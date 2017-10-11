/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package actions.venda;

import actions.produto.ProdutoDAO;
import actions.usuario.UsuarioDAO;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import entidades.produto.Produto;
import entidades.usuario.Usuario;
import entidades.venda.Venda;
import entidades.vendaproduto.VendaProduto;
import java.io.File;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.ListIterator;
import java.util.Map;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import util.GenericDAO;
import util.HibernateUtil;

import weka.clusterers.SimpleKMeans;
import weka.core.Instances;
import weka.experiment.InstanceQuery;

/**
 *
 * @author ronaldoarg
 */
public class NovaVenda extends ActionSupport {
    
    private Venda venda = new Venda();
    private String message;
    
    private List<Produto> recommenderProductList = new ArrayList<>(); 

    public List<Produto> getRecommenderProductList() {
        return recommenderProductList;
    }

    public void setRecommenderProductList(List<Produto> recommenderProductList) {
        this.recommenderProductList = recommenderProductList;
    }
    
    public Venda getVenda() {
        return venda;
    }

    public void setVenda(Venda venda) {
        this.venda = venda;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
       
    public List<Produto> getProductsRecommendationSale(Integer venda_id) throws Exception {

        // Clusterização dos produtos da venda
        SimpleKMeans saleProductsKmeans = new SimpleKMeans();
        saleProductsKmeans.setSeed(10);
        saleProductsKmeans.setPreserveInstancesOrder(true);
        saleProductsKmeans.setNumClusters(1);
        
        String saleProductsQueryString = "SELECT name, categoria, cor, genero, tamanho, preco FROM public.produto JOIN public.venda_produto ON public.venda_produto.id_venda = "+venda_id+" AND public.venda_produto.id_produto = public.produto.id";
        InstanceQuery saleProductsQuery = new InstanceQuery();
        File reader = new File("DatabaseUtils.props");
        saleProductsQuery.setUsername("ronaldoarg");
        saleProductsQuery.setPassword("");
        saleProductsQuery.setQuery(saleProductsQueryString);
        saleProductsQuery.initialize(reader);
        saleProductsQuery.setSparseData(true);
        
        Instances saleProductsInstances = saleProductsQuery.retrieveInstances();

        saleProductsKmeans.buildClusterer(saleProductsInstances);
        
        // Centroid do Cluster com os produtos da venda realizada
        Instances saleProductCentroids = saleProductsKmeans.getClusterCentroids();
        
        // Clusterização de todos os produtos do sistema
        SimpleKMeans allProductsKmeans = new SimpleKMeans();
        allProductsKmeans.setSeed(100);
        allProductsKmeans.setPreserveInstancesOrder(true);
        
        String allProductsQueryString = "SELECT name, categoria, cor, genero, tamanho, preco FROM public.produto ORDER BY id DESC";
        InstanceQuery allProductsQuery = new InstanceQuery();
        allProductsQuery.setUsername("ronaldoarg");
        allProductsQuery.setPassword("");
        allProductsQuery.setQuery(allProductsQueryString);
        allProductsQuery.initialize(reader);
        allProductsQuery.setSparseData(true);
        
        Instances allProductsInstances = allProductsQuery.retrieveInstances();

        allProductsKmeans.setNumClusters(allProductsInstances.numInstances()/2);
        allProductsKmeans.buildClusterer(allProductsInstances);        
        
        System.out.println("O Centroid do cluster de vendas está no cluster : "+allProductsKmeans.clusterInstance(saleProductCentroids.instance(0))+" de todos os produtos");
        
        
        int[] allProductsAssignments = allProductsKmeans.getAssignments();
        List<Integer> allProductsInstacesIdsToRecommender = new ArrayList<Integer>();
        
        int i = 0;
        int count = 0;
        for(int clusterNum : allProductsAssignments) {
            if(clusterNum == allProductsKmeans.clusterInstance(saleProductCentroids.instance(0))) {
                allProductsInstacesIdsToRecommender.add(i);
                count++;
            }
            i++;
        }
        
        List<Produto> recommenderProductList = new ArrayList<>();
        ProdutoDAO dao = new ProdutoDAO();

        ListIterator<Integer> id = allProductsInstacesIdsToRecommender.listIterator();
        while(id.hasNext()) {
            recommenderProductList.add(dao.getByName(allProductsInstances.get(id.next()).stringValue(0)));
        }
                
        return recommenderProductList;
    }
    
    @Override
    public String execute() throws Exception {
        Map<String, Object> session = (Map<String, Object>) ActionContext.getContext().getSession();
        
        if(session.get("usuario.id") != null && !session.get("usuario.id").equals("")) {
            
            UsuarioDAO u_dao = new UsuarioDAO();
            Usuario cliente = u_dao.getByCodigo((Integer) session.get("usuario.id"));

            List<Produto> produtos = (List<Produto>) session.get("carrinhoList");
            ListIterator<Produto> loop = produtos.listIterator();
            List<VendaProduto> vendaproduto = new ArrayList<>();
            
            while(loop.hasNext()) {                
                VendaProduto temp = new VendaProduto();
                Produto p = loop.next();
                temp.setVenda(venda);
                temp.setProduto(p);
                temp.setQuantidade(p.getQuantidade());
                vendaproduto.add(temp);
            }
            
            venda.setCliente(cliente);
            venda.setProdutos(vendaproduto);

            GenericDAO<Venda> dao = new GenericDAO(Venda.class);
            venda.setDataHora(new Date());
            Serializable newId = dao.save(venda);
          
            setMessage("Compra realizada com sucesso");
            session.put("carrinhoList", null);
            
            setRecommenderProductList(getProductsRecommendationSale(venda.getId_venda()));
            
            return "success";
        } else {
            return "login";
        }
        
    }
}

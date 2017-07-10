/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package actions.produto;

import actions.usuario.UsuarioDAO;
import com.opensymphony.xwork2.ActionSupport;
import entidades.produto.Produto;
import java.util.List;
import com.opensymphony.xwork2.ActionContext;
import entidades.usuario.Usuario;
import java.util.ArrayList;
import java.util.ListIterator;
import java.util.Map;
import util.GenericDAO;

/**
 *
 * @author ronaldoarg
 */
public class Carrinho extends ActionSupport {
    
    Map<String, Object> session = ActionContext.getContext().getSession();
   
    private List<Produto> carrinhoList = new ArrayList<>();    

    private Integer id;
    
    private Double total = 0.0;
    
    private String message;

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public List<Produto> getCarrinhoList() {
        return carrinhoList;
    }

    public void setCarrinhoList(List<Produto> carrinhoList) {
        this.carrinhoList = carrinhoList;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }
    
    public Double getTotal() {
        return total;
    }
    
    public void setTotal(Double total) {  
        this.total = total;
    }
    
    public void calculaTotal() {
        if(getCarrinhoList().size() > 0) {
            ListIterator<Produto> l = carrinhoList.listIterator();
            while(l.hasNext()) {
                setTotal(getTotal() + l.next().getValor());
            }            
        } else {
            setTotal(0.0);
        }
    }
    
    public String adiciona() throws Exception {
        
        if(session.get("carrinhoList") != null) {
            setCarrinhoList((List<Produto>) session.get("carrinhoList"));
        } 
        
        ProdutoDAO dao = new ProdutoDAO();
        Produto produto = dao.getById(id);
        
        if(produto == null) {
            return "success";
        }
        
        ListIterator<Produto> loop = carrinhoList.listIterator();
        Boolean contem = false;
        int t = 0;
        int posicao = 0;
        
        while(loop.hasNext()) {
            if(loop.next().getId().equals(produto.getId())) {
                contem = true;
                posicao = t;
            }
            t++;
        }
        
        if(contem) {
            produto = carrinhoList.get(posicao);
            carrinhoList.remove(posicao);
            produto.setQuantidade(produto.getQuantidade()+1);
        } else {
           produto.setQuantidade(1);
        }
        
        carrinhoList.add(posicao, produto);
        session.put("carrinhoList", carrinhoList);
        
        calculaTotal();
        return "success";
    }
    
    public String remove() throws Exception {
        
        if(session.get("carrinhoList") != null) {
            setCarrinhoList((List<Produto>) session.get("carrinhoList"));
        } 
        
        ProdutoDAO dao = new ProdutoDAO();
        Produto produto = dao.getById(id);
        
        if(produto == null) {
            return "success";
        }
        
        ListIterator<Produto> loop = carrinhoList.listIterator();
        Boolean contem = false;
        int t = 0;
        int posicao = 0;
        
        while(loop.hasNext()) {
            if(loop.next().getId().equals(produto.getId())) {
                contem = true;
                posicao = t;
            }
            t++;
        }
        
        if(contem) {
            produto = carrinhoList.get(posicao);
            carrinhoList.remove(posicao);
            produto.setQuantidade(produto.getQuantidade()-1);
        }
        
        if(produto.getQuantidade() > 0) {
            carrinhoList.add(posicao, produto);
        }
        
        session.put("carrinhoList", carrinhoList);
        
        calculaTotal();
        return "success";
    }
    
    public String removeAll() throws Exception {
        
        if(session.get("carrinhoList") != null) {
            setCarrinhoList((List<Produto>) session.get("carrinhoList"));
        } 
        
        ProdutoDAO dao = new ProdutoDAO();
        Produto produto = dao.getById(id);
        
        if(produto == null) {
            return "success";
        }
        
        ListIterator<Produto> loop = carrinhoList.listIterator();
        Boolean contem = false;
        int t = 0;
        int posicao = 0;
        
        while(loop.hasNext()) {
            if(loop.next().getId().equals(produto.getId())) {
                contem = true;
                posicao = t;
            }
            t++;
        }
        
        if(contem) {
            carrinhoList.remove(posicao);
        }
        
        session.put("carrinhoList", carrinhoList);
        calculaTotal();
        
        return "success";
    }

    @Override
    public String execute() throws Exception {
        if(session.get("carrinhoList") != null) {
            setCarrinhoList((List<Produto>) session.get("carrinhoList"));
        }
        
        UsuarioDAO dao = new UsuarioDAO();
        Usuario u = dao.getByCodigo((Integer) session.get("usuario.id"));
        
        System.out.println(session.get("usuario.id"));
        System.out.println(u);
        System.out.println(u.getPermission());

        
        if(u.getPermission()) {
            setMessage("Usuarios administradores não podem realizar compras");
            System.out.println("adm");
        }
        
        calculaTotal();
        return "success";
    }
    
    
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package actions.venda;

import actions.usuario.UsuarioDAO;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import entidades.produto.Produto;
import entidades.usuario.Usuario;
import entidades.venda.Venda;
import entidades.vendaproduto.VendaProduto;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.ListIterator;
import java.util.Map;
import util.GenericDAO;

/**
 *
 * @author ronaldoarg
 */
public class NovaVenda extends ActionSupport {
    
    private Venda venda = new Venda();
    private String message;
    
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
            
            return "success";
        } else {
            return "login";
        }
        
    }
}

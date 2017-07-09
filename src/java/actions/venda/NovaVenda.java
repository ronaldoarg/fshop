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
import java.util.Date;
import java.util.List;
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
            
            UsuarioDAO dao = new UsuarioDAO();
            Usuario cliente = dao.getByCodigo((Integer) session.get("usuario.id"));
            
            venda.setCliente(cliente);
            
            //venda.setProdutos(carrinhoList); ??????
            
            //GenericDAO<Venda> dao = new GenericDAO(Venda.class);
            //venda.setDataHora(new Date());
            //Serializable newId = dao.save(venda);
            
            setMessage("Compra realizada com sucesso");
            
            return "success";
        } else {
            return "login";
        }
        
    }
}

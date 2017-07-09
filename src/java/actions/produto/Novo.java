/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package actions.produto;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import entidades.produto.Produto;
import java.io.Serializable;
import java.util.Map;
import util.GenericDAO;

/**
 *
 * @author ronaldoarg
 */
public class Novo extends ActionSupport  {
    private Produto produto;
    private String message;

    public Produto getProduto() {
        return produto;
    }

    public void setProduto(Produto produto) {
        this.produto = produto;
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
            //if(session.get("usuario.permissao").equals("true")) {
                System.out.println(produto);
                GenericDAO<Produto> dao = new GenericDAO(Produto.class);
                Serializable newId = dao.save(produto);
                setMessage("Produto cadastrado com sucesso");
          //  } else {
          //      setMessage("Você não tem permissão para cadastrar um novo produto");
          //  }
        } else {
            setMessage("Você precisa estar logado para cadastrar um novo produto");
        }
        
        return "success";
    }   
}

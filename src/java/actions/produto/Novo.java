/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package actions.produto;

import actions.usuario.UsuarioDAO;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import entidades.produto.Produto;
import entidades.usuario.Usuario;
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
    private Usuario usuario;

    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }

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
            GenericDAO<Produto> dao = new GenericDAO(Produto.class);
            Serializable newId = dao.save(produto);
            setMessage("Produto cadastrado com sucesso");
            UsuarioDAO udao = new UsuarioDAO();
            setUsuario(udao.getByCodigo((Integer) session.get("usuario.id"))); 
        } else {
            setMessage("Você precisa estar logado para cadastrar um novo produto");
        }
       
        return "success";
    }   
}

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
import java.util.List;
import java.util.Map;
import util.GenericDAO;

/**
 *
 * @author ronaldoarg
 */
public class Listar extends ActionSupport {
    
    private List<Produto> produtoList;
    private Usuario usuario;
    private String message;
    
    public List<Produto> getProdutoList() {
        return produtoList;
    }

    public void setProdutoList(List<Produto> produtoList) {
        this.produtoList = produtoList;
    }

    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }
    
    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    @Override
    public String execute() throws Exception {
        GenericDAO dao = new GenericDAO(Produto.class);
        produtoList = dao.getAll();
        Map<String, Object> session = ActionContext.getContext().getSession();
        UsuarioDAO udao = new UsuarioDAO();
        
        if(session.get("usuario.id") != null && !session.get("usuario.id").equals("")) {
            setUsuario(udao.getByCodigo((Integer) session.get("usuario.id"))); 
        }
      
        return "success";
    }
    
}

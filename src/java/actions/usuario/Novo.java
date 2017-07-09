/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package actions.usuario;

import com.opensymphony.xwork2.ActionSupport;
import entidades.usuario.Usuario;
import java.io.Serializable;
import util.GenericDAO;

/**
 *
 * @author ronaldoarg
 */
public class Novo extends ActionSupport {
    
    private Usuario usuario;
    private String message;

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
        GenericDAO<Usuario> dao = new GenericDAO(Usuario.class);
        Serializable newId = dao.save(usuario);
        setMessage("Cadastro realizado com sucesso");
        return "success";
    }
    
    
}

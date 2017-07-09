/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package actions.usuario;

import com.opensymphony.xwork2.ActionSupport;
import entidades.usuario.Usuario;
import java.util.List;
import util.GenericDAO;

/**
 *
 * @author ronaldoarg
 */
public class Listar extends ActionSupport {

    private List<Usuario> usuarioList;
    private String message;
    private Usuario usuario;

    public List<Usuario> getUsuarioList() {
        return usuarioList;
    }

    public void setUsuarioList(List<Usuario> usuarioList) {
        this.usuarioList = usuarioList;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }
    
    @Override
    public String execute() throws Exception {
        GenericDAO<Usuario> dao = new GenericDAO(Usuario.class);
        usuarioList = dao.getAll();
        return "success";
    }
}

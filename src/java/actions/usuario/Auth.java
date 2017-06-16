/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package actions.usuario;

import com.opensymphony.xwork2.ActionSupport;
import entidades.usuario.Usuario;
import java.util.List;

/**
 *
 * @author ronaldoarg
 */
public class Auth extends ActionSupport {
    
    private Usuario usuario;
    private String message;
    private List<Usuario> usuarioList;

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

    public List<Usuario> getUsuarioList() {
        return usuarioList;
    }

    public void setUsuarioList(List<Usuario> usuarioList) {
        this.usuarioList = usuarioList;
    }

    
    @Override
    public String execute() throws Exception {
        
        UsuarioDAO clienteDAO = new UsuarioDAO();
        
        usuarioList = clienteDAO.getByUsername(usuario.getUsername());
        
        for (int i = 0; i < usuarioList.size(); i++) {
            if(usuario.getUsername() == null ? usuarioList.get(i).getUsername() == null : usuario.getUsername().equals(usuarioList.get(i).getUsername())) {
                setMessage("Login realizado com sucesso");
                usuario = usuarioList.get(i);
                return "success";
            }
        }
        setMessage("Usuario não encontrado");
        return "error";
    }
}

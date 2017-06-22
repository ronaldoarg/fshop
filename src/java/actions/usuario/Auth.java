/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package actions.usuario;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import entidades.usuario.Usuario;
import java.util.List;
import java.util.Map;
import org.apache.struts2.interceptor.SessionAware;

/**
 *
 * @author ronaldoarg
 */
public class Auth extends ActionSupport implements SessionAware  {
    
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
        
        UsuarioDAO usuarioDAO = new UsuarioDAO();
        Usuario u = usuarioDAO.getByUsername(usuario.getUsername(), usuario.getPassword());
        if (u != null) {
            Map<String, Object> session = ActionContext.getContext().getSession();
            
            session.put("usuario.name", u.getName());
            session.put("usuario.lastname", u.getLastname());
            session.put("usuario.id", u.getId());
            
            return "success";
            
        } else {
            setMessage("Dados Inválidos. Tente Novamente");
            return "error";
        }
    }
    
    public String logout() throws Exception {
        
        Map<String, Object> session = ActionContext.getContext().getSession();
        session.put("usuario.name", "");
        session.put("usuario.lastname", "");
        session.put("usuario.id", "");
        
        return "success";
    }

    @Override
    public void setSession(Map<String, Object> map) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}

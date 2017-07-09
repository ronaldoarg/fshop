/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package actions.usuario;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import entidades.usuario.Usuario;
import java.util.Map;
import util.GenericDAO;

/**
 *
 * @author ronaldoarg
 */
public class Conta extends ActionSupport {
    
    Usuario usuario;

    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }
    
    @Override
    public String execute() throws Exception {
        Map<String, Object> session = ActionContext.getContext().getSession();
        UsuarioDAO dao = new UsuarioDAO();
        usuario = dao.getByCodigo((Integer) session.get("usuario.id"));
        return "conta";
    }
    
    public String delete() throws Exception {
        Map<String, Object> session = ActionContext.getContext().getSession();
        
        UsuarioDAO udao = new UsuarioDAO();
        usuario = udao.getByCodigo((Integer) session.get("usuario.id"));

        GenericDAO dao = new GenericDAO(Usuario.class);
        dao.delete(usuario);
        
        session.put("usuario.name", "");
        session.put("usuario.lastname", "");
        session.put("usuario.id", "");
        
        return "success";
    }
    
}

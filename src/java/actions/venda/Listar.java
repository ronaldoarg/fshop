/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package actions.venda;

import actions.usuario.UsuarioDAO;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import entidades.usuario.Usuario;
import entidades.venda.Venda;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import util.GenericDAO;

/**
 *
 * @author ronaldoarg
 */
public class Listar extends ActionSupport {
    
    private List<Venda> vendas = new ArrayList<>();
    private Usuario usuario;

    public List<Venda> getVendas() {
        return vendas;
    }

    public void setVendas(List<Venda> vendas) {
        this.vendas = vendas;
    }

    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }
    
    @Override
    public String execute() throws Exception {
        Map<String, Object> session = ActionContext.getContext().getSession();
        
        GenericDAO dao = new GenericDAO(Venda.class);
        setVendas(dao.getAll());
        
        System.out.println(session.get("usuario.id"));
        
        UsuarioDAO udao = new UsuarioDAO();
        setUsuario(udao.getByCodigo((Integer) session.get("usuario.id")));
        
        return "success";
    }
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package actions.interacao;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import entidades.interacao.Interacao;
import java.io.Serializable;
import java.util.Map;
import org.apache.struts2.interceptor.SessionAware;
import util.GenericDAO;

/**
 *
 * @author ronaldoarg
 */
public class Nova extends ActionSupport implements SessionAware {
    private Interacao interacao;

    public Interacao getInteracao() {
        return interacao;
    }

    public void setInteracao(Interacao interacao) {
        this.interacao = interacao;
    }
    
    @Override
    public String execute() throws Exception {
        GenericDAO<Interacao> dao = new GenericDAO(Interacao.class);
        
        Map<String, Object> session = (Map<String, Object>) ActionContext.getContext().getSession();
 
        if(session.get("usuario.id") != null && !session.get("usuario.id").equals("")) {
            interacao.setUser_id((Integer) session.get("usuario.id"));
            Serializable newId = dao.save(interacao);
        }
        
        return "success";
    }

    @Override
    public void setSession(Map<String, Object> map) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}

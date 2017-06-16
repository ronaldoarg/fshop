/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package actions.interacao;

import com.opensymphony.xwork2.ActionSupport;
import entidades.interacao.Interacao;
import java.io.Serializable;
import util.GenericDAO;

/**
 *
 * @author ronaldoarg
 */
public class Nova extends ActionSupport {
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
        Serializable newId = dao.save(interacao);
        return "success";
    }
    
}

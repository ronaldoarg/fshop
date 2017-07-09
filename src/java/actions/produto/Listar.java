/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package actions.produto;

import com.opensymphony.xwork2.ActionSupport;
import entidades.produto.Produto;
import java.util.List;
import util.GenericDAO;

/**
 *
 * @author ronaldoarg
 */
public class Listar extends ActionSupport {
    
    private List<Produto> produtoList;

    private String message;
    
    public List<Produto> getProdutoList() {
        return produtoList;
    }

    public void setProdutoList(List<Produto> produtoList) {
        this.produtoList = produtoList;
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
        
        return "success";
    }
    
}

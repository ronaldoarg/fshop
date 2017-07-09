/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entidades.vendaproduto;

import entidades.produto.Produto;
import entidades.venda.Venda;
import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 *
 * @author ronaldoarg
 */
@Entity
@Table(name="venda_produto")
public class VendaProduto implements Serializable {

    @Id
    @ManyToOne
    @JoinColumn(name = "venda_codigo")
    private Venda venda;
    @Id
    @ManyToOne
    @JoinColumn(name = "produto_codigo")
    private Produto produto;

    @Column(nullable = false)
    private Integer quantidade;

    public Venda getVenda() {
        return venda;
    }

    public void setVenda(Venda venda) {
        this.venda = venda;
    }

    public Produto getProduto() {
        return produto;
    }

    public void setProduto(Produto produto) {
        this.produto = produto;
    }

    public Integer getQuantidade() {
        return quantidade;
    }

    public void setQuantidade(Integer quantidade) {
        this.quantidade = quantidade;
    }
    
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entidades.venda;

import entidades.usuario.Usuario;
import entidades.vendaproduto.VendaProduto;
import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 *
 * @author ronaldoarg
 */
@Entity
@Table(name = "venda")
public class Venda implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id_venda;

    @ManyToOne
    @JoinColumn(name = "id_usuario", nullable = false)
    private Usuario cliente;

    @OneToMany(mappedBy = "venda", targetEntity = VendaProduto.class, fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    private List<VendaProduto> produtos;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "data_hora", nullable = false)
    private Date dataHora;

    public Integer getId_venda() {
        return id_venda;
    }

    public void setId_venda(Integer id_venda) {
        this.id_venda = id_venda;
    }

    public Usuario getCliente() {
        return cliente;
    }

    public void setCliente(Usuario cliente) {
        this.cliente = cliente;
    }

    public List<VendaProduto> getProdutos() {
        return produtos;
    }

    public void setProdutos(List<VendaProduto> produtos) {
        this.produtos = produtos;
    }

    public Date getDataHora() {
        return dataHora;
    }

    public void setDataHora(Date dataHora) {
        this.dataHora = dataHora;
    }
    
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package actions.produto;

import entidades.produto.Produto;
import java.util.List;
import java.util.ListIterator;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import util.GenericDAO;
import util.HibernateUtil;

/**
 *
 * @author leoomoreira
 */
public class ProdutoDAO extends GenericDAO<Produto> {

    public ProdutoDAO() {
        super(Produto.class);
    }

    public Produto getById(Integer codigo) {
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        Produto produto = (Produto) session.get(Produto.class, codigo);
        transaction.commit();
        session.close();
        return produto;
    }
    
    public Produto getByName(String name) {
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        CriteriaBuilder criteriaBuilder = session.getCriteriaBuilder();
        CriteriaQuery<Produto> criteriaQuery = criteriaBuilder.createQuery(Produto.class);
        Root<Produto> rootProduto = criteriaQuery.from(Produto.class);
//        criteriaQuery.where(criteriaBuilder.like(criteriaBuilder.lower(rootProduto.get("name")), "%" + name.toLowerCase() + "%"));
        criteriaQuery.where(criteriaBuilder.equal(rootProduto.get("name"), name));
        Produto produto = (Produto) session.createQuery(criteriaQuery).getSingleResult();
        transaction.commit();
        session.close();
        return produto;
    }
    
    public List<Produto> getByDescricao(String descricao) {
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        CriteriaBuilder criteriaBuilder = session.getCriteriaBuilder();
        CriteriaQuery<Produto> criteriaQuery = criteriaBuilder.createQuery(Produto.class);
        Root<Produto> rootProduto = criteriaQuery.from(Produto.class);
        criteriaQuery.where(criteriaBuilder.like(criteriaBuilder.lower(rootProduto.get("descricao")), "%" + descricao.toLowerCase() + "%"));
        List<Produto> list = (List<Produto>) session.createQuery(criteriaQuery).getResultList();
        transaction.commit();
        session.close();
        return list;
    }
}

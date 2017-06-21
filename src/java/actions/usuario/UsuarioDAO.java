/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package actions.usuario;

import entidades.usuario.Usuario;
import java.util.List;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import util.GenericDAO;
import util.HibernateUtil;

/**
 *
 * @author ronaldoarg
 */
public class UsuarioDAO extends GenericDAO<Usuario>{
    
    public UsuarioDAO() {
        super(Usuario.class);
    }
    
    public Usuario getByCodigo(Integer codigo) {
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        Usuario cliente = (Usuario) session.get(Usuario.class, codigo);
        transaction.commit();
        session.close();
        return cliente;
    }
    
   public Usuario getByUsername(String username, String password) {
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        Query query = session.createQuery("from Usuario u where u.username = :username and u.password = :password");
        query.setParameter("username", username);
        query.setParameter("password", password);
        Usuario u = null;
        try {
            u = (Usuario) query.getSingleResult();
        } catch (Exception ex) {
            u = null;
        }
        transaction.commit();
        session.close();
        return u;
    }
    
}

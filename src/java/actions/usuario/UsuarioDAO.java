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
    
    public List<Usuario> getByUsername(String username) {
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        CriteriaBuilder criteriaBuilder = session.getCriteriaBuilder();
        CriteriaQuery<Usuario> criteriaQuery = criteriaBuilder.createQuery(Usuario.class);
        Root<Usuario> rootUsuario = criteriaQuery.from(Usuario.class);
        criteriaQuery.where(criteriaBuilder.like(criteriaBuilder.lower(rootUsuario.get("username")), "%" + username.toLowerCase() + "%"));
        List<Usuario> list = (List<Usuario>) session.createQuery(criteriaQuery).getResultList();
        transaction.commit();
        session.close();
        return list;
    }
    
}

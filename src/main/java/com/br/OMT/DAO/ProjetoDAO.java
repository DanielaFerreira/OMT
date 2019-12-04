/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.br.OMT.DAO;

import com.br.OMT.Hibernate.HibernateFactory;
import com.br.OMT.Hibernate.HibernateUtil;
import com.br.OMT.models.Projeto;
import java.util.List;
import org.hibernate.HibernateException;
import javax.persistence.Query;
import org.hibernate.Session;

/**
 *
 * @author vinic e daniela
 */
public class ProjetoDAO {

    HibernateUtil<Projeto> hup;
    Session s;

    public ProjetoDAO() {
        HibernateFactory.initSessionFactory();
        hup = new HibernateUtil<>();
    }

    public String salvar(Projeto p) {
        return hup.salvar(p);
    }

    public String atualizar(Projeto p) {
        return hup.atualizar(p);
    }

    public String deletar(Projeto p) {
        return hup.deletar(p);
    }
    
        
    public Projeto getById(Long id) {
        Projeto t;
        try {
            s = HibernateFactory.getSessionFactory().openSession();
            s.beginTransaction();
            org.hibernate.query.Query query = s.createQuery("from Projeto p where p.id =:id")
                    .setParameter("id", id);
            t = (Projeto) query.getSingleResult();
            s.getTransaction().commit();
            return t;
        } catch (HibernateException ex) {
            s.getTransaction().rollback();
            return null;
        } finally {
            s.close();
        }
    }
    
    public List<Projeto> listByDiscente(Long id){
        List<Projeto> le = null;
        try {
            s = HibernateFactory.getSessionFactory().openSession();
            s.beginTransaction();
            Query query = s.createQuery("from Projeto p where p.discente.id =:id");
            query.setParameter("id", id);
            le = query.getResultList();
            s.getTransaction().commit();
            return le;
        } catch (HibernateException ex) {
            s.getTransaction().rollback();
            return null;
        } finally {
            s.close();
        }
    }
}

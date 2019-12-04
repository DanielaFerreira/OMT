/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.br.OMT.DAO;

import com.br.OMT.Hibernate.HibernateFactory;
import com.br.OMT.Hibernate.HibernateUtil;
import com.br.OMT.Utils.Criptografia;
import com.br.OMT.models.Idioma;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.query.Query;

/**
 *
 * @author daniela
 */
public class IdiomaDAO {
    
    HibernateUtil<Idioma> hup;
    Session s;

    public IdiomaDAO() {
        HibernateFactory.initSessionFactory();
        hup = new HibernateUtil<>();
    }

    public String salvar(Idioma i) {
        return hup.salvar(i);
    }

    public String atualizar(Idioma i) {
        return hup.atualizar(i);
    }

    public String deletar(Idioma i) {
        return hup.deletar(i);
    }
    
     public Idioma getById(Long id) throws Exception {
        Idioma d = null;
        try {
            s = HibernateFactory.getSessionFactory().openSession();
            s.beginTransaction();
            Query query = s.createQuery("from Idioma i where i.id =:id");
            query.setParameter("id", id);
            d = (Idioma) query.getSingleResult();
            s.getTransaction().commit();
            return d;
        } catch (HibernateException ex) {
            s.getTransaction().rollback();
            return null;
        } finally {
            s.close();
        }
    }
     
       public List<Idioma> listarPorID(Long id){
        List<Idioma> le = null;
        try {
            s = HibernateFactory.getSessionFactory().openSession();
            s.beginTransaction();
            Query query = s.createQuery("from Idioma i where i.discente.id =:id");
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

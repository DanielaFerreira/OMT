/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.br.OMT.DAO;

import com.br.OMT.Hibernate.HibernateFactory;
import com.br.OMT.Hibernate.HibernateUtil;
import com.br.OMT.models.AreadeAtuacao;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.query.Query;

/**
 *
 * @author daniela
 */
public class AreadeAtuacaoDAO {
    
    HibernateUtil<AreadeAtuacao> huf;
    Session s;

    public AreadeAtuacaoDAO() {
        HibernateFactory.initSessionFactory();
        huf = new HibernateUtil<>();
    }

    public String salvar(AreadeAtuacao aa) {
        return huf.salvar(aa);
    }

    public String atualizar(AreadeAtuacao aa) {
        return huf.atualizar(aa);
    }

    public String deletar(AreadeAtuacao aa) {
        return huf.deletar(aa);
    }
    
    public AreadeAtuacao getById(Long id) {
        AreadeAtuacao t;
        try {
            s = HibernateFactory.getSessionFactory().openSession();
            s.beginTransaction();
            Query query = s.createQuery("from AreadeAtuacao aa where aa.id =:id")
                    .setParameter("id", id);
            t = (AreadeAtuacao) query.getSingleResult();
            s.getTransaction().commit();
            return t;
        } catch (HibernateException ex) {
            s.getTransaction().rollback();
            return null;
        } finally {
            s.close();
        }
    }
    
     public List<AreadeAtuacao> listarPorID(Long id){
        List<AreadeAtuacao> le = null;
        try {
            s = HibernateFactory.getSessionFactory().openSession();
            s.beginTransaction();
            Query query = s.createQuery("from AreadeAtuacao aa where aa.discente.id =:id");
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

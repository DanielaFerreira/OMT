/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.br.OMT.DAO;

import com.br.OMT.Hibernate.HibernateFactory;
import com.br.OMT.Hibernate.HibernateUtil;
import com.br.OMT.models.VagaReservadaCandidato;
import com.br.OMT.models.Discente;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.query.Query;

/**
 *
 * @author daniela
 */
public class VagaReservadaCandidatoDAO {
     HibernateUtil<VagaReservadaCandidato> hude;
    private Session s;

    public VagaReservadaCandidatoDAO() {
        hude = new HibernateUtil<>();
    }

    public String salvar(VagaReservadaCandidato de) {
        return hude.salvar(de);
    }

    public String atualizar(VagaReservadaCandidato de) {
        return hude.atualizar(de);
    }
    
    public List<VagaReservadaCandidato> listarTudo() {
        List<VagaReservadaCandidato> le = null;
        try {
            s = HibernateFactory.getSessionFactory().openSession();
            s.beginTransaction();
            Query query = s.createQuery("from VagaReservadaCandidato vrc");
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
    
    public List<Long> listarCodigodasVagasCandidato(Discente d){
        List<Long> le = null;
        try {
            s = HibernateFactory.getSessionFactory().openSession();
            s.beginTransaction();
            Query query = s.createQuery("select vrc.trabalho from VagaReservadaCandidato vrc where vrc.discente =:discente")
                    .setParameter("discente", d.getId());
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
    
       
    public String deletar(VagaReservadaCandidato de) {
        return hude.deletar(de);
    }
    
}

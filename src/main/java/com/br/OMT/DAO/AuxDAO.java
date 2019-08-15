package com.br.OMT.DAO;

import com.br.OMT.Hibernate.HibernateFactory;
import com.br.OMT.Hibernate.HibernateUtil;
import com.br.OMT.models.Aux;
import com.br.OMT.models.Trabalho;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.query.Query;

/**
 *
 * @author vinic
 */
public class AuxDAO {

    private HibernateUtil<Aux> hut;
    private Session s;

    public AuxDAO() {
        HibernateFactory.initSessionFactory();
        hut = new HibernateUtil<>();
    }

    public String salvar(Aux t) {
        return hut.salvar(t);
    }

    public String atualizar(Aux t) {
        return hut.atualizar(t);
    }

    public String deletar(Aux t) {
        return hut.deletar(t);
    }

    public Aux getByIdx(Long idx) {
        Aux a;
        try {
            s = HibernateFactory.getSessionFactory().openSession();
            s.beginTransaction();
            Query query = s.createQuery("from Aux a where a.idx =:idx")
                    .setParameter("idx", idx);
            a = (Aux) query.getSingleResult();
            s.getTransaction().commit();
            return a;
        } catch (HibernateException ex) {
            s.getTransaction().rollback();
            return null;
        } finally {
            s.close();
        }
    }

    public List<Aux> listAux() {
        List<Aux> a;
        try {
            s = HibernateFactory.getSessionFactory().openSession();
            s.beginTransaction();
            Query query = s.createQuery("from Aux t");
            a = query.getResultList();
            s.getTransaction().commit();
            return a;
        } catch (HibernateException ex) {
            s.getTransaction().rollback();
            return null;
        } finally {
            s.close();
        }
    }

}

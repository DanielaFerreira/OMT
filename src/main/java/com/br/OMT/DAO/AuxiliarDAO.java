package com.br.OMT.DAO;

import com.br.OMT.Hibernate.HibernateFactory;
import com.br.OMT.Hibernate.HibernateUtil;
import com.br.OMT.models.Auxiliar;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.query.Query;

/**
 *
 * @author vinic
 */
public class AuxiliarDAO {

    private HibernateUtil<Auxiliar> hut;
    private Session s;

    public AuxiliarDAO() {
        HibernateFactory.initSessionFactory();
        hut = new HibernateUtil<>();
    }

    public String salvar(Auxiliar t) {
        return hut.salvar(t);
    }

    public String atualizar(Auxiliar t) {
        return hut.atualizar(t);
    }

    public String deletar(Auxiliar t) {
        return hut.deletar(t);
    }

    public Auxiliar getByIdx(Long idx) {
        Auxiliar a;
        try {
            s = HibernateFactory.getSessionFactory().openSession();
            s.beginTransaction();
            Query query = s.createQuery("from Auxiliar a where a.idx =:idx")
                    .setParameter("idx", idx);
            a = (Auxiliar) query.getSingleResult();
            s.getTransaction().commit();
            return a;
        } catch (HibernateException ex) {
            s.getTransaction().rollback();
            return null;
        } finally {
            s.close();
        }
    }

    public List<Auxiliar> listAuxiliar() {
        List<Auxiliar> a;
        try {
            s = HibernateFactory.getSessionFactory().openSession();
            s.beginTransaction();
            Query query = s.createQuery("from Auxiliar a");
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

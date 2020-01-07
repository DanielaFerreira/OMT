package com.br.OMT.DAO;

import com.br.OMT.Hibernate.HibernateFactory;
import com.br.OMT.Hibernate.HibernateUtil;
import com.br.OMT.models.CandidatoVaga;
import com.br.OMT.models.Usuario;

import com.br.OMT.models.Discente;
import com.br.OMT.models.Trabalho;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.query.Query;

/**
 *
 * @author eddunic e Daniela
 */
public class CandidatoVagaDAO {

    HibernateUtil<CandidatoVaga> hude;
    private Session s;

    public CandidatoVagaDAO() {
        hude = new HibernateUtil<>();
    }

    public String salvar(CandidatoVaga de) {
        return hude.salvar(de);
    }

    public String atualizar(CandidatoVaga de) {
        return hude.atualizar(de);
    }
    
    public List<CandidatoVaga> listarTudo() {
        List<CandidatoVaga> le = null;
        try {
            s = HibernateFactory.getSessionFactory().openSession();
            s.beginTransaction();
            Query query = s.createQuery("from CandidatoVaga cv");
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
    
    public List<Long> listarCodigodasVagasCandidato(Usuario d){
        List<Long> le = null;
        try {
            s = HibernateFactory.getSessionFactory().openSession();
            s.beginTransaction();
            Query query = s.createQuery("select cv.trabalho from CandidatoVaga cv where cv.discente =:discente")
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
    
        
    public List<Trabalho> listarVagasDisponiveis(Discente d){
        TrabalhoDAO tDAO = new TrabalhoDAO();
        List<Trabalho> todosTrabalhos = tDAO.listTrabalho();
        List<Long> codigoVagasCandidatadas = listarCodigodasVagasCandidato(d);
        List<Trabalho> trabalhosDisponiveis = new ArrayList<>();
        
        for(int i = 0; i < todosTrabalhos.size(); i++){
            for(int j = 0; j < codigoVagasCandidatadas.size(); j++){
                if(todosTrabalhos.get(i).getId() != codigoVagasCandidatadas.get(j)){
                    trabalhosDisponiveis.add(todosTrabalhos.get(i));
                    System.out.println("profissao do traballho disponivel:" + codigoVagasCandidatadas.get(i));
                }
            }
        }
        return trabalhosDisponiveis;
    }

    public String deletar(CandidatoVaga de) {
        return hude.deletar(de);
    }
}

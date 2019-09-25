package com.br.OMT.DAO;

import com.br.OMT.Hibernate.HibernateUtil;
import com.br.OMT.models.CandidatoVaga;
import org.hibernate.Session;

/**
 *
 * @author vinic
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

    public String deletar(CandidatoVaga de) {
        return hude.deletar(de);
    }
}

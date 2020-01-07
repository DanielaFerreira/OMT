/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.br.OMT.Servlets;

import com.br.OMT.DAO.CampusDAO;
import com.br.OMT.DAO.DiscenteDAO;
import com.br.OMT.DAO.EventoDAO;
import com.br.OMT.DAO.FormacaoEmCampusDAO;
import com.br.OMT.DAO.FotosEventosDAO;
import com.br.OMT.DAO.TrabalhoDAO;
import com.br.OMT.DAO.UsuarioDAO;
import com.br.OMT.Utils.Criptografia;
import com.br.OMT.models.Discente;
import com.br.OMT.models.Entidade;
import com.br.OMT.models.Evento;
import com.br.OMT.models.FormacaoEmCampus;
import com.br.OMT.models.FotosEventos;
import com.br.OMT.models.Trabalho;
import com.br.OMT.models.Usuario;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.Normalizer;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.io.IOUtils;

/**
 *
 * @author vinic
 */
public class EncherBanco extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
	    throws ServletException, IOException {
	PrintWriter out = response.getWriter();

	String[] cursos = new String[]{"Técnico na forma integrada em informática", "Técnico na forma integrada em Edificações", "Técnico na forma integrada em Mecânica", "Técnico na forma integrada em Química", "Técnico na forma integrada em Eletrotécnica"};
	
        String[] nomesFemininos = new String[]{"Beatriz Lopes Albuquerque", "Jennifer Geovana Tavares do Amaral",
        "Tarsila Fontosa Sousa", "Ágata Citrine Cardoso de Jesus", "Josiane da Paz Fonseca", "Tábata do Amaral da Silva",
        "Lana Nicolas Manoel Assis", "Josiana Anderson Feitosa Neves", 
            "Gregória Cassiano Hermes", "Rana Hermes Júnior", 
            "Fausta Giovanne Fanti Santanna", "Otávia Bilac Araújo Pepes",
         "Tammires Diógenes Afonso Pereira", "Antônia Ledesma Magalhães"};
                
        Calendar data = Calendar.getInstance();

	out.println(getServletContext().getContextPath() + "\n"
		+ getServletContext().getRealPath("/index.jsp") + "\n"
		+ request.getContextPath() + "\n"
		+ request.getServletPath());
	try {
	    Discente d;
	    Usuario u;
	    Entidade e, entTeste1, entTeste2;
	    Evento ev;
	    Trabalho t, t2, t3;
	    FotosEventos fe;
	    FormacaoEmCampus fec;
            

	    InputStream stream;

	    DiscenteDAO dDAO = new DiscenteDAO();
	    UsuarioDAO uDAO = new UsuarioDAO();
	    CampusDAO cDAO = new CampusDAO();
	    EventoDAO evDAO = new EventoDAO();
	    TrabalhoDAO tDAO = new TrabalhoDAO();
	    FotosEventosDAO feDAO = new FotosEventosDAO();
	    FormacaoEmCampusDAO fecDAO = new FormacaoEmCampusDAO();
            

	    //Cadastro de Reitoria
	    e = Entidade.getInstance();
	    e.setBairro("Centro");
	    e.setCEP("69025010");
	    e.setCNAE("1234567");
	    e.setCNPJ("10792928000533");
	    e.setCidade("Manaus");
	    e.setComplemento("Na avenida Ferreira Pena");
	    e.setEstado("AM");
	    e.setNome("IFAM - Reitoria");
	    e.setNomeFantasia("Reitoria");
	    e.setNumero("1109");
	    e.setRua("Av. Ferreira Pena");
	    e.setTipo('R');
	    out.println(cDAO.salvar(e));

            
             //Coordenador Geral de Relações Institucionais e Cooperações
	    u = Usuario.getInstance();
	    u.setNome("Estanislau Santanna");
	    u.setNomeBanco(Criptografia.encrypt(u.getNome()));
	    u.setUsuario("estanis");
	    u.setUsuarioBanco(Criptografia.encrypt(u.getUsuario()));
	    u.setSenha("123");
	    u.setSenhaBanco(Criptografia.encrypt(u.getSenha()));
	    u.setEntidade(e);
	    out.println(uDAO.salvar(u));

	    //Cadastro de Campus 1
	    e = Entidade.getInstance();
	    e.setBairro("Centro");
	    e.setCEP("69020120");
	    e.setCNAE("1234567");
	    e.setCNPJ("1234567891235");
	    e.setCidade("Manaus");
	    e.setComplemento("Próximo ao Museu do Índio");
	    e.setEstado("AM");
	    e.setNome("IFAM - Campus Manaus Centro");
	    e.setNomeFantasia("IFAM - CMC");
	    e.setNumero("401");
	    e.setRua("Av. 7 de setembro");
	    e.setTipo('C');
	    out.println(cDAO.salvar(e));
	    entTeste1 = e;

	    u = Usuario.getInstance();
	    u.setNome("IFAM - Campus Manaus Centro");
	    u.setNomeBanco(Criptografia.encrypt(u.getNome()));
	    u.setUsuario("cmc");
	    u.setUsuarioBanco(Criptografia.encrypt(u.getUsuario()));
	    u.setSenha("cmc");
	    u.setSenhaBanco(Criptografia.encrypt(u.getSenha()));
	    u.setEntidade(e);
	    out.println(uDAO.salvar(u));

	    //Cadastro de Campus 2
	    e = Entidade.newInstance();
	    e.setBairro("Gilberto Mestrinho");
	    e.setCEP("69086475");
	    e.setCNAE("1234568");
	    e.setCNPJ("1234567891236");
	    e.setCidade("Manaus");
	    e.setComplemento("Próximo ao São José");
	    e.setEstado("AM");
	    e.setNome("IFAM - Campus Manaus Zona Leste");
	    e.setNomeFantasia("IFAM - CMZL");
	    e.setNumero("8045");
	    e.setRua(" Av. Cosme Ferreira");
	    e.setTipo('C');
	    out.println(cDAO.salvar(e));
	    entTeste2 = e;

	    u = Usuario.getInstance();
	    u.setNome("IFAM - Campus Manaus Zona Leste");
	    u.setNomeBanco(Criptografia.encrypt(u.getNome()));
	    u.setUsuario("cmzl");
	    u.setUsuarioBanco(Criptografia.encrypt(u.getUsuario()));
	    u.setSenha("cmzl");
	    u.setSenhaBanco(Criptografia.encrypt(u.getSenha()));
	    u.setEntidade(e);
	    out.println(uDAO.salvar(u));

	    //Cadastro de Empresa
	    e = Entidade.getInstance();
	    e.setBairro("Praça 14 de Janeiro");
	    e.setCEP("69020130");
	    e.setCNAE("1234569");
	    e.setCNPJ("1234567891239");
	    e.setCidade("Manaus");
	    e.setComplemento("Próximo ao IFAM-CMC");
	    e.setEstado("AM");
	    e.setNome("ITN - Instituto de Tecnologia e Negócios do Norte");
	    e.setNomeFantasia("ITN");
	    e.setNumero("1680");
	    e.setRua("Avenida Visconde de Porto Alegre");
	    e.setTipo('E');
	    out.println(cDAO.salvar(e));

          
            
	    u = Usuario.getInstance();
	    u.setNome("ITN");
	    u.setNomeBanco(Criptografia.encrypt(u.getNome()));
	    u.setUsuario("itn");
	    u.setUsuarioBanco(Criptografia.encrypt(u.getUsuario()));
	    u.setSenha("itn");
	    u.setSenhaBanco(Criptografia.encrypt(u.getSenha()));
	    u.setEntidade(e);
	    out.println(uDAO.salvar(u));

              //Cadastro de Trabalho
            
            //Trabalho 1
            t = Trabalho.getInstance();
            t.setSalario(1500.0);
            t.setProfissao("Técnico em Edificações");
            t.setDescricao("Verificar a consistência de massas");
            t.setEntidade(e);
            t.setTipo("Estágio");
            t.setQuantidadeVagas(4);
            
            DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
            df.setLenient(false);
            t.setTempoFinal(df.parse("12/12/2019"));
            t.setTempoInicio(df.parse("15/12/2019"));
            out.println(tDAO.salvar(t));
            
               //Trabalho 2
            t2 = Trabalho.getInstance();
            t2.setSalario(2500.0);
            t2.setProfissao("Técnico em Informática");
            t2.setDescricao("Verificar a consistência de computadores");
            t2.setEntidade(e);
            t2.setTipo("Efetivo");
            t2.setQuantidadeVagas(2);

            t2.setTempoFinal(df.parse("12/12/2019"));
            t2.setTempoInicio(df.parse("15/12/2019"));
            out.println(tDAO.salvar(t2));
            
             //Trabalho 3
            t3 = Trabalho.getInstance();
            t3.setSalario(1000.0);
            t3.setProfissao("Técnico em Mecânica");
            t3.setDescricao("Verificar a consistência de pneus");
            t3.setEntidade(e);
            t3.setTipo("Efetivo");
            t3.setQuantidadeVagas(2);

            t3.setTempoFinal(df.parse("12/12/2019"));
            t3.setTempoInicio(df.parse("15/12/2019"));
            out.println(tDAO.salvar(t3));
            
            
            
            
	    //Cadastro Discente
	    stream = getServletContext().getResourceAsStream("/img/templates/info1.jpg");
	    d = Discente.getInstance();
	    d.setNome("Daniela");
            d.setTelefone("92997548125");
	    d.setNomeBanco(Criptografia.encrypt(d.getNome()));
	    d.setCPF("02546569279");
	    d.setCPFbanco(Criptografia.encrypt(d.getCPF()));
	    d.setUsuario("201611440335");
	    d.setUsuarioBanco(Criptografia.encrypt(d.getUsuario()));
	    d.setRG("123456789");
	    d.setRGbanco(Criptografia.encrypt(d.getRG()));
	    d.setSenha("123");
	    d.setSenhaBanco(Criptografia.encrypt(d.getSenha()));
	    d.setSexo("MASCULINO");
	    d.setEtnia("BRANCA");
	    d.setEstadoCivil("SOLTEIRO");
	    d.setEmail("danielaferreira1133@gmail.com");

	    data.set(Calendar.DAY_OF_MONTH, 14);
	    data.set(Calendar.MONTH, Calendar.JUNE);
	    data.set(Calendar.YEAR, 2001);

	    d.setDataNascimento(data.getTime());

	    d.setLinkCurriculoLattes("https://wwws.cnpq.br/cvlattesweb/PKG_MENU.menu?f_cod=66443CA9D507B0651D4690F514632E67#");
	    d.setLinkPerfilLinkedIn("https://www.linkedin.com/in/victor-yan-b4312415b/");
	    d.setNomePai("Raimundo Silva Feitosa");
	    d.setNomeMae("Fernanda Cipriano Ferreira");
	    //d.setFoto(IOUtils.toByteArray(stream));
	    out.println(dDAO.salvar(d));

	    fec = FormacaoEmCampus.getInstance();
	    fec.setNome(cursos[new Random().nextInt(4)]);
	    fec.setAnoTermino(2019);
	    fec.setDiscente(d);
	    fec.setCampus(e);
	    out.println(fecDAO.salvar(fec));
            
            //Cadastro Discente 2
	    stream = getServletContext().getResourceAsStream("/img/templates/info1.jpg");
	    d = Discente.getInstance();
	    d.setNome("Nazareno Amorim Borges");
            d.setTelefone("92994652147");
	    d.setNomeBanco(Criptografia.encrypt(d.getNome()));
	    d.setCPF("02643782303");
	    d.setCPFbanco(Criptografia.encrypt(d.getCPF()));
	    d.setUsuario("nazareno");
	    d.setUsuarioBanco(Criptografia.encrypt(d.getUsuario()));
	    d.setRG("27364582");
	    d.setRGbanco(Criptografia.encrypt(d.getRG()));
	    d.setSenha("123");
	    d.setSenhaBanco(Criptografia.encrypt(d.getSenha()));
	    d.setSexo("MASCULINO");
	    d.setEtnia("BRANCA");
	    d.setEstadoCivil("SOLTEIRO");
	    d.setEmail("eduardo.bitencourt007@gmail.com");

	    data.set(Calendar.DAY_OF_MONTH, 14);
	    data.set(Calendar.MONTH, Calendar.JUNE);
	    data.set(Calendar.YEAR, 2001);

	    d.setDataNascimento(data.getTime());

	    d.setLinkCurriculoLattes("https://wwws.cnpq.br/cvlattesweb/PKG_MENU.menu?f_cod=66443CA9D507B0651D4690F514632E67#");
	    d.setLinkPerfilLinkedIn("https://www.linkedin.com/in/victor-yan-b4312415b/");
	    d.setNomePai("Adalberto Furtado Borges");
	    d.setNomeMae("Maria da Silva Amorim");
	    //d.setFoto(IOUtils.toByteArray(stream));
	    out.println(dDAO.salvar(d));

	    fec = FormacaoEmCampus.getInstance();
	    fec.setNome(cursos[new Random().nextInt(4)]);
	    fec.setAnoTermino(2018);
	    fec.setDiscente(d);
	    fec.setCampus(e);
	    out.println(fecDAO.salvar(fec));
            
            
	    //Cadastro de Eventos
	    ev = Evento.getInstance();
	    ev.setNome("Semana de Informática");
	    ev.setDescricao("Palestras e minicursos ofertados à comunidade do IFAM");
	    ev.setDataInicioInscricao(Calendar.getInstance().getTime());
	    ev.setDataFinalInscricao(Calendar.getInstance().getTime());
	    ev.setDataInicioEvento(Calendar.getInstance().getTime());
	    ev.setDataFinalEvento(Calendar.getInstance().getTime());
	    System.out.println(ev.getNome());
	    ev.setURL(Normalizer.normalize(ev.getNome(), Normalizer.Form.NFD).replaceAll("[^\\p{ASCII}]", "").replace(" ", "_"));
	    System.out.println(ev.getURL());
	    ev.setLocal("IFAM-CMC");
	    ev.setEntidade(e);
            
	    out.println(evDAO.salvar(ev));

	    fe = FotosEventos.getInstance();
	    stream = getServletContext().getResourceAsStream("/img/templates/info1.jpg");
	    fe.setEvento(ev);
	    fe.setFoto(IOUtils.toByteArray(stream));
	    out.println(feDAO.salvar(fe));

	    stream = getServletContext().getResourceAsStream("/img/templates/info2.png");
	    fe.setEvento(ev);
	    fe.setFoto(IOUtils.toByteArray(stream));
	    out.println(feDAO.salvar(fe));

	    stream = getServletContext().getResourceAsStream("/img/templates/info3.png");
	    fe.setEvento(ev);
	    fe.setFoto(IOUtils.toByteArray(stream));
	    out.println(feDAO.salvar(fe));
            
            ev = Evento.getInstance();
	    ev.setNome("Semana da Construção Civil");
	    ev.setDescricao("Palestras e minicursos ofertados à comunidade do IFAM");
	    ev.setDataInicioInscricao(Calendar.getInstance().getTime());
	    ev.setDataFinalInscricao(Calendar.getInstance().getTime());
	    ev.setDataInicioEvento(Calendar.getInstance().getTime());
	    ev.setDataFinalEvento(Calendar.getInstance().getTime());
	    System.out.println(ev.getNome());
	    ev.setURL(Normalizer.normalize(ev.getNome(), Normalizer.Form.NFD).replaceAll("[^\\p{ASCII}]", "").replace(" ", "_"));
	    System.out.println(ev.getURL());
	    ev.setLocal("IFAM-CMC");
	    ev.setEntidade(e);
	    out.println(evDAO.salvar(ev));

	    fe = FotosEventos.getInstance();
	    stream = getServletContext().getResourceAsStream("/img/templates/quim1.jpg");
	    fe.setEvento(ev);
	    fe.setFoto(IOUtils.toByteArray(stream));
	    out.println(feDAO.salvar(fe));

	    stream = getServletContext().getResourceAsStream("/img/templates/quim2.png");
	    fe.setEvento(ev);
	    fe.setFoto(IOUtils.toByteArray(stream));
	    out.println(feDAO.salvar(fe));

            
            
            

	    //Cadastro de outros discentes
	    for (int i = 0; i < 14; i++) {
                
		d = Discente.getInstance();
		d.setNome(nomesFemininos[i]);
                d.setTelefone("9299313548" + i);
		d.setNomeBanco(Criptografia.encrypt(d.getNome()));
		d.setCPF("025465692" + i);
		d.setCPFbanco(Criptografia.encrypt(d.getCPF()));
		d.setUsuario("2019114403" + i);
		d.setUsuarioBanco(Criptografia.encrypt(d.getUsuario()));
		d.setRG("1234567" + i);
		d.setRGbanco(Criptografia.encrypt(d.getRG()));
		d.setSenha("123");
		d.setSenhaBanco(Criptografia.encrypt(d.getSenha()));
		d.setSexo("FEMININO");
		d.setEtnia("BRANCA");
		d.setNomePai("Heraldo Bezerra Costa " + i);
		d.setNomeMae("Nilda Mônica Marcela Pinheiro " + i);
		d.setEstadoCivil("SOLTEIRO");
		d.setEmail("danielaferreira1133@gmail.com");
		d.setLinkCurriculoLattes("https://wwws.cnpq.br/cvlattesweb/PKG_MENU.menu?f_cod=66443CA9D507B0651D4690F514632E67#");
		d.setLinkPerfilLinkedIn("https://www.linkedin.com/in/victor-yan-b4312415b/");

		data.set(Calendar.DAY_OF_MONTH, new Random().nextInt(30));
		data.set(Calendar.MONTH, new Random().nextInt(12));
		data.set(Calendar.YEAR, 1980 + (new Random().nextInt(10)));

		d.setDataNascimento(data.getTime());

		out.println(dDAO.salvar(d));

		fec = FormacaoEmCampus.getInstance();
		fec.setNome(cursos[new Random().nextInt(4)]);
		fec.setAnoTermino(2018);
		fec.setDiscente(d);

		int sorteiaCampus = new Random().nextInt(2);
		System.out.println(entTeste1.getNome() + " " + entTeste2.getNome() + " " + sorteiaCampus);
		if (sorteiaCampus == 0) {
		    fec.setCampus(entTeste1);
		} else {
		    fec.setCampus(entTeste2);
		}

		//fec.setCampus(e);
		out.println(fecDAO.salvar(fec));
	    }
            
            
            
	    stream.close();
	} catch (Exception ex) {
	    Logger.getLogger(EncherBanco.class.getName()).log(Level.SEVERE, null, ex);
	}
	response.sendRedirect("home.jsp");

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
	    throws ServletException, IOException {
    }

}

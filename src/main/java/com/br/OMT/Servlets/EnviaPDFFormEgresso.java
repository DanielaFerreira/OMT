/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.br.OMT.Servlets;

import com.br.OMT.Utils.CommonsMail;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.MalformedURLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.mail.EmailException;

import java.net.MalformedURLException;
import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.HtmlEmail;

/**
 *
 * @author eddunic
 */
public class EnviaPDFFormEgresso extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
	    throws ServletException, IOException, MalformedURLException {

	doPost(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
	    throws ServletException, IOException, MalformedURLException {

//	try {
//	    CommonsMail.enviarEmail("eduardo.bitencourt007@gmail.com");
//	} catch (EmailException | MalformedURLException ex) {
//	    Logger.getLogger(EnviaPDFFormEgresso.class.getName()).log(Level.SEVERE, null, ex);
//	}
//	String acao = request.getParameter("acao");
//	if (acao.equals("Enviar")) {
//	    try {
//		CommonsMail.enviarEmail(request.getParameter("htmlEmail"));
//	    } catch (EmailException ex) {
//		Logger.getLogger(EnviaPDFFormEgresso.class.getName()).log(Level.SEVERE, null, ex);
//	    }
//	}
	String nome = request.getParameter("nome_discente");
	String naturalidade = request.getParameter("nat");
	String nacionalidade = request.getParameter("nac");
	String dataNasc = request.getParameter("nasc");
	String idade = request.getParameter("idade");
	String sexo = request.getParameter("gender");
	String cep = request.getParameter("cep");
	String bairro = request.getParameter("bairro");
	String municipio = request.getParameter("mun");
	String uniFederativa = request.getParameter("uf");
	String telefone = request.getParameter("tel");
	String celular = request.getParameter("cel");
	String email = request.getParameter("email");
	String ifam = request.getParameter("if");
	String tipoCurso = request.getParameter("tipo_curso");
	String nomeCurso = request.getParameter("nome_curso");
	String anoCurso = request.getParameter("ano_curso"); //ano de conclusao
	String idadeCurso = request.getParameter("idade_curso"); //idade de conclusao
	String semestreCurso = request.getParameter("sem"); //semestre de conclusao
	String tempoCurso = request.getParameter("time"); //tempo de conclusao
	String turnoCurso = request.getParameter("tur");
	String ativExtra = request.getParameter("extra");
	String ativAtual = request.getParameter("ativ_atual");
	String outraArea = request.getParameter("outra_area"); //se tiver
	String trabFormAtual = request.getParameter("trab_formacao_atual"); //se trabalha na área de formação
	String relacEmprego = request.getParameter("emprego_relacao");
	String outroEmprego = request.getParameter("outroEmprego");
	String ramoEmpresa = request.getParameter("ramoEmpresa");
	String outroRamo = request.getParameter("outroRamo");
	String nomeEmp = request.getParameter("nomeEmp");
	String enderEmp = request.getParameter("enderEmp");
	String bairroEmp = request.getParameter("bairroEmp");
	String cepEmp = request.getParameter("cepEmp");
	String telEmp = request.getParameter("telEmp");
	String ramalEmp = request.getParameter("ramalEmp");
	String emailEmp = request.getParameter("emailEmp");
	String chefeEmp = request.getParameter("chefeEmp");
	String admissaoEmp = request.getParameter("admissaoEmp");
	String funcao = request.getParameter("funcao"); //funcao na empresa
	String funcaoEsp = request.getParameter("funcaoEsp"); //se tiver outra funcao
	String rend = request.getParameter("rend"); //rendimento mensal
	String motivoFora = request.getParameter("motivoFora"); //fora da area de formacao
	String motivoForaEsp = request.getParameter("motivoForaEsp");
	String matriz = request.getParameter("matriz");
	String dific = request.getParameter("dific"); //se tiver
	String dificEsp = request.getParameter("dificEsp");
	String encontro = request.getParameter("encontro");
	String comentario = request.getParameter("comment");

	// Cria o e-mail
	HtmlEmail htmlEmail = new HtmlEmail();

	// Utilize o hostname do seu provedor de htmlEmail
	htmlEmail.setHostName("smtp.gmail.com");

	// Quando a porta utilizada não é a padrão (gmail = 465)
	htmlEmail.setSmtpPort(465);

	try {
	    // Adiciona os destinatários
	    htmlEmail.addTo(email);
	} catch (EmailException ex) {
	    Logger.getLogger(EnviaPDFFormEgresso.class.getName()).log(Level.SEVERE, null, ex);
	}

	try {
	    // Configura o seu htmlEmail do qual enviará
	    htmlEmail.setFrom("ifam.noreply@ifam.edu.br", "Instituto Federal do Amazonas");
	} catch (EmailException ex) {
	    Logger.getLogger(EnviaPDFFormEgresso.class.getName()).log(Level.SEVERE, null, ex);
	}

	// Adiciona um assunto
	htmlEmail.setSubject("IFAM - Pesquisa de Egresso");

	try {
	    // adiciona uma imagem ao corpo da mensagem e retorna seu id
	    // URL url = new URL("http://www.apache.org/images/asf_logo_wide.gif");
	    // String cid = htmlEmail.embed(url, "Apache logo");

	    // Adiciona a mensagem do htmlEmail e configura a mensagem para o formato HTML
	    // htmlEmail.setHtmlMsg("<html>The apache logo - <img src=\"cid:" + cid + "\"></html>");
	    String dados = nome + naturalidade + nacionalidade + dataNasc + idade + sexo + cep +
		    bairro + municipio + uniFederativa + telefone + celular + email + ifam + tipoCurso + 
		    nomeCurso + anoCurso + idadeCurso + semestreCurso + tempoCurso + turnoCurso + ativExtra +
		    ativAtual + outraArea + trabFormAtual + relacEmprego + outroEmprego + ramoEmpresa +
		    outroRamo + nomeEmp + enderEmp + bairroEmp + cepEmp + telEmp + ramalEmp + emailEmp +
		    chefeEmp + admissaoEmp + funcao + funcaoEsp + rend + motivoFora + motivoForaEsp + matriz +
		    dific + dificEsp + encontro + comentario;
	    
	    htmlEmail.setHtmlMsg(dados);
	    
	} catch (EmailException ex) {
	    Logger.getLogger(EnviaPDFFormEgresso.class.getName()).log(Level.SEVERE, null, ex);
	}

	try {
	    // configura uma mensagem alternativa caso o servidor não suporte HTML
	    htmlEmail.setTextMsg("Seu servidor de e-mail não suporta mensagem HTML.");
	} catch (EmailException ex) {
	    Logger.getLogger(EnviaPDFFormEgresso.class.getName()).log(Level.SEVERE, null, ex);
	}

	// Para autenticar no servidor é necessário chamar os dois métodos abaixo
	htmlEmail.setSSL(true);
	htmlEmail.setAuthentication("adopets.foundation@gmail.com", "stephoda");

	try {
	    // envia o e-mail
	    htmlEmail.send();
	} catch (EmailException ex) {
	    Logger.getLogger(EnviaPDFFormEgresso.class.getName()).log(Level.SEVERE, null, ex);
	}

    }

}

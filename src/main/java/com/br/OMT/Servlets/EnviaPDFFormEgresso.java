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

/**
 *
 * @author eddunic
 */
public class EnviaPDFFormEgresso extends HttpServlet {

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
//		CommonsMail.enviarEmail(request.getParameter("email"));
//	    } catch (EmailException ex) {
//		Logger.getLogger(EnviaPDFFormEgresso.class.getName()).log(Level.SEVERE, null, ex);
//	    }
//	}
	PrintWriter out = response.getWriter();

	out.println(request.getParameter("nome_discente"));

    }

}

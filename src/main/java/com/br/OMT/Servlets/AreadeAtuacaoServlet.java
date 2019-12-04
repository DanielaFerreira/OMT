/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.br.OMT.Servlets;

import com.br.OMT.DAO.AreadeAtuacaoDAO;
import com.br.OMT.DAO.DiscenteDAO;
import com.br.OMT.models.AreadeAtuacao;
import com.br.OMT.models.Discente;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author daniela
 */
public class AreadeAtuacaoServlet extends HttpServlet {

      @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setCharacterEncoding("ISO-8859-1");
        AreadeAtuacao aa = AreadeAtuacao.getInstance();
        AreadeAtuacaoDAO aadao = new AreadeAtuacaoDAO();
        
         if (request != null) {
            String butao = request.getParameter("acao");
            if (butao.equals("cadastrar")) {
                aa.setNome(request.getParameter("nome"));
              
                Discente d = (Discente) request.getSession().getAttribute("usuario");
                DiscenteDAO ddao = new DiscenteDAO();
                try {
                    d = ddao.buscarById(d.getId());
                    aa.setDiscente(d);
                    String str = aadao.salvar(aa);
                    if (str.equals("")) {
                        response.getWriter().println("Certo!");
                        response.sendRedirect("../OMT/feedback/sucesso.jsp");
                    } else {
                        response.sendRedirect("../OMT/feedback/erro.jsp?erro=" + str);
                    }
                } catch (Exception ex) {
                    Logger.getLogger(FormacaoServlet.class.getName()).log(Level.SEVERE, null, ex);
                }

            } else if(butao.equals("alterar")){
                    String id = request.getParameter("id");
                    
                    Long idLong = Long.parseLong(id);
                    aa = aadao.getById(idLong);
                    aa.setNome(request.getParameter("nome"));
                    
                    String str;
                    try {
                        str = aadao.atualizar(aa);
                        if (str.equals("")) {
                            response.sendRedirect("../OMT/feedback/atualizado.jsp");
                        } else {
                            response.sendRedirect("../OMT/feedback/erro.jsp?erro=" +str);
                        }
                    } catch (Exception ex) {
                        response.sendRedirect("../OMT/feedback/erro.jsp?erro=" +ex.getMessage());
                    }
                } else {
                    if (butao.equals("deletar")) {
                        String id = request.getParameter("id_area_atuacao");
                        Long idLong = Long.parseLong(id);
                        aa = aadao.getById(idLong);
                        aadao.deletar(aa);
                        response.sendRedirect("../OMT/feedback/deletado.jsp");
                    }
                }
            }
    }
               
}

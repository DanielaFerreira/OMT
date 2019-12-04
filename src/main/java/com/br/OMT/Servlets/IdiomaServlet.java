/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.br.OMT.Servlets;

import com.br.OMT.DAO.DiscenteDAO;
import com.br.OMT.DAO.IdiomaDAO;
import com.br.OMT.models.Discente;
import com.br.OMT.models.Idioma;
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
public class IdiomaServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setCharacterEncoding("ISO-8859-1");
        Idioma i = Idioma.getInstance();
        IdiomaDAO idao = new IdiomaDAO();
         Discente d = (Discente) request.getSession().getAttribute("usuario");
            
        if (request != null) {
            String butao = request.getParameter("acao");
            if (butao.equals("cadastrar")) {
                i.setNome(request.getParameter("nome"));
                i.setSituacao(request.getParameter("situacao"));
                DiscenteDAO ddao = new DiscenteDAO();
               
                try {
                    d = ddao.buscarById(d.getId());
                } catch (Exception ex) {
                    Logger.getLogger(IdiomaServlet.class.getName()).log(Level.SEVERE, null, ex);
                }
                i.setDiscente(d);
                try {
                    String str = idao.salvar(i);
                    if (str.equals("")) {
                        response.getWriter().println("Certo!");
                        response.sendRedirect("../OMT/feedback/sucesso.jsp");
                    } else {
                        response.sendRedirect("../OMT/feedback/erro.jsp?erro=" + str);
                    }
                } catch (Exception ex) {
                    Logger.getLogger(IdiomaServlet.class.getName()).log(Level.SEVERE, null, ex);
                }

            } else if(butao.equals("alterar")){
                    String id = request.getParameter("id");
                    Long idLong = Long.parseLong(id);
                try {
                    i = idao.getById(idLong);
                } catch (Exception ex) {
                    Logger.getLogger(IdiomaServlet.class.getName()).log(Level.SEVERE, null, ex);
                }
                    i.setNome(request.getParameter("nome"));
                i.setSituacao(request.getParameter("situacao"));
                    String str;
                    try {
                        str = idao.atualizar(i);
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
                        String id = request.getParameter("id_idioma");
                        Long idLong = Long.parseLong(id);
                        try {
                            i = idao.getById(idLong);
                        } catch (Exception ex) {
                            Logger.getLogger(IdiomaServlet.class.getName()).log(Level.SEVERE, null, ex);
                        }
                        idao.deletar(i);
                        response.sendRedirect("../OMT/feedback/deletado.jsp");
                    }
                }
            }
        }
    
}

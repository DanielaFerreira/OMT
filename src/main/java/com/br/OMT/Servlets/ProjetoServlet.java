/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.br.OMT.Servlets;

import com.br.OMT.DAO.DiscenteDAO;
import com.br.OMT.DAO.ProjetoDAO;
import com.br.OMT.models.Discente;
import com.br.OMT.models.Projeto;
import java.io.IOException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author vinic
 */
public class ProjetoServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setCharacterEncoding("ISO-8859-1");
        Discente d = (Discente) request.getSession().getAttribute("usuario");
        DiscenteDAO ddao = new DiscenteDAO();
        Projeto p = Projeto.getInstance();
        ProjetoDAO pdao = new ProjetoDAO();

        if (request != null) {
            String butao = request.getParameter("acao");
            if (butao.equals("cadastrar")) {

                p.setNome(request.getParameter("nome"));
                p.setDescricao(request.getParameter("descricao"));
                p.setArea(request.getParameter("area"));
                try {
                    d = ddao.buscarById(d.getId());
                    List<Projeto> projetos = d.getProjetos();
                    if (projetos.add(p)) {
                        System.out.println("Funcionou");
                        d.setProjetos(projetos);
                    }
                } catch (Exception ex) {
                    Logger.getLogger(ProjetoServlet.class.getName()).log(Level.SEVERE, null, ex);
                }
                p.setDiscente(d);
                String str = pdao.salvar(p);
                ddao.atualizar(d);
                if (str.equals("")) {
                    response.sendRedirect("../OMT/feedback/sucesso.jsp");
                } else {
                    response.sendRedirect("../OMT/feedback/erro.jsp?erro=" + str);
                }
            } else if (butao.equals("alterar")) {
                String id = request.getParameter("id");
                Long idLong = Long.parseLong(id);
                p = pdao.getById(idLong);
                 p.setNome(request.getParameter("nome"));
                p.setDescricao(request.getParameter("descricao"));
                p.setArea(request.getParameter("area"));
                try {
                    d = ddao.buscarById(d.getId());
                    List<Projeto> projetos = d.getProjetos();
                    if (projetos.add(p)) {
                        d.setProjetos(projetos);
                    }
                } catch (Exception ex) {
                    Logger.getLogger(ProjetoServlet.class.getName()).log(Level.SEVERE, null, ex);
                }
                String str;
                try {
                    str = pdao.atualizar(p);
                    if (str.equals("")) {
                        response.sendRedirect("../OMT/feedback/atualizado.jsp");
                    } else {
                        response.sendRedirect("../OMT/feedback/erro.jsp?erro=" + str);
                    }
                } catch (Exception ex) {
                    response.sendRedirect("../OMT/feedback/erro.jsp?erro=" + ex.getMessage());
                }
            } else {
                if (butao.equals("deletar")) {
                    String id = request.getParameter("id_projeto");
                    Long idLong = Long.parseLong(id);
                    p = pdao.getById(idLong);
                    pdao.deletar(p);
                    response.sendRedirect("../OMT/feedback/deletado.jsp");
                }
            }
        }
    }

}

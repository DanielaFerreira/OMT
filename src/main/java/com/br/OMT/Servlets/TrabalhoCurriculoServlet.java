/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.br.OMT.Servlets;

import com.br.OMT.DAO.TrabalhoCurriculoDAO;
import com.br.OMT.models.Discente;
import com.br.OMT.models.TrabalhoCurriculo;
import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author vinic
 */
public class TrabalhoCurriculoServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Discente d = (Discente) request.getSession().getAttribute("usuario");
        TrabalhoCurriculo tc = TrabalhoCurriculo.getInstance();
        TrabalhoCurriculoDAO tcdao = new TrabalhoCurriculoDAO();

        response.setCharacterEncoding("ISO-8859-1");
        if (request != null) {
            String butao = request.getParameter("acao");
            if (butao.equals("cadastrar")) {
                tc.setProfissao(request.getParameter("profissao"));
                tc.setDescricao(request.getParameter("descricao"));
                DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
                df.setLenient(false);
                try {
                    tc.setTempoInicio(df.parse(request.getParameter("inicio")));
                    tc.setTempoFinal(df.parse(request.getParameter("fim")));
                    tc.setDuracao(tc.getTempoFinal().getTime() - tc.getTempoInicio().getTime());
                    tc.setDiscente(d);
                    tc.setEmpresa(request.getParameter("empresa"));
                    String str = tcdao.salvar(tc);
                    if (str.equals("")) {
                        response.getWriter().println("Certo");
                        response.sendRedirect("../OMT/feedback/sucesso.jsp");
                    } else {
                        response.sendRedirect("../OMT/feedback/erro.jsp?erro=" + str);
                    }
                } catch (ParseException ex) {
                    System.out.println("Erro: " + ex.getMessage());
                }

            } else if (butao.equals("alterar")) {
                String id = request.getParameter("id");
     tc.setProfissao(request.getParameter("profissao"));
                tc.setDescricao(request.getParameter("descricao"));
                DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
                df.setLenient(false);
                Long idLong = Long.parseLong(id);
                tc = tcdao.getById(idLong);
           
                try {
                    tc.setTempoInicio(df.parse(request.getParameter("inicio")));
                    tc.setTempoFinal(df.parse(request.getParameter("fim")));
                    tc.setDuracao(tc.getTempoFinal().getTime() - tc.getTempoInicio().getTime());
                    tc.setDiscente(d);
                    tc.setEmpresa(request.getParameter("empresa"));
                    String str = tcdao.salvar(tc);
                    if (str.equals("")) {
                        response.sendRedirect("../OMT/feedback/atualizado.jsp");
                    } else {
                        response.sendRedirect("../OMT/feedback/erro.jsp?erro=" + str);
                    }
                } catch (ParseException ex) {
                    System.out.println("Erro: " + ex.getMessage());
                }
              
            } else {
                if (butao.equals("deletar")) {
                    String id = request.getParameter("id_trabalhoCurriculo");
                    Long idLong = Long.parseLong(id);
                    tc = tcdao.getById(idLong);
                    tcdao.deletar(tc);
                    response.sendRedirect("../OMT/feedback/deletado.jsp");
                }
            }
        }
    }

}

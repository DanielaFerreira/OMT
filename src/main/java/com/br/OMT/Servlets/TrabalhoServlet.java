/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.br.OMT.Servlets;

import com.br.OMT.DAO.TrabalhoDAO;
import com.br.OMT.models.Entidade;
import com.br.OMT.models.Trabalho;
import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author vinic
 */
public class TrabalhoServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String butao = request.getParameter("acao");
        Trabalho t = Trabalho.getInstance();
        TrabalhoDAO tdao = new TrabalhoDAO();
        response.setCharacterEncoding("ISO-8859-1");
        if (request != null) {

            if (butao.equals("cadastrar")) {
                t.setProfissao(request.getParameter("profissao"));
                t.setTipo(request.getParameter("tipo").charAt(0));
                t.setQuantidadeVagas(Integer.parseInt(request.getParameter("quantidadeVagas")));
                t.setSalario(Double.parseDouble(request.getParameter("salario")));
                t.setDescricao(request.getParameter("descricao"));
                DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
                df.setLenient(false);
                try {
                    t.setTempoFinal(df.parse(request.getParameter("inicio")));
                    t.setTempoInicio(df.parse(request.getParameter("fim")));
                    t.setEntidade((Entidade) request.getSession().getAttribute("entidade"));

                    String str = tdao.salvar(t);
                    if (str.equals("")) {
                        response.getWriter().println("Certo");
                    } else {
                        response.getWriter().println("Errrado: " + str);
                    }
                } catch (ParseException ex) {
                    System.out.println("Erro: " + ex.getMessage());
                }

            } else {
                if (butao.equals("alterar")) {
             t.setEntidade((Entidade) request.getSession().getAttribute("entidade"));
                    setDados(t, t.getProfissao(), t.getTipo(), t.getQuantidadeVagas(), t.getSalario(), t.getDescricao(), t.getTempoInicio(), t.getTempoFinal());

                    String str;
                    try {
                        str = tdao.atualizar(t);
                        if (str.equals("")) {
                            response.sendRedirect("empresa/vagas_trabalho.jsp");
                        } else {
                            response.getWriter().println("Errado!");
                            response.getWriter().println(str);
                        }
                    } catch (Exception ex) {
                        response.getWriter().println("Erro! " + ex.getMessage());
                    }
                }
            }
        }
    }

    private void setDados(Trabalho t, String profissao, char tipo, int qtdeVagas,
            Double salario, String descricao, Date inicio, Date fim) {
        t.setProfissao(profissao);
        t.setTipo(tipo);
        t.setQuantidadeVagas(qtdeVagas);
        t.setSalario(salario);
        t.setDescricao(descricao);
        t.setTempoInicio(inicio);
        t.setTempoFinal(fim);
    }

}

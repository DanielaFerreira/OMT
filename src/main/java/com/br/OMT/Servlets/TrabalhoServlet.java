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
public class TrabalhoServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String mensagem = "";
        String butao = request.getParameter("acao");
        Trabalho t = Trabalho.getInstance();
        TrabalhoDAO tdao = new TrabalhoDAO();
        response.setCharacterEncoding("UTF-8");
        if (request != null) {

            if (butao.equals("cadastrar")) {
                t.setEntidade((Entidade) request.getSession().getAttribute("entidade"));
                t.setProfissao(request.getParameter("profissao"));
                t.setTipo(request.getParameter("tipo").charAt(0));
                t.setQuantidadeVagas(Integer.parseInt(request.getParameter("quantidadeVagas")));
                t.setSalario(Double.parseDouble(request.getParameter("salario")));
                t.setDescricao(request.getParameter("descricao"));
                DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
                df.setLenient(false);
                try {
                    t.setTempoFinal(df.parse(request.getParameter("fim")));
                    t.setTempoInicio(df.parse(request.getParameter("inicio")));

                    String str = tdao.salvar(t);
                    if (str.equals("")) {
                        //request.getSession().setAttribute("user", mensagem);

                        response.sendRedirect("empresa/vaga_trabalho.jsp");
                        mensagem = "<strong>Cadastro realizado!</strong> a vaga de trabalho " + t.getProfissao() + "já está na lista de vagas ofertadas pela sua empresa.";

                    } else {
                        mensagem = "<strong>Opa, ocorreu uma falha</strong> A vaga de trabalho " + t.getProfissao() + "não foi possível ser cadastrada por conta do erro" + str;
                    }
                } catch (ParseException ex) {
                    System.out.println("Erro: " + ex.getMessage());
                }

            } else {
                if (butao.equals("alterar")) {
                    String id = request.getParameter("id");
                    Long idLong = Long.parseLong(id);
                    t = tdao.getById(idLong);
                    t.setProfissao(request.getParameter("profissao"));
                    t.setTipo(request.getParameter("tipo").charAt(0));
                    t.setQuantidadeVagas(Integer.parseInt(request.getParameter("quantidadeVagas")));
                    t.setSalario(Double.parseDouble(request.getParameter("salario")));
                    t.setDescricao(request.getParameter("descricao"));
                    DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
                    df.setLenient(false);
                    try {
                        t.setTempoFinal(df.parse(request.getParameter("fim")));
                        t.setTempoInicio(df.parse(request.getParameter("inicio")));
                    } catch (ParseException ex) {
                        Logger.getLogger(TrabalhoServlet.class.getName()).log(Level.SEVERE, null, ex);
                    }

                    String str;
                    try {
                        str = tdao.atualizar(t);
                        if (str.equals("")) {
                            response.sendRedirect("empresa/vaga_trabalho.jsp");
                        } else {
                            response.getWriter().println("Errado!");
                            response.getWriter().println(str);
                        }
                    } catch (Exception ex) {
                        response.getWriter().println("Erro! " + ex.getMessage());
                    }
                } else {
                    if (butao.equals("deletar")) {
                        String id = request.getParameter("id");
                        Long idLong = Long.parseLong(id);
                        t = tdao.getById(idLong);
                        tdao.deletar(t);
                        response.sendRedirect("empresa/vaga_trabalho.jsp");
                    }
                }
            }
        }
    }

}

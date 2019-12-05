/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.br.OMT.Servlets;

import com.br.OMT.DAO.DiscenteDAO;
import com.br.OMT.DAO.TrabalhoDAO;

import com.br.OMT.DAO.NotificacaoDAO;

import com.br.OMT.DAO.VagaReservadaCandidatoDAO;
import com.br.OMT.Utils.CommonsMail;
import com.br.OMT.models.Discente;
import com.br.OMT.models.Entidade;
import com.br.OMT.models.Notificacao;

import com.br.OMT.models.VagaReservadaCandidato;
import com.br.OMT.models.Trabalho;
import com.br.OMT.models.Usuario;
import java.io.IOException;
import java.net.MalformedURLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.mail.EmailException;

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
                t.setTipo(request.getParameter("tipo"));
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

                        response.sendRedirect("../OMT/feedback/sucesso.jsp");
                        mensagem = "<strong>Cadastro realizado!</strong> a vaga de trabalho " + t.getProfissao() + "já está na lista de vagas ofertadas pela sua empresa.";

                    } else {
                        mensagem = "<strong>Opa, ocorreu uma falha</strong> A vaga de trabalho " + t.getProfissao() + "não foi possível ser cadastrada por conta do erro" + str;
                        response.sendRedirect("../OMT/feedback/erro.jsp?erro=" + str);
                    }
                } catch (ParseException ex) {
                    response.sendRedirect("../OMT/feedback/sucesso.jsp?erro=" + ex.getMessage());
                }

            } else {
                if (butao.equals("alterar")) {
                    String id = request.getParameter("id");
                    Long idLong = Long.parseLong(id);
                    t = tdao.getById(idLong);
                    t.setProfissao(request.getParameter("profissao"));
                    t.setTipo(request.getParameter("tipo"));
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
                            response.sendRedirect("../OMT/feedback/atualizado.jsp");
                        } else {
                            response.sendRedirect("../OMT/feedback/erro.jsp?erro=" + str);
                        }
                    } catch (Exception ex) {
                        response.sendRedirect("../OMT/feedback/erro.jsp?erro=" + ex.getMessage());
                    }
                } else {
                    if (butao.equals("deletar")) {
                        String id = request.getParameter("id");
                        Long idLong = Long.parseLong(id);
                        t = tdao.getById(idLong);
                        tdao.deletar(t);
                        response.sendRedirect("../OMT/feedback/deletado.jsp");
                    } else if (butao.equals("indicar")) {
                        String idt = request.getParameter("idTrabalho");
                        String idd = request.getParameter("idDiscente");
                        Long idtLong = Long.parseLong(idt);
                        Long iddLong = Long.parseLong(idd);

                        Discente d = new Discente();
                        DiscenteDAO ddao = new DiscenteDAO();
                        VagaReservadaCandidato vrc = new VagaReservadaCandidato();
                        VagaReservadaCandidatoDAO vrcdao = new VagaReservadaCandidatoDAO();

                        t = tdao.getById(idtLong);

                        try {
                            d = ddao.buscarById(iddLong);
                            System.out.println("Nome discente " + d.getNome() + " trabalho " + t.getProfissao());
                        } catch (Exception ex) {
                            Logger.getLogger(TrabalhoServlet.class.getName()).log(Level.SEVERE, null, ex);
                        }

                        vrc.setDiscente(d);
                        vrc.setTrabalho(t);

                        Notificacao notificacao = new Notificacao();
                        NotificacaoDAO notificacaoDao = new NotificacaoDAO();
                        notificacao.setDestinatario((Usuario) d);
                        notificacao.setStatus("Não lida");

                        notificacao.setTituloDestinatario(request.getParameter("titulo"));
                        notificacao.setMensagemdoDestinatario(request.getParameter("mensagem") + " " + " <a class='d-block' target='blank' href='candidatoVerVaga.jsp?id=" + t.getId() + "> Ver vaga</a>");

                        String str;
                        try {
                            str = vrcdao.salvar(vrc);
                            str += notificacaoDao.salvar(notificacao);
                            CommonsMail.enviarEmail(d.getEmail(), t.getEntidade().getNome());
                            if (str.equals("")) {
                                response.sendRedirect("../OMT/feedback/vagaIndicada.jsp");
                            } else {
                                response.sendRedirect("../OMT/feedback/erro.jsp?erro=" + str);
                            }
                        } catch (Exception ex) {
                            response.sendRedirect("../OMT/feedback/erro.jsp?erro=" + ex.getMessage());
                        }

                    }
                }
            }
        }
    }

}

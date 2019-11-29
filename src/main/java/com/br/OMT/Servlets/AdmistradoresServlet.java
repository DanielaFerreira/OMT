/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.br.OMT.Servlets;

import com.br.OMT.DAO.FuncoesExtras;
import com.br.OMT.DAO.UsuarioDAO;
import com.br.OMT.Utils.Criptografia;
import com.br.OMT.models.Evento;
import com.br.OMT.models.Trabalho;
import com.br.OMT.models.Usuario;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author vinic
 */
public class AdmistradoresServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("Hello@");
        FuncoesExtras fe = new FuncoesExtras();
        ArrayList<Object> alo = fe.listNoticias();
        for(Object o: alo){
            if(o instanceof Evento){
                System.out.println("HelloEvento: "+((Evento) o).getNome());
            }else if(o instanceof Trabalho){
                System.out.println("HelloTrabalho: "+((Trabalho) o).getProfissao());
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setCharacterEncoding("ISO-8859-1");

        if (request != null) {
            String butao = request.getParameter("acao");
            if (butao.equals("cadastrar")) {
                Usuario u = Usuario.getInstance();
                u.setNome(request.getParameter("nome"));
                u.setUsuario(request.getParameter("usuario"));
                u.setTipo('A');
                u.setSenha(request.getParameter("senha"));
                byte[] senhaCriptografada;
                try {
                    senhaCriptografada = Criptografia.encrypt(u.getSenha());
                    u.setSenhaBanco(senhaCriptografada);
		    u.setNomeBanco(Criptografia.encrypt(u.getNome()));
		    u.setUsuarioBanco(Criptografia.encrypt(u.getUsuario()));
                    UsuarioDAO udao = new UsuarioDAO();
                    String str = udao.salvar(u);
                    if (str.equals("")) {
                        response.sendRedirect("/OMT/feedback/sucesso.jsp");
                    } else {
                        response.sendRedirect("/OMT/feedback/erro.jsp?eroo=" + str);
                    }
                } catch (Exception ex) {
                }

            }
        }
    }

}

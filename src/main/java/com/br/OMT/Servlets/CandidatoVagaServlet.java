/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.br.OMT.Servlets;

import com.br.OMT.DAO.CandidatoVagaDAO;
import com.br.OMT.DAO.TrabalhoDAO;
import com.br.OMT.Utils.Criptografia;
import com.br.OMT.models.CandidatoVaga;
import com.br.OMT.models.Discente;
import com.br.OMT.models.Trabalho;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author daniela
 */
public class CandidatoVagaServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
          TrabalhoDAO tDAO = new TrabalhoDAO();
          Trabalho t = new Trabalho();
          CandidatoVaga cv = new CandidatoVaga();
          CandidatoVagaDAO cvDAO = new CandidatoVagaDAO();
          
          t = tDAO.getById(Long.parseLong(request.getParameter("id")));
          
          cv.setDiscente((Discente) request.getSession().getAttribute("usuario"));
         
          
         // System.out.println("id trabalho: " + request.getParameter("id") + " id Discente: " + cv.getDiscente().getCPF());
          
          cv.setTrabalho(t);
          String str = cvDAO.salvar(cv);
    
        if (request != null) {
            response.sendRedirect("../OMT/feedback/sucesso.jsp");
        } else {
            response.sendRedirect("../OMT/feedback/erro.jsp?erro=" + str);
        }
            
        
    //    response.sendRedirect("../OMT/feedback/erro.jsp?erro=" +ex.getMessage());
              
        /*if (butao.equals("cancelar-candidatura")) {
                        String id = request.getParameter("id");
                        Long idLong = Long.parseLong(id);
                        t = tdao.getById(idLong);
                        tdao.deletar(t);
                        response.sendRedirect("../OMT/feedback/deletado.jsp");
                    }
                }
            }
    
    */
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

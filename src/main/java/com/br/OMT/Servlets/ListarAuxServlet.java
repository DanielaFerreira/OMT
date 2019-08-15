package com.br.OMT.Servlets;

import com.br.OMT.DAO.AuxDAO;
import com.br.OMT.models.Aux;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author eddunic
 */
public class ListarAuxServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Aux aux = new Aux();
        AuxDAO dao = new AuxDAO();

        aux.setIdx(1L);
        aux.setId(Long.parseLong(request.getParameter("id")));

        if (dao.listAux().isEmpty()) {
            dao.salvar(aux);
        } else {
            dao.atualizar(aux);
        }

        response.sendRedirect("/OMT/empresa/alterarVaga.jsp");
    }

}

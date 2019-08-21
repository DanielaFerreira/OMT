package com.br.OMT.Servlets;

import com.br.OMT.DAO.AuxiliarDAO;
import com.br.OMT.models.Auxiliar;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author eddunic
 */
public class ListarAuxiliarServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Auxiliar aux = new Auxiliar();
        AuxiliarDAO dao = new AuxiliarDAO();

        aux.setIdx(1L);
        aux.setId(Long.parseLong(request.getParameter("id")));

        if (dao.listAuxiliar().isEmpty()) {
            dao.salvar(aux);
        } else {
            dao.atualizar(aux);
        }

        response.sendRedirect("/OMT/empresa/alterarVaga.jsp");
    }

}

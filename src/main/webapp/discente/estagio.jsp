<%-- 
    Document   : estagio
    Created on : 24/07/2019, 17:05:34
    Author     : Aluno
--%>

<%@page import="com.br.OMT.models.Trabalho"%>
<%@page import="java.util.List"%>
<%@page import="com.br.OMT.DAO.TrabalhoDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<div class="col-md-12 table-responsive-lg">
    <table class="table table-sm table-striped table-bordered table-hover" id="filtro">

        <caption>Lista de vagas de emprego</caption>
        <thead>
            <tr class="auto">
                <th>Profissão</th>
                <th>Salário</th>
                <th>Ação</th>
            </tr>
        </thead>
        <tbody>
            <%
                TrabalhoDAO tDAO = new TrabalhoDAO();
                List<Trabalho> trabalhos = tDAO.listTrabalho();
                for (Trabalho t : trabalhos) {
            %>
            <tr>
                <th scope="row"><%=t.getProfissao()%></th>
                <td><%=t.getSalario()%></td>
                <td class="text-center"><a class="btn btn-green" href="/OMT/DiscenteServlet?id=<%=t.getId()%>" name="acao" value="candidatar">Candidatar-se</a></td>
            </tr>
            <% }%>
        </tbody>
        <tfoot>

            <tr class="auto">
                <th>Profissão</th>
                <th>Salário</th>
                <th>Ação</th>
            </tr>
        </tfoot>
    </table>
</div>
<script src="../js/jquery-3.3.1.min.js"></script>
<script src="../js/popper.min.js"></script>
<script src="../js/bootstrap.js"></script>
<script src="../js/mdb.min.js"></script>
<script src="../js/general.js"></script>
<script src="../js/jquery.mask.min.js"></script>
<script src="../js/mascaras.js"></script>
<script src="../js/addons/datatables.min.js"></script>
<script src="../js/filtro/filtro.js"></script>
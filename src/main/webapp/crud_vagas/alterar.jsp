<%-- 
    Document   : vaga_trabalho
    Created on : 12/06/2019, 22:03:04
    Author     : daniela
--%>
<%@page import="com.br.OMT.models.Trabalho"%>
<%@page import="com.br.OMT.DAO.TrabalhoDAO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="TrabalhoDAO" class="com.br.OMT.DAO.TrabalhoDAO"/>
<c:set var="trabalhos" value="${TrabalhoDAO.listTrabalho()}"/>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Observat�rio Mundo do Trabalho - Vaga de Trabalho</title>
        <link rel="stylesheet" href="../css/bootstrap.css"/>
        <link rel="stylesheet" href="../css/mdb.css"/>
        <link rel="stylesheet" href="../css/fontawesome-all.css">
        <link rel="stylesheet" href="../css/style.css">
    </head>
    <body>
        <jsp:include page="../header.jsp" />
        <main>
            <div class="container-fluid">
                <div class="row justify-content-center">
                    <div class="col-lg-8">
                        <nav class="navbar navbar-expand-lg navbar-light green darken-1">
                            <ul class="navbar-nav">
                                <li class="nav-item">
                                    <a href="javascript:history.back()" class="nav-link text-white">
                                        <i class="fa fa-arrow-alt-circle-left fa-lg"></i>
                                        Voltar
                                    </a>
                                </li>
                            </ul>
                        </nav>

                        <%
                            Trabalho t = Trabalho.getInstance();
                            TrabalhoDAO tDAO = new TrabalhoDAO();
                            t = tDAO.getById(Long.parseLong(request.getParameter("id")));
                        %>

                        <div class=" card">
                            <div class="mt-4 mx-4">
                                <form id="cadastrar-trabalho" method="POST" action="/OMT/TrabalhoServlet">
                                    <h3 class="font-weight-bold mb-4">Alterar vaga de emprego</h3>

                                    <div class="form-row">
                                        <div class="form-group col-md-6">
                                            <label for="profissao">Profiss�o</label>
                                            <input class="form-control validate" name="profissao" id="profissao" value="<%=t.getProfissao()%>" type="text">
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label for="tipo">Tipo</label>
                                            <input class="form-control validate" name="tipo" value="<%=t.getTipo()%>" id="tipo" type="text">
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="form-group col">
                                            <label for="salario">Sal�rio</label>
                                            <input class="form-control validate" name="salario" id="salario" value="<%=t.getSalario()%>" type="text"/>
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label for="quantidadeVagas">Quantidade de vagas</label>
                                            <input class="form-control validate" name="quantidadeVagas" id="quantidadeVagas" value="<%=t.getQuantidadeVagas()%>" type="number">
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="descricao">Descri��o</label>
                                        <textarea class="form-control" name="descricao" id="descricao" rows="5"><%=t.getDescricao()%></textarea>
                                    </div>

                                    <div class="row">
                                        <div class="form-group col-md-6">
                                            <label for="inicio">In�cio das inscri��es</label>
                                            <input class="form-control validate data" type="text" id="inicio" name="inicio"
                                                   value="<fmt:formatDate type="both" dateStyle="short" pattern="dd/MM/yyyy" value="<%=t.getTempoInicio()%>"/>"/> 
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label for="fim">T�rmino das inscri��es</label>
                                            <input class="form-control validate data" type="text" id="fim" name="fim"
                                                   value="<fmt:formatDate type="both" dateStyle="short" pattern="dd/MM/yyyy" value="<%=t.getTempoFinal()%>"/>"/> 
                                        </div>
                                        <input class="form-control" id="id" type="hidden" name="id" value="<%= t.getId()%>" readonly>
                                    </div>
                                    <div class="text-right">
                                        <button type="submit" name="acao" value="alterar" class="btn btn-green waves-effct">
                                            <i class="fa fa-check mr-1"></i>Alterar</button>
                                    </div>
                                    <br>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        <jsp:include page="../footer.jsp" />
    </body>
    <script src="../js/jquery-3.3.1.min.js"></script>
    <script src="../js/popper.min.js"></script>
    <script src="../js/bootstrap.js"></script>
    <script src="../js/mdb.min.js"></script>
    <script src="../js/general.js"></script>
    <script src="../js/jquery.mask.min.js"></script>
    <script src="../js/mascaras.js"></script>
</html>

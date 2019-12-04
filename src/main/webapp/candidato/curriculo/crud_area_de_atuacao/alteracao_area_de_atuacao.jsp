<%-- 
    Document   : alteracao_area_de_atuacao
    Created on : 03/12/2019, 15:38:49
    Author     : daniela
--%>
<%@page import="com.br.OMT.Servlets.AreadeAtuacaoServlet"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="com.br.OMT.models.AreadeAtuacao"%>
<%@page import="com.br.OMT.DAO.AreadeAtuacaoDAO"%>
<jsp:useBean id="AreadeAtuacaoDAO" class="com.br.OMT.DAO.AreadeAtuacaoDAO"/>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Alterar Área de Atuação</title>
        <link rel="stylesheet" href="../../../css/bootstrap.css"/>
        <link rel="stylesheet" href="../../../css/mdb.css"/>
        <link rel="stylesheet" href="../../../css/fontawesome-all.css">
        <link rel="stylesheet" href="../../../css/style.css">
    </head>
    <body>
        <main>
            <jsp:include page="../../../header.jsp"/>
            <div class="container-fluid col-md-8">
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
                            AreadeAtuacao aa = AreadeAtuacao.getInstance();
                            AreadeAtuacaoDAO aaDAO = new AreadeAtuacaoDAO();
                            aa = aaDAO.getById(Long.parseLong(request.getParameter("id")));
                        %>
                
                
                <div class="card px-4 py-4">
                    <form method="POST" action="/OMT/AreadeAtuacaoServlet">
                        <h3 class="font-weight-bold mb-4">Alterar Área de Atuação</h3>

                        <div class="form-row">
                            <div class="col-md-12 form-group">
                                <label for="nome">Nome</label>
                                <input name="nome" id="nome" type="text" value="<%=aa.getNome()%>" class="form-control validate">
                            </div>
                            <input class="form-control" id="id" type="hidden" name="id" value="<%=aa.getId()%>" readonly>
                       
                        </div>
                        <div class="text-right">
                            <button type="submit" name="acao" value="alterar" class="btn btn-md btn-green">
                                <i class="fa fa-check mr-1"></i>Alterar</button>
                            <button type="reset" class="btn btn-md btn-grey waves-effect"><i class="fas fa-eraser mr-1"></i>Limpar</button>
                        </div>
                    </form>
                </div>
            </div>
        </main>
        <jsp:include page="../../../footer.jsp"/>
        <script src="../../../js/jquery-3.3.1.min.js"></script>
        <script src="../../../js/popper.min.js"></script>
        <script src="../../../js/bootstrap.js"></script>
        <script src="../../../js/mdb.min.js"></script>
        <script src="../../../js/general.js"></script>
        <script src="../../../js/jquery.mask.min.js"></script>
        <script src="../../../js/mascaras.js"></script>
    </body>
</html>

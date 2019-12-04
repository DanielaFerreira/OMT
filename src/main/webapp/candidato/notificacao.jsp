<%-- 
    Document   : pagina_inicial
    Created on : 07/06/2018, 15:17:41
    Author     : Natan S. dos Santos
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="ISO-8859-1" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="EventoDAO" class="com.br.OMT.DAO.EventoDAO" />
<jsp:useBean id="FotosEventosDAO" class="com.br.OMT.DAO.FotosEventosDAO" />
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Observatório Mundo do Trabalho</title>
        <link rel="stylesheet" href="../css/bootstrap.css"/>
        <link rel="stylesheet" href="../css/mdb.css"/>
        <link rel="stylesheet" href="../css/fontawesome-all.css">
        <link rel="stylesheet" href="../css/style.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    </head>
    <body>
        <jsp:include page="../header.jsp"/>
        <main>
            <c:set var="eventos" value="${EventoDAO.listEventos()}"/>
            <c:if test="${not empty usuario}">

                <div class="container-fluid">

                    <div class="row justify-content-center">
                        <div class="col-8">
                            <nav class="navbar navbar-expand-lg navbar-light green darken-1">
                                <ul class="navbar-nav">
                                    <li class="nav-item">
                                        <a href="index.jsp" class="nav-link text-white">
                                            <i class="fa fa-arrow-alt-circle-left fa-lg"></i>
                                            Voltar
                                        </a>
                                    </li>
                                </ul>
                            </nav>
                            <div class="tab-content card px-4 py-4">
                                <h4 href="#"><strong> Notificações</strong></h4>
                                <table class="table table-sm table-striped table-bordered table-hover" id="filtro">
                                    <caption>Notificações</caption>
                                    <thead>
                                        <tr class="auto">
                                            <th>Nome<i class="fa fa-sort float-right"></i></th>
                                            <th>Mensagem<i class="fa fa-sort float-right"></i></th>
                                            <th>Data<i class="fa fa-sort float-right"></i></th>
                                            <th>Opção<i class="fa fa-sort float-right"></i></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>Samsung</td>
                                            <td>Venho por meio deste informar que sua...</td>
                                            <td>12/02/2003</td>
                                            <td><a class="blue-text">Ver mais</a></td>
                                        </tr>
                                    </tbody>
                                    <tfoot>
                                        <tr class="auto">
                                            <th>Nome</th>
                                            <th>Mensagem</th>
                                            <th>Data</th>
                                            <th>Opção</th>
                                        </tr>
                                    </tfoot>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </c:if>
            <c:if test="${empty usuario}">
                <h1> Acesso negado <a href="../home.jsp">Volte para a tela de login </a></h1>
            </c:if>
        </main>
        <jsp:include page="../footer.jsp"/>
        <script src="../js/jquery-3.3.1.min.js"></script>
        <script src="../js/popper.min.js"></script>
        <script src="../js/bootstrap.js"></script>
        <script src="../js/mdb.min.js"></script>
        <script src="../js/general.js"></script>
        <script src="../js/jquery-3.3.1.min.js"></script>
        <script src="../js/popper.min.js"></script>
        <script src="../js/bootstrap.js"></script>
        <script src="../js/mdb.min.js"></script>
        <script src="../js/general.js"></script>
        <script src="../js/jquery.mask.min.js"></script>
        <script src="../js/mascaras.js"></script>
        <script src="../js/addons/datatables.min.js"></script>
        <script src="../js/filtro/filtro.js"></script>
    </body>
</html>

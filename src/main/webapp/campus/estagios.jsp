<%-- 
    Document   : estagios
    Created on : 29/11/2019, 13:19:26
    Author     : Paulo Ribeiro
--%>

<%@page pageEncoding="ISO-8859-1"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="TrabalhoDAO" class="com.br.OMT.DAO.TrabalhoDAO"/>
<c:set var="trabalhos" value="${TrabalhoDAO.listTrabalho()}"/>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Estágios</title>
        <link rel="stylesheet" href="../css/bootstrap.css"/>
        <link rel="stylesheet" href="../css/mdb.css"/>
        <link rel="stylesheet" href="../css/fontawesome-all.css">
        <link rel="stylesheet" href="../css/style.css">
        <link rel="stylesheet" href="../css/addons/datatables.min.css">
    </head>
    <body>
        <jsp:include page="../header.jsp" />
        <main>
            <c:set var="eventos" value="${EventoDAO.listEventos()}"/>
            <c:if test="${not empty usuario}">

                <div class="container-fluid">
                    <div class="row justify-content-center">
                        <div class="col-lg-3">
                            <div class="form-row justify-content-end">
                                <div class="col-lg-12">
                                    <jsp:include page="pertil_flutuante.jsp"/>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-8">
                            <ul class="nav nav-tabs nav-justified green darken-1" role="tablist">
                                <li class="nav-item">
                                    <a href="index.jsp" class="nav-link">
                                        <i class="fas fa-home fa-lg"></i>
                                        Página Inicial
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a href="eventos.jsp" class="nav-link">
                                        <i class="fas fa-calendar-check fa-lg"></i>
                                        Eventos
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a href="estagios.jsp" class="nav-link active">
                                        <i class="fas fa-briefcase fa-lg"></i> 
                                        Estágios
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a href="egressos.jsp" class="nav-link">
                                        <i class="fa fa-user-graduate fa-lg"></i>
                                        Egressos
                                    </a>
                                </li>
                            </ul>

                            <div class="card px-4 py-4">
                                <div class="form-row align-items-center">
                                    <div class="col-sm-6">
                                        <h3 class="font-weight-bold">Vagas de estágios</h3>
                                    </div>
                                    <div class="col-sm-6">
                                        
                                    </div>
                                </div>
                                <div class="mr-3 ml-3 mt-4">
                                    <table class="table table-sm table-striped table-bordered table-hover" id="filtro">
                                        <caption>Lista de vagas de emprego</caption>
                                        <thead>
                                            <tr class="auto">
                                                <th>Profissão<i class="fa fa-sort float-right"></i></th>
                                                <th>Salário<i class="fa fa-sort float-right"></i></th>
                                                <th>Quantidade de Vagas<i class="fa fa-sort float-right"></i></th>
                                                <th>Ação<i class="fa fa-sort float-right"></i></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${trabalhos}" var="trabalho">
                                                <tr>
                                                    <td><c:out value="${trabalho.profissao}"/></td>               
                                                    <td>R$${trabalho.salario}</td>
                                                    <td>${trabalho.quantidadeVagas}</td>
                                                    <td>
<!--                                                            <a class="blue-text" href="" data-toggle="modal" data-target="#visualizarVaga${trabalho.id}">Ver mais</a>-->
                                                        <a class="blue-text" href="../crud_vagas/verVaga.jsp?id=${trabalho.id}">Ver mais</a>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                        <tfoot>
                                            <tr class="auto">
                                                <th>Profissão</th>
                                                <th>Salário</th>
                                                <th>Quantidade de Vagas</th>
                                                <th>Ação</th>
                                            </tr>
                                        </tfoot>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </c:if>
            <c:if test="${empty usuario}">
                <h1> Acesso negado <a href="../home.jsp">Volte para a tela de login </a></h1>
            </c:if>
        </main>
        <jsp:include page="../footer.jsp" />
        <script src="../js/jquery-3.3.1.min.js"></script>
        <script src="../js/popper.min.js"></script>
        <script src="../js/bootstrap.js"></script>
        <script src="../js/mdb.min.js"></script>
        <script src="../js/general.js"></script>
        <script src="../js/addons/datatables.min.js"></script>
        <script src="../js/filtro/filtro.js"></script>
    </body>
</html>

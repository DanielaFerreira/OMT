<%-- 
    Document   : evento
    Created on : 28/05/2018, 20:39:30
    Author     : Gabriel San Martin
--%>
<%@page pageEncoding="ISO-8859-1"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="EventoDAO" class="com.br.OMT.DAO.EventoDAO"/>
<c:set var="eventos" value="${EventoDAO.listEventos()}"/>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Eventos</title>
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
                        <div class="col-lg-2"> 
                            <jsp:include page="pertil_flutuante.jsp"/>
                            <br>
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
                                    <a href="../campus/eventos.jsp" class="nav-link active">
                                        <i class="fas fa-calendar-check fa-lg"></i>
                                        Eventos
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a href="#" class="nav-link">
                                        <i class="fas fa-briefcase fa-lg"></i> 
                                        Estágios
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a href="#" class="nav-link">
                                        <i class="fa fa-chalkboard-teacher fa-lg"></i>
                                        Cursos
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a href="manterEgresso.jsp" class="nav-link">
                                        <i class="fa fa-user-graduate fa-lg"></i>
                                        Egressos
                                    </a>
                                </li>
                            </ul>

                            <div class="card px-4 py-4">
                                <div class="form-row align-items-center">
                                    <div class="col-sm-6">
                                        <h3 class="font-weight-bold">Eventos de seu campus</h3>
                                    </div>
                                    <div class="col-sm-6">
                                        <a href="../cadastro/evento.jsp" class="btn btn-green float-right"><i class="fa fa-plus mr-1"></i>Cadastrar Evento</a>
                                    </div>
                                </div>
                                <div class="mr-3 ml-3 mt-4">
                                    <c:if test="${eventos.size()>0}">
                                        <table class="table table-striped table-bordered table-hover table-sm" id="filtro">
                                            <caption>Lista de eventos</caption>
                                            <thead>
                                                <tr>
                                                    <th>Nome<i class="fa fa-sort float-right"></i></th>
                                                    <th>Local<i class="fa fa-sort float-right"></i></th>
                                                    <th>In. Evento<i class="fa fa-sort float-right"></i></th>
                                                    <th>Fim Evento<i class="fa fa-sort float-right"></i></th>
                                                    <th>Ver mais</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${eventos}" var="evento">
                                                    <tr>
                                                        <td>${evento.nome}</td>
                                                        <td>${evento.local}</td>
                                                        <td>${evento.dataInicioEvento}</td>
                                                        <td>${evento.dataFinalEvento}</td>
                                                        <td><a class="blue-text" href="verEvento.jsp?q=${evento.URL}">Ver mais</a></td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                            <tfoot>
                                                <tr>
                                                    <th>Nome</th>
                                                    <th>Local</th>
                                                    <th>In. Evento</th>
                                                    <th>Fim Evento</th>
                                                    <th>Ver mais</th>
                                                </tr>
                                            </tfoot>
                                        </table>
                                    </c:if>
                                    <c:if test="${eventos.size()==0}">
                                        <h1 class="text-center my-5">Nenhum evento registrado ainda</h1>
                                    </c:if>
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

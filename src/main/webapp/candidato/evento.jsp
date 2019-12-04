<%-- 
    Document   : evento
    Created on : 30/11/2019, 17:20:40
    Author     : paulo
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="ISO-8859-1" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="EventoDAO" class="com.br.OMT.DAO.EventoDAO" />
<jsp:useBean id="FotosEventosDAO" class="com.br.OMT.DAO.FotosEventosDAO" />
<jsp:useBean id="TrabalhoDAO" class="com.br.OMT.DAO.TrabalhoDAO"/>
<c:set var="trabalhos" value="${TrabalhoDAO.listTrabalho()}"/>
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
    </head>
    <body>
        <jsp:include page="../header.jsp"/>
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
                                    <a href="evento.jsp" class="nav-link active">
                                        <i class="fas fa-calendar-check fa-lg"></i>
                                        Eventos
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a href="estagio.jsp" class="nav-link">
                                        <i class="fas fa-briefcase fa-lg"></i> Estágios</a>
                                </li>
                            </ul>
                            <div class="card mb-5"> 
                                <div class="mt-4 mx-4 mb-4">
                                    <section>
                                        <div class="form-row align-items-center">
                                            <div class="col-sm-6">
                                                <h3 class="font-weight-bold">Lista de eventos</h3>
                                            </div>
                                        </div>
                                        <div class="mr-3 ml-3 mt-3">
                                            <div class="col-lg-12">
                                                <div class="form-row">
                                                    <c:forEach items="${eventos}" var="evento">
                                                            <c:set property="fotos" target="${evento}" value="${FotosEventosDAO.getSingleFotosEventos(evento.id)}"/>
                                                            <div class="col-md-4 px-3 mb-3">
                                                                <div class="card form-group px-0">
                                                                    <!--Card image-->
                                                                    <div class="view overlay">
                                                                        <img class="card-img-top" width="100px" height="120px" src="/OMT/EventoServlet?id=<c:out value="${evento.fotos[0]}"></c:out>" alt="Card image cap">
                                                                        <a href="verEvento.jsp?q=${evento.URL}">
                                                                            <div class="mask rgba-white-light"></div>
                                                                        </a>
                                                                    </div>
                                                                    <!--Card content-->
                                                                    <div class="card-body form-group">
                                                                        <!--Título do evento-->
                                                                        <h4 class="card-title d-inline-block text-truncate w-100"><c:out value="${evento.nome}"></c:out></h4>
                                                                            <!--Descrição-->
                                                                            <p class="card-text d-inline-block text-truncate w-100"><c:out value="${evento.descricao}"></c:out></p>
                                                                        <a href="verEvento.jsp?q=${evento.URL}" class="btn btn-blue btn-md btn-block">Saiba mais <i class="fa fa-angle-right fa-lg"></i></a>
                                                                    </div>
                                                                    <!-- Card footer -->
                                                                    <div class="rounded-bottom mdb-color lighten-3 text-center pt-3">
                                                                        <ul class="list-unstyled list-inline font-small">
                                                                            <li class="list-inline-item pr-2 white-text"><i class="fa fa-clock pr-1"></i>
                                                                                <fmt:formatDate type = "both" dateStyle = "short" timeStyle = "short" value="${evento.dataFinalEvento}"/>
                                                                            </li>
                                                                        </ul>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                    </c:forEach>
                                                </div>
                                            </div>
                                        </div>
                                    </section>
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
        <jsp:include page="../footer.jsp"/>
        <script src="../js/jquery-3.3.1.min.js"></script>
        <script src="../js/popper.min.js"></script>
        <script src="../js/bootstrap.js"></script>
        <script src="../js/mdb.min.js"></script>
        <script src="../js/general.js"></script>
    </body>
</html>


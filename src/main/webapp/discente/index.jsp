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
    </head>
    <body>
        <jsp:include page="header.jsp"/>
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
                                    <a href="#paginaInicial" class="nav-link active" data-toggle="tab" role="tab">
                                        <i class="fas fa-home fa-lg"></i>
                                        Página Inicial
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a href="evento.jsp" class="nav-link" data-toggle="tab" role="tab">
                                        <i class="fas fa-calendar-check fa-lg"></i>
                                        Eventos
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a href="#estagios" class="nav-link" data-toggle="tab" role="tab">
                                        <i class="fas fa-briefcase fa-lg"></i> Estágios</a>
                                </li>
                                <li class="nav-item">
                                    <a href="" class="nav-link">
                                        <i class="fa fa-chalkboard-teacher fa-lg"></i>
                                        Cursos
                                    </a>
                                </li>
                            </ul>

                            <div class="tab-content card px-4 py-4">
                                <div class="tab-pane fade in show active" id="paginaInicial" role="tabpanel">
                                    <h1 class="mb-4 font-weight-bold">Bem-vindo, <c:out value="${usuario.nome}"></c:out>!</h1>
                                        <section>
                                            <!-- Card deck -->
                                            <div class="row card-deck">
                                            <c:forEach items="${eventos}" var="evento">
                                                <c:set property="fotos" target="${evento}" value="${FotosEventosDAO.getSingleFotosEventos(evento.id)}"/>
                                                <div class="card form-group col-md-3 mb-4 px-0 ">
                                                    <!--Card image-->
                                                    <div class="view overlay">
                                                        <img class="card-img-top" src="/OMT/EventoServlet?id=<c:out value="${evento.fotos[0]}"></c:out>" alt="Card image cap">
                                                        <a href="evento.jsp?q=${evento.URL}">
                                                            <div class="mask rgba-white-light"></div>
                                                        </a>
                                                    </div>

                                                    <!--Card content-->
                                                    <div class="card-body form-group">
                                                        <!--Título do evento-->
                                                        <h4 class="card-title"><c:out value="${evento.nome}"></c:out></h4>
                                                            <!--Descrição-->
                                                            <p class="card-text"><c:out value="${evento.descricao}"></c:out></p>

                                                            <a href="evento.jsp?q=${evento.URL}" class="btn btn-blue btn-md btn-block">Saiba mais <i class="fa fa-angle-right fa-lg"></i></a>
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
                                            </c:forEach>
                                        </div>
                                        <!-- Card deck -->
                                    </section>
                                </div>

                                <div class="tab-pane fade" id="estagios" role="tabpanel">
                                    <div class="form-row">
                                        <jsp:include page="estagio.jsp"/>
                                    </div>
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

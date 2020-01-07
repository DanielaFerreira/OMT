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
                                    <a href="evento.jsp" class="nav-link">
                                        <i class="fas fa-calendar-check fa-lg"></i>
                                        Eventos
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a href="estagio.jsp" class="nav-link active">
                                        <i class="fas fa-briefcase fa-lg"></i> Estágios</a>
                                </li>
                            </ul>

                            <div class="card mb-5"> 
                                <div class="mt-4 mx-4 mb-4">
                                    <section>
                                        <div class="form-row align-items-center">
                                            <div class="col-sm-6">
                                                <h3 class="font-weight-bold">Lista de estágios</h3>
                                            </div>
                                            
                                              <div class="col-md-6">
                                           <!-- <div class="row justify-content-end">
                                                <a class="btn btn-green" href="../crud_vagas/vagas_candidatadas.jsp?id=${usuario.id}"><i class="fa fa-address-card" style="margin-right: 2px;"></i> Candidaturas</a>
                                            </div>-->
                                        </div> 
                                        </div>
                                        <div class="mr-3 ml-3 mt-3">
                                            <div class="col-lg-12">
                                                <div class="form-row">
                                                    <c:forEach items="${trabalhos}" var="trabalho">
                                                        <div class="col-md-4 px-3 mb-4">
                                                            <div class="card px-0">
                                                                <div class="grey text-white">
                                                                    <i class="card-img-top fa fa-handshake text-center fa-4x mt-3 mb-3"></i>
                                                                </div>
                                                                <div class="card-body py-0">
                                                                    <div class="py-3">
                                                                        <h5 class="card-title">${trabalho.profissao}</h5>
                                                                        <p class="card-text d-inline-block text-truncate w-100">${trabalho.descricao}</p>
                                                                    </div>
                                                                    <h5 class="float-right">R$${trabalho.salario}</h5>
                                                                    <div class="py-4 mt-3">
                                                                        <a href="../crud_vagas/candidatoVerVaga.jsp?id=${trabalho.id}" class="btn btn-blue btn-md btn-block">Saiba mais <i class="fa fa-angle-right fa-lg"></i></a>
                                                                    </div>
                                                                </div>
                                                                <div class="rounded-bottom mdb-color lighten-3 text-center pt-3">
                                                                    <ul class="list-unstyled list-inline font-small">
                                                                        <li class="list-inline-item pr-2 white-text"><i class="fa fa-clock pr-1"></i>
                                                                            <fmt:formatDate type = "both" dateStyle = "short" timeStyle = "short" value="${trabalho.tempoFinal}"/>
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

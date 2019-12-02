<%-- 
    Document   : validar
    Created on : 01/12/2019, 13:23:10
    Author     : paulo
--%>
<!DOCTYPE html>
<%@page pageEncoding="ISO-8859-1"%>
<%@page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:useBean id="DiscenteDAO" class="com.br.OMT.DAO.DiscenteDAO"/>
<jsp:useBean id="FormacaoDAO" class="com.br.OMT.DAO.FormacaoDAO"/>
<jsp:useBean id="TrabalhoCurriculoDAO" class="com.br.OMT.DAO.TrabalhoCurriculoDAO"/>
<jsp:useBean id="ProjetosDAO" class="com.br.OMT.DAO.ProjetosDAO"/>
<jsp:useBean id="IOUtils" class="org.apache.commons.io.IOUtils"/>
<c:set var="discente" value="${DiscenteDAO.buscarById(param['id'])}"/>
<c:set var="formacoes" value="${FormacaoDAO.listarPorID(discente.id)}"/>
<c:set var="trabalhosCurriculo" value="${TrabalhoCurriculoDAO.listTrabalhoCurriculoByDiscente(discente.id)}"/>
<html lang="pt-br">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Observatório Mundo do Trabalho</title>
        <link rel="stylesheet" href="../css/bootstrap.css"/>
        <link rel="stylesheet" href="../css/mdb.css"/>
        <link rel="stylesheet" href="../css/fontawesome-all.css">
        <link rel="stylesheet" href="../css/style.css">
    </head>

    <body>
        <jsp:include page="../header.jsp"/>
        <main>
            <div class="container-fluid" >
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

                        <div class="card mb-5"> 
                            <div class="mt-4 mx-4 mb-4">
                                <h3 class="mb-4 font-weight-bold">Validar egresso</h3>
                                <div class="mr-3 ml-3 mt-3">
                                    <!--Conteúdo-->
                                    <div class="form-row">
                                        <div class="col-auto">
                                            <c:choose>
                                                <c:when test="${fn:length(discente.foto) > 0}">
                                                    <div>
                                                        <img class="foto-curriculo border border-light rounded z-depth-1" src="${IOUtils.toString(discente.foto, 'UTF-8')}">
                                                    </div>
                                                </c:when>
                                                <c:otherwise>
                                                    <div>
                                                        <img class="foto-curriculo border border-light rounded z-depth-1" src="../img/student.png">
                                                    </div>
                                                </c:otherwise>
                                            </c:choose>
                                        </div>
                                        <div class="col-auto">
                                            <h4><c:out value="${discente.nome}"/></h4>
                                            <h5><c:out value="${discente.formacao.nome}"/></h5>
                                            <h6>Manaus, Amazonas, Brasil</h6>
                                            <a class="d-block" target="blank" href="${discente.linkCurriculoLattes}">
                                                Currículo Lattes</a>
                                            <a class="d-block" target="blank" href="${discente.linkPerfilLinkedIn}">
                                                <i class="fab fa-linkedin-in mr-1"></i>Perfil LinkedIn</a>
                                        </div>
                                    </div>
                                    <div class="col-md-12 py-4 text-center">
                                        <h5 class="py-0">Os dados apresentados por <b>${discente.nome}</b> são válidos? <br>
                                            <small><b>OBS:</b> Caso o discente não seja válido, é recomendado efetuar o cancelamento do cadastro</small>
                                        </h5>

                                    </div>
                                    <div class="form-row">
                                        <div class="col-md-6">
                                            <a class="btn btn-green btn-md float-right">Sim, são validos</a>
                                        </div>
                                        <div class="col-md-6">
                                            <a class="btn btn-danger btn-md float-left">Não, cancelar cadastro</a>                                            
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        <jsp:include page="../footer.jsp"/>
        <script src="../js/jquery-3.3.1.min.js"></script>
        <script src="../js/popper.min.js"></script>
        <script src="../js/bootstrap.js"></script>
        <script src="../js/mdb.min.js"></script>
    </body>
</html>

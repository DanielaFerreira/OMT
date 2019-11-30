<%-- 
    Document   : campus
    Created on : 28/11/2019, 15:28:13
    Author     : Paulo Ribeiro
--%>
<%@page pageEncoding="ISO-8859-1" language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:useBean id="CampusDAO" class="com.br.OMT.DAO.CampusDAO"/>
<c:set var="campi" value="${CampusDAO.listarCampus()}"/>
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
        <jsp:include page="../header.jsp" />
        <main>
            <div class="container-fluid" >
                <div class="row justify-content-center">
                    <div class="col-lg-3">
                        <div class="form-row justify-content-end">
                            <div class="col-lg-12">
                                <jsp:include page="perfil_flutuante.jsp"/>
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
                                    <i class="fa fa-calendar-check fa-lg"></i>
                                    Eventos
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="estagio.jsp" class="nav-link">
                                    <i class="fas fa-briefcase fa-lg"></i>
                                    Estágios
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="egresso.jsp" class="nav-link">
                                    <i class="fa fa-user-graduate fa-lg"></i>
                                    Egressos
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="campus.jsp" class="nav-link active">
                                    <i class="fa fa-university fa-lg"></i>
                                    Campus
                                </a>
                            </li>
                        </ul>

                        <div class="card mb-5"> 
                            <div class="mt-4 mx-4 mb-4">
                                <div class="form-row align-items-center">
                                    <div class="col-sm-6">
                                        <h3 class="font-weight-bold">Lista de campus</h3>
                                    </div>
                                    <div class="col-sm-6">
                                        <a href="../crud_campus/cadastro.jsp" class="btn btn-green float-right"><i class="fa fa-plus mr-1"></i>Cadastrar Campus</a>
                                    </div>
                                </div>
                                <div class="mr-3 ml-3 mt-3">
                                    <c:if test="${campi.size()>0}">
                                        <table class="table table-striped table-bordered table-hover table-sm" id="filtro">
                                            <caption>Lista de eventos</caption>
                                            <thead>
                                                <tr>
                                                    <th>Nome<i class="fa fa-sort float-right"></i></th>
                                                    <th>Nome Fantasia<i class="fa fa-sort float-right"></i></th>
                                                    <th>CNPJ<i class="fa fa-sort float-right"></i></th>
                                                    <th>CNAE<i class="fa fa-sort float-right"></i></th>
                                                    <th>Estado<i class="fa fa-sort float-right"></i></th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${campi}" var="campus">
                                                    <tr>
                                                        <td>${campus.nome}</td>
                                                        <td>${campus.nomeFantasia}</td>
                                                        <td>${campus.CNPJ}</td>
                                                        <td>${campus.CNAE}</td>    
                                                        <td>${campus.estado}</td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                            <tfoot>
                                                <tr>
                                                    <th>Nome</th>
                                                    <th>Nome Fantasia</th>
                                                    <th>CNPJ</th>
                                                    <th>CNAE</th>
                                                    <th>Estado</th>
                                                </tr>
                                            </tfoot>
                                        </table>
                                    </c:if>
                                    <c:if test="${eventos.size()==0}">
                                        <h1 class="text-center my-5">Nenhum campus registrado ainda</h1>
                                    </c:if>
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
        <script src="../js/general.js"></script>
        <script src="../js/jquery.mask.min.js"></script>
        <script src="../js/mascaras.js"></script>
        <script src="../js/addons/datatables.min.js"></script>
        <script src="../js/filtro/filtro.js"></script>
        <script src="../js/funcao_back/volta_atualiza.js"></script>
    </body>
</html>


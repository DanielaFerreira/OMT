<%-- 
    Document   : egresso
    Created on : 28/11/2019, 15:28:07
    Author     : Paulo Ribeiro
--%>

<%@page pageEncoding="ISO-8859-1" language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:useBean id="DiscenteDAO" class="com.br.OMT.DAO.DiscenteDAO"/>
<jsp:useBean id="Criptografia" class="com.br.OMT.Utils.Criptografia"/>
<c:set var="discentes" value="${DiscenteDAO.listar()}"/>
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
                                <a href="evento.jsp" class="nav-link ">
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
                                <a href="egresso.jsp" class="nav-link active">
                                    <i class="fa fa-user-graduate fa-lg"></i>
                                    Egressos
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="campus.jsp" class="nav-link">
                                    <i class="fa fa-university fa-lg"></i>
                                    Campus
                                </a>
                            </li>
                        </ul> 

                        <div class="card mb-5"> 
                            <div class="mt-4 mx-4 mb-4">
                                <div class="form-row align-items-center">
                                    <div class="col-sm-6">
                                        <h3 class="font-weight-bold">Lista de egressos</h3>
                                    </div>
                                    <div class="col-sm-6">
                                        <a class="btn btn-green float-right btn-md" href="../crud_egressos/cadastro.jsp"><i class="fa fa-plus mr-1"></i>Cadastrar egresso</a>
                                    </div>
                                </div>
                                <div class="mr-3 ml-3 mt-3">
                                    <table class="table table-sm table-striped table-bordered table-hover" id="filtro">
                                        <caption>Lista de egressos</caption>
                                        <thead>
                                            <tr>
                                                <th>Nome<i class="fa fa-sort float-right"></i></th>
                                                <th>Formação<i class="fa fa-sort float-right"></i></th>
                                                <th>Campus<i class="fa fa-sort float-right"></i></th>
                                                <th>Ano de formação <i class="fa fa-sort float-right"></i></th>
                                                <th>Currículo<i class="fa fa-sort float-right"></i></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${discentes}" var="discente">
                                                <c:set target="${discente}" property="nome" value="${Criptografia.decrypt(discente.nomeBanco)}"/>
                                                <c:set target="${discente}" property="usuario" value="${Criptografia.decrypt(discente.usuarioBanco)}"/>
                                                <tr>
                                                    <td><c:out value="${discente.nome}"/></td>               
                                                    <td>${discente.formacao.nome}</td>
                                                    <td>${discente.formacao.campus.nome}</td>
                                                    <td>${discente.formacao.anoTermino}</td>
                                                    <td><a class="blue-text" href="../crud_egressos/verDiscente.jsp?id=${discente.id}">Ver currículo</a></td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                        <tfoot>
                                            <tr>
                                                <th>Nome</th>
                                                <th>Formação</th>
                                                <th>Campus</th>
                                                <th>Ano de formação</th>
                                                <th>Currículo</th>
                                            </tr>
                                        </tfoot>
                                    </table>  
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

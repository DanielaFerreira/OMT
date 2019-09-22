<%@page pageEncoding="ISO-8859-1"%>
<%@page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
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
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    </head>

    <body>
        <jsp:include page="header.jsp" />

        <div class="container-fluid">

            <div class="row justify-content-center">
                <jsp:include page="perfil_flutuante.jsp"/>
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
                            <a href="vaga_trabalho.jsp" class="nav-link">
                                <i class="fas fa-briefcase fa-lg"></i> Vagas</a>
                        </li>
                        <li class="nav-item">
                            <a href="curso.jsp" class="nav-link">
                                <i class="fa fa-chalkboard-teacher fa-lg"></i>
                                Cursos
                            </a>
                        </li>

                        <li class="nav-item">
                            <a href="discente.jsp" class="nav-link active">
                                <i class="fa fa-user-graduate fa-lg"></i>
                                Egresso
                            </a>
                        </li>

                        <li class="nav-item">
                            <a href="#" class="nav-link" data-toggle="tab" role="tab">
                                <i class="fa fa-university fa-lg"></i>
                                Campus
                            </a>
                        </li>
                    </ul>

                    <div class="card mb-5">
                        <div class="mt-4 mx-4">
                            <h3 class="font-weight-bold mb-4">Lista de egressos</h3>
                            <div class="table-responsive">
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
                                                <td><a class="btn btn-green" href="curriculoDiscente.jsp?id=${discente.id}">Ver currículo</a></td>
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
                            <br>
                        </div>
                    </div>
                </div>
            </div>

            <script src="../js/jquery-3.3.1.min.js"></script>
            <script src="../js/popper.min.js"></script>
            <script src="../js/bootstrap.js"></script>
            <script src="../js/mdb.min.js"></script>
            <script src="../js/general.js"></script>
            <script src="../js/jquery.mask.min.js"></script>
            <script src="../js/mascaras.js"></script>
            <script src="../js/addons/datatables.min.js"></script>
            <script src="../js/filtro/filtro.js"></script>
        </div>
        <jsp:include page="../footer.jsp"/>
    </body>
</html>

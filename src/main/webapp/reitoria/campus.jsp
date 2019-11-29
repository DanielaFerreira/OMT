<%-- 
    Document   : campus
    Created on : 28/11/2019, 15:28:13
    Author     : Paulo Ribeiro
--%>

<%@page pageEncoding="ISO-8859-1" language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
                    <div class="col-lg-2">
                        <jsp:include page="perfil_flutuante.jsp"/>
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
                                <a href="trabalho.jsp" class="nav-link">
                                    <i class="fas fa-briefcase fa-lg"></i>
                                    Estágios
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="curso.jsp" class="nav-link">
                                    <i class="fa fa-chalkboard-teacher fa-lg"></i>
                                    Cursos
                                </a>
                            </li>

                            <li class="nav-item">
                                <a href="evento.jsp" class="nav-link">
                                    <i class="fa fa-calendar-check fa-lg"></i>
                                    Eventos
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
                                <h3 class="mb-4 font-weight-bold">Campus</h3>
                                <div class="mr-3 ml-3 mt-3">
                                    <!--Conteúdo-->
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
        <script src="../js/graficos/graficoGenero.js" charset="UTF-8"></script>
    </body>
</html>

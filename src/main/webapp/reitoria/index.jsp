<%-- 
    Document   : pagina_inicial
    Created on : 07/06/2018, 15:17:41
    Author     : Natan S. dos Santos
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
                                <a href="index.jsp" class="nav-link active" data-toggle="tab" role="tab">
                                    <i class="fas fa-home fa-lg"></i>
                                    Página Inicial
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="../errors/manutencao.jsp" class="nav-link">
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
                                <a href="#" class="nav-link">
                                    <i class="fa fa-calendar-check fa-lg"></i>
                                    Eventos
                                </a>
                            </li>

                            <li class="nav-item">
                                <a href="#" class="nav-link" data-toggle="tab" role="tab">
                                    <i class="fa fa-user-graduate fa-lg"></i>
                                    Egressos
                                </a>
                            </li>

                            <li class="nav-item">
                                <a href="#" class="nav-link" data-toggle="tab" role="tab">
                                    <i class="fa fa-university fa-lg"></i>
                                    Campus
                                </a>
                            </li>
                        </ul>

                        <div class="card px-4 py-4">
                            <h1 class="mb-4 font-weight-bold">Bem-vindo 
                                <c:out value="${usuario.nome}"></c:out>!</h1>
                                <div class="row">
                                    <div class="col-sm-12 col-md-6 col-xl-4">
                                        <canvas id="graficoGenero1"></canvas>
                                    </div> 
                                    <div class="col-sm-12 col-md-6 col-xl-4">
                                        <canvas id="graficoGenero3"></canvas>
                                    </div>       
                                    <div class="col-sm-12 col-md-6 col-xl-4">
                                        <canvas id="graficoGenero2"></canvas>
                                    </div>  
                                </div>      
                                <div class="row">   
                                </div>      
                                <div class="row">    
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



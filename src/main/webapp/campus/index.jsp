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
        <title>Observat�rio Mundo do Trabalho</title>
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
                        <div class="col-lg-2"> 
                            <jsp:include page="pertil_flutuante.jsp"/>
                            <br>
                        </div>
                        <div class="col-lg-8">
                            <ul class="nav nav-tabs nav-justified green darken-1" role="tablist">
                                <li class="nav-item">
                                    <a href="index.jsp" class="nav-link active" data-toggle="tab" role="tab">
                                        <i class="fas fa-home fa-lg"></i>
                                        P�gina Inicial
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a href="eventos.jsp" class="nav-link">
                                        <i class="fas fa-calendar-check fa-lg"></i>
                                        Eventos
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a href="estagios.jsp" class="nav-link">
                                        <i class="fas fa-briefcase fa-lg"></i> 
                                        Est�gios
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a href="egressos.jsp" class="nav-link">
                                        <i class="fa fa-user-graduate fa-lg"></i>
                                        Egressos
                                    </a>
                                </li>
                            </ul>

                            <div class="card px-4 py-4">
                                <h3 class="mb-4 font-weight-bold">Estat�sticas</h3>
                                <div class="mr-3 ml-3 mt-3">
                                    <div class="form-row">
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
        <script src="../js/graficos/graficoGenero.js" charset="UTF-8"></script>
    </body>
</html>



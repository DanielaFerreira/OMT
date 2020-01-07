<%@page pageEncoding="ISO-8859-1" language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
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
        <c:if test="${not empty usuario}">
            <jsp:include page="../header.jsp" />
            <main>
                <div class="container-fluid">
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
                                    <a href="#" class="nav-link active" data-toggle="tab" role="tab">
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
                                    <a href="vaga_trabalho.jsp?id=${usuario.id}" class="nav-link">
                                        <i class="fas fa-briefcase fa-lg"></i> Vagas</a>
                                </li>
                            </ul>

                            <div class="card mb-5"> 
                                <div class="mt-4 mx-4 mb-4">
                                    <h3 class="mb-4 font-weight-bold">Estatísticas</h3>
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
                </div>
            </main>
            <jsp:include page="../footer.jsp"/>
        </c:if>
        <c:if test="${empty usuario}">
            <jsp:include page="../errors/sessaoExpirada.jsp"/>
        </c:if>
        <script src="../js/jquery-3.3.1.min.js"></script>
        <script src="../js/popper.min.js"></script>
        <script src="../js/bootstrap.js"></script>
        <script src="../js/mdb.min.js"></script>
        <script src="../js/general.js"></script>
        <script src="../js/graficos/graficoGenero.js" charset="UTF-8"></script>
    </body>
</html>
<%-- 
    Document   : sucesso
    Created on : 29/11/2019, 07:58:27
    Author     : Paulo Ribeiro
--%>
<%@page import="com.br.OMT.models.Discente"%>
<%@page pageEncoding="ISO-8859-1"%>
<%@page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Observat�rio Mundo do Trabalho</title>
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
                                    <a href="javascript:history.go(-2)" class="nav-link text-white">
                                        <i class="fa fa-arrow-alt-circle-left fa-lg"></i>
                                        Voltar
                                    </a>
                                </li>
                            </ul>
                        </nav>

                        <div class="card mb-5"> 
                            <div class="mt-4 mx-4 mb-4">
                                <h3 class="mb-4 font-weight-bold">Indica��o concluida</h3>
                                <div class="mr-3 ml-3 mt-3">
                                    <!--Conte�do-->
                                    <div class="col-md-12 text-center mb-5">
                                        <div class="col-md-12">
                                            <i class="fa fa-paper-plane fa-7x green-text animated tada infinite"></i>
                                        </div>
                                        <div class="col-md-12">
                                            <h4 class="mt-4">Parab�ns, a opera��o foi efetuada com sucesso. <a href="javascript:history.go(-2)" class="blue-text">Clique aqui</a> para <br> retornar para p�gina anterior.</h4>
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


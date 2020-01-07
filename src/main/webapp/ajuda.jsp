<%-- 
    Document   : ajuda
    Created on : 04/12/2019, 18:03:56
    Author     : daniela
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html lang="pt-br">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>OMT Ajuda</title>
        <link rel="stylesheet" href="css/bootstrap.css"/>
        <link rel="stylesheet" href="css/mdb.css"/>
        <link rel="stylesheet" href="css/fontawesome-all.css">
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        
        <main>

            <div class="container-fluid col-lg-8">
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

                <div class="card px-4 py-4">
                    <h3 class="font-weight-bold text-center">Ajuda</h3>
                    <div class="section">
                        <div class="form">

                            <h5 class="mb-4">Quaisquer dúvidas sobre o projeto, entre em contato com os responsáveis por cada módulo:</h5>
                            <h5 class="font-weight-bold text-uppercase">Módulo 1: Egresso</h5>
                            <a href="https://www.linkedin.com/in/luiz-francisco-65b552165/">Luiz Francisco Martins Bentes</a>
                            <h5 class="font-weight-bold text-uppercase" style="margin-top: 15px;">Módulo 2: Empresa</h5>
                            <a href="https://www.linkedin.com/in/daniela-ferreira-a37096194/">Daniela Ferreira Feitosa</a>
                            <h5 class="font-weight-bold text-uppercase" style="margin-top: 15px;">Módulo 3: Formando</h5>
                            <a href="#!">Módulo ainda não disponível</a>
                  
                            <h5 class="font-weight-bold text-uppercase">Coordenador da Fábrica de Software</h5>
                            <a href="https://www.linkedin.com/in/emmerson-santa-rita-801a0523/">Emmerson Santa Rita da Silva</a>
                            
                        </div>
                    </div>
                </div>
            </div>
        </main>
        <jsp:include page="footer.jsp"/>
        <script src="js/jquery-3.3.1.min.js"></script>
        <script src="js/popper.min.js"></script>
        <script src="js/bootstrap.js"></script>
        <script src="js/mdb.min.js"></script>
    </body>
</html>

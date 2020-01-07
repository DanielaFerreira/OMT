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
                    <h3 class="font-weight-bold text-center">Recuperação de conta</h3>
                    <div class="section">
                        <div class="form row">
                            <h4 class="mb-4"><strong>Informe seu e-mail para receber as instruções de recuperação de conta e mudança de senha</strong></h4>
                            <div class="form-group col-md-10">
                                <label for="email">E-mail</label>
                                <input class="form-control" type="email" name="email" id="email" maxlength="40">
                            </div>
                            <button class="btn btn-green waves-effct" name="acao" type="submit" value="Recuperar">
                                <i class="fa fa-check mr-1"></i>Recuperar</button>


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

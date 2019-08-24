<%-- 
    Document   : candidatos
    Created on : 22/08/2019, 15:03:43
    Author     : Paulo Ribeiro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Observatório Mundo do Trabalho - Vaga de Trabalho</title>
        <link rel="stylesheet" href="../css/bootstrap.css"/>
        <link rel="stylesheet" href="../css/mdb.css"/>
        <link rel="stylesheet" href="../css/fontawesome-all.css">
        <link rel="stylesheet" href="../css/style.css">
    </head>
    <body>
        <jsp:include page="../empresa/header.jsp" />

        <div class="container-fluid">

            <div class="row justify-content-center">

                <div> 
                    <jsp:include page="../empresa/perfil_flutuante.jsp"/>
                </div>

                <div class="col-8">

                    <div class=" card mb-5">

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
                            <h3 class="font-weight-bold mb-4">Candidatos para a vaga</h3>

                            <table class="table table-sm table-striped table-bordered table-hover" id="filtro">
                                <caption>Lista de eventos de sua empresa</caption>
                                <thead>
                                    <tr class="auto">
                                        <th>Nome<i class="fa fa-sort float-right"></i></th>
                                        <th>Formação<i class="fa fa-sort float-right"></i></th>
                                        <th>Campus<i class="fa fa-sort float-right"></i></th>
                                        <th>Ano de formação <i class="fa fa-sort float-right"></i></th>
                                        <th class="disabled">Ação<i class="fa fa-sort float-right"></i></th>
                                    </tr>
                                </thead>
                                <tbody>

                                    <tr>
                                        <td>Eduardo</td>               
                                        <td>Informática</td>
                                        <td>Ifam-CMC</td>
                                        <td>20/08/2019 - 04/09/2019</td>
                                        <td>
                                            <a class="btn btn-blue">Currículo</a>
                                            <a class="btn btn-green"><i class="fa fa-check"></i> Contratar</a>
                                            <a class="btn btn-danger"><i class="fa fa-window-close"></i> Dispensar</a>
                                        </td>
                                    </tr>
                                </tbody>
                                <tfoot>

                                    <tr class="auto">
                                        <th>Nome</th>
                                        <th>Formação</th>
                                        <th>Campus</th>
                                        <th>Ano de formação</th>
                                        <th>Ação</th>
                                    </tr>
                                </tfoot>
                            </table>     

                        </div>
                    </div>
                </div>
            </div>
        </div>

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
    </body>
</html>

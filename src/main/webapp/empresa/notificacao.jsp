<%@page import="com.br.OMT.models.Trabalho"%>
<%@page import="com.br.OMT.DAO.TrabalhoDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="TrabalhoDAO" class="com.br.OMT.DAO.TrabalhoDAO"/>
<c:set var="trabalhos" value="${TrabalhoDAO.listTrabalho()}"/>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Observatório Mundo do Trabalho - Vaga de Trabalho</title>
        <link rel="stylesheet" href="../css/bootstrap.css"/>
        <link rel="stylesheet" href="../css/mdb.css"/>
        <link rel="stylesheet" href="../css/fontawesome-all.css">
        <link rel="stylesheet" href="../css/style.css">
    </head>
    <body>

        <jsp:include page="header.jsp" />
        <div class="container-fluid">


            <div class="row justify-content-center">
                <jsp:include page="perfil_flutuante.jsp"/>
                <div class="col-lg-8">

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

                    <div class=" card">
                        <div class="mt-4 mx-4">
                            <h4 href="#"><strong> Notificações</strong></h4>
                            <table class="table table-sm table-striped table-bordered table-hover" id="filtro">
                                <caption>Notificações</caption>
                                <thead>
                                    <tr class="auto">
                                        <th>
                                            <div class="form-check">
                                                <input class="form-check-input position-static" type="checkbox" id="blankCheckbox" value="option1" aria-label="...">
                                                <label class="form-check-label" for="inlineRadio1"> Selecionar tudo</label>
                                            </div>
                                            <i class="fa fa-sort float-right"></i>
                                        </th>
                                        <th>Mensagem<i class="fa fa-sort float-right"></i></th>
                                        <th>Data<i class="fa fa-sort float-right"></i></th>
                                        <th>Opção<i class="fa fa-sort float-right"></i></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>
                                            <div class="form-check">
                                                <input class="form-check-input position-static" type="checkbox" id="blankCheckbox" value="option1" aria-label="...">
                                                <label class="form-check-label" for="inlineRadio1"> Samsung</label>
                                            </div>
                                        </td>
                                        <td>Venho por meio deste informar que sua...</td>
                                        <td>12/02/2003</td>
                                        <td><a class="btn btn-primary">Ver mais</a></td>
                                    </tr>
                                </tbody>
                                <tfoot>
                                    <tr class="auto">
                                        <th>
                                            <div class="form-check">
                                                <input class="form-check-input position-static" type="checkbox" id="blankCheckbox" value="option1" aria-label="...">
                                                <label class="form-check-label" for="inlineRadio1"> Selecionar tudo</label>
                                            </div>
                                        </th>
                                        <th>Mensagem</th>
                                        <th>Data</th>
                                        <th>Opção</th>
                                    </tr>
                                </tfoot>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="../footer.jsp" />
    </body>
    <script src="../js/jquery-3.3.1.min.js"></script>
    <script src="../js/popper.min.js"></script>
    <script src="../js/bootstrap.js"></script>
    <script src="../js/mdb.min.js"></script>
    <script src="../js/general.js"></script>
    <script src="../js/jquery.mask.min.js"></script>
    <script src="../js/mascaras.js"></script>
    <script src="../js/addons/datatables.min.js"></script>
    <script src="../js/filtro/filtro.js"></script>
</html>

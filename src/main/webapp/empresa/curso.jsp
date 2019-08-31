<%-- 
    Document   : vaga_trabalho
    Created on : 12/06/2019, 22:03:04
    Author     : daniela
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Observatório Mundo do Trabalho - Vaga de cursos</title>
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
                                <i class="fas fa-briefcase fa-lg"></i> 
                                Vagas
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="curso.jsp" class="nav-link active">
                                <i class="fa fa-chalkboard-teacher fa-lg"></i>
                                Cursos
                            </a>
                        </li>

                        <li class="nav-item">
                            <a href="discente.jsp" class="nav-link">
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

                    <div class="tab-content card mb-5">
                        <div class="tab-pane fade in show active" id="graficos" role="tabpanel">
                            <main>
                                <div class="card px-4 py-4">

                                    <div class="form-row">
                                        <div class="col-md-6">
                                            <h3 class="font-weight-bold mb-4">Cursos de sua empresa</h3>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="row justify-content-end">
                                                <a class="btn btn-green" href="../cadastro/curso.jsp"><i class="fa fa-plus"></i> Novo curso</a>
                                            </div>
                                        </div> 
                                    </div>
                                    <div class="table-responsive-xl">
                                        <table class="table table-sm table-striped table-bordered table-hover" id="table-cursos">

                                            <caption>Lista de cursos de sua empresa</caption>
                                            <!--<div class="alert alert-success alert-dismissible fade show"  role="alert">
                                            <%-- ${mensagem}--%>
                                            <button type="button" class="close" data-dismiss="alert" aria-label="Close"<span aria-hidden="true">&times;</span>
                                            </button>
                                        </div> -->

                                            <thead>
                                                <tr class="auto">
                                                    <th>Nome</th>
                                                    <th>Nível</th>
                                                    <th>Quantidade de Vagas</th>
                                                    <th>Ação</th>
                                                </tr>
                                            </thead>
                                            <tbody>

                                                <tr>
                                                    <td>Informática básica</td>               
                                                    <td>Subsequente</td>
                                                    <td>20</td>
                                                    <td>
                                                        <a type="button" class="btn btn-green">Ver mais</a>
                                                    </td>
                                                </tr>

                                            <script>

                                                $('#deletarVaga${trabalho.id}').on('shown.bs.modal', function () {
                                                    $('#myInput').trigger('focus'); //e.relatedTarget.
                                                });

                                                $('#visualizarVaga${trabalho.id}').on('shown.bs.modal', function () {
                                                    $('#myInput').trigger('focus'); //e.relatedTarget.
                                                });
                                            </script>
                                            </tbody>
                                            <tfoot>

                                                <tr class="auto">
                                                    <th>Profissão</th>
                                                    <th>Salário</th>
                                                    <th>Quantidade de Vagas</th>
                                                    <th>Ação</th>
                                                </tr>
                                            </tfoot>

                                        </table>
                                    </div>
                                </div>
                            </main>
                            <script src="../js/jquery-3.3.1.min.js"></script>
                            <script src="../js/popper.min.js"></script>
                            <script src="../js/bootstrap.js"></script>
                            <script src="../js/mdb.min.js"></script>
                            <script src="../js/general.js"></script>
                            <script src="../js/jquery.mask.min.js"></script>
                            <script src="../js/mascaras.js"></script>
                            <script src="../js/addons/datatables.min.js"></script>
                            <script>
                                            $("#table-cursos").DataTable({
                                                initComplete: function () {
                                                    this.api().columns().every(function () {
                                                        var column = this;
                                                        var select = $('<select class="custom-select w-auto"><option value=""></option></select>')
                                                                .appendTo($(column.header()))
                                                                .on('change', function () {
                                                                    var val = $.fn.dataTable.util.escapeRegex(
                                                                            $(this).val()
                                                                            );

                                                                    column
                                                                            .search(val ? '^' + val + '$' : '', true, false)
                                                                            .draw();
                                                                });

                                                        column.data().unique().sort().each(function (d, j) {
                                                            select.append('<option value="' + d + '">' + d + '</option>')
                                                        });
                                                    });
                                                },
                                                "language": {
                                                    "url": "/OMT/js/addons/datatables-pt-br.json"
                                                },
                                                "order": [[0, "asc"]],
                                                "pagingType": "full_numbers"
                                            });
                                            $(".datatables_length").addClass("bs-select");
                            </script>
                        </div>

                        <div class="tab-pane fade" id="eventos" role="tabpanel">
                            <div class="mt-4 mx-4">

                            </div>
                        </div>
                        <div class="tab-pane fade" id="cursos" role="tabpanel">
                            <div class="mt-4 mx-4">

                            </div>
                        </div>
                        <div class="tab-pane fade" id="egressos" role="tabpanel">
                            <div class="mt-4 mx-4">

                            </div>
                        </div>
                        <div class="tab-pane fade" id="campus" role="tabpanel">
                            <div class="mt-4 mx-4">

                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>

        <jsp:include page="../footer.jsp" />
    </body>
</html>

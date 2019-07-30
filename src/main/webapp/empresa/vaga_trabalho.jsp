<%-- 
    Document   : vaga_trabalho
    Created on : 12/06/2019, 22:03:04
    Author     : daniela
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="TrabalhoDAO" class="com.br.OMT.DAO.TrabalhoDAO"/>
<c:set var="trabalhos" value="${TrabalhoDAO.listTrabalho()}"/>
<!DOCTYPE html>
<html>
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
        <jsp:include page="header.jsp" />

        <div class="container-fluid">

            <div class="row justify-content-center">

                <div> 
                    <jsp:include page="perfil_flutuante.jsp"/>
                </div>

                <div class="col-8">
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
                            <a href="vaga_trabalho.jsp" class="nav-link active">
                                <i class="fas fa-briefcase fa-lg"></i> Vagas</a>
                        </li>
                        <li class="nav-item">
                            <a href="curso.jsp" class="nav-link">
                                <i class="fa fa-chalkboard-teacher fa-lg"></i>
                                Cursos
                            </a>
                        </li>

                        <li class="nav-item">
                            <a href="#" class="nav-link" data-toggle="tab" role="tab">
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
                                            <h3 class="font-weight-bold mb-4">Vagas de emprego de sua empresa</h3>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="row justify-content-end">
                                                <a class="btn btn-green" href="../cadastro/trabalho.jsp"><i class="fa fa-plus"></i> Nova vaga</a>
                                            </div>
                                        </div> 
                                    </div>

                                    <table class="table table-sm table-striped table-bordered table-hover" id="table-trabalhos">

                                        <caption>Lista de vagas de emprego</caption>
                                        <!--<div class="alert alert-success alert-dismissible fade show"  role="alert">
                                        <%-- ${mensagem}--%>
                                        <button type="button" class="close" data-dismiss="alert" aria-label="Close"<span aria-hidden="true">&times;</span>
                                        </button>
                                    </div> -->

                                        <thead>
                                            <tr class="auto">
                                                <th>Profissão</th>
                                                <th>Salário</th>
                                                <th>Quantidade de Vagas</th>
                                                <th>Ação</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${trabalhos}" var="trabalho">
                                                <tr>
                                                    <td><c:out value="${trabalho.profissao}"/></td>               
                                                    <td>R$${trabalho.salario}</td>
                                                    <td>${trabalho.quantidadeVagas}</td>
                                                    <td>
                                                        <a type="button" class="btn btn-green" data-toggle="modal" data-target="#visualizarVaga${trabalho.id}">Ver mais</a>
                                                    </td>
                                                </tr>

                                                <!-- Modal -->
                                            <div class="modal fade bd-example-modal-xl" id="deletarVaga${trabalho.id}" tabindex="-1" role="dialog" aria-labelledby="modalDeletar" aria-hidden="true">
                                                <div class="modal-dialog modal-xl modal-dialog-centered" role="document">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h5 class="modal-title">Você tem certeza que deseja excluir a vaga para <b>${trabalho.profissao}</b>?</h5>
                                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                <span aria-hidden="true">&times;</span>
                                                            </button>
                                                        </div>
                                                        <div class="modal-body alert-danger">
                                                            Esta é uma ação que não pode ser desfeita, pois os dados não poderão ser recuperados.
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-primary" data-dismiss="modal">Cancele</button>
                                                            <form id="formDeletar" name="formDeletar" method="post" action="/OMT/TrabalhoServlet" data-id="<c:out value="${trabalho.id}"/>">
                                                                <button type="submit" name="acao" value="deletar" class="btn btn-danger">Sim, delete</button>
                                                            </form>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <!-- Modal -->
                                            <div class="modal fade" id="visualizarVaga${trabalho.id}" tabindex="-1" role="dialog" aria-labelledby="modalVisualizar" aria-hidden="true">
                                                <div class="modal-dialog modal-dialog-centered" role="document">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h5 class="modal-title">Vaga de Trabalho para <strong>${trabalho.profissao}</strong></h5>
                                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                <span aria-hidden="true">&times;</span>
                                                            </button>
                                                        </div>
                                                        <div class="modal-body"> 
                                                            <div class="row">
                                                                <label class="col"> <strong> Profissão </strong> </label>
                                                                <label class="col">${trabalho.profissao}</label>
                                                            </div>
                                                            <div class="row">
                                                                <label class="col "> <strong> Salário </strong> </label>
                                                                <label class="col">R$ ${trabalho.salario}</label>
                                                            </div>
                                                            <div class="row">
                                                                <label class="col "> <strong> Quantidade de Vagas </strong> </label>
                                                                <label class="col">${trabalho.quantidadeVagas}</label>
                                                            </div>
                                                            <div class="row">
                                                                <label class="col "> <strong> Tipo </strong> </label>
                                                                <label class="col">${trabalho.tipo}</label>
                                                            </div>
                                                            <div class="row">
                                                                <label class="col "> <strong>  Descrição </strong> </label>
                                                                <label class="col">${trabalho.descricao}</label>
                                                            </div>
                                                            <%--
                                                                                                        <div class="row">
                                                                                                            <label class="col">Inscrições de ${trabalho.tempoInicio} a ${trabalho.tempoFinal}</label>
                                                                                                        </div>
                                                            --%>
                                                            <br>
                                                            <div class="row justify-content-end">

                                                                <a data-dismiss="modal" aria-label="Close" type="button" class="btn btn-grey" data-toggle="modal" data-target="#deletarVaga${trabalho.id}"><i class="fa fa-trash"></i> Excluir</a>
                                                                <a type="button" class="btn btn-yellow" href="alterarVaga.jsp?id=${trabalho.id}"><i class="fa fa-pen"></i> Alterar</a>
                                                            </div>
                                                        </div>

                                                    </div>
                                                </div>
                                            </div>

                                            <script>

                                                $('#deletarVaga${trabalho.id}').on('shown.bs.modal', function () {
                                                    $('#myInput').trigger('focus'); //e.relatedTarget.
                                                });

                                                $('#visualizarVaga${trabalho.id}').on('shown.bs.modal', function () {
                                                    $('#myInput').trigger('focus'); //e.relatedTarget.
                                                });
                                            </script>
                                        </c:forEach>
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
                                                $("#table-trabalhos").DataTable({
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

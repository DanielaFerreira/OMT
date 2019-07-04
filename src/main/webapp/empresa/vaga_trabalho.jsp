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
        <main>
            <div class="container my-4" >
                <div class="card px-4 py-4">
                    <div class="row">
                        <h1 class="font-weight-bold mb-4">Vagas de trabalho da sua empresa</h1>
                        <div class="text-center mx-auto">
                            <a class="btn btn-green" href="../cadastro/trabalho.jsp">Adicionar</a>
                         <!--    <button class="btn btn-blue">Atualizar</button> -->
                        </div> </div>
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
                                        <a type="button" class="btn btn-info" data-toggle="modal" data-target="#visualizarVaga${trabalho.id}"><i class="fa fa-eye"></i>Visualizar</a>
                                        <a type="button" class="btn btn-outline-danger" data-toggle="modal" data-target="#deletarVaga${trabalho.id}"><i class="fa fa-trash"></i>Excluir</a>
                                        <a type="button" class="btn btn-outline-warning" href="alterarVaga.jsp?id=${trabalho.id}"><i class="fa fa-pen"></i>Alterar</a>
                                   
                                    </td>


                                </tr>

                                <!-- Modal -->
                            <div class="modal fade" id="deletarVaga${trabalho.id}" tabindex="-1" role="dialog" aria-labelledby="modalDeletar" aria-hidden="true">
                                <div class="modal-dialog modal-dialog-centered" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title">Você tem certeza que deseja excluir a vaga para ${trabalho.profissao}?</h5>
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
                                            <h5 class="modal-title">Vaga de Trabalho para ${trabalho.profissao}</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body"> 
                                            <div class="row">
                                                <label class="col text-success">Profissão</label>
                                                <label class="col">${trabalho.profissao}</label>
                                            </div>
                                            <div class="row">
                                                <label class="col text-success">Salário</label>
                                                <label class="col">R$ ${trabalho.salario}</label>
                                            </div>
                                            <div class="row">
                                                <label class="col text-success">Quantidade de Vagas</label>
                                                <label class="col">${trabalho.quantidadeVagas}</label>
                                            </div>
                                            <div class="row">
                                                <label class="col text-success">Tipo</label>
                                                <label class="col">${trabalho.tipo}</label>
                                            </div>
                                            <div class="row">
                                                <label class="col text-success">Descrição</label>
                                                <label class="col">${trabalho.descricao}</label>
                                            </div>
<%--
                                            <div class="row">
                                                <label class="col">Inscrições de ${trabalho.tempoInicio} a ${trabalho.tempoFinal}</label>
                                            </div>
--%>


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
    </body>
</html>

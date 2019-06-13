<%-- 
    Document   : vaga_trabalho
    Created on : 12/06/2019, 22:03:04
    Author     : daniela
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <jsp:include page="header.jsp"/>
        <main>
            <div class="container my-4" >
                <div class="card px-4 py-4">
                    <div class="row">
                        <h1 class="font-weight-bold mb-4">Vagas de trabalho da sua empresa</h1>
                        <div class="text-center mx-auto">
                            <a class="btn btn-green" href="../cadastro/trabalho.jsp">Adicionar</a>
                            <button class="btn btn-blue">Atualizar</button>
                        </div> </div>
                    <table class="table table-sm table-striped table-bordered table-hover" id="table-egressos">

                        <caption>Lista de vagas de emprego</caption>
                        <thead>
                            <tr class="auto">
                                <th>Profissão</th>
                                <th>Salário</th>
                                <th>Quantidade de Vagas</th>
                                <th>Tipo</th>
                                <th>Descrição</th>
                                <th>Ação</th>
                            </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${trabalhos}" var="trabalho">
                            <c:set target="${trabalho}" property="nome" value="${Criptografia.decrypt(trabalho.nomeBanco)}"/>
                            <c:set target="${trabalho}" property="usuario" value="${Criptografia.decrypt(trabalho.usuarioBanco)}"/>
                            <tr>
                                <td><c:out value="${trabalho.profissao}"/></td>               
                            <td>${trabalho.salario}</td>
                            <td>${trabalho.quantidadeVagas}</td>
                            <td>${trabalho.tipo}</td>
                            <td>${trabalho.descricao}</td>
                            <td><a class="blue-text" href="trabalho_cadastrado.jsp?id=${trabalho.id}"><i class="fa fa-eye"></i>Visualizar</a></td>
                            </tr>
                        </c:forEach>
                        </tbody>
                        <tfoot>
                            <tr>
                                <th>Nome</th>
                                <th>Formação</th>
                                <th>Campus</th>
                                <th>Ano de formação</th>
                                <th>Currículo</th>
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
            $("#table-egressos").DataTable({
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

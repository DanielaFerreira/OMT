<%@page pageEncoding="ISO-8859-1"%>
<%@page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="DiscenteDAO" class="com.br.OMT.DAO.DiscenteDAO"/>
<jsp:useBean id="Criptografia" class="com.br.OMT.Utils.Criptografia"/>
<c:set var="discentes" value="${DiscenteDAO.listar()}"/>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Consultar Egressos</title>
        <link rel="stylesheet" href="../css/bootstrap.css"/>
        <link rel="stylesheet" href="../css/mdb.css"/>
        <link rel="stylesheet" href="../css/fontawesome-all.css">
        <link rel="stylesheet" href="../css/style.css">
        <link rel="stylesheet" href="../css/addons/datatables.min.css">
    </head>

    <body>
        <main>
            <jsp:include page="../header.jsp"/>
            <div class="container">
                <!--cabeçalho da página de menu logins-->

                <!--mensagem de boas vindas-->
                <h4 class="text-center my-4">
                    <img src="../img/logoInicial.png" alt="Logotipo do OMT" height="175" width="270">
                </h4>

                <!--Nav Tabs-->
                <ul class="nav nav-tabs nav-justified green darken-2" role="tablist">
                    <li class="nav-item">
                        <a href="../home.jsp" class="nav-link">
                            <i class="fas fa-user-graduate fa-lg"></i>
                            Discente
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="#login2" class="nav-link" data-toggle="tab" role="tab">
                            <i class="fas fa-university fa-lg"></i>
                            Reitoria
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="#login3" class="nav-link" data-toggle="tab" role="tab">
                            <i class="fas fa-school fa-lg"></i>
                            Campus
                        </a>
                    </li>

                    <li class="nav-item">
                        <a href="#login4" class="nav-link" data-toggle="tab" role="tab">
                            <i class="fas fa-school fa-lg"></i>
                            Empresa
                        </a>
                    </li>
                    <li class="nav-item active">
                        <a href="consultoria.jsp" class="nav-link active"><i class="fa fa-search fa-lg"></i>Ver Egressos</a>
                    </li>
                </ul>

                <div class="tab-content card mb-5">
                    <div class="tab-pane fade" id="login2" role="tabpanel">
                        <div class="mt-4 mx-4">
                            <form action="/OMT/LoginServlet" method="POST" class="loginMenu">
                                <input type="hidden" name="entidade" value="reitoria"/>

                                <label for="acessoLoginRet" class="grey-text">Nome de Acesso</label>
                                <input class="form-control" id="acessoLoginRet" name="usuario" type="text">

                                <br>

                                <label for="senhaLoginRet" class="grey-text">Senha</label>
                                <input class="form-control" id="senhaLoginRet" name="senha" type="password">

                                <div class="text-center my-4">
                                    <button class="btn btn-green" id="buttonLoginRet" type="submit">Entrar</button>
                                </div>
                            </form>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="login3" role="tabpanel">
                        <div class="mt-4 mx-4">
                            <form action="/OMT/LoginServlet" method="POST" class="loginMenu">
                                <input type="hidden" name="entidade" value="campus"/>

                                <label for="acessoLoginCam" class="grey-text">Nome de Acesso</label>
                                <input class="form-control" id="acessoLoginCam" name="usuario" type="text">

                                <br>

                                <label for="senhaLoginCam" class="grey-text">Senha</label>
                                <input class="form-control" id="senhaLoginCam" name="senha" type="password">

                                <div class="text-center my-4">
                                    <button class="btn btn-green" id="buttonLoginCam" type="submit">Entrar</button>
                                </div>
                            </form>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="login4" role="tabpanel">
                        <div class="mt-4 mx-4">                       
                            <form action="/OMT/LoginServlet" method="POST" class="loginMenu">
                                <input type="hidden" name="entidade" value="empresa"/>

                                <label for="acessoLoginEmp" class="grey-text">Nome de Acesso</label>
                                <input class="form-control" id="acessoLoginEmp" name="usuario" type="text">

                                <br>

                                <label for="senhaLoginEmp" class="grey-text">Senha</label>
                                <input class="form-control" id="senhaLoginEmp" name="senha" type="password">

                                <div class="text-center my-4">
                                    <button class="btn btn-green" id="buttonLoginEmp" type="submit">Entrar</button>
                                </div>
                            </form>

                        </div>
                    </div>
                    
                    <div class="tab-pane fade in show active"  role="tabpanel">
                        <div class="mt-4 mx-4" role="tablist">
                            <h3 class="font-weight-bold mb-4 text-center">Veja nossos Egressos</h3>
                            <table class="table table-sm table-striped table-bordered table-hover" id="table-egressos">
                                <caption>Lista de egressos</caption>
                                <thead>
                                    <tr>
                                        <th>Nome<i class="fa fa-sort float-right"></i></th>
                                        <th>Formação<i class="fa fa-sort float-right"></i></th>
                                        <th>Campus<i class="fa fa-sort float-right"></i></th>
                                        <th>Ano de formação <i class="fa fa-sort float-right"></i></th>
                                        <th>Currículo<i class="fa fa-sort float-right"></i></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${discentes}" var="discente">
                                        <c:set target="${discente}" property="nome" value="${Criptografia.decrypt(discente.nomeBanco)}"/>
                                        <c:set target="${discente}" property="usuario" value="${Criptografia.decrypt(discente.usuarioBanco)}"/>
                                        <tr>
                                            <td><c:out value="${discente.nome}"/></td>               
                                            <td>${discente.formacao.nome}</td>
                                            <td>${discente.formacao.campus.nome}</td>
                                            <td>${discente.formacao.anoTermino}</td>
                                            <td><a class="blue-text" href="curriculoDiscente.jsp?id=${discente.id}">curriculo</a></td>
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
                </div>
            </div>
        </main>
        <jsp:include page="../footer.jsp"/>
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

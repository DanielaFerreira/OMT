<%-- 
    Document   : indicarVaga
    Created on : 01/12/2019, 13:59:03
    Author     : paulo
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="DiscenteDAO" class="com.br.OMT.DAO.DiscenteDAO"/>
<jsp:useBean id="Criptografia" class="com.br.OMT.Utils.Criptografia"/>
<c:set var="discentes" value="${DiscenteDAO.listar()}"/>
<c:set var="trabalho" value="${param['id']}"/>
<html lang="pt-br">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>${evento.nome}</title>
        <link rel="stylesheet" href="../css/bootstrap.css"/>
        <link rel="stylesheet" href="../css/mdb.css"/>
        <link rel="stylesheet" href="../css/fontawesome-all.css">
        <link rel="stylesheet" href="../css/style.css">
    </head>
    <body>
        <jsp:include page="../header.jsp"/>
        <main>
            <c:if test="${not empty usuario}">
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
                        <section>
                            <div class="form-row align-items-center">
                                <div class="col-sm-6">
                                    <h3 class="font-weight-bold">Indicar vaga</h3>
                                </div> 
                            </div>
                            <div class="mr-3 ml-3 mt-4">
                                <table class="table table-sm table-striped table-bordered table-hover" id="filtro">
                                    <caption>Lista de egressos</caption>
                                    <thead>
                                        <tr>
                                            <th>Nome<i class="fa fa-sort float-right"></i></th>
                                            <th>Formação<i class="fa fa-sort float-right"></i></th>
                                            <th>Campus<i class="fa fa-sort float-right"></i></th>
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
                                                <td><a class="blue-text" href="../crud_egressos/empresaVerEgresso.jsp?id=${discente.id}&t=${trabalho}">Ver currículo</a></td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                    <tfoot>
                                        <tr>
                                            <th>Nome</th>
                                            <th>Formação</th>
                                            <th>Campus</th>
                                            <th>Currículo</th>
                                        </tr>
                                    </tfoot>
                                </table>
                            </div>
                        </section>
                    </div>
                </div>
            </c:if>
            <c:if test="${empty usuario}">
                <h1> Acesso negado <a href="../home.jsp">Volte para a tela de login </a></h1>
            </c:if>
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
        <script src="../js/filtro/filtro.js"></script>
        <script src="../js/funcao_back/volta_atualiza.js"></script>
    </body>
</html>

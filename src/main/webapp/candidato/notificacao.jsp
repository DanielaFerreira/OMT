<%-- 
    Document   : pagina_inicial
    Created on : 07/06/2018, 15:17:41
    Author     : Natan S. dos Santos
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="ISO-8859-1" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="EventoDAO" class="com.br.OMT.DAO.EventoDAO" />
<jsp:useBean id="FotosEventosDAO" class="com.br.OMT.DAO.FotosEventosDAO" />

<jsp:useBean id="NotificacaoDAO" class="com.br.OMT.DAO.NotificacaoDAO"/>

<c:set var="notificacoes" value="${NotificacaoDAO.listarNotificacaoUsuario(id)}"/>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Observatório Mundo do Trabalho</title>
        <link rel="stylesheet" href="../css/bootstrap.css"/>
        <link rel="stylesheet" href="../css/mdb.css"/>
        <link rel="stylesheet" href="../css/fontawesome-all.css">
        <link rel="stylesheet" href="../css/style.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    </head>
    <body>
        <jsp:include page="../header.jsp"/>
        <main>
            <c:set var="eventos" value="${EventoDAO.listEventos()}"/>
            <c:if test="${not empty usuario}">

                <div class="container-fluid">

                    <div class="row justify-content-center">
                        <div class="col-8">
                            <nav class="navbar navbar-expand-lg navbar-light green darken-1">
                                <ul class="navbar-nav">
                                    <li class="nav-item">
                                        <a href="index.jsp" class="nav-link text-white">
                                            <i class="fa fa-arrow-alt-circle-left fa-lg"></i>
                                            Voltar
                                        </a>
                                    </li>
                                </ul>
                            </nav>
                            <div class="tab-content card px-4 py-4">
                                <h4 href="#"><strong> Notificações</strong></h4>
                                <c:if test="${trabalhosCurriculo.size() > 0}">

                                    <table class="table table-sm table-striped table-bordered table-hover" id="filtro">
                                        <caption>Notificações</caption>
                                        <thead>
                                            <tr class="auto">
                                                <th>Título<i class="fa fa-sort float-right"></i></th>
                                                <th>Mensagem<i class="fa fa-sort float-right"></i></th>
                                                <th>Data<i class="fa fa-sort float-right"></i></th>
                                                <th>Opção<i class="fa fa-sort float-right"></i></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${notificacoes}" var="trabalhoCurriculo">

                                                <tr>
                                                    <td><c:out value="${notificacao.tituloRemetente}"/></td>
                                                    <td><c:out value="${notificacao.mensagemRemetente}"/></td>
                                                    <td>12/02/2003</td>
                                                    <td><a class="blue-text">Ver mais</a></td>
                                                  <!--  <a href="curriculo/crud_experiencia/alteracao_experiencia.jsp?id=${trabalhoCurriculo.id}" class="nav-link text-success"><i class="fa fa-edit fa-1x"></i>Alterar</a>
                                                        <a class="nav-link  text-danger" href="#" data-toggle="modal" data-target="#excluir_trabalho${trabalhoCurriculo.id}"><i class="fa fa-trash fa-1x"></i> Excluir</td>
                                                -->
                                                </tr>

                                            </c:forEach>



                                        </tbody>
                                        <tfoot>
                                            <tr class="auto">
                                                <th>Título</th>
                                                <th>Mensagem</th>
                                                <th>Data</th>
                                                <th>Opção</th>
                                            </tr>
                                        </tfoot>
                                    </table>
                                </c:if>
                                <c:if test="${notificacoes.size() == 0}">
                                    <h4 class="grey-text text-center my-4">
                                        Sem  Notificações</h4>
                                    </c:if>
                            </div>
                        </div>
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

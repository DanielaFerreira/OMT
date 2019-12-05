<%-- 
    Document   : candidatoVerVaga
    Created on : 30/11/2019, 15:45:51
    Author     : daniela
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="ISO-8859-1" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="trabalhoDAO" class="com.br.OMT.DAO.TrabalhoDAO"/>
<c:set var="vaga" value="${trabalhoDAO.getById(param.id)}"/>
<!DOCTYPE html>
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
                        <a class="mx-auto"></a>[
                        <a class="nav-link text-white" href="#" data-toggle="modal" data-target="#candidatar-se"> 
                            <i class="fas fa-briefcase fa-lg"></i> 
                            Candidatar-se
                        </a>
                     
                    </nav>
                    <div class="card px-4 py-4">
                        <section>
                            <div class="form-row align-items-center">
                                <div class="col-sm-6">
                                    <h3 class="font-weight-bold">${vaga.profissao}</h3>
                                </div>
                            </div>
                            <div class="mr-3 ml-3 mt-4">
                                <table class="table table-sm table-bordered">
                                    <tbody>
                                        <tr>
                                            <th scope="row">Profissão</th>
                                            <td><c:out value="${vaga.profissao}"/></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">Tipo</th>
                                            <td><c:out value="${vaga.tipo}"/></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">Salários</th>
                                            <td>${vaga.salario}</td>
                                        </tr>
                                        <tr>
                                            <th scope="row">Quantidade de vagas</th>
                                            <td><c:out value="${vaga.quantidadeVagas}"/></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">Iníco das inscrições</th>
                                            <td><fmt:formatDate type="both" dateStyle="short" pattern="dd/MM/yyyy" value="${vaga.tempoInicio}"/></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">Fim das inscrições</th>
                                            <td><fmt:formatDate type="both" dateStyle="short" pattern="dd/MM/yyyy" value="${vaga.tempoFinal}"/></td>
                                        </tr>

                                        <tr>
                                            <th scope="row">Descrição</th>
                                            <td>${vaga.descricao}</td>
                                        </tr>
                                    </tbody>
                                </table>
                                <!--modal candidatar-se-->
                                <div class="modal fade" id="candidatar-se" tabindex="-1" role="dialog" aria-labelledby="TituloModalCentralizado" aria-hidden="true">
                                    <div class="modal-dialog modal-dialog-centered" role="document">
                                        <div class="modal-content">
                                            <form id="formCandidatar-se" name="formCandidatar-se" method="post" action="/OMT/CandidatoVagaServlet">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="TituloModalCentralizado">Você tem certeza que deseja se candidatar a vaga <b>${vaga.profissao}</b>?</h5>
                                                    <a href="" class="close text-white" data-dismiss="modal" aria-label="Cancelar">
                                                        <i class="fas fa-times-circle fa-lg"></i>
                                                    </a> 
                                                </div>
                                                <div class="modal-body alert-info">
                                                    <input class="form-control" id="id" type="hidden" name="id" value="${vaga.id}" readonly>
                                                    Ao se candidatar, você passa por uma análise do CIE-E e da instituição que está ofertando esta vaga. Candidatar-se?
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="submit" name="acao" value="candidatar-se" class="btn btn-elegant">Sim</button>
                                                    <button type="button" class="btn btn-primary" data-dismiss="modal">Não, cancelar</button>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
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
        <script src="../js/funcao_back/volta_atualiza.js"></script>
    </body>
</html>



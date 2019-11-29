<%-- 
    Document   : curriculo
    Created on : 07/06/2018, 15:20:11
    Author     : Natan S. dos Santos
--%>
<%@page pageEncoding="ISO-8859-1"%>
<%@page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:useBean id="DiscenteDAO" class="com.br.OMT.DAO.DiscenteDAO"/>
<jsp:useBean id="FormacaoDAO" class="com.br.OMT.DAO.FormacaoDAO"/>
<jsp:useBean id="TrabalhoCurriculoDAO" class="com.br.OMT.DAO.TrabalhoCurriculoDAO"/>
<jsp:useBean id="ProjetosDAO" class="com.br.OMT.DAO.ProjetosDAO"/>
<jsp:useBean id="IOUtils" class="org.apache.commons.io.IOUtils"/>
<c:set var="discente" value="${DiscenteDAO.buscarById(param['id'])}"/>
<c:set var="formacoes" value="${FormacaoDAO.listarPorID(discente.id)}"/>
<c:set var="trabalhosCurriculo" value="${TrabalhoCurriculoDAO.listTrabalhoCurriculoByDiscente(discente.id)}"/>
<c:set var="projetos" value="${ProjetosDAO.listByDiscente(discente.id)}"/>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>${discente.nome}</title>
        <link rel="stylesheet" href="../css/bootstrap.css"/>
        <link rel="stylesheet" href="../css/mdb.css"/>
        <link rel="stylesheet" href="../css/fontawesome-all.css">
        <link rel="stylesheet" href="../css/style.css">
    </head>
    <body>
        <jsp:include page="../header.jsp"/>
        <main>
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
                    <a class="mx-auto"></a>
                    <a class="nav-link text-white" href="#" data-toggle="modal" data-target="#excluir"> 
                        <i class="fa fa-trash fa-lg"></i> 
                        Excluir
                    </a>
                    <a href="alterar.jsp?id=${discente.id}" class="nav-link text-white">
                        <i class="fa fa-edit fa-lg"></i>
                        Alterar 
                    </a>
                </nav>
                <div id="to-pdf">
                    <div class="card px-4 py-4">
                        <section>
                            <div class="form-row align-items-center">
                                <div class="col-sm-6">
                                    <h3 class="font-weight-bold mb-4">Dados pessoais</h3>
                                </div>
                            </div>
                            <div class="mr-3 ml-2">
                                <div class="form-row mt-2 mb-3">
                                    <div class="col-auto">
                                        <div class="">
                                            <c:choose>
                                                <c:when test="${fn:length(discente.foto) > 0}">
                                                    <div>
                                                        <img class="foto-curriculo border border-light rounded z-depth-1" src="${IOUtils.toString(discente.foto, 'UTF-8')}">
                                                    </div>
                                                </c:when>
                                                <c:otherwise>
                                                    <div>
                                                        <img class="foto-curriculo border border-light rounded z-depth-1" src="../img/student.png">
                                                    </div>
                                                </c:otherwise>
                                            </c:choose>
                                        </div>
                                    </div>
                                    <div class="col-auto">
                                        <h4><c:out value="${discente.nome}"/></h4>
                                        <h5><c:out value="${discente.formacao.nome}"/></h5>
                                        <h6>Manaus, Amazonas, Brasil</h6>
                                        <a class="d-block" target="blank" href="${discente.linkCurriculoLattes}">
                                            Currículo Lattes</a>
                                        <a class="d-block" target="blank" href="${discente.linkPerfilLinkedIn}">
                                            <i class="fab fa-linkedin-in mr-1"></i>Perfil LinkedIn</a>
                                    </div>
                                </div>
                                <table class="table table-sm table-bordered">
                                    <tbody>
                                        <tr>
                                            <th scope="row">Nome em citações bibliográficas</th>
                                            <td>LIMA, V. Y. P.</td>
                                        </tr>
                                        <tr>
                                            <th scope="row">Sexo</th>
                                            <td><c:out value="${discente.sexo}"/></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">Etnia</th>
                                            <td><c:out value="${discente.etnia}"/></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">Filiação</th>
                                            <td>${discente.nomePai} e ${discente.nomeMae}</td>
                                        </tr>
                                        <tr>
                                            <th scope="row">Estado Civil</th>
                                            <td><c:out value="${discente.estadoCivil}"/></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">Idade</th>
                                            <td>${discente.idade} anos </td>
                                        </tr>
                                        <tr>
                                            <th scope="row">Nascimento</th>
                                            <td><fmt:formatDate type="both" dateStyle="short" pattern="dd/MM/yyyy" value="${discente.dataNascimento}"/> - Brasil</td>
                                        </tr>
                                        <tr>
                                            <th scope="row">Carteira de Identidade</th>
                                            <td>40028922 SSP - AM - 12/07/2012</td>
                                        </tr>
                                        <tr>
                                            <th scope="row">CPF</th>
                                            <td class="CPF"><c:out value="${discente.CPF}"/> </td>
                                        </tr>
                                        <tr>
                                            <th scope="row">Endereço residencial</th>
                                            <td>Av. Djalma Batista</td>
                                        </tr>
                                        <tr>
                                            <th scope="row">
                                                <i class="fa fa-phone mr-1"></i>Telefone
                                            </th>
                                            <td>4002-8922</td>
                                        </tr>
                                        <tr>
                                            <th scope="row">
                                                <i class="fa fa-at mr-1"></i>Endereço eletrônico
                                            </th>
                                            <td>E-mail para contato : ${discente.email}</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </section> 
                        <hr class="my-4">
                        <section>
                            <div class="form-row align-items-center">
                                <div class="col-sm-6">
                                    <h3 class="font-weight-bold">Formação acadêmica/ titulação </h3>
                                </div>
                            </div>
                            <div class="mr-3 ml-2">
                                <c:if test="${formacoes.size() > 0}">
                                    <table class="table table-sm table-bordered">
                                        <thead>
                                            <tr>
                                                <th>Nome</th>
                                                <th>Escola/Instituição</th>
                                                <th>Ano de término</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${formacoes}" var="formacao">
                                                <tr>
                                                    <td><c:out value="${formacao.nome}"/></td>
                                                    <td><c:out value="${formacao.escola}"/></td>
                                                    <td><c:out value="${formacao.anoTermino}"/></td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </c:if>
                                <c:if test="${formacoes.size() == 0}">
                                    <h4 class="grey-text text-center my-4">
                                        Nenhuma formação registrada ainda
                                    </h4>
                                </c:if>
                            </div>
                        </section>
                        <hr class="my-4">
                        <section>
                            <div class="form-row align-items-center">
                                <div class="col-sm-6">
                                    <h3 class="font-weight-bold mb-4">Experiências profissionais</h3>
                                </div>
                            </div>

                            <div class="mr-3 ml-2">
                                <c:if test="${trabalhosCurriculo.size() > 0}">
                                    <table class="table table-sm table-bordered">
                                        <thead>
                                            <tr>
                                                <th>Profissão</th>
                                                <th>Descrição</th>
                                                <th>Início</th>
                                                <th>Fim</th>
                                                <th>Duração</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${trabalhosCurriculo}" var="trabalhoCurriculo">
                                                <tr>
                                                    <td><c:out value="${trabalhoCurriculo.profissao}"/></td>
                                                    <td><c:out value="${trabalhoCurriculo.descricao}"/></td>
                                                    <td><fmt:formatDate type="both" dateStyle="short" pattern="dd/MM/yyyy" value="${trabalhoCurriculo.tempoInicio}"/></td>
                                                    <td><fmt:formatDate type="both" dateStyle="short" pattern="dd/MM/yyyy" value="${trabalhoCurriculo.tempoFinal}"/></td>
                                                    <td><fmt:formatNumber type="number" maxFractionDigits="2" value="${trabalhoCurriculo.duracao/1000/60/60/24/365}"/> anos</td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </c:if>
                                <c:if test="${trabalhosCurriculo.size() == 0}">
                                    <h4 class="grey-text text-center my-4">
                                        Sem experiência profissional
                                    </h4>
                                </c:if>
                            </div>
                        </section>
                        <hr class="my-4">
                        <section>
                            <div class="form-row align-items-center">
                                <div class="col-sm-6">
                                    <h3 class="font-weight-bold mb-4">Participação em projetos acadêmicos</h3>
                                </div>
                            </div>
                            <div class="mr-3 ml-2">
                                <c:if test="${projetos.size() > 0}">
                                    <table class="table table-sm table-bordered">
                                        <thead>
                                            <tr>
                                                <th>Nome</th>
                                                <th>Descrição</th>
                                                <th>Área</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${projetos}" var="projeto">
                                                <tr>
                                                    <td><c:out value="${projeto.nome}"/></td>
                                                    <td><c:out value="${projeto.descricao}"/></td>
                                                    <td><c:out value="${projeto.area}"/></td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </c:if>
                                <c:if test="${projetos.size() == 0}">
                                    <h4 class="grey-text text-center my-4">
                                        Nenhum projeto registrado
                                    </h4>
                                </c:if>
                            </div>
                        </section>
                        <hr class="my-4">
                        <div class="row">
                            <section class="col-sm-12 col-lg-6">
                                <div class="form-row align-items-center">
                                    <div class="col-sm-6">
                                        <h3 class="font-weight-bold mb-4">Áreas de atuação</h3>
                                    </div>
                                </div>

                                <div class="mr-3 ml-2">
                                    <table class="table table-sm table-bordered">
                                        <thead>
                                            <tr>
                                                <th>Nome</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>Ciência da Computação</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </section>
                            <hr class="my-4">
                            <section class="col-sm-12 col-lg-6">
                                <div class="form-row align-items-center">
                                    <div class="col-sm-6">
                                        <h3 class="font-weight-bold mb-4">Idiomas</h3>
                                    </div>
                                </div>
                                <div class="mr-3 ml-2">
                                    <table class="table table-sm table-bordered">
                                        <thead>
                                            <tr>
                                                <th>Nome</th>
                                                <th>Situação</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>Inglês</td>
                                                <td>Compreende Razoavelmente , Fala Pouco , Escreve Razoavelmente , Lê Bem </td>
                                            </tr>
                                            <tr>
                                                <td>Português</td>
                                                <td >Compreende Bem , Fala Bem , Escreve Bem , Lê Bem </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </section>
                            <!--modal excluir-->
                            <div class="modal fade" id="excluir" tabindex="-1" role="dialog" aria-labelledby="TituloModalCentralizado" aria-hidden="true">
                                <div class="modal-dialog modal-dialog-centered" role="document">
                                    <div class="modal-content">
                                        <form id="formDeletar" name="formDeletar" method="post" action="#">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="TituloModalCentralizado">Você tem certeza que deseja excluir o discente <b>${discente.nome}</b>?</h5>
                                                <a href="" class="close text-white" data-dismiss="modal" aria-label="Cancelar">
                                                    <i class="fas fa-times-circle fa-lg"></i>
                                                </a> 
                                            </div>
                                            <div class="modal-body alert-danger">
                                                <input class="form-control" id="id" type="hidden" name="id" value="${vaga.id}" readonly>
                                                Esta é uma ação que não pode ser desfeita, pois os dados não poderão ser recuperados.
                                            </div>
                                            <div class="modal-footer">
                                                <button type="submit" name="acao" value="deletar" class="btn btn-danger"> Sim, delete</button>
                                                <button type="button" class="btn btn-primary" data-dismiss="modal"> Cancelar</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <a id="btnImprimirCurriculo" class="btn btn-primary float-right"><i class="fa fa-print mr-1"></i>Imprimir</a>
                            </div>
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
        <script src="../js/jquery.mask.min.js"></script>
        <script src="../js/mascaras.js"></script>
        <script src="../js/jspdf.min.js"></script>
        <script src="../js/html2canvas.min.js"></script>
        <script type="text/javascript">
            $("#btnBaixarCurriculo").click(function () {
                var pdf = new jsPDF('p', 'pt', 'a4');
                var original = $("#to-pdf");
                var novo = Object.assign({}, original);

                $($(novo).find('.not-printable')).each(function () {
                    $(this).hide();
                });
                var padding = $(novo).css('padding');
                $(novo).css('padding', '20px');
                pdf.addHTML(novo, function () {
                    pdf.save('web.pdf');
                    $($(novo).find('.not-printable')).each(function () {
                        $(this).show();
                    });
                    $(novo).css('padding', padding);
                });
            });
            $("#btnImprimirCurriculo").click(function () {
                window.print();
            });
        </script>
    </body>
</html>

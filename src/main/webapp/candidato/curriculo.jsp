<%-- 
    Document   : curriculo
    Created on : 07/06/2018, 15:20:11
    Author     : Natan S. dos Santos
--%>
<%@page import="java.time.Period"%>
<%@page pageEncoding="ISO-8859-1"%>
<%-- @page language="java" contentType="text/html; charset=UTF-8"--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:useBean id="FormacaoDAO" class="com.br.OMT.DAO.FormacaoDAO"/>
<jsp:useBean id="TrabalhoCurriculoDAO" class="com.br.OMT.DAO.TrabalhoCurriculoDAO"/>
<jsp:useBean id="ProjetoDAO" class="com.br.OMT.DAO.ProjetoDAO"/>
<jsp:useBean id="IdiomaDAO" class="com.br.OMT.DAO.IdiomaDAO"/>
<jsp:useBean id="AreadeAtuacaoDAO" class="com.br.OMT.DAO.AreadeAtuacaoDAO"/>
<jsp:useBean id="IOUtils" class="org.apache.commons.io.IOUtils"/>
<c:set var="formacoes" value="${FormacaoDAO.listarPorID(usuario.id)}"/>
<c:set var="idiomas" value="${IdiomaDAO.listarPorID(usuario.id)}"/>
<c:set var="areas_atuacao" value="${AreadeAtuacaoDAO.listarPorID(usuario.id)}"/>
<c:set var="trabalhosCurriculo" value="${TrabalhoCurriculoDAO.listTrabalhoCurriculoByDiscente(usuario.id)}"/>
<c:set var="projetos" value="${ProjetoDAO.listByDiscente(usuario.id)}"/>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Currículo</title>
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
                </nav>
                <div id="to-pdf">
                    <div class="card px-4 py-4">
                        <section>
                            <div class="form-row align-items-center">
                                <div class="col-sm-6">
                                    <h3 class="font-weight-bold mb-4">Dados pessoais</h3>
                                </div>
                                <div class="col-sm-6">
                                    <a href="candidato/alterarPerfil.jsp" class="btn btn-primary btn-md float-right">
                                        <i class="fa fa-edit mr-1"></i>Atualizar informações
                                    </a>
                                </div>  
                            </div>
                            <div class="mr-3 ml-2">
                                <div class="form-row mt-2 mb-3">
                                    <div class="col-auto">
                                        <div class="">
                                            <c:choose>
                                                <c:when test="${fn:length(usuario.foto) > 0}">
                                                    <div>
                                                        <img class="foto-curriculo border border-light rounded z-depth-1" src="${IOUtils.toString(usuario.foto, 'UTF-8')}">
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
                                        <h4><c:out value="${usuario.nome}"/></h4>
                                        <h5><c:out value="${usuario.formacao.nome}"/></h5>
                                        <h6>Manaus, Amazonas, Brasil</h6>
                                        <a class="d-block" target="blank" href="${usuario.linkCurriculoLattes}">
                                            Currículo Lattes</a>
                                        <a class="d-block" target="blank" href="${usuario.linkPerfilLinkedIn}">
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
                                            <td><c:out value="${usuario.sexo}"/></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">Etnia</th>
                                            <td><c:out value="${usuario.etnia}"/></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">Filiação</th>
                                            <td>${usuario.nomePai} e ${usuario.nomeMae}</td>
                                        </tr>
                                        <tr>
                                            <th scope="row">Estado Civil</th>
                                            <td><c:out value="${usuario.estadoCivil}"/></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">Idade</th>
                                            <td>${usuario.idade} anos </td>
                                        </tr>
                                        <tr>
                                            <th scope="row">Nascimento</th>
                                            <td><fmt:formatDate type="both" dateStyle="short" pattern="dd/MM/yyyy" value="${usuario.dataNascimento}"/> - Brasil</td>
                                        </tr>
                                        <tr>
                                            <th scope="row">Carteira de Identidade</th>
                                            <td>40028922 SSP - AM - 12/07/2012</td>
                                        </tr>
                                        <tr>
                                            <th scope="row">CPF</th>
                                            <td class="CPF"><c:out value="${usuario.CPF}"/> </td>
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
                                            <td>E-mail para contato : ${usuario.email}</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </section> 
                        <hr class="my-4">
                        <section>
                            <div class="form-row align-items-center">
                                <div class="col-sm-6">
                                    <h3 class="font-weight-bold">Formação acadêmica/titulação </h3>
                                </div>
                                <div class="col-sm-6">
                                    <a href="curriculo/crud_formacao/cadastro_formacao.jsp" class="btn btn-primary btn-md float-right"><i class="fa fa-plus mr-1"></i>Adicionar formação</a>
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
                                                    <td><a href="curriculo/crud_formacao/alteracao_de_formacao.jsp?id=${formacao.id}" class="nav-link text-success"><i class="fa fa-edit fa-1x"></i>Alterar</a>
                                                        <a class="nav-link  text-danger" href="#" data-toggle="modal" data-target="#excluir_formacao${formacao.id}"><i class="fa fa-trash fa-1x"></i> Excluir</td>
                                                </tr>
                                                
                                                
                                                      <!--modal excluir-->
                                <div class="modal fade" id="excluir_formacao${formacao.id}" tabindex="-1" role="dialog" aria-hidden="true">
                                    <div class="modal-dialog modal-dialog-centered" role="document">
                                        <div class="modal-content">
                                            <form name="formDeletarFormacao" method="post" action="/OMT/FormacaoServlet">
                                                <div class="modal-header">
                                                    <h5 class="modal-title">Você tem certeza que deseja excluir a formação <b><c:out value="${formacao.nome}"/></b>?</h5>
                                                    <a href="" class="close text-white" data-dismiss="modal" aria-label="Cancelar">
                                                        <i class="fas fa-times-circle fa-lg"></i>
                                                    </a> 
                                                </div>
                                                <div class="modal-body alert-danger">
                                                    <input class="form-control" type="hidden" name="id_formacao"  value="${formacao.id}" readonly>
                                                    Esta é uma ação que não pode ser desfeita, pois os dados não poderão ser recuperados.
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="submit" name="acao" value="deletar" class="btn btn-danger btn-md">Sim, delete</button>
                                                    <button type="button" class="btn btn-primary btn-md" data-dismiss="modal">Cancelar</button>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
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
                                <div class="col-sm-6">
                                    <a href="curriculo/crud_experiencia/cadastro_experiencia_profissional.jsp" class="btn btn-primary btn-md float-right"><i class="fa fa-plus mr-1"></i>Adicionar experiência</a>
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
                                                    <td><a href="curriculo/crud_experiencia/alteracao_experiencia.jsp?id=${trabalhoCurriculo.id}" class="nav-link text-success"><i class="fa fa-edit fa-1x"></i>Alterar</a>
                                                        <a class="nav-link  text-danger" href="#" data-toggle="modal" data-target="#excluir_trabalho${trabalhoCurriculo.id}"><i class="fa fa-trash fa-1x"></i> Excluir</td>
                                                </tr>
                                                
                                                  <!--modal excluir-->
                                <div class="modal fade" id="excluir_trabalho${trabalhoCurriculo.id}" tabindex="-1" role="dialog" aria-hidden="true">
                                    <div class="modal-dialog modal-dialog-centered" role="document">
                                        <div class="modal-content">
                                            <form name="formDeletarTrabalho" method="post" action="/OMT/TrabalhoCurriculoServlet">
                                                <div class="modal-header">
                                                    <h5 class="modal-title">Você tem certeza que deseja excluir a experiência profissional <b><c:out value="${trabalhoCurriculo.profissao}"/></b>?</h5>
                                                    <a href="" class="close text-white" data-dismiss="modal" aria-label="Cancelar">
                                                        <i class="fas fa-times-circle fa-lg"></i>
                                                    </a> 
                                                </div>
                                                <div class="modal-body alert-danger">
                                                    <input class="form-control" type="hidden" name="id_trabalho_curriculo"  value="${trabalhoCurriculo.id}" readonly>
                                                    Esta é uma ação que não pode ser desfeita, pois os dados não poderão ser recuperados.
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="submit" name="acao" value="deletar" class="btn btn-danger btn-md">Sim, delete</button>
                                                    <button type="button" class="btn btn-primary btn-md" data-dismiss="modal">Cancelar</button>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
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
                                <div class="col-sm-6">
                                    <a href="curriculo/crud_projeto/cadastro_projeto.jsp" class="btn btn-primary btn-md float-right"><i class="fa fa-plus mr-1"></i>Adicionar projeto</a>
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
                                                    <td><a href="curriculo/crud_projeto/alteracao_de_projeto.jsp?id=${projeto.id}" class="nav-link text-success"><i class="fa fa-edit fa-1x"></i>Alterar</a>
                                                        <a class="nav-link  text-danger" href="#" data-toggle="modal" data-target="#excluir_projeto${projeto.id}"><i class="fa fa-trash fa-1x"></i> Excluir</td>
                                              
                                                </tr>
                                                
                                                  <!--modal excluir-->
                                <div class="modal fade" id="excluir_projeto${projeto.id}" tabindex="-1" role="dialog" aria-hidden="true">
                                    <div class="modal-dialog modal-dialog-centered" role="document">
                                        <div class="modal-content">
                                            <form name="formDeletarProjeto" method="post" action="/OMT/ProjetoServlet">
                                                <div class="modal-header">
                                                    <h5 class="modal-title">Você tem certeza que deseja excluir o projeto <b><c:out value="${projeto.nome}"/></b>?</h5>
                                                    <a href="" class="close text-white" data-dismiss="modal" aria-label="Cancelar">
                                                        <i class="fas fa-times-circle fa-lg"></i>
                                                    </a> 
                                                </div>
                                                <div class="modal-body alert-danger">
                                                    <input class="form-control" type="hidden" name="id_projeto"  value="${projeto.id}" readonly>
                                                    Esta é uma ação que não pode ser desfeita, pois os dados não poderão ser recuperados.
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="submit" name="acao" value="deletar" class="btn btn-danger btn-md">Sim, delete</button>
                                                    <button type="button" class="btn btn-primary btn-md" data-dismiss="modal">Cancelar</button>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
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
                                    <div class="col-sm-6">
                                        <a href="curriculo/crud_area_de_atuacao/cadastro_area_de_atuacao.jsp" class="btn btn-primary btn-md float-right"><i class="fa fa-plus mr-1"></i>Adicionar área de atuação</a>
                                    </div>
                                </div>

                                <div class="mr-3 ml-2">
                                    <c:if test="${areas_atuacao.size() > 0}">
                                
                                    <table class="table table-sm table-bordered">
                                        <thead>
                                            <tr>
                                                <th>Nome</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <c:forEach items="${areas_atuacao}" var="area_atuacao">
                                            
                                                <td><c:out value="${area_atuacao.nome}"/></td>
                                                <td><a href="curriculo/crud_area_de_atuacao/alteracao_area_de_atuacao.jsp?id=${area_atuacao.id}" class="nav-link text-success"><i class="fa fa-edit fa-1x"></i>Alterar</a>
                                                        <a class="nav-link  text-danger" href="#" data-toggle="modal" data-target="#excluir_area${area_atuacao.id}"><i class="fa fa-trash fa-1x"></i> Excluir</td>
                                                
                                                                       <!--modal excluir-->
                                <div class="modal fade" id="excluir_area${area_atuacao.id}" tabindex="-1" role="dialog" aria-hidden="true">
                                    <div class="modal-dialog modal-dialog-centered" role="document">
                                        <div class="modal-content">
                                            <form name="formDeletarArea" method="post" action="/OMT/AreadeAtuacaoServlet">
                                                <div class="modal-header">
                                                    <h5 class="modal-title">Você tem certeza que deseja excluir a área de atuação <b><c:out value="${area_atuacao.nome}"/></b>?</h5>
                                                    <a href="" class="close text-white" data-dismiss="modal" aria-label="Cancelar">
                                                        <i class="fas fa-times-circle fa-lg"></i>
                                                    </a> 
                                                </div>
                                                <div class="modal-body alert-danger">
                                                    <input class="form-control" type="hidden" name="id_area_atuacao"  value="${area_atuacao.id}" readonly>
                                                    Esta é uma ação que não pode ser desfeita, pois os dados não poderão ser recuperados.
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="submit" name="acao" value="deletar" class="btn btn-danger btn-md">Sim, delete</button>
                                                    <button type="button" class="btn btn-primary btn-md" data-dismiss="modal">Cancelar</button>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                                                </c:forEach>
                                            </tr>
                                        </tbody>
                                    </table>
                                </c:if>
                                <c:if test="${areas_atuacao.size() == 0}">
                                    <h4 class="grey-text text-center my-4">
                                        Nenhuma área de atuação registrada
                                    </h4>
                                </c:if>
                                </div>
                            </section>
                            <hr class="my-4">
                            <section class="col-sm-12 col-lg-6">
                                <div class="form-row align-items-center">
                                    <div class="col-sm-6">
                                        <h3 class="font-weight-bold mb-4">Idiomas</h3>
                                    </div>
                                    <div class="col-sm-6">
                                        <a href="curriculo/crud_idioma/cadastro_idioma.jsp" class="btn float-right btn-md btn-primary"><i class="fa fa-plus mr-1"></i>Adicionar idioma</a>
                                    </div>
                                </div>
                                <div class="mr-3 ml-2">
                                     <c:if test="${idiomas.size() > 0}">
                                
                                    <table class="table table-sm table-bordered">
                                        <thead>
                                            <tr>
                                                <th>Nome</th>
                                                <th>Situação</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                          <!--  <tr>
                                                <td>Inglês</td>
                                                <td>Compreende Razoavelmente , Fala Pouco , Escreve Razoavelmente , Lê Bem </td>
                                            </tr>-->
                                          <c:forEach items="${idiomas}" var="idioma">
                                            <tr>
                                                <td><c:out value="${idioma.nome}"/></td>
                                                <td><c:out value="${idioma.situacao}"/></td>
                                                <td><a href="curriculo/crud_idioma/alteracao_idioma.jsp?id=${idioma.id}" class="nav-link text-success"><i class="fa fa-edit fa-1x"></i>Alterar</a>
                                                        <a class="nav-link  text-danger" href="#" data-toggle="modal" data-target="#excluir_idioma${idioma.id}"><i class="fa fa-trash fa-1x"></i> Excluir</td>
                                                
                                            </tr>
                                                                   <!--modal excluir-->
                                <div class="modal fade" id="excluir_idioma${idioma.id}" tabindex="-1" role="dialog" aria-hidden="true">
                                    <div class="modal-dialog modal-dialog-centered" role="document">
                                        <div class="modal-content">
                                            <form name="formDeletarIdioma" method="post" action="/OMT/IdiomaServlet">
                                                <div class="modal-header">
                                                    <h5 class="modal-title">Você tem certeza que deseja excluir o idioma <b><c:out value="${idioma.nome}"/></b>?</h5>
                                                    <a href="" class="close text-white" data-dismiss="modal" aria-label="Cancelar">
                                                        <i class="fas fa-times-circle fa-lg"></i>
                                                    </a> 
                                                </div>
                                                <div class="modal-body alert-danger">
                                                    <input class="form-control" type="hidden" name="id_idioma"  value="${idioma.id}" readonly>
                                                    Esta é uma ação que não pode ser desfeita, pois os dados não poderão ser recuperados.
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="submit" name="acao" value="deletar" class="btn btn-danger btn-md">Sim, delete</button>
                                                    <button type="button" class="btn btn-primary btn-md" data-dismiss="modal">Cancelar</button>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                                                
                                                </c:forEach>
                                        </tbody>
                                    </table>
                                    
                                </c:if>
                                <c:if test="${idiomas.size() == 0}">
                                    <h4 class="grey-text text-center my-4">
                                        Nenhuma idioma registrado
                                    </h4>
                                </c:if>
                                </div>
                            </section>
                        </div>
                        <hr>

                        <div class="text-right">
                            <!--button id="btnBaixarCurriculo" class="btn btn-md btn-cyan"><i class="fa fa-download mr-1"></i>Baixar</button-->
                            <button id="btnImprimirCurriculo" class="btn btn-md btn-md btn-mdb-color"><i class="fa fa-print mr-1"></i>Imprimir</button>
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
        <script src="../js/jspdf.min.js"></script>
        <script src="../js/html2canvas.min.js"></script>
        <script src="../js/general.js"></script>
        <script src="../js/funcao_back/volta_atualiza.js"></script>
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

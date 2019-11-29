<%-- 
    Document   : evento
    Created on : 28/05/2018, 20:39:30
    Author     : Paulo Victor Ribeio
--%>
<%@page pageEncoding="ISO-8859-1"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:useBean id="EventoDAO" class="com.br.OMT.DAO.EventoDAO"/>
<jsp:useBean id="FotosEventosDAO" class="com.br.OMT.DAO.FotosEventosDAO"/>
<jsp:useBean id="URLDecoder" class="java.net.URLDecoder"/>
<c:set var="evento" value="${EventoDAO.buscarPorURL(param.q)}"/>
<c:set target="${evento}" property="fotos" value="${FotosEventosDAO.listFotosEventos(evento.id)}"/>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Cadastro de Evento</title>
        <link rel="stylesheet" href="../css/bootstrap.css"/>
        <link rel="stylesheet" href="../css/mdb.css"/>
        <link rel="stylesheet" href="../css/fontawesome-all.css">
        <link rel="stylesheet" href="../css/style.css">
        <link href="../fileinput/css/fileinput.min.css" media="all" rel="stylesheet" type="text/css" />
    </head>
    <body>
        <jsp:include page="../header.jsp" />
        <main>
            <div class="container-fluid">
                <div class="row justify-content-center">
                    <div class="col-lg-8">
                        <div class=" card mb-5">
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
                                <form method="post" id="cadastrar-evento" action="/OMT/EventoServlet" 
                                      enctype="multipart/form-data">
                                    <h3 class="font-weight-bold mb-4">Novo evento</h3>

                                    <div class="form-group foto-multipla">
                                        <label for="fotos">Fotos</label>
                                        <div class="file-loading">
                                            <input id="fotos" name="fotos[]" type="file"  multiple>
                                        </div>
                                        <small id="infoAnoFinalizacao" class="form-text text-muted">
                                            Todas as fotos selecionadas serão exibidas para os usuários definidos
                                        </small>
                                    </div>              

                                    <div class="form-group">
                                        <label for="nome">Nome do Evento</label>
                                        <input class="form-control" type="text" value="${evento.nome}" placeholder="Nome do evento" id="nome" name="nome" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="local">Local do Evento</label>
                                        <input class="form-control" placeholder="Local do evento" value="${evento.local}" type="text" id="local" name="local">
                                    </div>
                                    <div class="form-row">
                                        <div class="form-group col-md-6">
                                            <label for="inscricaoInicio">Data de Início das Inscrições</label>
                                            <input class="form-control data" type="text" value="${evento.dataInicioInscricao}" id="inscricaoInicio" name="inscricaoInicio">
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label for="inscricaoFim">Data de Fim das Inscrições</label>
                                            <input class="form-control data" type="text" value="${evento.dataFinalInscricao}" id="inscricaoFim" name="inscricaoFim">
                                        </div>
                                    </div>
                                    <div class="form-row">
                                        <div class="form-group col-md-6">
                                            <label for="inicio">Data de Início do Evento</label>
                                            <input class="form-control data" type="text" value="${evento.dataInicioEvento}" id="inicio" name="inicio">
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label for="fim">Data de Fim do Evento</label>
                                            <input class="form-control data" type="text" value="${evento.dataFinalEvento}" id="fim" name="fim">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="descricao">Descrição do Evento</label>
                                        <textarea id="descricao" name="descricao" placeholder="Descrições do evento" class="form-control" rows="5">${evento.descricao}</textarea>
                                    </div>


                                    <div class="text-right">
                                        <button type="submit" name="acao" value="cadastrar" class="btn btn-green waves-effct">
                                            <i class="fa fa-check mr-1"></i>Alterar</button>

                                        <button type="reset" class="btn btn-grey waves-effct">
                                            <i class="fas fa-eraser mr-1"></i>Limpar</button>
                                    </div>
                                </form>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </main>
        <jsp:include page="../footer.jsp" />
        <script src="../js/jquery-3.3.1.min.js"></script>
        <script src="../js/popper.min.js"></script>
        <script src="../js/bootstrap.js"></script>
        <script src="../js/mdb.min.js"></script>
        <script src="../js/general.js"></script>
        <script src="../js/jquery.mask.min.js"></script>
        <script src="../js/mascaras.js"></script>
        <!-- sortable.min.js is only needed if you wish to sort / rearrange files in initial preview. 
            This must be loaded before fileinput.min.js -->
        <script src="../fileinput/js/plugins/sortable.min.js" type="text/javascript"></script>
        <!-- the main fileinput plugin file -->
        <script src="../fileinput/js/fileinput.min.js"></script>
        <!-- optionally uncomment line below for loading your theme assets for a theme like Font Awesome (`fa`) -->
        <script src="../fileinput/themes/fa/theme.min.js"></script>
        <script src="../fileinput/js/locales/pt-BR.js"></script>
        <script src="../js/inputFotoPerfil.js"></script>
    </body>
</html>

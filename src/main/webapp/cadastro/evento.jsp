<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="TrabalhoDAO" class="com.br.OMT.DAO.TrabalhoDAO"/>
<c:set var="trabalhos" value="${TrabalhoDAO.listTrabalho()}"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Observatório Mundo do Trabalho - Curso</title>
        <link rel="stylesheet" href="../css/bootstrap.css"/>
        <link rel="stylesheet" href="../css/mdb.css"/>
        <link rel="stylesheet" href="../css/fontawesome-all.css">
        <link rel="stylesheet" href="../css/style.css">
    </head>
    <body>
        <jsp:include page="../empresa/header.jsp" />

        <div class="container-fluid">

            <div class="row justify-content-center">

                <jsp:include page="../empresa/perfil_flutuante.jsp"/>

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
                                        <input id="fotos" name="fotos[]" type="file" multiple>
                                    </div>
                                    <small id="infoAnoFinalizacao" class="form-text text-muted">
                                        Todas as fotos selecionadas serão exibidas para os usuários definidos
                                    </small>
                                </div>

                                <div class="form-group">
                                    <label for="nome">Nome do Evento</label>
                                    <input class="form-control" type="text" id="nome" name="nome" required>
                                </div>
                                <div class="form-group">
                                    <label for="local">Local do Evento</label>
                                    <input class="form-control" type="text" id="local" name="local">
                                </div>
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="inscricaoInicio">Data de Início das Inscrições</label>
                                        <input class="form-control data" type="text" id="inscricaoInicio" name="inscricaoInicio">
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="inscricaoFim">Data de Fim das Inscrições</label>
                                        <input class="form-control data" type="text" id="inscricaoFim" name="inscricaoFim">
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="inicio">Data de Início do Evento</label>
                                        <input class="form-control data" type="text" id="inicio" name="inicio">
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="fim">Data de Fim do Evento</label>
                                        <input class="form-control data" type="text" id="fim" name="fim">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="descricao">Descrição do Evento</label>
                                    <textarea id="descricao" name="descricao" class="form-control" rows="5"></textarea>
                                </div>


                                <div class="text-right">
                                    <button type="submit" name="acao" value="cadastrar" class="btn btn-green waves-effct">
                                        <i class="fa fa-check mr-1"></i>Cadastrar</button>

                                    <button type="reset" class="btn btn-grey waves-effct">
                                        <i class="fas fa-eraser mr-1"></i>Limpar</button>
                                </div>
                            </form>
                        </div>
                    </div>

                </div>
            </div>
        </div>
        <jsp:include page="../footer.jsp" />
    </body>

    <script src="../js/jquery-3.3.1.min.js"></script>
    <script src="../js/popper.min.js"></script>
    <script src="../js/bootstrap.js"></script>
    <script src="../js/mdb.min.js"></script>
    <script src="../js/general.js"></script>
    <script src="../js/jquery.mask.min.js"></script>
    <script src="../js/mascaras.js"></script>
    <script>
        $('#cadastrar-evento').submit(function (e) {
            alert($('#inscricaoInicio').val());
        });
    </script>
</html>


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
                                <li class="nav-item">
                            <a href="index.jsp" class="nav-link text-white">
                                <i class="fa fa-home fa-lg">
                                </i>Voltar para a página inicial
                            </a>
                        </li>
                            </ul>
                        </nav>

                        <div class="card px-4 py-4">
                            <form id="cadastrar-trabalho" method="POST" action="/OMT/TrabalhoServlet">

                                <div class="row justify-content-between">
                                    <div class="col-md-9">
                                        <h3 class="font-weight-bold mb-4">Nova vaga de emprego</h3>
                                    </div>
                                    <div class="col-md2">
                                        <div class=" align-self-end"> 
                                            <a class="btn btn-green" href="../empresa/form_editavel.jsp">Formulário</a>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="profissao">Profissão</label>
                                        <input class="form-control validate" name="profissao" id="profissao" type="text">
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="tipo">Tipo</label>
                                        <input class="form-control validate" name="tipo" id="tipo" type="text">
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="form-group col">
                                        <label for="salario">Salário</label>
                                        <input class="form-control validate" name="salario" id="salario" type="text"/>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="quantidadeVagas">Quantidade de vagas</label>
                                        <input class="form-control validate" name="quantidadeVagas" id="quantidadeVagas" type="number">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="descricao">Descrição</label>
                                    <textarea class="form-control" name="descricao" id="descricao" rows="5"></textarea>
                                </div>

                                <div class="row">
                                    <div class="form-group col-md-6">
                                        <label for="inicio">Início das inscrições</label>
                                        <input class="form-control validate data" type="text" id="inicio" name="inicio"/>  
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="fim">Término das inscrições</label>
                                        <input class="form-control validate data" type="text" id="fim" name="fim"/>  
                                    </div>
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


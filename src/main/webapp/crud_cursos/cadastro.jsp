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
                                <form id="cadastrar-trabalho" method="POST" action="#">
                                    <section>
                                        <h3 class="font-weight-bold mb-4">Novo curso</h3>
                                        <div class="form-row">
                                            <div class="form-group col-md-12">
                                                <label for="nome">Nome</label>
                                                <input class="form-control validate" placeholder="Nome do curso" name="nome" id="nome" type="text">
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="form-group col-md-6">
                                                <label for="nivel">Nível</label>
                                                <input class="form-control validate" placeholder="Nível" name="nivel" id="nivel" type="text">
                                            </div>

                                            <div class="form-group col-md-6">
                                                <label for="quantidadeVagas">Quantidade de vagas</label>
                                                <input class="form-control validate" placeholder="Quantidade de vagas" name="quantidadeVagas" id="quantidadeVagas" type="number">
                                            </div>
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
                                    </section>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        <jsp:include page="../footer.jsp" />
    </body>
    <script src="../js/jquery-3.3.1.min.js"></script>
    <script src="../js/popper.min.js"></script>
    <script src="../js/bootstrap.js"></script>
    <script src="../js/mdb.min.js"></script>
    <script src="../js/general.js"></script>
    <script src="../js/jquery.mask.min.js"></script>
    <script src="../js/mascaras.js"></script>
</html>


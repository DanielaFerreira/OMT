<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="pt-br">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Observatório Mundo do Trabalho</title>
        <link rel="stylesheet" href="../css/bootstrap.css"/>
        <link rel="stylesheet" href="../css/mdb.css"/>
        <link rel="stylesheet" href="../css/fontawesome-all.css">
        <link rel="stylesheet" href="../css/style.css">
    </head>

    <body>
        <jsp:include page="../header.jsp"/>
        <div class="container-fluid">
            <div class="row justify-content-center">
                <div class="col-lg-8">
                    <ul class="nav nav-tabs green darken-2 mt-3" role="tablist">
                        <li class="nav-item">
                            <a href="javascript:history.back()" class="nav-link text-white">
                                <i class="fa fa-arrow-alt-circle-left fa-lg"></i>
                                Voltar
                            </a>
                        </li>
                    </ul>

                    <div class="card mb-5">
                        <div class="mt-4 mx-4 mb-4">
                            <form method="post" name="cadastrar-campus" id="cadastrar-campus" action="/OMT/CampusServlet">
                                <section>
                                    <h3 class="mb-4"><strong>Dados do campus</strong></h3>
                                    <div class="form-row">
                                        <div class="form-group col-md-6">
                                            <label for="cnpj">CNPJ</label>
                                            <input class="form-control CNPJ" type="text" id="cnpj" name="cnpj" required>
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label for="cnae">CNAE</label>
                                            <input class="form-control CNAE" type="text" id="cnae" name="cnae" required>
                                        </div>
                                    </div>
                                    <div class="form-row">
                                        <div class="form-group col-md-8">
                                            <label for="nome">Nome do Campus</label>
                                            <input class="form-control" type="text" id="nome" name="nome" required>
                                        </div>
                                        <div class="form-group col-md-4">
                                            <label for="nomeFantasia">Nome Fantasia do Campus</label>
                                            <input class="form-control" type="text" id="nomeFantasia" name="nomeFantasia" required>
                                        </div>
                                    </div>
                                    <div class="form-row">
                                        <div class="form-group col-md-6">
                                            <label for="cep">CEP</label>
                                            <input class="form-control CEP" type="text" id="cep" name="cep" required aria-describedby="infoCEP">
                                            <small id="infoCEP" class="form-text text-muted">
                                                Preenchendo o CEP, outros campos relacionados ao endereço serão preenchidos automaticamente
                                            </small>
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label for="estado">Estado</label>
                                            <input class="form-control" type="text" id="estado" name="estado" readonly required>
                                        </div>
                                    </div>
                                    <div class="form-row">
                                        <div class="form-group col-md-4">
                                            <label for="cidade">Cidade</label>
                                            <input class="form-control" type="text" id="cidade" name="cidade" readonly required>
                                        </div>
                                        <div class="form-group col-md-4">
                                            <label for="bairro">Bairro</label>
                                            <input class="form-control" type="text" id="bairro" name="bairro" readonly required>
                                        </div>
                                        <div class="form-group col-md-4">
                                            <label for="rua">Rua</label>
                                            <input class="form-control" type="text" id="rua" name="rua" readonly required>
                                        </div>
                                    </div>
                                    <div class="form-row">
                                        <div class="form-group col-md-6">
                                            <label for="numero">Número</label>
                                            <input class="form-control" type="text" id="numero" name="numero" >
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label for="complemento">Complemento</label>
                                            <input class="form-control" type="text" id="complemento" name="complemento" required>
                                        </div>
                                    </div>

                                    <div class="form-row">
                                        <div class="form-group col">
                                            <label for="tipo">Tipo</label>
                                            <select class="form-control" name="tipo" id="tipo" required>
                                                <option value="" disabled selected>Selecionar opção</option>
                                                <option value="C">Campus</option>
                                                <option value="R">Reitoria</option>
                                            </select>
                                        </div>
                                    </div>
                                </section>
                                <section>
                                    <h3 class="mb-3 mt-2"><strong>Usuário padrão</strong></h3> 
                                    <div class="form-row">
                                        <div class="form-group col-md-6">
                                            <label for="nomeUsuario">Nome</label>
                                            <input class="form-control" type="text" placeholder="Nome" id="nomeUsuario" name="nomeUsuario" required>
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label for="login">Usuário</label>
                                            <input class="form-control" type="text" id="login" placeholder="Usuário" name="login" required aria-describedby="infoLogin">
                                            <small id="infoLogin" class="form-text text-muted">
                                                Nome para entrar no sistema
                                            </small>
                                        </div>
                                    </div>
                                    <div class="form-row">
                                        <div class="form-group col-md-6">
                                            <label for="senha">Senha</label>
                                            <input class="form-control validate" id="senha" placeholder="Senha" type="password" name="senha" required>
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label for="confirmar">Confirmar Senha</label>
                                            <input class="form-control validate" id="confirmar" placeholder="Confirmar senha" type="password" name="senha" required>
                                        </div>
                                    </div>
                                </section>
                                <div class="text-right">
                                    <button type="submit" name="acao" value="cadastrar" class="btn btn-green waves-effect btn-md">
                                        <i class="fa fa-check mr-1"></i>Cadastrar</button>
                                    <button type="reset" class="btn btn-grey waves-effect btn-md"><i class="fas fa-eraser mr-1"></i>Limpar</button>
                                </div>
                            </form>
                            <script src="../js/jquery-3.3.1.min.js"></script>
                            <script src="../js/popper.min.js"></script>
                            <script src="../js/bootstrap.js"></script>
                            <script src="../js/mdb.min.js"></script>
                            <script src="../js/general.js"></script>
                            <script src="../js/jquery.mask.min.js"></script>
                            <script src="../js/mascaras.js"></script>
                            <script src="../js/consultaCNPJ.js"></script>
                            <script src="../js/consultaCEP.js"></script>
                            <script>
                                $('#cadastrar-empresa').submit(function () {
                                    $('#cnpj').unmask('00.000.000/0000-00');
                                    $('#cnae').unmask('00000-0/00');
                                });
                            </script>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="../footer.jsp"/>
    </body>
</html>
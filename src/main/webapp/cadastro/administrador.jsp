<%@page pageEncoding="ISO-8859-1"%>
<%@page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Novo Administrador</title>
        <link rel="stylesheet" href="../css/bootstrap.css"/>
        <link rel="stylesheet" href="../css/mdb.css"/>
        <link rel="stylesheet" href="../css/fontawesome-all.css">
        <link rel="stylesheet" href="../css/style.css">
    </head>
    <body>
        <%@include file="../header.jsp"%>
        <div class="container">
            <!--Nav Tabs-->
            <ul class="nav nav-tabs nav-justified green darken-2" role="tablist">
                <li class="nav-item">
                    <a href="egresso.jsp" class="nav-link" data-toggle="tab" role="tab">
                        <i class="fas fa-user-graduate fa-lg"></i>
                        Discente
                    </a>
                </li>
                <li class="nav-item">
                    <a href="campus.jsp" class="nav-link" data-toggle="tab" role="tab">
                        <i class="fas fa-school fa-lg"></i>
                        Campus
                    </a>
                </li>
                <li class="nav-item">
                    <a href="empresa.jsp" class="nav-link" data-toggle="tab" role="tab">
                        <i class="fas fa-briefcase fa-lg"></i> Empresa</a>
                </li>
                <li class="nav-item">
                    <a href="administrador.jsp" class="nav-link active">
                        <i class="fa fa-user-tie fa-lg"></i>   Administrador</a>
                </li>
            </ul>
            <div class="card py-4 px-4">
                <h4 class="mb-4"><strong>Dados do Administrador</strong></h4>
                <form id="cadastrar-formacao" method="POST" action="/OMT/AdmistradoresServlet">
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="nome">Nome</label>
                            <input class="form-control validate" name="nome" id="nome" type="text" required>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="usuario">Nome de Usuário</label>
                            <input class="form-control validate" id="usuario" type="text" name="usuario" required/>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="senha">Senha</label>
                            <input class="form-control validate" id="senha" type="password" name="senha" required>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="confirmar">Confirmar Senha</label>
                            <input class="form-control validate" id="confirmar" type="password" name="senha" required>
                        </div>
                    </div>
                    <div class="text-right">
                        <button type="submit" name="acao" value="cadastrar" class="btn btn-green waves-effect">
                            <i class="fa fa-check mr-1"></i>Cadastrar</button>
                        <button type="reset" class="btn btn-grey waves-effect"><i class="fas fa-eraser mr-1"></i>Limpar</button>
                    </div>
                </form>
            </div>
        </div>
        <%@include file="../footer.jsp"%>
        <script src="../js/jquery-3.3.1.min.js"></script>
        <script src="../js/popper.min.js"></script>
        <script src="../js/bootstrap.js"></script>
        <script src="../js/mdb.min.js"></script>
        <script src="../js/general.js"></script>
        <script src="../js/jquery.mask.min.js"></script>
        <script src="../js/mascaras.js"></script>
    </body>
</html>

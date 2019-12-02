<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="EventoDAO" class="com.br.OMT.DAO.EventoDAO" />
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Novo Área de Atuação</title>
        <link rel="stylesheet" href="../css/bootstrap.css"/>
        <link rel="stylesheet" href="../css/mdb.css"/>
        <link rel="stylesheet" href="../css/fontawesome-all.css">
        <link rel="stylesheet" href="../css/style.css">
    </head>
    <body>
        <main>
            <jsp:include page="../header.jsp"/>
            <div class="container-fluid col-md-8">
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
                    <form id="cadastrar-projeto" method="POST" action="/OMT/lalal">
                        <h3 class="font-weight-bold mb-4">Cadastrar área de atuação</h3>

                        <div class="form-row">
                            <div class="col-md-12 form-group">
                                <label for="nome">Nome</label>
                                <input name="nome" id="nome" type="text" placeholder="Nome da área de atuação" class="form-control validate">
                            </div>
                        </div>
                        <div class="text-right">
                            <button type="submit" name="acao" value="cadastrar" class="btn btn-md btn-green">
                                <i class="fa fa-check mr-1"></i>Cadastrar</button>
                            <button type="reset" class="btn btn-md btn-grey waves-effect"><i class="fas fa-eraser mr-1"></i>Limpar</button>
                        </div>
                    </form>
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
    </body>
</html>

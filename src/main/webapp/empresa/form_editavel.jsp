<%-- 
    Document   : form_editavel
    Created on : 13/08/2019, 20:42:05
    Author     : daniela
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Form OMT</title>
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <link rel="stylesheet" href="../css/style.css">
        <link rel="stylesheet" href="../css/bootstrap.min.css"/>
        <link rel="stylesheet" href="../css/tether.min.css"/>
        <link rel="stylesheet" href="../css/form_builder.css"/>
        <link rel="stylesheet" href="../css/fontawesome-all.css">
        <link rel="stylesheet" href="../css/bootstrap.css"/>
        <link rel="stylesheet" href="../css/mdb.css"/> 
    </head>
    <body>
        <jsp:include page="../empresa/header.jsp" />
        <main>
            <div class="container-fluid">
                <div class="row justify-content-center">
                    <div class="form-row justify-content-center col-lg-8">
                        <div class="col-sm-11">
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
                                            </i>Página inicial
                                        </a>
                                    </li>
                                </ul>
                            </nav>
                            <div class=" card px-4 py-4">
                                <div class="form-row justify-content-center">
                                    <div class="col-lg-12">
                                        <h3 class="font-weight-bold mb-4">Novo formulário</h3>
                                    </div>
                                    <div class="col-sm-5 text-center">
                                        <h5>Arraste os campos para a área abaixo</h5>
                                    </div>
                                    <div class="col-sm-5 text-center">
                                        <h5>Preview</h5>
                                    </div>
                                </div>
                                <div class="form-row justify-content-center">
                                    <div class="form-row col-lg-5 bal_builder form_builder_area" id="form_area"></div>
                                    <div class="col-sm-5">
                                        <div class="col-md-12">
                                            <form class="form-horizontal">
                                                <div class="preview"></div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                                <br>
                            </div>
                        </div>

                        <div class="col-sm-1">
                            <br><br>
                            <div class="collg-12">
                                <div class="form_builder">
                                    <div class=" text-center">
                                        <nav class="card nav-sidebar">
                                            <ul class="nav">
                                                <li class="form_bal_textfield">
                                                    <a href="javascript:;" title="Resposta curta"><i class="fas fa-align-left"></i></a>
                                                </li>
                                                <li class="form_bal_textarea">
                                                    <a href="javascript:;" title="Resposta longa"><i class="fas fa-align-justify"></i></a>
                                                </li>
                                                <li class="form_bal_select">
                                                    <a href="javascript:;" title="Lista suspensa"> <i class="fas fa-caret-square-down"></i></a>
                                                </li>
                                                <li class="form_bal_radio">
                                                    <a href="javascript:;" title="Múltipla escolha"><i class="fas fa-bullseye"></i></i></a>
                                                </li>
                                                <li class="form_bal_checkbox">
                                                    <a href="javascript:;" title="Caixas de seleção"><i class="fas fa-check-square"></i></a>
                                                </li>
                                                <li class="form_bal_email">
                                                    <a href="javascript:;" title="E-mail"> <i class="fas fa-envelope-square"></i></a>
                                                </li>
                                                <li class="form_bal_number">
                                                    <a href="javascript:;" title="Número"><i class="fas fa-list-ol"></i></a>
                                                </li>
                                                <li class="form_bal_password">
                                                    <a href="javascript:;" title="Senha"> <i class="fas fa-key"></i></a>
                                                </li>
                                                <li class="form_bal_date">
                                                    <a href="javascript:;" title="Data"><i class="fas fa-calendar-alt"></i></a>
                                                </li>
                                                <li class="form_bal_button">
                                                    <a href="javascript:;" title="Botão"><i class="fa fa-plus-circle pull-right"></i></a>
                                                </li>
                                            </ul>
                                        </nav>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        <jsp:include page="../footer.jsp" />
    </body>
    <script src="../js/jquery-3.3.1.min.js"></script>
    <script src="../js/jquery-ui.min.js"></script>
    <script src="../js/tether.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script src="../js/form_builder.js"></script>       
</html>

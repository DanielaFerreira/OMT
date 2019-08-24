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
        <link rel="stylesheet" href="../css/bootstrap.min.css"/>
        <link rel="stylesheet" href="../css/tether.min.css"/>
        <link rel="stylesheet" href="../css/form_builder.css"/>
        <link rel="stylesheet" href="../css/fontawesome-all.css">
        <link rel="stylesheet" href="../css/bootstrap.css"/>
        <link rel="stylesheet" href="../css/mdb.css"/>


        <script src="../js/jquery-3.3.1.min.js"></script>
        <script src="../js/jquery-ui.min.js"></script>
        <script src="../js/tether.min.js"></script>
        <script src="../js/bootstrap.min.js"></script>
        <script src="../js/form_builder.js"></script>        
    </head>

    <body>
        <jsp:include page="../empresa/header.jsp" />

        <div class="container-fluid">

            <div class="row justify-content-center">

                <div> 
                    <jsp:include page="../empresa/perfil_flutuante.jsp"/>
                </div>

                <div class="col-8">

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
                            <div class="form_builder" style="margin-top: 25px">
                                <div>
                                    <button style="cursor: pointer;display: none" class="btn btn-info export_html mt-2 pull-right">Exibir HTML gerado</button>
                                </div> 
                                <div class="row">
                                    <div class="col-1"></div>
                                    <div class="col-1 fixed-bottom text-center">
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
                                    <div class="col-5 bal_builder">
                                        <div class="form_builder_area" ></div>
                                    </div>

                                    <div class="col-5">
                                        <div class="col-md-10">
                                            <form class="form-horizontal">
                                                <div class="preview"></div>
                                                <div style="display: none" class="form-group plain_html"><textarea rows="50" class="form-control"></textarea></div>
                                            </form>
                                        </div>

                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
        <jsp:include page="../footer.jsp" />
    </body>
</html>

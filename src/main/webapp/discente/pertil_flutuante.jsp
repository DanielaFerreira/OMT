<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:useBean id="IOUtils" class="org.apache.commons.io.IOUtils"/>
<jsp:useBean id="Sexo" class="com.br.OMT.Beans.SexoBean"/>
<jsp:useBean id="EstadoCivil" class="com.br.OMT.Beans.EstadoCivilBean"/>
<jsp:useBean id="Etnia" class="com.br.OMT.Beans.EtniaBean"/>

<div class="card">

    <nav class="navbar navbar-expand-lg green darken-1">

        <div class="nav-tabs justify-content-center border-0">
            <div class="col-12">
                <a class="text-white">
                    <b>Seu perfil</b>
                </a>
            </div>
        </div>
    </nav>
    <br>
    <div class="section">
        <div class="form-row">
            <div class="form-group col">
                <div class="text-center">
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
        </div>
        <div class="form-row">
            <div class=" col-sm-12 text-center">
                <h6>Egresso</h6>
                <h3 for="nome"><c:out value="${usuario.nome}"/></h3>
            </div>
        </div>
    </div>

    <br>

    <div class="list-group">
        <a href="notificacao.jsp" class="list-group-item list-group-item-action">
            <i class="fa fa-bell fa-lg mr-1"></i>
            Notificações
            <span class="badge green darken-1 badge-pill">7</span>
        </a>
        <a href="curriculo.jsp" class="list-group-item list-group-item-action">
            <i class="fa fa-address-card fa-lg mr-1"></i>
            Currículo
        </a>
        <a href="alterarPerfil.jsp" class="list-group-item list-group-item-action">
            <i class="fa fa-edit fa-lg mr-1"></i> 
            Editar perfil
        </a>
        <a href="/OMT/LoginServlet" alt="Sair" class="list-group-item list-group-item-action">
            <i class="fa fa-sign-out-alt fa-lg mr-1"></i>
            Encerrar sessão
        </a>
    </div>
    <br>
</div>

<script src="../js/jquery-3.3.1.min.js"></script>
<script src="../js/popper.min.js"></script>
<script src="../js/bootstrap.js"></script>
<script src="../js/mdb.min.js"></script>
<script src="../js/general.js"></script>
<script src="../js/jquery.mask.min.js"></script>
<script src="../js/mascaras.js"></script>
<script src="../js/croppie.min.js"></script>
<script>
    $('#formAlterar').submit(function () {
        $('#cpf').unmask('000.000.000-00');
        $('#rg').unmask('00.000.000-0');
    });
    var id = $('form[name="formAlterar"]').attr("id");
    $(function () {
        var $uploadCrop;

        function readFile(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    $uploadCrop.croppie('bind', {
                        url: e.target.result
                    });
                }

                reader.readAsDataURL(input.files[0]);
            } else {
                alert("Sorry - you're browser doesn't support the FileReader API");
            }
        }

        $uploadCrop = $('#upload-demo').croppie({
            viewport: {
                width: 150,
                height: 200,
                type: 'square'
            },
            boundary: {
                width: 250,
                height: 250
            }
        });

        $('#upload').on('change', function () {
            $(".crop").show();
            readFile(this);
        });
        $('.upload-result').on('click', function (ev) {
            $uploadCrop.croppie('result', 'canvas').then(function (resp) {
                popupResult({
                    src: resp
                });
            });
        });

        function popupResult(result) {
            var html;
            if (result.html) {
                html = result.html;
            }
            if (result.src) {
                var label = "<figcaption>Foto de perfil nova</figcaption>";
                html = '<img class="foto-curriculo border border-light rounded z-depth-1 mb-4" src="' + result.src + '" />' + label;
            }
            $("#result").html(html);
            $("#fotoCortada").val(result.src);
        }
    });
</script>


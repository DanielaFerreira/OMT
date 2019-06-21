<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:useBean id="IOUtils" class="org.apache.commons.io.IOUtils"/>
<jsp:useBean id="Sexo" class="com.br.OMT.Beans.SexoBean"/>
<jsp:useBean id="EstadoCivil" class="com.br.OMT.Beans.EstadoCivilBean"/>
<jsp:useBean id="Etnia" class="com.br.OMT.Beans.EtniaBean"/>

<div class="card  py-4">
    <h3 class="font-weight-bold mb-4 text-center">Meu Perfil</h3>
    <form id="formAlterar" name="formAlterar" method="post" action="../discente/alterarPerfil.jsp" data-id="<c:out value="${usuario.id}"/>">
        <div class="section">

            <div class="form-row">
                <div class="form-group col-sm-12 ">
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
                    <h2 for="nome"><c:out value="${usuario.nome}"/></h2>
                </div>
            </div>
        </div>
        <div class="col-md-12 text-center">
            <button type="submit" name="acao" value="vermais" class="btn btn-md btn-grey"><i class="fa fa-edit fa-lg mr-1"></i> Editar perfil</button>
        </div>
    </form>
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


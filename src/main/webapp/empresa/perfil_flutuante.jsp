<%-- 
    Document   : perfil_flutuante
    Created on : 21/06/2019, 14:19:18
    Author     : Junior
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="card  py-4">
    <h3 class="font-weight-bold mb-4 text-center">Meu Perfil</h3>
    <form id="formAlterar" name="formAlterar" method="post" action="../discente/alterarPerfil.jsp">
    <div class="section">

        <div class="form-row">
            <div class="form-group col-sm-12 ">
                <div class="text-center">
                    <div>
                        <img class="foto-curriculo border border-light rounded z-depth-1" src="../img/student.png"> 
                    </div>

                </div>
            </div>
        </div>
        <div class="form-row">
            <div class=" col-sm-12 text-center">
                <h2 for="nome"><c:out value=""/>Nome</h2>
            </div>
        </div>
    </div>
    <div class="col-md-12 text-center">
        <button type="submit" name="acao" value="vermais" class="btn btn-md btn-grey"><i class="fa fa-edit fa-lg mr-1"></i> Editar perfil</button>
    </div>
</form>
</div>

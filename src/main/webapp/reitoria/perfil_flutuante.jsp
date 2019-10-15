<%-- 
    Document   : perfil_flutuante
    Created on : 21/06/2019, 14:19:18
    Author     : Paulo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="card">

    <nav class="navbar navbar-expand-lg green darken-1">

        <div class="nav-tabs justify-content-center border-0">
            <div class="col-12">
                <a class="text-white col-12 text-center">
                    <b>Seu perfil</b>
                </a>
            </div>
        </div>
    </nav>
    <br>
    <form id="formAlterar" name="formAlterar" method="post" action="../discente/alterarPerfil.jsp">
        <div class="section">

            <div class="form-row">
                <div class="form-group col">
                    <div class="text-center">
                        <div>
                            <img class="foto-curriculo z-depth-1 border-light" src="../img/empresa.png"> 
                        </div>

                    </div>
                </div>
            </div>
            <div class="form-row">
                <div class=" col-sm-12 text-center">
                    <h3 for="nome"><c:out value=""/>Nome</h3>
                </div>
            </div>
        </div>


    </form>
    <br>
    <div class="list-group">
        <a href="#" class="list-group-item list-group-item-action">
            <i class="fa fa-bell fa-lg mr-1"></i>
            Notificações
            <span class="badge green darken-1 badge-pill">7</span>
        </a>
        <a href="#" class="list-group-item list-group-item-action">
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
<br>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="card mb-4">
    <nav class="navbar navbar-expand-lg green darken-1">
        <div class="nav-tabs justify-content-center border-0">
            <a class="text-white">
                <b>Seu perfil</b>
            </a>
        </div>
    </nav>
    <div class="text-center mt-2">
        <img class="foto-curriculo border border-light rounded z-depth-1" src="../img/empresa.png">
        <h6 class="mt-2">Campus</h6>
        <h3 for="nome"><c:out value="${usuario.nome}"/></h3>
    </div>
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
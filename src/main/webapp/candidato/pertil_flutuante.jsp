<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:useBean id="IOUtils" class="org.apache.commons.io.IOUtils"/>
<jsp:useBean id="Sexo" class="com.br.OMT.Beans.SexoBean"/>
<jsp:useBean id="EstadoCivil" class="com.br.OMT.Beans.EstadoCivilBean"/>
<jsp:useBean id="Etnia" class="com.br.OMT.Beans.EtniaBean"/>

<div class="card mb-4">
    <nav class="navbar navbar-expand-lg green darken-1">
        <div class="nav-tabs justify-content-center border-0">
            <div class="text-white">    
                <a><b>Seu perfil</b></a>
            </div>
        </div>
    </nav>
    <div class="section">
        <div class="col-md-12 text-center mt-2">
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

            <h6 class="mt-2">Egresso</h6>
            <h3 for="nome"><c:out value="${usuario.nome}"/></h3>
        </div>
        <div class="list-group mt-3">
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
    </div>
    <br>
</div>


<%@page pageEncoding="ISO-8859-1" language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <header>
        <nav class="navbar navbar-expand-lg navbar-dark green darken-3">
            <!--Botão home-->
            <a class="navbar-brand" href="/OMT/home.jsp">IFAM - Sistema de Egressos</a>

            <!--Botão Menu tela pequena-->
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target=".barraPrincipal" aria-controls="barraPrincipal"
                    aria-expanded="false" aria-label="Alternar navegação">
                <span class="navbar-toggler-icon"></span>
            </button>
            <!--Conteúdo ajustável-->
            <div class="collapse navbar-collapse barraPrincipal">
                <!--Links-->
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item">
                        <a href="" class="nav-link"><i class="fa fa-question-circle fa-lg mr-1"></i>Suporte</a>
                    </li>
                    <li class="nav-item">
                        <a href="" class="nav-link"><i class="fa fa-universal-access fa-lg mr-1"></i>Acessibilidade</a>
                    </li>

                    <li class="nav-item">
                        <a href="http://www2.ifam.edu.br" class="nav-link">
                            <img class="mr-1" height="25" width="20" src="/OMT/img/logoIF.png"/>Site do IFAM</a>
                    </li>

                    <li class="dropdown">
                        <a class="dropdown-toggle nav-link active"  data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="fa fa-user fa-lg mr-1"></i><c:out value="${usuario.nome}"></c:out>
                        </a>
                        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenuButton">
                            <a class="dropdown-item" href="#"><i class="fa fa-bell fa-lg mr-1"></i>Notificações</a>
                            <a class="dropdown-item" href="#"><i class="fa fa-user-edit fa-lg mr-1"></i>Vagas</a>
                            <a class="dropdown-item" href="#"><i class="fa fa-user-edit fa-lg mr-1"></i>Projetos</a>
                            <a class="dropdown-item" href="#" alt="Sair" ><i class="fa fa-sign-out-alt fa-lg mr-1"></i>Encerrar sessão</a>
                        </div>
                    </li>
                </ul>
            </div>
        </nav>
    </header>
</html>
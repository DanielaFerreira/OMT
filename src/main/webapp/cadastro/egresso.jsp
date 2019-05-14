<%@page import="com.br.OMT.models.Discente"%>
<%@page pageEncoding="ISO-8859-1"%>
<%@page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="Sexo" class="com.br.OMT.Beans.SexoBean"/>
<jsp:useBean id="EstadoCivil" class="com.br.OMT.Beans.EstadoCivilBean"/>
<jsp:useBean id="Etnia" class="com.br.OMT.Beans.EtniaBean"/>

<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Cadastro de Egresso</title>
        <link rel="stylesheet" href="../css/bootstrap.css"/>
        <link rel="stylesheet" href="../css/mdb.css"/>
        <link rel="stylesheet" href="../css/fontawesome-all.css">
        <link rel="stylesheet" href="../css/style.css">
    </head>

    <body>
        <jsp:include page="../header.jsp"/>
        <!--mensagem de boas vindas-->
        <h4 class="text-center my-4">
            Seja bem-vindo ao<br>
            <img src="../img/logoInicial.png" alt="Logotipo do OMT" height="150" width="300">
        </h4>

        <div style="margin-bottom: 2%" class="container">
            <!--cabeçalho da página de menu logins-->
            <div class="container">

                <!--Nav Tabs-->
                <ul class="nav nav-tabs nav-justified green darken-2" role="tablist">
                    <li class="nav-item">
                        <a href="egresso.jsp" class="nav-link active" data-toggle="tab" role="tab">
                            <i class="fas fa-user-graduate fa-lg"></i>
                             Discente
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="campus.jsp" class="nav-link" data-toggle="tab" role="tab">
                            <i class="fas fa-school fa-lg"></i>
                             Campus
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="empresa.jsp" class="nav-link" data-toggle="tab" role="tab">
                            <i class="fas fa-briefcase fa-lg"></i> Empresa</a>
                    </li>
                    <li class="nav-item">
                        <a href="administrador.jsp" class="nav-link">
                            <i class="fa fa-user-tie fa-lg"></i>   Administrador</a>
                    </li>
                </ul>

                <div class="card py-4 px-4">
                    <h4 class="mb-4"><strong>Dados do Aluno</strong></h4>
                    <form id="form-cadastrar" name="form-cadastrar" method="post" action="/OMT/DiscenteServlet" >
                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label for="usuario">Matrícula</label>
                                <input class="form-control" type="text" id="usuario" name="usuario" maxlength="12" required>
                            </div>
                            <div class="form-group col-md-6">
                                <label for="nome">Nome Completo</label>
                                <input class="form-control" type="text" id="nome" name="nome" required>                                        
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label for="cpf">CPF</label>
                                <input class="form-control CPF" type="text" id="cpf" name="cpf" maxlength="18" required> 
                            </div>
                            <div class="form-group col-md-6">
                                <label for="rg">RG</label>
                                <input class="form-control RG" type="text" id="rg" name="rg" required> 
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="email">E-mail</label>
                            <input class="form-control" type="email" name="email" id="email" maxlength="40">
                        </div>
                        <div class="form-row">
                            <div class="form-group col-sm-12 col-lg-6">
                                <label for="linkCurriculoLattes">Link Currículo Lattes</label>
                                <input class="form-control" type="url" name="linkCurriculoLattes" id="linkCurriculoLattes" maxlength="128">
                            </div>
                            <div class="form-group col-sm-12 col-lg-6">
                                <label for="linkPerfilLinkedIn">Link Perfil LinkedIn</label>
                                <input class="form-control" type="url" id="linkPerfilLinkedIn" name="linkPerfilLinkedIn" maxlength="128">
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group col-sm-12 col-lg-4">
                                <label for="sexo">Sexo</label>
                                <select class="form-control" name="sexo" id="sexo" required>
                                    <c:forEach items="${Sexo.values}" var="sexo" varStatus="loop">
                                        <option value="${sexo}">${sexo}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group col-sm-12 col-lg-4">
                                <label for="estadoCivil">Estado Civil</label>
                                <select class="form-control" name="estadoCivil" id="estadoCivil" required>
                                    <c:forEach items="${EstadoCivil.values}" var="estadoCivil" varStatus="loop">
                                        <option value="${estadoCivil}">${estadoCivil}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group col-sm-12 col-lg-4">
                                <label for="etnia">Etnia</label>
                                <select class="form-control" name="etnia" id="etnia" required>
                                    <c:forEach items="${Etnia.values}" var="etnia" varStatus="loop">
                                        <option value="${etnia}">${etnia}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="text-right">
                            <button class="btn btn-green waves-effct" name="acao" type="submit" value="Cadastrar">
                                <i class="fa fa-check mr-1"></i>Cadastrar</button>
                            <button type="reset" class="btn btn-grey waves-effct">
                                <i class="fas fa-eraser mr-1"></i>Limpar</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <jsp:include page="../footer.jsp"/>
    </body>
</html>

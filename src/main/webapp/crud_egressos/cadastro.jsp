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
        <title>Observat�rio Mundo do Trabalho</title>
        <link rel="stylesheet" href="../css/bootstrap.css"/>
        <link rel="stylesheet" href="../css/mdb.css"/>
        <link rel="stylesheet" href="../css/fontawesome-all.css">
        <link rel="stylesheet" href="../css/style.css">
    </head>

    <body>
        <jsp:include page="../header.jsp"/>
        <div class="container">
            <ul class="nav nav-tabs green darken-2" role="tablist">
                <li class="nav-item">
                    <a href="javascript:history.back()" class="nav-link text-white">
                        <i class="fa fa-arrow-alt-circle-left fa-lg"></i>
                        Voltar
                    </a>
                </li>
            </ul>

            <div class="card mb-5">
                <div class="mt-4 mx-4 mb-4">
                    <h4 class="mb-4"><strong>Cadastrar egresso</strong></h4>
                    <form id="form-cadastrar" name="form-cadastrar" method="post" action="/OMT/DiscenteServlet" >
                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label for="usuario">Matr�cula</label>
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
                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label for="email">E-mail</label>
                                <input class="form-control" type="email" name="email" id="email" maxlength="40">
                            </div>
                            <div class="form-group col-md-6">
                                <label for="dataNasc">Data de Nascimento</label>
                                <input class="form-control" type="date" name="dataNasc" id="dataNasc" maxlength="40">
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group col-sm-12 col-lg-6">
                                <label for="linkCurriculoLattes">Link Curr�culo Lattes</label>
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
                        <section>
                            <h4 class="mb-4"><strong>Usu�rio padr�o</strong></h4>

                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="senha">Senha</label>
                                    <input class="form-control validate" id="senha" type="password" name="senha" required="">
                                    <small id="infoLogin" class="form-text text-muted">
                                        Senha para entrar no sistema
                                    </small>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="confirmar">Confirmar Senha</label>
                                    <input class="form-control validate" id="confirmar" type="password" name="senha" required="">
                                </div>
                            </div>
                        </section>
                        <div class="text-right">
                            <button class="btn btn-green waves-effct" name="acao" type="submit" value="Cadastrar">
                                <i class="fa fa-check mr-1"></i>Cadastrar</button>
                            <button type="reset" class="btn btn-grey waves-effct">
                                <i class="fas fa-eraser mr-1"></i>Limpar</button>
                        </div>
                        <br>
                    </form>
                </div>
            </div>
        </div>
        <jsp:include page="../footer.jsp"/>
    </body>
</html>

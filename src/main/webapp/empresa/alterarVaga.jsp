<%-- 
    Document   : vaga_trabalho
    Created on : 12/06/2019, 22:03:04
    Author     : daniela
--%>
<%@page import="com.br.OMT.DAO.AuxiliarDAO"%>
<%@page import="com.br.OMT.models.Auxiliar"%>
<%@page import="com.br.OMT.models.Trabalho"%>
<%@page import="com.br.OMT.DAO.TrabalhoDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="TrabalhoDAO" class="com.br.OMT.DAO.TrabalhoDAO"/>
<c:set var="trabalhos" value="${TrabalhoDAO.listTrabalho()}"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Observatório Mundo do Trabalho - Vaga de Trabalho</title>
        <link rel="stylesheet" href="../css/bootstrap.css"/>
        <link rel="stylesheet" href="../css/mdb.css"/>
        <link rel="stylesheet" href="../css/fontawesome-all.css">
        <link rel="stylesheet" href="../css/style.css">
    </head>
    <body>

        <jsp:include page="header.jsp" />
        <div class="container-fluid">


            <div class="row justify-content-center">

                <div col-4> 
                    <jsp:include page="perfil_flutuante.jsp"/>
                </div>

                <div class="col-8">

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

                    <%
                        Auxiliar aux = new Auxiliar();
                        AuxiliarDAO dao = new AuxiliarDAO();
                        aux = dao.getByIdx(1L);
                        
                        TrabalhoDAO tDAO = new TrabalhoDAO();
                        Trabalho t = tDAO.getById(aux.getId());
                    %>

                    <div class=" card">
                        <div class="mt-4 mx-4">
                            <form id="cadastrar-trabalho" method="POST" action="/OMT/TrabalhoServlet" data-id="<c:out value="${trabalho.id}"/>">
                                <h3 class="font-weight-bold mb-4">Alterar vaga de emprego</h3>

                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="profissao">Profissão</label>
                                        <input class="form-control validate" name="profissao" id="profissao" value="<%=t.getProfissao()%>" type="text">
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="tipo">Tipo</label>
                                        <input class="form-control validate" name="tipo" value="<%=t.getTipo()%>" id="tipo" type="text">
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="form-group col">
                                        <label for="salario">Salário</label>
                                        <input class="form-control validate" name="salario" id="salario" value="<c:out value="<%=t.getSalario()%>"/>" type="text"/>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="quantidadeVagas">Quantidade de vagas</label>
                                        <input class="form-control validate" name="quantidadeVagas" id="quantidadeVagas" value="<c:out value="<%=t.getQuantidadeVagas()%>"/>" type="number">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="descricao">Descrição</label>
                                    <textarea class="form-control" name="descricao" value="<c:out value="<%=t.getDescricao()%>"/>" id="descricao" rows="5"></textarea>
                                </div>

                                <div class="row">
                                    <div class="form-group col-md-6">
                                        <label for="inicio">Início das inscrições</label>
                                        <input class="form-control validate data" type="text" id="inicio" value="<%=t.getTempoInicio()%>" name="inicio"/>  
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="fim">Término das inscrições</label>
                                        <input class="form-control validate data" type="text" value="<c:out value="<%=t.getTempoFinal()%>"/>" id="fim" name="fim"/>  
                                    </div>
                                </div>
                                <div class="text-right">
                                    <button type="submit" name="acao" value="alterar" class="btn btn-green waves-effct">
                                        <i class="fa fa-check mr-1"></i>Alterar</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="../footer.jsp" />
    </body>
</html>

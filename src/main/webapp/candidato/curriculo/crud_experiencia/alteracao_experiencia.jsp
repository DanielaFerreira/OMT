<%-- 
    Document   : alteracao_area_de_atuacao
    Created on : 03/12/2019, 15:41:21
    Author     : daniela
--%>
<%@page import="com.br.OMT.Servlets.TrabalhoCurriculoServlet"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="com.br.OMT.models.TrabalhoCurriculo"%>
<%@page import="com.br.OMT.DAO.TrabalhoCurriculoDAO"%>
<jsp:useBean id="TrabalhoCurriculoDAO" class="com.br.OMT.DAO.TrabalhoCurriculoDAO"/>
<html lang="pt-br">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Alterar Experiência de Trabalho</title>
        <link rel="stylesheet" href="../../../css/bootstrap.css"/>
        <link rel="stylesheet" href="../../../css/mdb.css"/>
        <link rel="stylesheet" href="../../../css/fontawesome-all.css">
        <link rel="stylesheet" href="../../../css/style.css">
    </head>
    <body>
        <jsp:include page="../../../header.jsp"/>
        <main>
            <div class="container-fluid col-md-8">
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
                            TrabalhoCurriculo tc = TrabalhoCurriculo.getInstance();
                            TrabalhoCurriculoDAO tcDAO = new TrabalhoCurriculoDAO();
                            tc = tcDAO.getById(Long.parseLong(request.getParameter("id")));
                        %>
                
                
                
                <div class="card px-4 py-4">
                    <form method="POST" action="/OMT/TrabalhoCurriculoServlet">
                        <h3 class="font-weight-bold mb-4">Alterar Experiência Profissional</h3>
                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label for="profissao">Profissão</label>
                                <input class="form-control validate" value="<%=tc.getProfissao()%>" name="profissao" id="profissao" type="text">
                            </div>
                            <div class="form-group col-md-6">
                                <label>Nome da empresa/empregador/local de trabalho</label>
                                <input class="form-control validate" value="<%=tc.getEmpresa()%>" name="empregador" id="empregador" type="text"/>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group col-md-6">
                                <label for="inicio">Data de início</label>
                                <input class="form-control validate data" type="text" value="<%=tc.getTempoInicio()%>"  id="inicio" name="inicio"/>  
                            </div>
                            <div class="form-group col-md-6">
                                <label for="fim">Data de fim</label>
                                <input class="form-control validate data" type="text" id="fim" value="<%=tc.getTempoFinal()%>" name="fim"/>  
                            </div>
                        </div>

                        

                        <div class="form-group">
                            <label for="descricao">Descrição</label>
                            <textarea class="form-control" name="descricao" id="descricao" rows="5"><%=tc.getDescricao()%></textarea>
                        </div>
                        <div class="text-right">
                            <button type="submit" name="acao" value="alterar" class="btn btn-md btn-green">
                                <i class="fa fa-check mr-1"></i>Alterar</button>
                            <button type="reset" class="btn btn-md btn-grey waves-effect"><i class="fas fa-eraser mr-1"></i>Limpar</button>
                        </div>
                    </form>
                </div>
            </div>
        </main>
        <jsp:include page="../../../footer.jsp"/>
        <script src="../../../js/jquery-3.3.1.min.js"></script>
        <script src="../../../js/popper.min.js"></script>
        <script src="../../../js/bootstrap.js"></script>
        <script src="../../../js/mdb.min.js"></script>
        <script src="../../../js/general.js"></script>
        <script src="../../../js/jquery.mask.min.js"></script>
        <script src="../../../js/mascaras.js"></script>

    </body>
</html>
<%-- 
    Document   : empresa
    Created on : 28/05/2018, 20:39:40
    Author     : Gabriel San Martin
--%>
<%@page pageEncoding="ISO-8859-1"%>
<%@page language="java" contentType="text/html; charset=UTF-8"%>
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
        <main>
            <div class="container mt-3">
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
                        <form method="post" name="cadastrar-empresa" action="/OMT/EmpresaServlet">
                            <section>
                                <h4 class="mb-4"><strong>Dados da Empresa</strong></h4>
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="cnpj">CNPJ</label>
                                        <input class="form-control validate CNPJ" type="text" id="cnpj" name="cnpj" required>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="cnae">CNAE</label>
                                        <input class="form-control validate CNAE" type="text" id="cnae" name="cnae" required>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="nome">Nome da Empresa ou Raz�o Social</label>
                                    <input class="form-control validate" type="text" id="nome" name="nome">
                                </div>
                                <div class="form-group">
                                    <label for="nomeFantasia">Nome Fantasia da Empresa</label>
                                    <input class="form-control" type="text" id="nomeFantasia" name="nomeFantasia" required>
                                </div>
                                <div class="form-group">
                                    <label for="ramoAtuacao">Ramo de atua��o</label>
                                    <select class="form-control" id="ramoAtuacao" name="ramoAtuacao" required>
                                        <option value="-1" selected="selected">Selecione</option>
                                        <option value="1">Academia de Esportes / Artes Marciais</option>
                                        <option value="2">A��car e �lcool</option>
                                        <option value="3">Administra��o e Participa��o</option>
                                        <option value="4">Ag�ncias de Emprego / Consultoria de RH</option>
                                        <option value="5">Ag�ncias de Turismo / Viagem</option>
                                        <option value="6">Agricultura / Pecu�ria / Silvicultura</option>
                                        <option value="7">Alimentos</option>
                                        <option value="8">Arquitetura / Paisagismo / Urbanismo </option>
                                        <option value="9">Assessoria de Imprensa</option>
                                        <option value="10">Automa��o  Automotivo</option>
                                        <option value="11">Banc�rio / Financeiro</option>
                                        <option value="12">Bebidas</option>
                                        <option value="13">Bens de Capital</option>
                                        <option value="14">Bens de Consumo (Outros)</option>
                                        <option value="15">Borracha</option>
                                        <option value="16">Caf�</option>
                                        <option value="17">Cal�ados</option>
                                        <option value="18">Com�rcio Atacadista</option>
                                        <option value="19">Com�rcio Varejista</option>
                                        <option value="20">Comunica��o</option>
                                        <option value="21">Concession�rias / Auto Pe�as</option><option value="22">Constru��o Civil</option>
                                        <option value="23">Consultoria Geral</option><option value="24">Contabilidade/ Auditoria</option>
                                        <option value="27">Corretagem de T�tulos e Valores Imobili�rios</option>
                                        <option value="25">Corretagem (Im�veis)</option>
                                        <option value="26">Corretagem (Seguros)</option><option value="28">Cosm�ticos</option>
                                        <option value="29">Divers�o/ Entretenimento</option>
                                        <option value="30">Educa��o/ Idiomas</option>
                                        <option value="31">Eletr�nica/ Eletroeletr�nica/ Eletrodom�sticos</option>
                                        <option value="32">Embalagens</option><option value="33">Energia/ Eletricidade</option>
                                        <option value="34">Engenharia</option><option value="35">Equipamentos industriais</option>
                                        <option value="36">Equipamentos m�dicos / precis�o</option>
                                        <option value="37">Est�tica/ Academias</option>
                                        <option value="38">Eventos</option>
                                        <option value="39">Farmac�utica/ Veterin�ria</option><option value="40">Financeiras</option>
                                        <option value="41">Gr�fica/ Editoras</option><option value="42">Importa��o/ Exporta��o</option><option value="43">Incorporadora Ind�strias</option><option value="44">Inform�tica</option><option value="45">Internet/ Sites</option><option value="46">Jornais</option><option value="47">Jur�dica</option><option value="48">Log�stica / Armaz�ns</option><option value="49">Madeiras  Materiais de Constru��o</option><option value="50">Material de Escrit�rio </option><option value="51">Mec�nica/ Manuten��o</option><option value="52">Metal�rgica / Sider�rgica</option><option value="53">Minera��o</option><option value="54">M�veis e Artefatos de decora��o </option><option value="55">�rg�os p�blicos</option><option value="56">Outros</option><option value="57">Papel e Derivados</option><option value="58">Petroqu�mico/ Petr�leo</option><option value="59">Pl�sticos</option><option value="60">Prestadora de Servi�os</option><option value="61">Publicidade / Propaganda</option><option value="62">Recursos Humanos</option><option value="63">Rela��es P�blicas</option><option value="64">Representa��o Comercial</option><option value="65">Restaurante/ Industrial/ Fast Food</option><option value="66">Sa�de</option><option value="67">Seguran�a Patrimonial </option>
                                        <option value="68">Seguros/ Previd�ncia Privada</option>
                                        <option value="69">Sindicatos / Associa��es / ONGs</option>
                                        <option value="70">Supermercado / Hipermercado </option>
                                        <option value="71">Telecomunica��es</option><option value="72">Telemarketing/ Call Center</option>
                                        <option value="73">T�xtil/ Couro</option>
                                        <option value="74">Transportes </option>
                                        <option value="75">Turismo/ Hotelaria</option>
                                    </select>
                                </div>

                                <div class="form-group">
                                    <label for="telefone">Telefone</label>
                                    <input class="form-control" type="text" id="telefone" name="telefone" required>
                                </div>


                                <div class="form-group">
                                    <label for="email">E-mail</label>
                                    <input class="form-control" type="text" id="email" name="email" required>
                                </div>

                                <div class="form-group">
                                    <label for="cep">CEP</label>
                                    <input class="form-control validate CEP" type="text" id="cep" name="cep" required>
                                </div>
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="estado">Estado</label>
                                        <input class="form-control" type="text" id="estado" name="estado" readonly required>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="cidade">Cidade</label>
                                        <input class="form-control" type="text" id="cidade" name="cidade" readonly required>
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group col-md-4">
                                        <label for="bairro">Bairro</label>
                                        <input class="form-control" type="text" id="bairro" name="bairro" readonly required>
                                    </div>
                                    <div class="form-group col-md-4">
                                        <label for="rua">Rua</label>
                                        <input class="form-control" type="text" id="rua" name="rua" readonly required>
                                    </div>
                                    <div class="form-group col-md-4">
                                        <label for="numero">N�mero</label>
                                        <input class="form-control" type="text" id="numero" name="numero" >
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="complemento">Complemento</label>
                                    <input class="form-control" type="text" id="complemento" name="complemento" required>
                                </div>  
                            </section>
                            <hr class="my-4">
                            <section>
                                <h4 class="mb-4"><strong>Usu�rio padr�o</strong></h4>
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="nome">Nome</label>
                                        <input class="form-control validate" type="text" id="nomeUsuario" name="nomeUsuario" required>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="usuario">Usu�rio</label>
                                        <input class="form-control validate" type="text" id="usuario" name="usuario" required aria-describedby="infoLogin">
                                        <small id="infoLogin" class="form-text text-muted">
                                            Nome para entrar no sistema
                                        </small>
                                    </div>
                                </div>  
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="senha">Senha</label>
                                        <input class="form-control validate" id="senha" type="password" name="senha" required/>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="confirmar">Confirmar Senha</label>
                                        <input class="form-control validate" id="confirmar" type="password" name="senha" required/>
                                    </div>
                                </div>
                            </section>
                            <div class="text-right">
                                <button type="submit" name="acao" value="cadastrar" class="btn btn-green waves-effect">
                                    <i class="fa fa-check mr-1"></i>Cadastrar</button>
                                <button type="reset" class="btn btn-grey waves-effect"><i class="fas fa-eraser mr-1"></i>Limpar</button>
                            </div>
                        </form>

                        <script src="../js/jquery-3.3.1.min.js"></script>
                        <script src="../js/popper.min.js"></script>
                        <script src="../js/bootstrap.js"></script>
                        <script src="../js/mdb.min.js"></script>
                        <script src="../js/general.js"></script>
                        <script src="../js/jquery.mask.min.js"></script>
                        <script src="../js/mascaras.js"></script>
                        <script src="../js/consultaCNPJ.js"></script>
                        <script src="../js/consultaCEP.js"></script>
                        <script>
                            $('#cadastrar-empresa').submit(function () {
                                $('#cnpj').unmask('00.000.000/0000-00');
                                $('#cnae').unmask('00000-0/00');
                            });
                        </script>
                    </div>
                </div>
            </div>
        </main>
        <jsp:include page="../footer.jsp"/>
    </body>
</html>

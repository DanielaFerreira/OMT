<%-- 
    Document   : estagio
    Created on : 24/07/2019, 17:05:34
    Author     : Aluno
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<div class="col-md-12 table-responsive-lg">
    <table class="table table-sm table-striped table-bordered table-hover" id="filtro">

        <caption>Lista de vagas de emprego</caption>
        <thead>
            <tr class="auto">
                <th>Profissão</th>
                <th>Salário</th>
                <th>Ação</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <th scope="row">Auxiliar de informática</th>
                <td>900,000</td>
                <td class="text-center"><a class="btn btn-green">Candidatar-se</a></td>
            </tr>
        </tbody>
        <tfoot>

            <tr class="auto">
                <th>Profissão</th>
                <th>Salário</th>
                <th>Ação</th>
            </tr>
        </tfoot>
    </table>
</div>
<script src="../js/jquery-3.3.1.min.js"></script>
<script src="../js/popper.min.js"></script>
<script src="../js/bootstrap.js"></script>
<script src="../js/mdb.min.js"></script>
<script src="../js/general.js"></script>
<script src="../js/jquery.mask.min.js"></script>
<script src="../js/mascaras.js"></script>
<script src="../js/addons/datatables.min.js"></script>
<script src="../js/filtro/filtro.js"></script>
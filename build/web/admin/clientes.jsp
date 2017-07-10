<%-- 
    Document   : admin
    Created on : Jun 21, 2017, 11:21:55 PM
    Author     : ronaldoarg
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>

<%@include file="../header.jsp" %>
<div class="container">
    <%@include file="conta.jsp" %>
    <!-- CONTENT -->
    <div class="container well">
        <nav class="nav__admin">
            <ul class="nav nav-tabs nav-justified">
               <li role="presentation"><a href="<%= request.getContextPath() %>/admin/pedidos">Pedidos</a></li>
               <li role="presentation"><a href="<%= request.getContextPath() %>/admin/produtos">Produtos</a></li>
               <li role="presentation" class="active"><a href="<%= request.getContextPath() %>/admin/clientes">Clientes</a></li>
             </ul>
        </nav>
        <div class="page-header page-header--admin">
            <h1 class="title">Clientes</h1>
        </div>
        <table class="table table-striped table-bordered">
           <thead>
               <tr>
                   <td><b>Nome</b></td>
                   <td><b>Sobrenome</b></td>
                   <td><b>Usuário</b></td>
                   <td><b>Email</b></td>
               </tr>
           </thead>
           <tbody>
           <s:iterator value="usuarioList" var="c">
                <tr>
                    <td><s:property value="#c.getName()" /></td>
                    <td><s:property value="#c.getLastname()" /></td>
                    <td><s:property value="#c.getUsername()" /></td>
                    <td><s:property value="#c.getEmail()" /></td>
                <tr>
            </s:iterator>
            </tbody>
            <tfoot>
                <tr>
                    <td colspan="4">
                    </td>
                </tr>
            </tfoot>
        </table>
    </div>
</div>
<%@include file="../footer.jsp" %>
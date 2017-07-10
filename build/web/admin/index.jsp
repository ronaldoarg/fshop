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
               <li role="presentation" class="active"><a href="<%= request.getContextPath() %>/admin/pedidos">Pedidos</a></li>
               <li role="presentation"><a href="<%= request.getContextPath() %>/admin/produtos">Produtos</a></li>
               <li role="presentation"><a href="<%= request.getContextPath() %>/admin/clientes">Clientes</a></li>
             </ul>
        </nav>
         <div class="page-header page-header--admin">
            <h1 class="title">Vendas</h1>
        </div>
        <s:if test="vendas != null && vendas.size() > 0">
            <s:iterator value="vendas" var="c">
            <table class="table table-striped table-bordered">
                <thead>
                    <tr>
                        <td><b>Cliente</b></td>
                        <td><b>Produtos</b></td>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td><s:property value="#c.getCliente().getName()" /></td>
                        <td>    
                            <table class="table table-bordered">
                                <thead>
                                    <tr>
                                        <td><b>Nome</b></td>
                                        <td><b>Quantidade</b></td>
                                    </tr>
                                </thead>
                                <s:iterator value="#c.getProdutos()" var="p">
                                    <tr>                            
                                        <td>
                                            <s:property value="#p.getProduto().getName()" />
                                        </td>
                                        <td>
                                            <s:property value="#p.getQuantidade()" />
                                        </td>
                                    </tr>        
                                </s:iterator>
                            </table>
                        </td>
                    </tr>
                    
                    
                    
                </tbody>
                <tfoot>
                    <tr>
                        <td colspan="5">
                            
                        </td>
                    </tr>
                </tfoot>
            </table>
            </s:iterator>
        </s:if>
        <s:else>
            <div class="alert alert-danger" role="alert">Nenhuma venda realizada</div>
        </s:else>
    </div>
</div>
        
<%@include file="../footer.jsp" %>
<%-- 
    Document   : carrinho
    Created on : Jul 6, 2017, 10:48:51 PM
    Author     : ronaldoarg
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>

<%@include file="header.jsp" %>

<div class="container">
    <!-- CONTENT -->
    <div class="col-md-12 well">
        <h1>Carrinho</h1>
        
        <s:if test="carrinhoList != null && carrinhoList.size() > 0">
            <table class="table table-striped table-bordered">
                <thead>
                    <tr>
                        <td><b>Produto</b></td>
                        <td><b>Preço Individual</b></td>
                        <td><b>Quantidade</b></td>
                        <td><b>Excluir</b></td>
                        <td><b>Valor</b></td>
                    </tr>
                </thead>
                <tbody>
                <s:iterator value="carrinhoList" var="c">
                    <tr>
                        <td><s:property value="#c.getName()" /></td>
                        <td>R$ <s:property value="#c.getPreco()" /></td>
                        <td>
                            <ul class="pagination">
                                <li>
                                    <a href="<%= request.getContextPath() %>/carrinhoremove?id=<s:property value="#c.getId()" />">
                                      <span aria-hidden="true">-</span>
                                    </a>
                                </li>
                                <li>
                                    <span aria-hidden="true"><s:property value="#c.getQuantidade()" /></span>
                                </li>
                                <li>
                                    <a href="<%= request.getContextPath() %>/carrinhoadd?id=<s:property value="#c.getId()" />">
                                        <span aria-hidden="true">+</span>
                                    </a>
                                </li>
                            </ul>
                        </td>                        

                        <td>
                            <a href="<%= request.getContextPath() %>/carrinhodelete?id=<s:property value="#c.getId()" />">
                                <button class="btn btn-danger">
                                    <span class="glyphicon glyphicon-trash"></span>
                                </button>
                            </a>
                        </td>
                        <td>R$ <s:property value="#c.getValor()" /></td>
                    <tr>
                </s:iterator>

                </tbody>
                <tfoot>
                    <tr>
                        <td colspan="5">
                            <span class="pull-right"><b>Valor total da compra: </b>R$ <s:property value="total" /></span>
                        </td>
                    </tr>
                </tfoot>
            </table>
            <button class="btn"><a href="<%= request.getContextPath() %>/home"><span class="glyphicon glyphicon-arrow-left"></span> Continuar comprando</a></button>                
            <!--<a href="<%= request.getContextPath() %>/finalizarcompra" class="btn btn-primary pull-right">Finalizar compra</a>
            --> 
            
            <a href="<%= request.getContextPath() %>/novaVenda" class="btn btn-primary pull-right">Finalizar compra</a>


        </s:if>
        <s:else>
            <div class="alert alert-danger" role="alert">O seu carrinho está vazio</div>
            <button class="btn"><a href="<%= request.getContextPath() %>/home"><span class="glyphicon glyphicon-arrow-left"></span> Continuar comprando</a></button>                
            <button class="btn btn-primary pull-right disabled">Finalizar compra</button>
        </s:else> 
         
    </div>
</div>

<%@include file="footer.jsp" %>
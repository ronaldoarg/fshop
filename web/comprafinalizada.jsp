<%-- 
    Document   : vendarealizada
    Created on : Jul 8, 2017, 4:49:38 PM
    Author     : ronaldoarg
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>

<%@include file="header.jsp" %>

    <div class="well container">
        <h3 class="text-center"><span class="glyphicon glyphicon-ok"></span> Compra realizada com sucesso</h3><br>
        <h5 class="text-center">Aguarde um email com o código de rastreio da sua compra.</h5>
    </div>

    <div class="container well">
        <h2>Produtos recomendados</h2>
        <s:if test="recommenderProductList != null && recommenderProductList.size() > 0">
            <s:iterator value="recommenderProductList" var="c">
                <div class="col-md-3 product">  
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title"><s:property value="#c.getName()" /></h3>
                        </div>
                        <div class="panel-body">
                            <img src="http://www.attali.com/wp-content/plugins/mybooktable/images/book-placeholder.jpg" alt="Blusa Azul" class="img-responsive"/>
                        </div>
                        <div class="panel-footer">
                            <span><s:property value="#c.getAutor()" /></span><br>
                            <span><s:property value="#c.getCategoria()" /></span><br>
                            <span>Editora <s:property value="#c.getEditora()" /></span><br>
                            <hr>
                            <span>R$ <s:property value="#c.getPreco()" /></span>
                            <button class="btn btn-xs btn-primary pull-right button-buy">
                                <a href="<%= request.getContextPath() %>/carrinhoadd?id=<s:property value="#c.getId()" />">Comprar</a>
                            </button>
                        </div>
                    </div>
		</div>
            </s:iterator>
        </s:if>
    </div>

<%@include file="footer.jsp" %>
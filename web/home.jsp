<%-- 
    Document   : home
    Created on : Jun 11, 2017, 3:56:50 PM
    Author     : ronaldoarg
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>

<%@include file="header.jsp" %>

<div class="container">
    <!-- CONTENT -->
    <div class="col-md-9 well">
        <nav class="navbar navbar-default">
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav" id="main-menu"> 
                    <li class="active"><a href="#">Roupas</a></li>
                    <li><a href="#">Calçados</a></li>
                    <li><a href="#">Acessórios</a></li>
                </ul>
                <div class="nav navbar-nav navbar-right">
                    <form class="navbar-form navbar-left">
                        <div class="form-group">
                        <input type="text" class="form-control" placeholder="Buscar" id="main-search">
                        </div>
                        <button type="submit" class="btn btn-default" id="main-search-button"><span class="glyphicon glyphicon-search" aria-hidden="true"></span></button>
                    </form>
                </div>
            </div>
        </nav>
            
        <s:if test="produtoList != null && produtoList.size() > 0">
            <s:iterator value="produtoList" var="c">
                <div class="col-md-4 product">  
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title"><s:property value="#c.getName()" /></h3>
                        </div>
                        <div class="panel-body">
                            <img src="https://upload.wikimedia.org/wikipedia/commons/2/24/Blue_Tshirt.jpg" alt="Blusa Azul" class="img-responsive"/>
                        </div>
                        <div class="panel-footer">
                            <span>R$ <s:property value="#c.getPreco()" /></span>
                            <button class="btn btn-xs btn-primary pull-right button-buy">
                                <a href="<%= request.getContextPath() %>/carrinhoadd?id=<s:property value="#c.getId()" />">Comprar</a>
                            </button>
                        </div>
                    </div>
		</div>
            </s:iterator>
        </s:if>
        <s:else>
            <div class="alert alert-danger" role="alert">Nenhum produto cadastrado</div>
        </s:else>    	
    </div>

    <!-- SIDEBAR -->
    <%@include file="sidebar.jsp" %>

</div>

<%@include file="footer.jsp" %>

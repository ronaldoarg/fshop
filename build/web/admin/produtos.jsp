<%-- 
    Document   : admin
    Created on : Jun 21, 2017, 11:21:55 PM
    Author     : ronaldoarg
--%>
<%@include file="../header.jsp" %>
<div class="container">
    <%@include file="conta.jsp" %>
    <!-- CONTENT -->
    <div class="container well">
        <nav class="nav__admin">
            <ul class="nav nav-tabs nav-justified">
               <li role="presentation"><a href="<%= request.getContextPath() %>/admin/pedidos">Pedidos</a></li>
               <li role="presentation" class="active"><a href="<%= request.getContextPath() %>/admin/produtos">Produtos</a></li>
               <li role="presentation"><a href="<%= request.getContextPath() %>/admin/clientes">Clientes</a></li>
             </ul>
        </nav>
             
        <div class="page-header page-header--admin">
            <h1 class="title">Produtos</h1>
            <a href="<%= request.getContextPath() %>/admin/cadastroproduto">
                <button type="button" class="btn btn-primary pull-right">Novo produto</button>
            </a>
        </div>
             
        <s:if test="produtoList != null && produtoList.size() > 0">
            <s:iterator value="produtoList" var="c">
                <div class="col-md-3 product">  
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title"><s:property value="#c.getName()" /></h3>
                        </div>
                        <div class="panel-body">
                            <img src="https://upload.wikimedia.org/wikipedia/commons/2/24/Blue_Tshirt.jpg" alt="Blusa Azul" class="img-responsive"/>
                        </div>
                        <div class="panel-footer">
                            <span>R$ <s:property value="#c.getPreco()" /></span>
                        </div>
                    </div>
		</div>

            </s:iterator>
        </s:if>
        <s:else>
            <div class="alert alert-danger" role="alert">Nenhum produto cadastrado</div>
        </s:else>     
    </div>
</div>
<%@include file="../footer.jsp" %>
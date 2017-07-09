<%-- 
    Document   : admin
    Created on : Jun 21, 2017, 11:21:55 PM
    Author     : ronaldoarg
--%>
<%@include file="../header.jsp" %>
<div class="container">
    <!-- CONTENT -->
    <div class="col-md-12 well">
        <nav class="nav__admin">
            <ul class="nav nav-tabs nav-justified">
               <li role="presentation" class="active"><a href="<%= request.getContextPath() %>/admin">Compras</a></li>
               <li role="presentation"><a href="<%= request.getContextPath() %>/admin/produtos">Produtos</a></li>
               <li role="presentation"><a href="<%= request.getContextPath() %>/admin/clientes">Clientes</a></li>
             </ul>

        </nav>
    </div>
</div>
<%@include file="../footer.jsp" %>
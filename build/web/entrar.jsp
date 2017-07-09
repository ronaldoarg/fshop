<%-- 
    Document   : entrar
    Created on : Jun 13, 2017, 10:22:17 PM
    Author     : ronaldoarg
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>

<%@include file="header.jsp" %>

<div class="container">
    <div class="row">
        <div class="col-md-4 col-md-offset-4 well">
            <h2 class="text-center">Login<br><br>
            <small>Informe seus dados abaixo</small></h2><br><br>

            <s:if test="message != null && message.trim().length() > 0">
                <div class="alert alert-danger" role="alert"><s:property value="message" /></div>
            </s:if>

            <form action="auth" method="POST">
                <div class="form-group">
                    <label for="username">Usuário</label>
                    <input type="text" class="form-control" id="username" name="usuario.username">
                </div>

                <div class="form-group">
                    <label for="password">Senha</label>
                    <input type="password" class="form-control" id="password" name="usuario.password">
                </div>

                <button type="submit" class="btn btn-primary pull-right">Entrar</button>
            </form>
        </div>
    </div>
</div>

<%@include file="footer.jsp" %>
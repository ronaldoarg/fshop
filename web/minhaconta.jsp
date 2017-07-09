<%-- 
    Document   : minhaconta
    Created on : Jul 9, 2017, 7:04:10 PM
    Author     : ronaldoarg
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>

<%@include file="header.jsp" %>

    <div class="well container">
        
        
        <img src="https://tracker.moodle.org/secure/attachment/30912/f3.png" alt="<s:property value="usuario.getName()"/> <s:property value="usuario.getLastname()"/>" class="img-circle col-md-2 img-responsive">
        
        <h1><s:property value="usuario.getName()"/> <s:property value="usuario.getLastname()"/></h1>
        <h5><b>Usuário: </b><s:property value="usuario.getUsername()"/></h5>
        <h5><b>Email: </b><s:property value="usuario.getEmail()"/></h5>

        <a href="<%= request.getContextPath() %>/deleteuser"><button class="btn btn-danger pull-right">Deletar Conta</button></a>
        
    </div>

<%@include file="footer.jsp" %>
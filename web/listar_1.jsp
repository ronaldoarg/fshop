<%-- 
    Document   : listar
    Created on : Jun 15, 2017, 5:41:08 PM
    Author     : ronaldoarg
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>

<%@include file="header.jsp" %>

<s:if test="message != null && message.trim().length() > 0">
    <div><s:property value="message" /></div>
</s:if>
    
<%@include file="footer.jsp" %>
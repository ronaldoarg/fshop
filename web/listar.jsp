<%-- 
    Document   : listar
    Created on : Jun 15, 2017, 5:41:08 PM
    Author     : ronaldoarg
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>

<%@include file="header.jsp" %>

<h1>Clientes</h1>

<s:if test="message != null && message.trim().length() > 0">
    <div><s:property value="message" /></div>
</s:if>

<s:if test="usuarioList != null && usuarioList.size() > 0">
    <table>
        <tr> 
            <td>Codigo</td>
            <td>Nome</td>
        </tr>
        <s:iterator value="usuarioList" var="c">
       
            <tr> 
                <td><s:property value="#c.getId()" /></td>
                <td><s:property value="#c.getName()" /></td>    
            </tr>
        </s:iterator>
    </table>
</s:if>
    
<%@include file="footer.jsp" %>
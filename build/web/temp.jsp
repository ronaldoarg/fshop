<%-- 
    Document   : teste
    Created on : Jun 15, 2017, 3:26:51 PM
    Author     : ronaldoarg
--%>

<%@include file="header.jsp" %>
<h1>Users</h1>

<table>
    <tr> 
        <td>Código</td>
        <td>Nome</td>
        <td>&nbsp;</td>
    </tr>
    
    <s:iterator value="users" var="c">
        entrou
        <tr> 
            <td><s:property value="#c.getEmail()" /></td>
            <td><s:property value="#c.getUsername()" /></td>
        </tr>
    </s:iterator>
</table>
    
    
<%@include file="footer.jsp" %>
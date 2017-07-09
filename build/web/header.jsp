<%-- 
    Document   : header
    Created on : Jun 11, 2017, 3:52:14 PM
    Author     : ronaldoarg
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
    <head>
        <title>F Shop</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="<%= request.getContextPath() %>/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="<%= request.getContextPath() %>/assets/css/main.css" rel="stylesheet">
    </head>
	<body>

	<nav class="navbar navbar-inverse" style="border-radius: 0px">
            <div class="container">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="<%= request.getContextPath() %>/home">F Shop</a>
                </div>
                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav navbar-right">
                        <% if(session.getAttribute("usuario.id") == null || session.getAttribute("usuario.id").equals("")) { %>	
                            <li><a href="<%= request.getContextPath() %>/carrinho">Carrinho <span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span> </a></li>
                            <li><a href="<%= request.getContextPath() %>/cadastro">Cadastre-se <span class="glyphicon glyphicon-user" aria-hidden="true"></span> </a></li>
                            <li><a href="<%= request.getContextPath() %>/entrar">Login <span class="glyphicon glyphicon-log-in" aria-hidden="true"></span></a></li>
                        <%} else { %>
                            <li class="welcome-user"><span class="glyphicon glyphicon-user" aria-hidden="true"></span> Bem vindo, <%= session.getAttribute("usuario.name") %> <%= session.getAttribute("usuario.lastname") %></li>
                            <li><a href="<%= request.getContextPath() %>/minhaconta">Minha Conta <span class="glyphicon glyphicon-lock" aria-hidden="true"></span> </a></li>
                            <li><a href="<%= request.getContextPath() %>/carrinho">Carrinho <span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span> </a></li>
                            <li><a href="<%= request.getContextPath() %>/sair">Logout <span class="glyphicon glyphicon-log-out" aria-hidden="true"></span></a></li>
                       <% } %>
                    </ul>
                </div><!-- /.navbar-collapse -->
            </div><!-- /.container-fluid -->
	</nav>
                                        
                                        
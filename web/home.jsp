<%-- 
    Document   : home
    Created on : Jun 11, 2017, 3:56:50 PM
    Author     : ronaldoarg
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>

<s:if test="message != null && message.trim().length() > 0">
    <div><s:property value="message" /></div>
</s:if>

<div class="container">
	<!-- CONTENT -->
	<div class="col-md-9 well">
		<nav class="navbar navbar-default">
			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav" id="main-menu"> 
					<li class="active"><a href="#">Roupas</a></li>
					<li><a href="#">CalÃ§ado</a></li>
					<li><a href="#">AcessÃ³rios</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<form class="navbar-form navbar-left">
						<div class="form-group">
						<input type="text" class="form-control" placeholder="Buscar" id="main-search">
						</div>
						<button type="submit" class="btn btn-default" id="main-search-button"><span class="glyphicon glyphicon-search" aria-hidden="true"></span></button>
					</form>
				</ul>
			</div>
		</nav>

		<div class="col-md-4 product">  
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">Blusa Azul Masculina P</h3>
				</div>
				<div class="panel-body">
					<img src="https://upload.wikimedia.org/wikipedia/commons/2/24/Blue_Tshirt.jpg" alt="Blusa Azul" class="img-responsive"/>
				</div>
				<div class="panel-footer">
					<span>R$ 49,90</span>
					<button class="btn btn-xs btn-primary pull-right button-buy">Comprar</button>
				</div>
			</div>
		</div>
		<div class="col-md-4 product">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">Blusa Cinza Masculina P</h3>
				</div>
				<div class="panel-body">
					<img src="https://upload.wikimedia.org/wikipedia/commons/c/c6/Grey_Tshirt.jpg" alt="Blusa Cinza" class="img-responsive"/>
				</div>
				<div class="panel-footer">
					<span>R$ 49,90</span>
					<button class="btn btn-xs btn-primary pull-right button-buy">Comprar</button>
				</div>
			</div>
		</div>
		<div class="col-md-4 product">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">Blusa Azul Masculina M</h3>
				</div>
				<div class="panel-body">
					<img src="https://upload.wikimedia.org/wikipedia/commons/2/24/Blue_Tshirt.jpg" alt="Blusa Azul" class="img-responsive"/>
				</div>
				<div class="panel-footer">
					<span>R$ 49,90</span>
					<button class="btn btn-xs btn-primary pull-right button-buy">Comprar</button>
				</div>
			</div>
		</div>
		<div class="col-md-4 product">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">Blusa Cinza Masculina M</h3>
				</div>
				<div class="panel-body">
					<img src="https://upload.wikimedia.org/wikipedia/commons/c/c6/Grey_Tshirt.jpg" alt="Blusa Cinza" class="img-responsive"/>
				</div>
				<div class="panel-footer">
					<span>R$ 49,90</span>
					<button class="btn btn-xs btn-primary pull-right button-buy">Comprar</button>
				</div>
			</div>
		</div>
		<div class="col-md-4 product">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">Blusa Azul Masculina G</h3>
				</div>
				<div class="panel-body">
					<img src="https://upload.wikimedia.org/wikipedia/commons/2/24/Blue_Tshirt.jpg" alt="Blusa Azul" class="img-responsive"/>
				</div>
				<div class="panel-footer">
					<span>R$ 49,90</span>
					<button class="btn btn-xs btn-primary pull-right button-buy">Comprar</button>
				</div>
			</div>
		</div>
		<div class="col-md-4 product">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">Blusa Cinza Masculina G</h3>
				</div>
				<div class="panel-body">
					<img src="https://upload.wikimedia.org/wikipedia/commons/c/c6/Grey_Tshirt.jpg" alt="Blusa Cinza" class="img-responsive"/>
				</div>
				<div class="panel-footer">
					<span>R$ 49,90</span>
					<button class="btn btn-xs btn-primary pull-right button-buy">Comprar</button>
				</div>
			</div>
		</div>
	</div>

	<!-- SIDEBAR -->
	<%@include file="sidebar.jsp" %>

</div>

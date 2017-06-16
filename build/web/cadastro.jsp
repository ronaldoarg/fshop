<%-- 
    Document   : home
    Created on : Jun 11, 2017, 3:56:50 PM
    Author     : ronaldoarg
--%>

<%@include file="header.jsp" %>

<div class="container">
	<div class="row">
		<div class="col-md-4 col-md-offset-4">
			<h2 class="text-center">Novo usuário<br><br>
			<small>Informe seus dados abaixo</small></h2><br><br>
			<form action="novousuario">
				<div class="form-group">
					<label for="name">Nome</label>
					<input type="text" class="form-control" id="name" placeholder="Mark" name="usuario.name">
				</div>
				<div class="form-group">
					<label for="lastname">Sobrenome</label>
					<input type="text" class="form-control" id="lastname" placeholder="Zuckerberg" name="usuario.lastname">
				</div>
				<div class="form-group">
					<label for="username">Usuário</label>
					<input type="text" class="form-control" id="username" placeholder="markz" name="usuario.username">
				</div>
				<div class="form-group">
					<label for="email">Email</label>
					<input type="email" class="form-control" id="email" placeholder="email@email.com.br" name="usuario.email">
				</div>
				<div class="form-group">
					<label for="password">Senha</label>
					<input type="password" class="form-control" id="password" placeholder="********" name="usuario.password">
				</div>
			
				<button type="submit" class="btn btn-primary pull-right">Cadastrar</button>
			</form>
		</div>
	</div>
</div>

<%@include file="footer.jsp" %>
		
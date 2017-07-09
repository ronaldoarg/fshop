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
               <li role="presentation"><a href="<%= request.getContextPath() %>/admin">Compras</a></li>
               <li role="presentation" class="active"><a href="<%= request.getContextPath() %>/admin/produtos">Produtos</a></li>
               <li role="presentation"><a href="<%= request.getContextPath() %>/admin/clientes">Clientes</a></li>
             </ul>
        </nav>
             
        <div class="page-header page-header--admin">
            <h1 class="title">Novo Produto</h1>
        </div>
        
       <form action="novoproduto" method="POST" class="col-md-6 col-md-offset-3">
            <s:if test="message != null && message.trim().length() > 0">
                <div class="alert alert-success" role="alert"><s:property value="message" /></div>
            </s:if>
            <div class="form-group">
                <label for="name">Nome</label>
                <input type="text" class="form-control" id="name" name="produto.name">
            </div>
            <div class="form-group">
                <label for="quatidade">Quantidade</label>
                <input type="text" class="form-control" id="quantidade" name="produto.quantidade" type="number">
            </div>
            <div class="form-group">
                <label for="preco">Preço</label>
                <input type="text" class="form-control" id="preco" name="produto.preco" type="number">
            </div>
            <div class="form-group">
                <label for="tamanho">Tamanho</label>
                 <select class="form-control" id="preco" name="produto.tamanho">
                    <option value="pp">PP</option>
                    <option value="p">P</option>
                    <option value="m">M</option>
                    <option value="g">G</option>
                    <option value="gg">GG</option>

                </select>
            </div>
            <div class="form-group">
                <label for="tamanho">Categoria</label>
                 <select class="form-control" id="preco" name="produto.categoria">
                    <option value="roupa">Roupa</option>
                    <option value="calcado">Calçado</option>
                    <option value="acessorio">Acessório</option>
                </select>
            </div>
            <div class="form-group">
                <label for="genero">Gênero</label>
                <select class="form-control" id="preco" name="produto.genero">
                    <option value="Feminino">Feminino</option>
                    <option value="Feminino">Masculino</option>
                </select>
            </div>
            <div class="form-group">
                <label for="cor">Cor</label>
                <input type="text" class="form-control" id="cor" name="produto.cor">
            </div>
            
            <button type="button" class="btn btn-default pull-left" onclick="history.back();">Voltar</button>            
            <button type="submit" class="btn btn-primary pull-right">Cadastrar</button>

        </form>
             
    </div>
</div>
<%@include file="../footer.jsp" %>
 function novaInteracao(field, value, user_id) {
	var params = "interacao.field="+field+"&interacao.text="+value+"&interacao.user_id="+user_id;    
	$.post("novainteracao", params)
		.done(function(response) {
			console.log("success");			console.log(response);

		})
		.fail(function() {
			console.log("error");
		})
		.always(function() {
			console.log("finished");
		});
}

$('#main-search-button').click(function(e) {
	e.preventDefault();
	novaInteracao('main-search', $('#main-search').val(), 1)
});

$('#main-menu li a').click(function() {
	novaInteracao('main-menu', $(this)[0].textContent, 1);
});

$('.button-buy').click(function() {
	novaInteracao('button-buy', $(this).parent().parent().children('.panel-heading').children('h3')[0].textContent, 1);
});

$('.well-sidebar a').click(function() {
	novaInteracao
	('sidebar-filters', $(this)[0].textContent, 1);
});

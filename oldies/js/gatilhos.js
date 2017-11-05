$(document).ready(function(){
	
	//Gera o calendário para os campos marcados com "data"
	$('input[calendar="true"]').datepicker(
		{
			dateFormat:'dd-mm-yy',
			dayNamesMin: [ "Dom", "Seg", "Ter", "Qua", "Qui", "Sex", "Sab" ],
			monthNames: [ "Janeiro", "Fevereiro", "Março", "Abril", "Maio", "Junho", "Julho", "Agosto", "Setembro", "Outubro", "Novembro", "Dezembro" ]
		}
	);
    
    //Faz os campos com o attr upper sendo true sejam colocados em Caixa Alta
	$('input[upper="true"]').keyup(function(){
		$(this).val($(this).val().toUpperCase());
	});
	
	//Pesquisa LIVE - Select2
	$('.live').select2();//Está dando erro no agendamento... verificar...
	
	/* Função responsável por fazer o Ajax  de combobox
	 *sendo somente necessário setar os atributos url(controller/action), e o Id do elemento que receberá o retorno destinoid.
	 *onde o valor a ser passado para a função no controller será o próprio valor do combobox
	 */
	$('select[ajax="true"]').change(function(){
		
		var base = "/dev/dst/";//base da aplicação
		//alert(base);
		var url = $(this).attr('url');//controller/action
		var destinoid = $(this).attr('destinoid');//id do elemento que receberá os dados
		var valor = $(this).val();//valor do combobox
		url = base+url+valor;// monta a url  final
		$('#'+destinoid).html('');//limpa a opção
		$('#'+destinoid).html('<option>Carregando...</option>');//exibe no destino 'Carregando...'
		
		$.get(url, function (data){
			$('#'+destinoid).html('');
			$('#'+destinoid).html(data);
		});
	
	});
    
	//Abre o modal quando se d´foco a um input com a marcação modal=true
	$('input[modal="true"]').focus(function(){
		var base = "/dev/dst/";
		var url = base+$(this).attr('url');
		//alert(url);
		$(this).colorbox({transition: "fade", speed:500, href:url, width:"70%", height:"70%", returnFocus: true});
	});
	
	//Plugin de expansão 
	$('p.expand').toggler();
    
	//Popover
	$('[data-rel=popover]').popover({html:true});
	
	
});

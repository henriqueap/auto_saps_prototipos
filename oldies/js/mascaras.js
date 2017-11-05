$(document).ready(function(){


$('input[mask="lat"]').mask("-99.9999999");
$('input[mask="long"]').mask("-99.9999999");
$('input[mask="cpf"]').mask("99999999999");
$('input[mask="cnpj"]').mask("99999999999999");
$('input[mask="decimal"]').maskMoney({symbol:"",decimal:".",thousands:""})
$('input[mask="cep"]').mask("99999-999");
$('input[mask="data"]').mask("99-99-9999");		
$('input[mask="hora"]').mask("99:99"); 
$('input[mask="telefone"]').mask("(99)9999-9999");
$('input[mask="matricula"]').mask("999.999-9");
        
});

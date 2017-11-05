<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title> SAPS - Sistema de Acompanhamento de Projetos de Seguran&ccedil;a - Cadastro </title>
    <!-- Icons -->
    <link href="favicon.ico" type="image/x-icon" rel="icon" />
    <link href="favicon.ico" type="image/x-icon" rel="shortcut icon" />
    <!-- CSS -->
    <link rel="stylesheet" type="text/css" href="./assets/css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="./assets/css/bootstrap-responsive.min.css" />
    <link rel="stylesheet" type="text/css" href="./assets/css/font-awesome.min.css" />
    <link rel="stylesheet" type="text/css" href="./assets/css/ace.css" />
    <link rel="stylesheet" type="text/css" href="./assets/css/ace-responsive.min.css" />
    <link rel="stylesheet" type="text/css" href="./assets/css/ace-skins.css" />
    <link rel="stylesheet" type="text/css" href="./assets/css/superfish2.css" />
    <link rel="stylesheet" type="text/css" href="./assets/css/tabs.css" />
    <link rel="stylesheet" type="text/css" href="./assets/css/colorbox/colorbox.css" />
    <link rel="stylesheet" type="text/css" href="./assets/css/cleditor/cleditor.css" />
    <link rel="stylesheet" type="text/css" href="./assets/css/custom.css" />
    <link rel="stylesheet" type="text/css" href="./assets/css/ui-lightness/jquery-ui-1.7.3.custom.css" />
    <link rel="stylesheet" type="text/css" href="./assets/css/select2.min.css" />
    <link rel="stylesheet" type="text/css" href="./assets/css/smoothness/jquery-ui-1.7.3.custom.css" />  
  </head>

  <body>        
    <div class="navbar navbar-inverse">
      <div class="navbar-inner">
        <div class="container-fluid">	
          <table>
            <tr>
              <td>
                <img src="http://www2.defesasocial.rn.gov.br/cbmrn/cbdocs/cbmrn.png" width="80" height="80" />
              </td>
              <td>
                <font class="brand" >Sistema de Acompanhamento de Projetos de Seguran&ccedil;a - SAPS</font> 
              </td>
            </tr>
          </table>
        </div><!--/.container-fluid-->
      </div><!--/.navbar-inner-->
    </div><!--/.navbar-->

    <div class="container-fluid" id="main-container">
      <div id="main-content" style="margin-left: auto; margin-right: auto; width: 60%;" class="clearfix">
        <div id="page-header" class="position-relative">
          <h1 class="page-header">
            Cadastro de Interessado<small><i class="icon-double-angle-right"></i> Cadastre-se</small>       
          </h1>
        </div><!--/page-header-->

        <div class="widget-box">
          <div class="widget-header">
            <h5>Seus Dados</h5>
          </div><!--/widget-header-->

          <div class="widget-body">
            <div class="widget-main">
              <div class="clientes form">
                <form action="/serten/clientes/edit" id="ClienteEditForm" method="post" accept-charset="utf-8">
                  <div style="display:none;">
                    <input type="hidden" name="_method" value="POST" />
                  </div>
                  <fieldset>
                    <div class="input select required">
                      <label for="ClientePro">Cliente ou Profissional</label>
                      <select name="clientepro" class="span2" id="ClientePro">
                        <option value="">-- Selecione --</option>
                        <option value="1">Cliente</option>
                        <option value="2">Profissional</option>							
                      </select>
                    </div>

                    <div class="input text required">
                      <label for="NomeCompleto">Nome Completo</label>
                      <input name="nomecompleto" type="text" upper="true" class="span4" maxlength="255" id="NomeCompleto"/>
                    </div>						

                    <div class="input text required">
                      <label for="ClienteNumFone">Fone - DDD</label>
                      <input name="data[Cliente][num_fone]" type="text" class="span2" mask="telefone" maxlength="15" id="ClienteNumFone" />
                    </div>

                    <div class="input text required">
                      <label for="ClienteDscEmail">Email</label>
                      <input name="data[Cliente][dsc_email]" type="text" class="span4" maxlength="100" id="ClienteDscEmail" />
                    </div>

                    <div class="input text required">
                      <label for="ClienteNumCnpj">CPF</label>
                      <input name="data[Cliente][num_cnpj]" type="text" class="span2" maxlength="14" id="ClienteNumCnpj" />
                    </div>

                    <div id="crea_cau" class="input text required profissional">
                      <label for="EngenheiroNumCrea">Num. CREA/CAU</label>
                      <input name="data[Engenheiro][num_crea]" type="text" class="span3" maxlength="10" id="EngenheiroNumCrea" />
                    </div>

                    <div id="crea_cau_uf" class="input select required profissional">
                      <label for="EngenheiroDscUfcrea">UF CREA/CAU</label>
                      <select name="data[Engenheiro][dsc_ufcrea]" class="span4" id="EngenheiroDscUfcrea">
                        <option value="">-- Selecione --</option>
                        <option value="1">AC</option>
                        <option value="2">AL</option>
                        <option value="3">AM</option>
                        <option value="4">AP</option>
                        <option value="5">BA</option>
                        <option value="6">CE</option>
                        <option value="7">DF</option>
                        <option value="8">ES</option>
                        <option value="9">GO</option>
                        <option value="10">MA</option>
                        <option value="11">MG</option>
                        <option value="12">MS</option>
                        <option value="13">MT</option>
                        <option value="14">PA</option>
                        <option value="15">PB</option>
                        <option value="16">PE</option>
                        <option value="17">PI</option>
                        <option value="18">PR</option>
                        <option value="19">RJ</option>
                        <option value="20">RN</option>
                        <option value="21">RO</option>
                        <option value="22">RR</option>
                        <option value="23">RS</option>
                        <option value="24">SC</option>
                        <option value="25">SE</option>
                        <option value="26">SP</option>
                        <option value="27">TO</option>
                      </select>
                    </div>

                    <div class="input select required">
                      <label for="ClienteDscUf">Estado</label>
                      <select name="data[Cliente][dsc_uf]" ajax="true" url="clientes/getmun/" destinoid="cidade" class="span2" id="ClienteDscUf">
                        <option value="">-- Selecione --</option>
                        <option value="1">AC</option>
                        <option value="2">AL</option>
                        <option value="3">AM</option>
                        <option value="4">AP</option>
                        <option value="5">BA</option>
                        <option value="6">CE</option>
                        <option value="7">DF</option>
                        <option value="8">ES</option>
                        <option value="9">GO</option>
                        <option value="10">MA</option>
                        <option value="11">MG</option>
                        <option value="12">MS</option>
                        <option value="13">MT</option>
                        <option value="14">PA</option>
                        <option value="15">PB</option>
                        <option value="16">PE</option>
                        <option value="17">PI</option>
                        <option value="18">PR</option>
                        <option value="19">RJ</option>
                        <option value="20">RN</option>
                        <option value="21">RO</option>
                        <option value="22">RR</option>
                        <option value="23">RS</option>
                        <option value="24">SC</option>
                        <option value="25">SE</option>
                        <option value="26">SP</option>
                        <option value="27">TO</option>
                      </select>
                    </div>

                    <div class="input select required">
                      <label for="cidade">Cidade</label>
                      <!--select name="data[Cliente][dsc_cidade]" id="cidade" ajax="true" url="edificacoes/getbairro/" destinoid="bairro" class="span3 live">
                              <option value="">-- Selecione um municÃ­pio --</option>
                      </select-->
                      <input name="data[Cliente][dsc_cidade]" type="text" upper="true" class="span4" maxlength="255" id="cidade" />
                    </div>

                    <div class="input select required">
                      <label for="bairro">Bairro</label>
                      <!--select name="data[Cliente][dsc_bairro]" id="bairro" class="span3 live">
                              <option value="">-- Selecione um bairro --</option>
                      </select-->
                      <input name="data[Cliente][dsc_bairro]" type="text" upper="true" class="span4" maxlength="255" id="bairro" />
                    </div>

                    <div class="input text required">
                      <label for="ClienteDscEndereco">Endereço</label>
                      <input name="data[Cliente][dsc_endereco]" type="text" upper="true" class="span4" maxlength="255" id="ClienteDscEndereco" />
                    </div>

                    <div class="input text required">
                      <label for="ClienteDscCompl">Complemento</label>
                      <input name="data[Cliente][dsc_compl]" type="text" upper="true" class="span4" maxlength="255" id="ClienteDscCompl" />
                    </div>

                    <div class="input text required">
                      <label for="ClienteDscNumero">Número</label>
                      <input name="data[Cliente][dsc_numero]" type="text" class="span1" maxlength="5" id="ClienteDscNumero" />
                    </div>

                    <div class="input text required">
                      <label for="ClienteNumCep">CEP</label>
                      <input name="data[Cliente][num_cep]" type="text" class="span2" mask="cep" maxlength="9" id="ClienteNumCep" />
                    </div>

                    <div class="input text required">
                      <label for="SenhaValida">Senha de 8 dígitos</label>
                      <input name="senha_valida" type="password" class="span2" mask="sen" maxlength="8" id="SenhaValida" />
                    </div>

                    <div class="input text required">
                      <label for="ConfirmaSenha">Confirma Senha</label>
                      <input name="confirma_senha" type="password" class="span2" mask="sen" maxlength="8" id="ConfirmaSenha" />
                    </div>
                  </fieldset>
                  <div class="form-actions">
                    <div class="submit">
                      <input class="btn btn-success" type="submit" value="Salvar" href="cliente.jsp"/>
                    </div>
                  </div>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>

      <div class="modal hide fade" id="modal-busca">
        <div class="modal-body">
          <div id="form-busca-content">
            Carregando...
          </div>
        </div>
        <div class="modal-footer">
          <a href="#" class="btn" data-dismiss="modal">Fechar</a>				
        </div>
      </div>	
      <a href="#" id="btn-scroll-up" class="btn btn-small btn-inverse">
        <i class="icon-double-angle-up icon-only"></i>
      </a>
      <div id="footer">
        <p class="muted credit" style="text-align: center">Corpo de Bombeiros Militar do Rio Grande do Norte - 2017
          <br/> Desenvolvido pela Galera do SAPS - PDS Web
        </p>
      </div>
    </div>

    <!-- Scripts -->
    <script type="text/javascript" src="./assets/js/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="./assets/js/jquery-migrate-1.0.0.min.js"></script>
    <script type="text/javascript" src="./assets/js/bootstrap.js"></script>
    <script type="text/javascript" src="./assets/js/jquery-ui-1.9.2.custom.min.js"></script>
    <script type="text/javascript" src="./assets/js/superfish.js"></script>
    <script type="text/javascript" src="./assets/js/jquery.tools.min.js"></script>
    <script type="text/javascript" src="./assets/js/expand.js"></script>
    <script type="text/javascript" src="./assets/js/mask.js"></script>
    <script type="text/javascript" src="./assets/js/mask_valor.js"></script>
    <script type="text/javascript" src="./assets/js/mascaras.js"></script>
    <script type="text/javascript" src="./assets/js/colorbox.js"></script>
    <script type="text/javascript" src="./assets/js/cleditor.min.js"></script>
    <script type="text/javascript" src="./assets/js/select2.full.min.js"></script>
    <script type="text/javascript" src="./assets/js/gatilhos.js"></script>
    <script type="text/javascript" src="./assets/js/jquery.gmap.js"></script>
    <script type="text/javascript" src="./assets/js/custom.js"></script>
    <script type="text/javascript" src="./assets/js/jquery.flot.min.js"></script>
    <script type="text/javascript" src="./assets/js/jquery.flot.resize.min.js"></script>
    <script type="text/javascript" src="./assets/js/jquery.flot.pie.min.js"></script>
    <script type="text/javascript" src="./assets/js/jquery.ui.touch-punch.min.js"></script>
    <script type="text/javascript" src="./assets/js/jquery.slimscroll.min.js"></script>
    <script type="text/javascript" src="./assets/js/jquery.easy-pie-chart.min.js"></script>
    <script type="text/javascript" src="./assets/js/jquery.sparkline.min.js"></script>
    <script type="text/javascript" src="./assets/js/ace-elements.min.js"></script>
    <script type="text/javascript" src="./assets/js/ace.min.js"></script>
    <script type="text/javascript" src="./assets/js/jquery-ui-1.10.2.custom.min.js"></script>
    <script type="text/javascript">
      $("#crea_cau").hide();
      $("#crea_cau_uf").hide();
      $("#ClientePro").change(function () {
        var op = $("#ClientePro option:selected").val();
        if (op == 1) {
          $("#crea_cau").hide();
          $("#crea_cau_uf").hide();
        } else {
          $("#crea_cau").show();
          $("#crea_cau_uf").show();
        }
      });
    </script>

  </body>
</html>
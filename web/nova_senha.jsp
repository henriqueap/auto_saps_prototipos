<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title> SAPS - Sistema de Acompanhamento de Projetos de Seguran&ccedil;a Clientes </title>
    <!-- CSS -->
    <link href="favicon.ico" type="image/x-icon" rel="icon" />
    <link href="favicon.ico" type="image/x-icon" rel="shortcut icon" />
    <link rel="stylesheet" type="text/css" href="./assets/css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="./assets/css/bootstrap-responsive.min.css" />
    <link rel="stylesheet" type="text/css" href="./assets/css/font-awesome.min.css" />
    <!--[if IE 7]>
      <link rel="stylesheet" type="text/css" href="./assets/css/font-awesome-ie7.min.css" />
    <![endif]-->
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
    <!--[if lt IE 9]>
      <link rel="stylesheet" type="text/css" href="./assets/css/ace-ie.min.css" />
    <![endif]-->
  </head>
  <body>

    <div class="container-fluid" id="main-container">
      <div id="main-content" style="margin-left: auto; margin-right: auto; width: 60%;" class="clearfix">
        <div id="page-content" class="clearfix">
          <div id="page-header" class="position-relative">
            <h1 class="page-header">
              Minha Senha<small><i class="icon-double-angle-right"></i>Alterar</small>       
            </h1>
          </div><!--/#page-header-->

          <div class="widget-box">
            <div class="widget-header">
              <h5>Alterar Senha</h5>
            </div>

            <div class="widget-body">
              <div class="widget-main">
                <div class="clientes form">
                  <form action="cliente.jsp" id="ClienteEditForm" method="post" accept-charset="utf-8">
                    <div style="display:none;">
                      <input type="hidden" name="_method" value="POST" />
                    </div>

                    <fieldset>
                      <div class="input text required">
                        <label for="senha_atual">Senha Atual</label>
                        <input name="senha_atual" type="password" class="span2" mask="sen" maxlength="8" id="senha_atual" />
                      </div>
                      <div class="input text required">
                        <label for="nova_senha">Nova Senha</label>
                        <input name="nova_senha" type="password" class="span2" mask="sen" maxlength="8" id="nova_senha" />
                      </div>
                      <div class="input text required">
                        <label for="confirma_senha">Confirma Senha</label>
                        <input name="confirma_senha" type="password" class="span2" mask="sen" maxlength="8" id="confirma_senha" />
                      </div>
                      <div class="form-actions">
                        <div class="submit"><input class="btn btn-success" type="submit" value="Enviar"/></div>
                      </div>
                    </fieldset>			
                  </form>

                </div>
              </div>
            </div><!--/widget-body-->
          </div><!--/.widget-box-->

          <!-- Modal -->
          <div class="modal hide fade" id="modal-busca">
            <div class="modal-body">
              <div id="form-busca-content">
                Carregando...
              </div>
            </div>
            <div class="modal-footer">
              <a href="#" class="btn" data-dismiss="modal">Fechar</a>				
            </div>
          </div><!--/#modal-busca-->

          <a href="#" id="btn-scroll-up" class="btn btn-small btn-inverse">
            <i class="icon-double-angle-up icon-only"></i>
          </a>
        </div><!--/.page-content-->
      </div><!--/#main-content-->
    </div><!--/#main-container-->

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
    <!--[if lt IE 9]>
            <script type="text/javascript" src="./assets/js/excanvas.min.js"></script>
    <![endif]-->

    <script type="text/javascript">
      $(document).ready(function () {
        $('ul.sf-menu').superfish();
        $("ul.tabs").tabs("div.panes > div.panes");
        $('#loading').hide();

        $('#loading').ajaxStart(function () {
          $(this).show();
        });

        $('#loading').ajaxStop(function () {
          $(this).hide();
        });

        $("#calcular").click(function () {
          if ($("#area").val() == '')
          {
            alert('Digite a áera para calcular valor.');
            return false;
          }

          if ($("#area").val() <= 100)
          {
            if ($("#tipo").val() == 1) {
              //valor_m2 = 0.25;
              /*var valor = $("#area").val() * 0.15 //Residencial
               if (valor < 15)
               {
               valor = 15;
               }*/
              valor = 25;
            } else if ($("#tipo").val() == 2) {
              /*var valor = $("#area").val() * 0.23 //Industrial
               if (valor < 23)
               {
               valor = 23;
               }*/
              valor = 40;
            } else {
              /*var valor = $("#area").val() * 0.19 //Variados
               if (valor < 19)
               {
               valor = 19;
               }*/
              valor = 30;
            }
          } else {
            if ($("#tipo").val() == 1) {
              //valor_m2 = 0.15;
              var valor = $("#area").val() * 0.30
              if (valor < 17)
              {
                valor = 17;
              }
              //valor = 30;
            } else if ($("#tipo").val() == 2) {
              var valor = $("#area").val() * 0.45
              if (valor < 25)
              {
                valor = 25;
              }
              //valor = 45;
            } else {
              var valor = $("#area").val() * 0.35
              if (valor < 21)
              {
                valor = 21;
              }
              //valor = 35;
            }
          }

          $("#resposta").val(valor)
        });
      });
    </script>

  </body>
</html>
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title> SAPS - Sistema de Acompanhamento de Projetos de Seguran&ccedil;a - Redefinir Senha </title>
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
        </div>
      </div>
    </div>

    <div class="container-fluid" id="main-container">
      <div id="main-content" style="margin-left: auto; margin-right: auto; width: 60%;" class="clearfix">
        <div id="page-content" class="clearfix">
          <div id="page-header" class="position-relative">
            <h1 class="page-header">
              Esqueceu sua senha?<small><i class="icon-double-angle-right"></i>Redefina</small>       
            </h1>
          </div><!--/page-header-->

          <div class="widget-box">
            <div class="widget-header">
              <h5>Redefinição</h5>
            </div>

            <div class="widget-body">
              <div class="widget-main">
                <div class="clientes form">
                  <form action="/serten/clientes/edit" id="ClienteEditForm" method="post" accept-charset="utf-8">
                    <div style="display:none;">
                      <input type="hidden" name="_method" value="POST" />
                    </div>

                    <fieldset>
                      <div class="input text required">
                        <h5>Insira o Email cadastrado:</h5>
                        <label for="ClienteDscEmail">Email</label>
                        <input name="data[Cliente][dsc_email]" type="text" class="span4" maxlength="100" id="ClienteDscEmail"/>
                      </div>
                    </fieldset>

                    <div class="form-actions">
                      <div class="submit">
                         <input class="btn btn-success" type="submit" value="Enviar"/>
                      </div>
                    </div>			
                  </form>

                </div>
              </div>
            </div><!--/widget-body-->
          </div><!--/widget-box-->
          <div class="modal hide fade" id="modal-busca">
            <div class="modal-body">
              <div id="form-busca-content">
                Carregando...
              </div>
            </div>

            <div class="modal-footer">
              <a href="#" class="btn" data-dismiss="modal">Fechar</a>				
            </div>
          </div><!--/modal-busca-->

          <a href="#" id="btn-scroll-up" class="btn btn-small btn-inverse">
            <i class="icon-double-angle-up icon-only"></i>
          </a>
        </div><!--/page-content-->
      </div><!--/main-content-->
    </div><!--/main-container-->

    <div id="footer">
      <p class="muted credit" style="text-align: center"> Corpo de Bombeiros Militar do Rio Grande do Norte - 2017 <br>Desenvolvido por CTIInf - CBMAL</p>
    </div>
  </body>
</html>
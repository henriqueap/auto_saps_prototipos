<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
      <title> SAPS - Sistema de Acompanhamento de Projetos de Seguran&ccedil;a - Acesso	</title>
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
      <!--[if lt IE 9]>
        <link rel="stylesheet" type="text/css" href="./assets/css/ace-ie.min.css" />
      <![endif]-->
  </head>
  <body>	
    <div class="navbar navbar-inverse">
      <div class="navbar-inner">
        <div style="height: 0px;text-align: center; margin-top: 2px">
          <div id="loading"></div>
        </div>	 
        <div class="container-fluid">
            <a class="brand" href="#">
              <small style="font-weight: bolder">Sistema de Acompanhamento de Projetos de Seguran&ccedil;a - SAPS</small>
            </a>
        </div><!--/.container-fluid-->
      </div><!--/.navbar-inner-->
    </div><!--/.navbar-->

    <div class="container-fluid" id="main-container">
      <div id="main-content" style="margin-left: auto; margin-right: auto" class="clearfix">                                   
        <div class="row-fluid">
          <div class="span4 offset4" style="margin-top: 20px; padding: 20px">                               

            <!-- Feedback para o usuário -->
            <%
              if (request.getParameter("message") != null) {
                out.print("<div class='alert alert-" + request.getParameter("type") + "' role='alert'>");
                out.print(request.getParameter("message"));
                out.print("</div>");
              }
            %>

            <div id="login" class="box" style="padding-left: 10px; padding-right: 10px; padding-bottom: 10px">
              <form action="auth" id="UsuarioLoginForm" method="post" accept-charset="utf-8">
                  <div id="page-header" class="position-relative" style="margin-bottom: 20px">
                    <h1 class="page-header">
                      Login do Usuário <small><i class="icon-double-angle-right"></i> Infome matrícula e senha</small>
                    </h1>
                  </div><!--/page-header-->
                  <div class="input text">
                    <label for="UsuarioMatricula">Matrícula</label>
                    <input name="matricula" type="text" mask="matricula" id="UsuarioMatricula" />
                  </div>
                  <div class="input password">
                    <label for="UsuarioSenha">Senha</label>
                    <input type="password" name="senha" id="UsuarioSenha" />
                  </div>
                  <div class="submit">
                    <input class="btn btn-success" type="submit" value="Autenticar" />
                  </div>
                  <div class="form-row">
                    <br />
                    <a href="redefinicao.jsp">Esqueceu sua senha?</a>&nbsp;&nbsp;<br/>
                    <a href="cadastro.jsp" >Fazer cadastro</a>&nbsp;&nbsp;
                  </div>
                </form>
            </div>

          </div>
        </div>
      </div><!-- #main-content -->
    </div><!--/.fluid-container#main-container-->

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
    </div><!--/.modal-->

    <a href="#" id="btn-scroll-up" class="btn btn-small btn-inverse">
      <i class="icon-double-angle-up icon-only"></i>
    </a>

    <div id="footer">
      <p class="muted credit" style="text-align: center">
        Corpo de Bombeiros Militar do Rio Grande do Norte - 2017 <br> Desenvolvido por CTIInf - CBMAL
      </p>
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
    <script type="text/javascript" src="./assets/js/gatilhos.js"></script>
    <script type="text/javascript" src="./assets/js/jquery.gmap.js"></script>
    <script type="text/javascript" src="./assets/js/custom.js"></script>
    <script type="text/javascript" src="./assets/js/ace-elements.min.js"></script>
    <script type="text/javascript" src="./assets/js/ace.min.js"></script>
    <!--[if lt IE 9]>
        <script type="text/javascript" src="./assets/js/excanvas.min.js"></script>
    <![endif]-->
    <script type="text/javascript">
      $(document).ready(function()	{
        $('ul.sf-menu').superfish();
        $("ul.tabs").tabs("div.panes > div.panes");
        $('#loading').hide();

        $('#loading').ajaxStart(function() {
          $(this).show();	
        });

        $('#loading').ajaxStop(function(){
          $(this).hide();	
        });	
      });
    </script>

  </body>
</html>
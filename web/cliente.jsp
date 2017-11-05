<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title> SAPS - Sistema de Acompanhamento de Projetos de Seguran&ccedil;a Clientes </title>
    <!-- Icons -->
    <link href="favicon.ico" type="image/x-icon" rel="icon" />
    <link href="favicon.ico" type="image/x-icon" rel="shortcut icon" />
    <!-- CSS -->
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
    <!-- Controle de Acesso -->
    <%@ page import="java.util.*" %>
    <%@ page import="javax.servlet.http.HttpSession" %>
    <%@ page errorPage="sem_acesso.jsp"%>
    <%
      HttpSession sessao = request.getSession();
      String logd = (String) sessao.getAttribute("logado");
      if (!(logd.equals("true"))) {
        response.sendRedirect("login.jsp?type=danger&&message=Acesso Negado! Você não está conectado.");
      }
    %>

    <div class="navbar navbar-inverse">
      <div class="navbar-inner">
        <!-- <div style="height: 0px;text-align: center; margin-top: 2px">
          <div id="loading"></div>
        </div> -->
        <div class="container-fluid">
          <table>
            <tr>
              <td>
                <img src="http://www2.defesasocial.rn.gov.br/cbmrn/cbdocs/cbmrn.png" width="80" height="80" />
              </td>
              <td>
                <font class="brand" >Sistema de Acompanhamento de Projetos de Seguran&ccedil;a - SAPS</font>
              </td>
              <td>
                <font color='#FFFFFF'>Calculadora de Cobrança:</font>
                <br />
                <font color='#FFFFFF'>Área (m2): </font>
                <input type='text' id='area' class='span1' mask='decimal' />
                <br />
                <select id='tipo' class='span2'>
                  <!-- <option>Escolha o tipo:</option> -->
                  <option value='1'>Residencial</option>
                  <option value='2'>Industrial</option>
                  <option value='3'>Variados</option>
                </select>
                <input type='button' id='calcular' value='Calcular'/>
                <font color='#FFFFFF'>(R$): </font>
                <input type='text' id='resposta' class='span1'/>
              </td>
              <td>
                <div class="container-fluid pull-right" style="margin-top: 35px">
                  <ul class="nav ace-nav pull-right">
                    <li class="light-blue user-profile">
                      <a class="user-menu dropdown-toggle" href="#" data-toggle="dropdown">
                        <span > Cb Pereira </span>
                        <i class="icon-caret-down"></i>
                      </a>
                      <ul id="user_menu" class="pull-right dropdown-menu dropdown-yellow dropdown-caret dropdown-closer">
                        <li><a href="/serten/usuarios/logout" ><i class="icon-off"></i> Logout</a></li>
                      </ul>
                    </li>
                  </ul><!--/.ace-nav-->
                  <form class="form-inline pull-right" method="POST" action="/serten/projetos/view">
                    <input type="text" name="id" class="input-small" placeholder="Num. do Processo"/>
                    <input type="submit" class="btn btn-mini btn-success"/>
                  </form>
                </div>
              </td>
            </tr>
          </table>

          <!-- Form Enviar Torpedo  -->
          <!--div class="btn-group pull-right" style="margin-right: 8px">
            <img src="<?//= $iconChat;?>" alt="ChatBm" title="ChatBm" />
          </div-->
        </div><!--/.container-fluid-->
      </div><!--/.navbar-inner-->
    </div><!--/.navbar-->

    <div class="container-fluid" id="main-container">
      <a href="#" id="menu-toggler"><span></span></a><!-- menu toggler -->
      <div id="sidebar">
        <div id="sidebar-shortcuts">
          <div id="sidebar-shortcuts-large">
            <a class="btn btn-small btn-warning" title="Meus dados" href="cadastro.jsp">
              <i class="icon-group"></i>
            </a>
            <a class="btn btn-small btn-success" title="Nova EdificaÃ§Ã£o" href="edificacao.jsp">
              <i class="icon-home"></i>
            </a>
            <a class="btn btn-small btn-danger" title="Meus Projetos" href="#">
              <i class="icon-fire-extinguisher"></i>
            </a>
            <a class="btn btn-small btn-info" title="Perguntas e Respostas" target="_blank" href="#">
              <i class="icon-info-sign"></i>
            </a>
          </div>
          <div id="sidebar-shortcuts-mini">
            <span class="btn btn-warning"></span>
            <span class="btn btn-success" ></span>
            <span class="btn btn-danger"></span>
            <span class="btn btn-info"></span>
          </div>
        </div><!-- #sidebar-shortcuts -->
        <ul class="nav nav-list">
          <li class="active">
            <a href="cliente.jsp">
              <i class="icon-dashboard"></i>
              <span>Início</span>
            </a>
          </li>
          <li>
            <a href="cliente.jsp" class="dropdown-toggle" >
              <i class="icon-group"></i>
              <span>Clientes</span>
              <b class="arrow icon-angle-down"></b>
            </a>
            <ul class="submenu">
              <!--li><a href="/serten/clientes/add">Novo</a></li-->
              <li><a href="#">Alterar meus dados</a></li>
              <li><a href="nova_senha.jsp">Alterar minha senha</a></li>
            </ul>
          </li>
          <!--li>
          <a href="#" class="dropdown-toggle" >
          <i class="icon-eject"></i>
          <span>Despachantes</span>
          <b class="arrow icon-angle-down"></b>
          </a>
          <ul class="submenu">

          <li><a href="/serten/despachantes/add">Novo</a></li>
          <li><a href="/serten/despachantes">Consultar</a></li>
          </ul>
          </li-->
          <li>
            <a href="#" class="dropdown-toggle" >
              <i class="icon-user-md"></i>
              <span>Profissionais</span>
              <b class="arrow icon-angle-down"></b>
            </a>
            <ul class="submenu">
              <li><a href="profissional.jsp">Novo</a></li>
              <li><a href="#">Consultar</a></li>
            </ul>
          </li>
          <li>
            <a href="#" class="dropdown-toggle" >
              <i class="icon-home"></i>
              <span>Edificação/Evento</span>
              <b class="arrow icon-angle-down"></b>
            </a>
            <ul class="submenu">
              <li><a href="edificacao.jsp">Nova</a></li>
              <li><a href="#">Consultar</a></li>
            </ul>
          </li>
          <li>
            <a href="#" class="dropdown-toggle" >
              <i class="icon-fire-extinguisher"></i>
              <span>Processos</span>
              <b class="arrow icon-angle-down"></b>
            </a>
            <ul class="submenu">
              <!--li> <a href="/serten/projetos/tramitar_lote">Tramitar Lote</a></li-->
              <li> <a href="#">Acompanhar Processos</a></li>
              <!--li> <a href="/serten/projetos/areceber_distribuicao">A Receber DistribuiÃ§Ã£o</a></li>
              <li> <a href="/serten/projetos/areceber_lote">Receber Lote</a></li-->
              <!--li> <a href="#">Cadastrar</a></li-->
              <!--li> <a href="#">Consultar</a></li-->
              <li><a href="novo_processo.jsp">Novo Processo</a> </li>
              <li> <a href="#">FAQ</a></li>
              <!--li> <a href="/serten/pareceres/homologar">Homologar AAT</a></li>
              <li> <a href="/serten/projetos/vistar">Vistar AVCB ou CAVL</a></li>
              <li> <a href="/serten/projetos/homologar">Homologar AVCB</a></li>
              <li> <a href="/serten/projetos/homologar_cavl">Homologar CAVL</a></li>
              <li> <a href="/serten/projetos/aprovar_clcb">Aprovar CLCB</a></li>
              <li> <a href="/serten/projetos/homologar_clcb">Homologar CLCB</a></li-->
            </ul>
          </li>
          <!--li>
                  <a href="#" class="dropdown-toggle" >
                          <i class="icon-cogs"></i>
                          <span>Operar</span>
                          <b class="arrow icon-angle-down"></b>
                  </a>
                  <ul class="submenu">
                          <li><a href="/serten/analises">AnÃ¡lises</a></li>

                          <li><a href="/serten/vistorias">Vistorias</a></li>

                          <li><a href="/serten/vistorias/distribuicoes">Vistorias DistribuÃ­das</a></li>

                          <li><a href="/serten/cartas">Cartas</a></li>
                  </ul>
          </li>
          <li>
                  <a href="#" class="dropdown-toggle" >
                          <i class="icon-screenshot"></i>
                          <span>FiscalizaÃ§Ã£o</span>
                          <b class="arrow icon-angle-down"></b>
                  </a>
                  <ul class="submenu">
                          <li><a href="/serten/fiscalizacoes/add">Registrar</a></li>
                          <li><a href="/serten/fiscalizacoes">Consultar</a></li>
                          <li><a href="/serten/fiscalizacoes/relatorio">RelatÃ³rio</a></li>
                          <li><a href="/serten/fiscalizacoes/mapa">Mapa</a></li>
                  </ul>
          </li-->
          <!--li>
                  <a href="#" class="dropdown-toggle" >
                          <i class="icon-calendar"></i>
                          <span>Agendamento</span>
                          <b class="arrow icon-angle-down"></b>
                  </a>
                  <ul class="submenu">
                          <li><a href="/serten/agendamentos">Agendamento do dia</a></li>
                          <li><a href="/serten/agendamentos/busca">Agendamento por data</a></li>
                  </ul>
          </li-->
          <!--li>
                  <a href="#" class="dropdown-toggle" >
                          <i class="icon-bar-chart"></i>
                          <span>GestÃ£o</span>
                          <b class="arrow icon-angle-down"></b>
                  </a>
                  <ul class="submenu">
                          <li><a href="/serten/gestao/arrecadacao">ArrecadaÃ§Ã£o</a></li
                          <li><a href="/serten/gestao/auditoria">Auditoria</a></li>
                          <li><a href="/serten/gestao/indicadores">Indicadores</a></li>
                  </ul>
          </li>
          <li>
                  <a href="#" class="dropdown-toggle" >
                          <i class="icon-briefcase"></i>
                          <span>AdministraÃ§Ã£o</span>
                          <b class="arrow icon-angle-down"></b>
                  </a>
                  <ul class="submenu">
                          <li> <a href="/serten/usuarios">UsuÃ¡rios</a></li>
                          <li> <a href="/serten/admin/acl">PermissÃµes</a></li>
                          <li> <a href="/serten/boletos/consultadar">Consulta DAR</a></li>
                          <li> <a href="/serten/boletos/compensaunitario">Compensar Boleto</a></li>
                          <li> <a href="/serten/boletos/isentaboleto">Isentar Boleto</a></li>
                          <li> <a href="/serten/arquivos/retorno">Enviar Retorno</a></li>
                          <li> <a href="/serten/arquivos">Listar Retornos</a></li>
                          <li> <a href="/#">FAQ</a></li>
                          <li> <a href="/serten/avisos">Avisos</a></li>
                  </ul>
          </li-->
        </ul><!--/.nav-list-->
        <div id="sidebar-collapse"><i class="icon-double-angle-left"></i></div>
      </div><!--/#sidebar-->
      <div id="main-content" class="clearfix">
        <div id="page-content" class="clearfix">
          <div id="page-header" class="position-relative">
            <h1 class="page-header">Cliente <small><i class="icon-double-angle-right"></i> Edifício</small>
            </h1>
          </div><!--/page-header-->

          <div class="toolbar">
            <div class="btn-group">
              <a class="btn btn-mini dropdown-toggle" data-toggle="dropdown" href="#">
                Ações <span class="caret"></span>
              </a>
              <ul class="dropdown-menu">
                <!--li><a href="/serten/clientes/delete" onclick="return confirm(&#039;VocÃª tem certeza que deseja excluir o id #?&#039;);">Excluir</a></li-->
                <!--li><a href="/serten/clientes">Listar Clientes</a></li-->
                <!--li><a href="/serten/ramo_atividades/add">Novo Ramo Atividade</a> </li-->
                <li><a href="#">Listar Profissionais</a> </li>
                <li><a href="profissional.jsp">Novo Profissional</a> </li>
                <li><a href="#">Listar Edificações</a> </li>
                <li><a href="edificacao.jsp">Nova Edificação</a> </li>
                <li><a href="#">Acompanhar Processos</a> </li>
                <li><a href="novo_processo.jsp">Novo Processo</a> </li>
              </ul>
            </div>
          </div>
          <div class="widget-box">
            <div class="widget-header">
              <h5>Meus Dados</h5>
            </div>
            <div class="widget-body">
              <div class="widget-main">
                <div class="clientes form">
                  <form action="/serten/clientes/edit" id="ClienteEditForm" method="post" accept-charset="utf-8">
                    <div style="display:none;">
                      <input type="hidden" name="_method" value="POST" />
                    </div>
                    <fieldset>
                      <input type="hidden" name="data[Cliente][cod_cliente]" id="ClienteCodCliente" />
                      <div class="input text required">
                        <label for="ClienteDscNomefantasia">Nome Fantasia/Nome Completo Profissional</label>
                        <input name="data[Cliente][dsc_nomefantasia]" type="text" upper="true" class="span4" maxlength="255" id="ClienteDscNomefantasia" />
                      </div>
                      <div class="input text required">
                        <label for="ClienteDscRazaosocial">Razão Social/Nome Completo Profissional</label>
                        <input name="data[Cliente][dsc_razaosocial]" type="text" upper="true" class="span4" maxlength="255" id="ClienteDscRazaosocial" />
                      </div>
                      <div class="input text">
                        <label for="ClienteNumInscricaoestadual">Insc. Estadual</label>
                        <input name="data[Cliente][num_inscricaoestadual]" type="text" class="span2" maxlength="10" id="ClienteNumInscricaoestadual" />
                      </div>
                      <div class="input text required">
                        <label for="ClienteNumCnpj">CNPJ/CPF</label>
                        <input name="data[Cliente][num_cnpj]" type="text" class="span2" maxlength="14" id="ClienteNumCnpj" />
                      </div>
                      <div class="input text required">
                        <label for="ClienteNumCep">CEP</label>
                        <input name="data[Cliente][num_cep]" type="text" class="span2" mask="cep" maxlength="9" id="ClienteNumCep" />
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
                        <select name="data[Cliente][dsc_cidade]" id="cidade" ajax="true" url="edificacoes/getbairro/" destinoid="bairro" class="span3 live">
                          <option value="">-- Selecione um município --</option>
                        </select>
                      </div>
                      <div class="input select required">
                        <label for="bairro">Bairro</label>
                        <select name="data[Cliente][dsc_bairro]" id="bairro" class="span3 live">
                          <option value="">-- Selecione um bairro --</option>
                        </select>
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
                        <label for="ClienteDscReferencia">Pt. Referência</label>
                        <input name="data[Cliente][dsc_referencia]" type="text" upper="true" class="span4" maxlength="500" id="ClienteDscReferencia" />
                      </div>
                      <div class="input text required">
                        <label for="ClienteNumFone1">Fone 1 - DDD</label>
                        <input name="data[Cliente][num_fone1]" type="text" class="span2" mask="telefone" maxlength="15" id="ClienteNumFone1" />
                      </div>
                      <div class="input text">
                        <label for="ClienteNumFone2">Fone 2 - DDD</label>
                        <input name="data[Cliente][num_fone2]" type="text" class="span2" mask="telefone" maxlength="15" id="ClienteNumFone2" />
                      </div>
                      <div class="input text required">
                        <label for="ClienteDscEmail">Email</label>
                        <input name="data[Cliente][dsc_email]" type="text" class="span4" maxlength="100" id="ClienteDscEmail" />
                      </div>
                      <div class="input text">
                        <label for="ClienteDscNomeRep">Nome Representante</label>
                        <input name="data[Cliente][dsc_nome_rep]" type="text" upper="true" class="span4" maxlength="255" id="ClienteDscNomeRep" />
                      </div>
                      <div class="input text">
                        <label for="ClienteNumCpfRep">CPF Representante</label>
                        <input name="data[Cliente][num_cpf_rep]" type="text" class="span2" mask="cpf" maxlength="11" id="ClienteNumCpfRep" />
                      </div>
                      <div class="input text required">
                        <label for="ClienteNomContatoRep">Contato na Empresa</label>
                        <input name="data[Cliente][nom_contato_rep]" type="text" upper="true" class="span2" maxlength="255" id="ClienteNomContatoRep" />
                      </div>
                      <div class="input text required">
                        <label for="ClienteNumFoneRep">Fone do Contato - DDD</label>
                        <input name="data[Cliente][num_fone_rep]" type="text" class="span2" mask="telefone" maxlength="15" id="ClienteNumFoneRep" />
                      </div>
                      <div class="input text required">
                        <label for="ClienteDscEmailRep">Email do Contato</label>
                        <input name="data[Cliente][dsc_email_rep]" type="text" class="span4" maxlength="100" id="ClienteDscEmailRep" />
                      </div>
                    </fieldset>
                    <div class="form-actions">
                      <div class="submit">
                        <input class="btn btn-success" type="submit" value="Salvar" />
                      </div>
                  </form>
                </div>
              </div>
            </div>
          </div><!--./widget-box-->
        </div><!--./page-content-->
      </div><!-- #main-content -->
    </div><!--/.#main-container-->

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
    </div>

    <a href="#" id="btn-scroll-up" class="btn btn-small btn-inverse">
      <i class="icon-double-angle-up icon-only"></i>
    </a>

    <div id="footer">
      <p class="muted credit" style="text-align: center">
        Corpo de Bombeiros Militar do Rio Grande do Norte - 2017 <br /> Desenvolvido por CTIInf - CBMAL
      </p>
    </div>

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
            alert('Digite a área para calcular valor.');
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
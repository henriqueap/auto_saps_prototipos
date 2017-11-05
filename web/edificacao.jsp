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
        <div id="loading">					</div>
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
                <font color='#FFFFFF'>Calculadora de Cobrança:</font><br>
                <font color='#FFFFFF'>Área (m2): </font><input type='text' id='area' class='span1' mask='decimal'><br>
                <select id='tipo' class='span2'>
                  <!-- <option>Escolha o tipo:</option> -->
                  <option value='1'>Residencial</option>
                  <option value='2'>Industrial</option>
                  <option value='3'>Variados</option>
                </select>
                <input type='button' id='calcular' value='Calcular'>
                <font color='#FFFFFF'>(R$): </font><input type='text' id='resposta' class='span1'>
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
                      <input type="text" name="id" class="input-small" placeholder="Nº do Processo" />
                      <input type="submit" class="btn btn-mini btn-success">
                    </form>
                  </div>
                </td>
            </tr>
          </table>
          <!--div class="btn-group pull-right" ><!-- Form Enviar Torpedo	-->
          <!--/div>

          <div class="btn-group pull-right" style="margin-right: 8px"><!-- Form Enviar Torpedo  -->
            <!--img src="<?//= $iconChat;?>" alt="ChatBm" title="ChatBm"/>\
          </div-->
        </div><!--/.container-fluid-->
      </div><!--/.navbar-inner-->
    </div><!--/.navbar-->

    <div class="container-fluid" id="main-container">
      <a href="#" id="menu-toggler"><span></span></a><!-- menu toggler -->
      <div id="sidebar">
        <div id="sidebar-shortcuts">
          <div id="sidebar-shortcuts-large">
            <a class="btn btn-small btn-warning" title="Meus dados" href="cliente.jsp">
              <i class="icon-group"></i>
            </a>
            <a class="btn btn-small btn-success" title="Nova Edificação" href="edificacao.jsp">
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
              <li><a href="cliente.jsp">Alterar meus dados</a></li>
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
              <li><a href="profisional.jsp">Novo</a></li>
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
              <li><a href="#">Nova</a></li>
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
              <!--li> <a href="/serten/projetos/areceber_distribuicao">A Receber Distribuição</a></li>
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
              <li><a href="/serten/analises">Análises</a></li>

              <li><a href="/serten/vistorias">Vistorias</a></li>

              <li><a href="/serten/vistorias/distribuicoes">Vistorias Distribuídas</a></li>

              <li><a href="/serten/cartas">Cartas</a></li>
            </ul>
          </li>
          <li>
            <a href="#" class="dropdown-toggle" >
              <i class="icon-screenshot"></i>
              <span>Fiscalização</span>
              <b class="arrow icon-angle-down"></b>
            </a>
            <ul class="submenu">
              <li><a href="/serten/fiscalizacoes/add">Registrar</a></li>
              <li><a href="/serten/fiscalizacoes">Consultar</a></li>
              <li><a href="/serten/fiscalizacoes/relatorio">Relatório</a></li>
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
              <span>Gestão</span>
              <b class="arrow icon-angle-down"></b>
            </a>
            <ul class="submenu">
              <li><a href="/serten/gestao/arrecadacao">Arrecadação</a></li
              <li><a href="/serten/gestao/auditoria">Auditoria</a></li>
              <li><a href="/serten/gestao/indicadores">Indicadores</a></li>
            </ul>
          </li>
          <li>
            <a href="#" class="dropdown-toggle" >
              <i class="icon-briefcase"></i>
              <span>Administração</span>
              <b class="arrow icon-angle-down"></b>
            </a>
            <ul class="submenu">
              <li> <a href="/serten/usuarios">Usuários</a></li>
              <li> <a href="/serten/admin/acl">Permissões</a></li>
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
            <h1 class="page-header">Edificação <small><i class="icon-double-angle-right"></i> Cadastrar</small>
            </h1>
          </div><!--/.page-header-->

          <div class="toolbar">
            <div class="btn-group">
              <a class="btn btn-mini dropdown-toggle" data-toggle="dropdown" href="#">
                Ações <span class="caret"></span>
              </a>
              <ul class="dropdown-menu">
                <!--li><a href="/serten/clientes/delete" onclick="return confirm(&#039;Você tem certeza que deseja excluir o id #?&#039;);">Excluir</a></li-->
                <!--li><a href="/serten/clientes">Listar Clientes</a></li-->
                <!--li><a href="/serten/ramo_atividades/add">Novo Ramo Atividade</a> </li-->
                <li><a href="#">Listar Profissionais</a> </li>
                <li><a href="#">Novo Profissional</a> </li>
                <li><a href="#">Listar Edificações</a> </li>
                <li><a href="#">Nova Edificação</a> </li>
                <li><a href="#">Acompanhar Processos</a> </li>
                <li><a href="novo_processo.jsp">Novo Processo</a> </li>
              </ul>
            </div>
          </div><!--./.toolbar-->
          <div class="widget-box">
            <div class="widget-header">
              <h5>Meus Dados</h5>
            </div>
            <div class="widget-body">
              <div class="widget-main">
                <div class="edificacoes form">
                  <form action="/serten/edificacoes/add" id="EdificacaoAddForm" method="post" accept-charset="utf-8">

                    <div style="display:none;">
                      <input type="hidden" name="_method" value="POST" />
                    </div>

                    <fieldset>
                      <div id="alerta"></div>
                      <div id="fiscalizacao"></div>
                      <input type="hidden" name="data[Edificacao][cod_edificacao]" id="EdificacaoCodEdificacao" />
                      <div class="input select required">
                        <label for="EdificacaoCodCliente">Cliente</label>
                        <select name="data[Edificacao][cod_cliente]" ajax="true" class="span4 live" id="EdificacaoCodCliente">
                          <option value="">-- Selecione --</option>
                          <option value="1">TESTE CBMRN</option>
                          <option value="21">GILSON CANINDE DA SILVA</option>
                          <option value="22">TRASNPORTES NOVO NORDESTE</option>
                          <option value="41">ALEXANDRE DOS SANTOS</option>
                          <option value="42">RAINHA DO PASTEL</option>
                          <option value="61">FUNERARIA SÃO PEDRO</option>
                          <option value="62">PAULA BEATRIZ FRANCELINO ARAUJO GALVÃO</option>
                          <option value="63">SUPERMERCADO COSTA LTDA - ME</option>
                          <option value="64">FASERN FUNDAÇÃO COSERN DE PREVIDENCIA COMPLEMENTAR</option>
                          <option value="65">GBI</option>
                          <option value="66">EDIFICIO COMOERCIAL COM 8 PAVIMENTOS</option>
                          <option value="81">ALESSANDRA FRANCA MONTENEGRO</option>
                          <option value="82">POLICLÍNICA ANTÃ”NIA GONDIM</option>
                          <option value="101">LEANDRO GÁS</option>
                          <option value="102">WALECIA GALVÃO RODRIGUES</option>
                          <option value="103">DROGASIL (PRUD. MORAIS)</option>
                          <option value="104">KS ÁGUA E GÁS</option>
                          <option value="105">ATS DISTRIBUIDORA LTDA</option>
                          <option value="106">SANTOS E FIGUEIREDO LTDA - ME</option>
                          <option value="107">KAYONARA AUGUSTO NUNES</option>
                          <option value="108">PREFEITURA MUNICIPAL DE RIO DO FOGO</option>
                          <option value="109">PREFEITURA MUNICIPAL DE SÃO JOSÉ DE MIPIBU</option>
                          <option value="110">CPO NATAL CENTRO DE PÓS GRADUAÇÃO EM ODONTOLOGIA</option>
                        </select>
                      </div>
                      <div class="input text required">
                        <label for="EdificacaoDscNomefantasia">Nome Fantasia</label>
                        <input name="data[Edificacao][dsc_nomefantasia]" type="text" upper="true" class="span4" maxlength="200" id="EdificacaoDscNomefantasia" />
                      </div>
                      <div class="input text required">
                        <label for="EdificacaoDscRazaosocial">Razão Social</label>
                        <input name="data[Edificacao][dsc_razaosocial]" type="text" upper="true" class="span4" maxlength="200" id="EdificacaoDscRazaosocial" />
                      </div>
                      <div class="input text required">
                        <label for="EdificacaoNumCnpj">CNPJ/CPF</label>
                        <input name="data[Edificacao][num_cnpj]" type="text" class="span2" maxlength="14" id="EdificacaoNumCnpj" />
                      </div>
                      <div class="input select required">
                        <label for="EdificacaoCodClassificacao">Classificação</label>
                        <select name="data[Edificacao][cod_classificacao]" ajax="true" url="edificacoes/subclass/" destinoid="sub" class="span4 live" id="EdificacaoCodClassificacao">
                          <option value="">-- Selecione --</option>
                          <option value="02">RESIDENCIAL</option>
                          <option value="03">COMERCIAL</option>
                          <option value="04">MISTA</option>
                          <option value="05">PÚBLICA</option>
                          <option value="06">HOSPITALAR</option>
                          <option value="07">INDUSTRIAL</option>
                          <option value="08">GARAGEM</option>
                          <option value="10">REUNIÃO PÚBLICA</option>
                          <option value="12">USO ESPECIAL DIVERSOS</option>
                          <option value="01">OUTROS</option>
                        </select>
                      </div>
                      <div class="input select required">
                        <label for="sub">Sub Classificação</label>
                        <select name="data[Edificacao][cod_sub_classificacao]" id="sub" class="span4 live">
                          <option value="">Selecione uma classificação</option>
                        </select>
                      </div>
                      <div class="input text">
                        <label for="EdificacaoObs">Observação</label>
                        <input name="data[Edificacao][obs]" type="text" class="span4" id="EdificacaoObs" />
                      </div>
                      <div class="input text required">
                        <label for="EdificacaoDscEndereco">Endereço (Rua + Número)</label>
                        <input name="data[Edificacao][dsc_endereco]" type="text" upper="true" class="span4" maxlength="200" id="EdificacaoDscEndereco" />
                      </div>
                      <div id='adress-box'>
                        <div class="input text required">
                          <label for="EdificacaoNumCep">CEP</label>
                          <input name="data[Edificacao][num_cep]" type="text" id="EdificacaoNumCep" mask="cep" class="span2" maxlength="9" />
                        </div>
                        <div class="input select required">
                          <label for="cidade">Cidade do RN</label>
                          <select name="data[Edificacao][dsc_cidade]" id="cidade" ajax="true" url="edificacoes/getbairro/" destinoid="bairro" class="span3 live">
                            <option value="">-- Selecione um município --</option>
                            <option value="6942">Acari</option>
                            <option value="6944">Afonso Bezerra</option>
                            <option value="6945">Agua Nova</option>
                            <option value="6946">Alexandria</option>
                            <option value="6947">Almino Afonso</option>
                            <option value="6948">Alto do Rodrigues</option>
                            <option value="6949">Angicos</option>
                            <option value="6950">Antonio Martins</option>
                            <option value="6951">Apodi</option>
                            <option value="6952">Areia Branca</option>
                            <option value="6953">Ares</option>
                            <option value="6943">Assu</option>
                            <option value="6954">Baia Formosa</option>
                            <option value="6955">Barao de Serra Branca</option>
                            <option value="6956">Barauna</option>
                            <option value="6957">Barcelona</option>
                            <option value="6958">Belo Horizonte</option>
                            <option value="6959">Bento Fernandes</option>
                            <option value="6960">Boa Saude</option>
                            <option value="6961">Bodo</option>
                            <option value="6962">Bom Jesus</option>
                            <option value="6963">Brejinho</option>
                            <option value="6964">Caicara do Norte</option>
                            <option value="6965">Caicara do Rio do Vento</option>
                            <option value="6966">Caico</option>
                            <option value="6967">Campo Grande</option>
                            <option value="6968">Campo Redondo</option>
                            <option value="6969">Canguaretama</option>
                            <option value="6970">Caraubas</option>
                            <option value="6971">Carnauba dos Dantas</option>
                            <option value="6972">Carnaubais</option>
                            <option value="6973">Ceara-Mirim</option>
                            <option value="6974">Cerro Cora</option>
                            <option value="6975">Coronel Ezequiel</option>
                            <option value="6976">Coronel Joao Pessoa</option>
                            <option value="6977">Corrego de Sao Mateus</option>
                            <option value="6978">Cruzeta</option>
                            <option value="6979">Currais Novos</option>
                            <option value="6980">Doutor Severiano</option>
                            <option value="6981">Encanto</option>
                            <option value="6982">Equador</option>
                            <option value="6983">Espirito Santo</option>
                            <option value="6984">Espirito Santo do Oeste</option>
                            <option value="6985">Extremoz</option>
                            <option value="6986">Felipe Guerra</option>
                            <option value="6987">Fernando Pedroza</option>
                            <option value="6988">Firmamento</option>
                            <option value="6989">Florania</option>
                            <option value="6990">Francisco Dantas</option>
                            <option value="6991">Frutuoso Gomes</option>
                            <option value="6992">Galinhos</option>
                            <option value="6993">Gameleira</option>
                            <option value="6994">Goianinha</option>
                            <option value="6995">Governador Dix-sept Rosado</option>
                            <option value="6996">Grossos</option>
                            <option value="6997">Guamare</option>
                            <option value="6998">Ielmo Marinho</option>
                            <option value="6999">Igreja Nova</option>
                            <option value="7000">Ipanguacu</option>
                            <option value="7001">Ipiranga</option>
                            <option value="7002">Ipueira</option>
                            <option value="7003">Itaja</option>
                            <option value="7004">Itau</option>
                            <option value="7005">Jacana</option>
                            <option value="7006">Jandaira</option>
                            <option value="7007">Janduis</option>
                            <option value="7008">Japi</option>
                            <option value="7009">Jardim de Angicos</option>
                            <option value="7010">Jardim de Piranhas</option>
                            <option value="7011">Jardim do Serido</option>
                            <option value="7012">Joao Camara</option>
                            <option value="7013">Joao Dias</option>
                            <option value="7014">Jose da Penha</option>
                            <option value="7015">Jucurutu</option>
                            <option value="9718">Jundia</option>
                            <option value="7016">Jundia de Cima</option>
                            <option value="7017">Lagoa D&#039;anta</option>
                            <option value="7020">Lagoa Nova</option>
                            <option value="7021">Lagoa Salgada</option>
                            <option value="7018">Lagoa de Pedras</option>
                            <option value="7019">Lagoa de Velhos</option>
                            <option value="7022">Lajes</option>
                            <option value="7023">Lajes Pintadas</option>
                            <option value="7024">Lucrecia</option>
                            <option value="7025">Luis Gomes</option>
                            <option value="7026">Macaiba</option>
                            <option value="7027">Macau</option>
                            <option value="7028">Major Felipe</option>
                            <option value="7029">Major Sales</option>
                            <option value="7030">Marcelino Vieira</option>
                            <option value="7031">Martins</option>
                            <option value="7032">Mata de Sao Braz</option>
                            <option value="7033">Maxaranguape</option>
                            <option value="7034">Messias Targino</option>
                            <option value="7035">Montanhas</option>
                            <option value="7036">Monte Alegre</option>
                            <option value="7037">Monte das Gameleiras</option>
                            <option value="7038">Mossoro</option>
                            <option value="7039">Natal</option>
                            <option value="7040">Nisia Floresta</option>
                            <option value="7041">Nova Cruz</option>
                            <option value="7042">Olho-d&#039;agua Do Borges</option>
                            <option value="7043">Ouro Branco</option>
                            <option value="7044">Parana</option>
                            <option value="9717">Parau</option>
                            <option value="7045">Parazinho</option>
                            <option value="7046">Parelhas</option>
                            <option value="7047">Parnamirim</option>
                            <option value="7048">Passa E Fica</option>
                            <option value="7049">Passagem</option>
                            <option value="7050">Patu</option>
                            <option value="7051">Pau dos Ferros</option>
                            <option value="7052">Pedra Grande</option>
                            <option value="7053">Pedra Preta</option>
                            <option value="7054">Pedro Avelino</option>
                            <option value="7055">Pedro Velho</option>
                            <option value="7056">Pendencias</option>
                            <option value="7057">Piloes</option>
                            <option value="7058">Poco Branco</option>
                            <option value="7059">Portalegre</option>
                            <option value="7060">Porto do Mangue</option>
                            <option value="7061">Pureza</option>
                            <option value="7062">Rafael Fernandes</option>
                            <option value="7063">Rafael Godeiro</option>
                            <option value="7064">Riacho da Cruz</option>
                            <option value="7065">Riacho de Santana</option>
                            <option value="7066">Riachuelo</option>
                            <option value="7067">Rio do Fogo</option>
                            <option value="7068">Rodolfo Fernandes</option>
                            <option value="7069">Rosario</option>
                            <option value="7070">Ruy Barbosa</option>
                            <option value="7071">Salva Vida</option>
                            <option value="7072">Santa Cruz</option>
                            <option value="7073">Santa Fe</option>
                            <option value="7074">Santa Maria</option>
                            <option value="7075">Santa Teresa</option>
                            <option value="7076">Santana do Matos</option>
                            <option value="7077">Santana do Serido</option>
                            <option value="7078">Santo Antonio</option>
                            <option value="7079">Santo Antonio do Potengi</option>
                            <option value="7080">Sao Bento do Norte</option>
                            <option value="7081">Sao Bento do Trairi</option>
                            <option value="7082">Sao Bernardo</option>
                            <option value="7083">Sao Fernando</option>
                            <option value="7084">Sao Francisco do Oeste</option>
                            <option value="7085">Sao Geraldo</option>
                            <option value="7086">Sao Goncalo do Amarante</option>
                            <option value="7087">Sao Joao do Sabugi</option>
                            <option value="7088">Sao Jose da Passagem</option>
                            <option value="7089">Sao Jose de Mipibu</option>
                            <option value="7090">Sao Jose do Campestre</option>
                            <option value="7091">Sao Jose do Serido</option>
                            <option value="7092">Sao Miguel</option>
                            <option value="7093">Sao Miguel de Touros</option>
                            <option value="7094">Sao Paulo do Potengi</option>
                            <option value="7095">Sao Pedro</option>
                            <option value="7096">Sao Rafael</option>
                            <option value="7097">Sao Tome</option>
                            <option value="7098">Sao Vicente</option>
                            <option value="7099">Senador Eloi de Souza</option>
                            <option value="7100">Senador Georgino Avelino</option>
                            <option value="7101">Serra Caiada</option>
                            <option value="7105">Serra Negra do Norte</option>
                            <option value="7102">Serra da Tapuia</option>
                            <option value="7103">Serra de Sao Bento</option>
                            <option value="7104">Serra do Mel</option>
                            <option value="7106">Serrinha</option>
                            <option value="7107">Serrinha dos Pintos</option>
                            <option value="7108">Severiano Melo</option>
                            <option value="7109">Sitio Novo</option>
                            <option value="7110">Taboleiro Grande</option>
                            <option value="7111">Taipu</option>
                            <option value="7112">Tangara</option>
                            <option value="7113">Tenente Ananias</option>
                            <option value="7114">Tenente Laurentino Cruz</option>
                            <option value="7115">Tibau</option>
                            <option value="7116">Tibau do Sul</option>
                            <option value="7117">Timbauba dos Batistas</option>
                            <option value="7118">Touros</option>
                            <option value="7119">Trairi</option>
                            <option value="7120">Triunfo Potiguar</option>
                            <option value="7121">Umarizal</option>
                            <option value="7122">Upanema</option>
                            <option value="7123">Varzea</option>
                            <option value="7124">Venha-ver</option>
                            <option value="7125">Vera Cruz</option>
                            <option value="7126">Vicosa</option>
                            <option value="7127">Vila Flor</option>
                          </select>
                        </div>
                        <div class="input select required">
                          <label for="bairro">Bairro</label>
                          <select name="data[Edificacao][dsc_bairro]" id="bairro" class="span3 live">
                            '<option value="">-- Selecione um bairro --</option>
                          </select>
                        </div>
                        <div class="input text">
                          <label for="EdificacaoNumLat">Latitude</label>
                          <input name="data[Edificacao][num_lat]" type="text" mask="lat" readonly="readonly" class="span2" maxlength="20" id="EdificacaoNumLat" />
                        </div>
                        <div class="input text">
                          <label for="EdificacaoNumLong">Longitude</label>
                          <input name="data[Edificacao][num_long]" type="text" mask="long" readonly="readonly" class="span2" maxlength="20" id="EdificacaoNumLong" />
                        </div>
                        <div class="input text required">
                          <label for="EdificacaoDscReferencia">Referência</label>
                          <input name="data[Edificacao][dsc_referencia]" type="text" upper="true" id="EdificacaoDscReferencia" class="span4" maxlength="100" />
                        </div>
                      </div>
                      <div class="input text required">
                        <label for="EdificacaoNumPavimentos">Nº de Pavimentos</label>
                        <input name="data[Edificacao][num_pavimentos]" type="text" class="span1" maxlength="22" id="EdificacaoNumPavimentos" />
                      </div>
                      <div class="input text required">
                        <label for="EdificacaoNumArea">Área(m²)</label>
                        <input name="data[Edificacao][num_area]" type="text" mask="decimal" class="span2" maxlength="22" id="EdificacaoNumArea" />
                      </div>
                      <div class="input text required">
                        <label for="EdificacaoNumAltura">Altura(metros)</label>
                        <input name="data[Edificacao][num_altura]" type="text" class="span1" maxlength="22" id="EdificacaoNumAltura" />
                      </div>
                      <div class="input text">
                        <label for="EdificacaoCapacidade">Capacidade de Público</label>
                        <input name="data[Edificacao][capacidade]" type="text" class="span2" maxlength="22" id="EdificacaoCapacidade" />
                      </div>
                      <div class="input select required">
                        <label for="EdificacaoDscCentralGas">Central de Gás</label>
                        <select name="data[Edificacao][dsc_central_gas]" class="span1" id="EdificacaoDscCentralGas">
                          <option value="">--</option>
                          <option value="1">Sim</option>
                          <option value="0">Não</option>
                        </select>
                      </div>
                      <div class="input select required">
                        <label for="EdificacaoDscCilindroGas">Cilindro de Gás Estacionário</label>
                        <select name="data[Edificacao][dsc_cilindro_gas]" class="span1" id="EdificacaoDscCilindroGas">
                          <option value="">--</option>
                          <option value="1">Sim</option>
                          <option value="0">Não</option>
                        </select>
                      </div>
                      <div class="input select required">
                        <label for="EdificacaoDscRisco">Risco</label>
                        <select name="data[Edificacao][dsc_risco]" class="span2" id="EdificacaoDscRisco">
                          <option value="">--</option>
                          <option value="A">Risco A</option>
                          <option value="B">Risco B</option>
                          <option value="C">Risco C</option>
                        </select>
                      </div>
                    </fieldset>

                    <div class="form-actions">
                      <div class="submit">
                        <input class="btn btn-success" type="submit" value="Salvar" />
                      </div>
                    </div>

                  </form>				
                </div>
              </div><!--./#widget-main-->
            </div><!--./#widget-body-->
          </div><!--/.widget-box-->
        </div><!--/#page-content-->
      </div><!--/#main-content -->
    </div><!--/#main-container-->

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
        Corpo de Bombeiros Militar do Rio Grande do Norte - 2017 <br> Desenvolvido por CTIInf - CBMAL
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
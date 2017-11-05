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
    <!-- Controle de Acesso -->
    <%@ page import="java.util.*" %>
    <%@ page import="javax.servlet.http.HttpSession" %>
    <%@ page errorPage="sem_acesso.jsp"%>
    <% 
      HttpSession sessao = request.getSession();
      String logd = (String) sessao.getAttribute("logado");
      if (!(logd.equals("true"))) {
        response.sendRedirect("login.jsp?type=danger&&message=Acesso Negado! Voc� n�o est� conectado.");
      }
    %>
    
    <div class="container-fluid" id="main-container">
      <div id="main-content" class="clearfix">
        <div id="page-content" class="clearfix">
          <script type="text/javascript">
            $(document).ready(function () {

              //$('#engenheiro').attr("disabled",true);
              //$('#dat_aberturaDay').attr("disabled",true);
              //$('#dat_aberturaMonth').attr("disabled",true);
              //$('#dat_aberturaYear').attr("disabled",true);
              //$('#dat_finalDay').attr("disabled",true);
              //$('#dat_finalMonth').attr("disabled",true);
              //$('#dat_finalYear').attr("disabled",true);

              /*Habilita ou desabilita a lista de eng a depender do tipo do projeto */
              $('#tipoprojeto').change(function () {
                //toma o valor do tipo de projeto, se tipo completo ou tempor�rio habilita o combobox
                if ($('#tipoprojeto').val() == 1 || $('#tipoprojeto').val() == 2 || $('#tipoprojeto').val() == 3) {
                  $('#engenheiro').attr("disabled", false);
                  $('#geracao').attr("disabled", false);
                  if ($('#tipoprojeto').val() == 2)
                  {
                    $('#dat_aberturaDay').attr("disabled", false);
                    $('#dat_aberturaMonth').attr("disabled", false);
                    $('#dat_aberturaYear').attr("disabled", false);
                    $('#dat_finalDay').attr("disabled", false);
                    $('#dat_finalMonth').attr("disabled", false);
                    $('#dat_finalYear').attr("disabled", false);
                  } else
                  {
                    $('#dat_aberturaDay').attr("disabled", true);
                    $('#dat_aberturaMonth').attr("disabled", true);
                    $('#dat_aberturaYear').attr("disabled", true);
                    $('#dat_finalDay').attr("disabled", true);
                    $('#dat_finalMonth').attr("disabled", true);
                    $('#dat_finalYear').attr("disabled", true);
                  }
                } else
                {
                  if ($('#tipoprojeto').val() == 4)
                  {
                    $('#geracao').attr("disabled", true);
                    var geracao = 6;
                    $('#geracao option[value="' + geracao + '"]').attr({selected: "selected"});
                    var eng = 2;
                    $('#cod_eng option[value="' + eng + '"]').attr({selected: "selected"});
                  }
                  $('#engenheiro').attr("disabled", true);
                  $('#dat_aberturaDay').attr("disabled", true);
                  $('#dat_aberturaMonth').attr("disabled", true);
                  $('#dat_aberturaYear').attr("disabled", true);
                  $('#dat_finalDay').attr("disabled", true);
                  $('#dat_finalMonth').attr("disabled", true);
                  $('#dat_finalYear').attr("disabled", true);
                }
              });

              function retorna_dias_uteis(data, dias, direcao, dias_uteis) {
                if (dias == 0) {
                  //return data;
                  return dias_uteis;
                }

                var isFimDeSemana;

                //Verifica se o dia � util
                isFimDeSemana = data.getDay() in {0: 'Sunday', 6: 'Saturday'};
                //if (!isFimDeSemana) { dias--; }
                //Se for util soma um dia no contador
                if (!isFimDeSemana) {
                  dias_uteis++;
                }
                // adiciona/subtrai um dia
                data.setDate(data.getDate() + direcao);

                dias--;
                return retorna_dias_uteis(data, dias, direcao, dias_uteis);
              }

              /* Antes de submeter o formul�rio de notifica��o toma o valor do editor e seta no valor da dsc_notificacao do formul�rio a ser submetido */
              $("#ProjetoAddForm").submit(function () {

                var engenheiro = $('#engenheiro').val();//valor engenheiro
                var tipoprojeto = $('#tipoprojeto').val()//tipo projeto

                if (tipoprojeto == '') {//verifica se � do tipo completo e não foi selecionado um engenheiro
                  alert('Por favor selecione o tipo de projeto!');
                  return false;
                }

                if (engenheiro == '' && tipoprojeto == 1) {//verifica se � do tipo completo e não foi selecionado um engenheiro
                  alert('Em projetos Completos � necess�rio indicar o Engenheiro Respos�vel!\nPor favor selecione um engenheiro!');
                  return false;
                }

                if (engenheiro == '' && tipoprojeto == 2) {//verifica se � do tipo tempor�rio e não foi selecionado um engenheiro
                  alert('Em projetos Tempor�rios � necess�rio indicar o Engenheiro Respos�vel!\nPor favor selecione um engenheiro!');
                  $('#engenheiro').focus();
                  return false;
                }

                if (engenheiro == '' && tipoprojeto == 3) {//verifica se � do tipo subloja e não foi selecionado um engenheiro
                  alert('Em projetos "Subloja" � necess�rio indicar o Engenheiro Respos�vel!\nPor favor selecione um engenheiro!');
                  $('#engenheiro').focus();
                  return false;
                }
                var dia = $('#dat_aberturaDay').val();
                var mes = $('#dat_aberturaMonth').val();
                var ano = $('#dat_aberturaYear').val();
                if (tipoprojeto == 2)
                {
                  var dat_inicial = new Date(ano, mes - 1, dia);
                  var dat_atual = new Date();
                  var dias_total = Math.ceil((dat_inicial.getTime() - dat_atual.getTime()) / 1000 / 60 / 60 / 24);
                  var dias_uteis = retorna_dias_uteis(dat_inicial, dias_total, -1, 0);
                  //alert(retorna_dias_uteis(dat_inicial, dias_total, -1, 0));
                  //return false;
                  //if (dias_total < 5)
                  if (dias_total < 10)
                  {
                    if (confirm('Este evento não cumpre com o prazo mínimo de 10 dias CORRIDOS. Restam somente ' + dias_total + ' dias CORRIDOS para o evento. Tem certeza que deseja prosseguir?'))
                    {
                      return true;//se true submete
                    } else
                    {
                      return false;
                    }
                  }
                }
                //return true;//se true submete
              });

              //inicia o editor
              var editor = $("#alvo").cleditor({width: 600, height: 250})[0];

              $(".nota input").change(function () {
                if ($(this).attr('checked')) {
                  var atual = $('#alvo').val();
                  $('#alvo').val(atual + '<br>' + $(this).val());
                  editor.updateFrame();// atualizando o valor do editor após inser��o dos valores na textarea
                }
              });
            });
          </script>
          <div id="page-header" class="position-relative">
            <h1 class="page-header">Processo <small>
              <i class="icon-double-angle-right"></i> Inclus�o de Processo</small>
            </h1>
          </div><!--/page-header-->

          <div class="toolbar">
            <div class="btn-group">
              <a class="btn btn-mini dropdown-toggle" data-toggle="dropdown" href="#">
                Ações <span class="caret"></span>
              </a>
              <ul class="dropdown-menu">
                <li><a href="/serten/projetos">Listar Projetos</a></li>
                <li><a href="/serten/edificacoes">Listar Edifica��es</a> </li>
                <li><a href="/serten/edificacoes/add">Nova Edifica��o</a> </li>
              </ul>
            </div>
          </div><!--/.toolbar-->

          <div class="widget-box">
            <div class="widget-header"><h5>Cadastro</h5></div>
            <div class="widget-body">
              <div class="widget-main">
                <div class="projetos form">
                  <form action="/serten/projetos/add" id="ProjetoAddForm" method="post" accept-charset="utf-8">
                    <div style="display:none;">
                      <input type="hidden" name="_method" value="POST" />
                    </div>
                    <fieldset>

                      <div class="input select required">
                        <label for="tipoprojeto">Tipo Processo</label>
                        <select name="data[Projeto][cod_tipoprojeto]" id="tipoprojeto">
                          <option value="">-- Selecione --</option>
                          <option value="1">AVCB(Completo)</option>
                          <option value="2">CAVL(Tempor�rio)</option>
                          <!--option value="3">AVCB(SubLoja)</option-->
                          <option value="4">CLCB</option>
                        </select>
                      </div>
                      
                      <div class="input date">
                        <label for="dat_abertura">Data do Evento Tempor�rio</label>
                        <select name="data[Projeto][dat_abertura][day]" id="dat_aberturaDay" class="span2">
                          <option value="01">1</option>
                          <option value="02">2</option>
                          <option value="03">3</option>
                          <option value="04">4</option>
                          <option value="05">5</option>
                          <option value="06">6</option>
                          <option value="07">7</option>
                          <option value="08">8</option>
                          <option value="09">9</option>
                          <option value="10">10</option>
                          <option value="11">11</option>
                          <option value="12">12</option>
                          <option value="13">13</option>
                          <option value="14">14</option>
                          <option value="15">15</option>
                          <option value="16">16</option>
                          <option value="17">17</option>
                          <option value="18">18</option>
                          <option value="19">19</option>
                          <option value="20" selected="selected">20</option>
                          <option value="21">21</option>
                          <option value="22">22</option>
                          <option value="23">23</option>
                          <option value="24">24</option>
                          <option value="25">25</option>
                          <option value="26">26</option>
                          <option value="27">27</option>
                          <option value="28">28</option>
                          <option value="29">29</option>
                          <option value="30">30</option>
                          <option value="31">31</option>
                        </select>-
                        <select name="data[Projeto][dat_abertura][month]" id="dat_aberturaMonth" class="span2">
                          <option value="01">Janeiro</option>
                          <option value="02">Fevereiro</option>
                          <option value="03">Mar�o</option>
                          <option value="04">Abril</option>
                          <option value="05">Maio</option>
                          <option value="06">Junho</option>
                          <option value="07">Julho</option>
                          <option value="08">Agosto</option>
                          <option value="09" selected="selected">Setembro</option>
                          <option value="10">Outubro</option>
                          <option value="11">Novembro</option>
                          <option value="12">Dezembro</option>
                        </select>-
                        <select name="data[Projeto][dat_abertura][year]" id="dat_aberturaYear" class="span2">
                          <option value="2037">2037</option>
                          <option value="2036">2036</option>
                          <option value="2035">2035</option>
                          <option value="2034">2034</option>
                          <option value="2033">2033</option>
                          <option value="2032">2032</option>
                          <option value="2031">2031</option>
                          <option value="2030">2030</option>
                          <option value="2029">2029</option>
                          <option value="2028">2028</option>
                          <option value="2027">2027</option>
                          <option value="2026">2026</option>
                          <option value="2025">2025</option>
                          <option value="2024">2024</option>
                          <option value="2023">2023</option>
                          <option value="2022">2022</option>
                          <option value="2021">2021</option>
                          <option value="2020">2020</option>
                          <option value="2019">2019</option>
                          <option value="2018">2018</option>
                          <option value="2017" selected="selected">2017</option>
                          <option value="2016">2016</option>
                          <option value="2015">2015</option>
                          <option value="2014">2014</option>
                          <option value="2013">2013</option>
                          <option value="2012">2012</option>
                          <option value="2011">2011</option>
                          <option value="2010">2010</option>
                          <option value="2009">2009</option>
                          <option value="2008">2008</option>
                          <option value="2007">2007</option>
                          <option value="2006">2006</option>
                          <option value="2005">2005</option>
                          <option value="2004">2004</option>
                          <option value="2003">2003</option>
                          <option value="2002">2002</option>
                          <option value="2001">2001</option>
                          <option value="2000">2000</option>
                          <option value="1999">1999</option>
                          <option value="1998">1998</option>
                          <option value="1997">1997</option>
                        </select>
                      </div>

                      <div class="input date">
                        <label for="dat_final">Data Final</label>
                        <select name="data[Projeto][dat_final][day]" id="dat_finalDay" class="span2">
                          <option value="01">1</option>
                          <option value="02">2</option>
                          <option value="03">3</option>
                          <option value="04">4</option>
                          <option value="05">5</option>
                          <option value="06">6</option>
                          <option value="07">7</option>
                          <option value="08">8</option>
                          <option value="09">9</option>
                          <option value="10">10</option>
                          <option value="11">11</option>
                          <option value="12">12</option>
                          <option value="13">13</option>
                          <option value="14">14</option>
                          <option value="15">15</option>
                          <option value="16">16</option>
                          <option value="17">17</option>
                          <option value="18">18</option>
                          <option value="19">19</option>
                          <option value="20" selected="selected">20</option>
                          <option value="21">21</option>
                          <option value="22">22</option>
                          <option value="23">23</option>
                          <option value="24">24</option>
                          <option value="25">25</option>
                          <option value="26">26</option>
                          <option value="27">27</option>
                          <option value="28">28</option>
                          <option value="29">29</option>
                          <option value="30">30</option>
                          <option value="31">31</option>
                        </select>-
                        <select name="data[Projeto][dat_final][month]" id="dat_finalMonth" class="span2">
                          <option value="01">Janeiro</option>
                          <option value="02">Fevereiro</option>
                          <option value="03">Março</option>
                          <option value="04">Abril</option>
                          <option value="05">Maio</option>
                          <option value="06">Junho</option>
                          <option value="07">Julho</option>
                          <option value="08">Agosto</option>
                          <option value="09" selected="selected">Setembro</option>
                          <option value="10">Outubro</option>
                          <option value="11">Novembro</option>
                          <option value="12">Dezembro</option>
                        </select>-
                        <select name="data[Projeto][dat_final][year]" id="dat_finalYear" class="span2">
                          <option value="2037">2037</option>
                          <option value="2036">2036</option>
                          <option value="2035">2035</option>
                          <option value="2034">2034</option>
                          <option value="2033">2033</option>
                          <option value="2032">2032</option>
                          <option value="2031">2031</option>
                          <option value="2030">2030</option>
                          <option value="2029">2029</option>
                          <option value="2028">2028</option>
                          <option value="2027">2027</option>
                          <option value="2026">2026</option>
                          <option value="2025">2025</option>
                          <option value="2024">2024</option>
                          <option value="2023">2023</option>
                          <option value="2022">2022</option>
                          <option value="2021">2021</option>
                          <option value="2020">2020</option>
                          <option value="2019">2019</option>
                          <option value="2018">2018</option>
                          <option value="2017" selected="selected">2017</option>
                          <option value="2016">2016</option>
                          <option value="2015">2015</option>
                          <option value="2014">2014</option>
                          <option value="2013">2013</option>
                          <option value="2012">2012</option>
                          <option value="2011">2011</option>
                          <option value="2010">2010</option>
                          <option value="2009">2009</option>
                          <option value="2008">2008</option>
                          <option value="2007">2007</option>
                          <option value="2006">2006</option>
                          <option value="2005">2005</option>
                          <option value="2004">2004</option>
                          <option value="2003">2003</option>
                          <option value="2002">2002</option>
                          <option value="2001">2001</option>
                          <option value="2000">2000</option>
                          <option value="1999">1999</option>
                          <option value="1998">1998</option>
                          <option value="1997">1997</option>
                        </select>
                      </div>

                      <div class="input select">
                        <label for="geracao">Autogerar</label>
                        <select name="data[Projeto][cod_geracao]" id="geracao">
                          <option value="1">An�lise Comum</option>
                          <option value="2">An�lise Amplia��o</option>
                          <option value="3">Re-An�lise</option>
                          <option value="4">Autentica��o(Gerar no processo!)</option>
                          <option value="5">Vistoria</option>
                          <option value="6">CLCB(nao usar!)</option>
                        </select>
                      </div>

                      <div class="input select">
                        <label for="engenheiro">Resp. T�cnico</label>
                        <select name="data[Projeto][cod_eng]" id="engenheiro" class="span4 live">
                          <option value="">-- Selecione o Respos�vel --</option>
                          <option value="2181">ADRIAN MEDIEROS DA SILVA</option>
                          <option value="1061">ADRIANA SOUZA DE JESUS VIANA</option>
                          <option value="1683">ADRIANO AUGUSTO CAVALCANTE</option>
                          <option value="744">ADRIANO BEZERRA DA SILVA</option>
                          <option value="1941">ADRIANO CAMPOS DE MELO</option>
                          <option value="3022">ADRIANO MOREIRA DA SILVA</option>
                          <option value="384">ADROALDO LACERDA DE CASTRO</option>
                          <option value="1123">AD�O DA COSTA DANTAS</option>
                          <option value="1421">AECIO ALUIZIO FENANDES DE FARIA</option>
                          <option value="3661">AILTON DA SILVA ARAUJO</option>
                          <option value="41">ALAN BRUNO LIMA DA SILVA</option>
                          <option value="3623">ALESSANDRO LE�O RIBEIRO</option>
                          <option value="3662">ALEX GALLO DE LIMA</option>
                          <option value="1901">ALEX QUEIROZ DIAS DE OLIVEIRA</option>
                          <option value="604">ALEX SANDRO PINHO SALVIA
                        </select>
                      </div>

                      <div class="input select required">
                        <label for="ProjetoDscOrigemObm">OBM Resp.</label>
                        <select name="data[Projeto][dsc_origem_obm]" id="ProjetoDscOrigemObm">
                          <option value="">-- Selecione --</option>
                          <option value="2">SAT - MOSSOR�</option>
                          <option value="3">SAT - CAIC�</option>
                          <option value="1">SAT - NATAL</option>
                        </select>
                      </div>

                      <div class="input text required">
                        <label for="ProjetoCodEdificacao">N� Edifica��o SAPS</label>
                        <input name="data[Projeto][cod_edificacao]" type="text" data-toggle="modal" data-target="#modal-busca" readonly="readonly" href="/serten/edificacoes/busca" maxlength="30" id="ProjetoCodEdificacao" />
                      </div>

                      <div class="widget-box transparent" style="margin-top: 10px">
                        <div class="widget-header">
                          <h4 class="lighter">
                            Notas para Aux�lio
                          </h4>
                        </div>
                        <div class="widget-body">
                          <div class="widget-main">
                            <div class="box">
                              <!-- inicio das frases prontas -->
                              <!--form-->
                              <a data-toggle="collapse" data-target="#g1" OnMouseOver="this.style.cursor = 'pointer';"><i class="icon-edit"></i> DOCUMENTOS ENTREGUES PELO PROPRIETÁRIO</a>
                              <div id="g1" class="collapse" >
                                <div class="box">
                                  <div class="nota">
                                    <input type="checkbox" value="ANOTA��O DE RESPONSABILIDADE T�CNICA - ART: ___" />
                                    <label for="Tipo8">ANOTA��O DE RESPONBILIDADE T�CNICA - ART: 00 (QTDADE)<label>
                                  </div>
                                  <div class="nota">
                                    <input type="checkbox" value="MEMORIAIS DESCRITIVOS: ___" />
                                    <label for="Tipo8">MEMORIAIS DESCRITIVOS: 00 (QTDADE)<label>
                                  </div>
                                  <div class="nota">
                                    <input type="checkbox" value="PROJETO ARQUITET�NICO: ___" />
                                    <label for="Tipo8">PROJETO ARQUITETÔNICO: 00 (QTDADE)<label>
                                  </div>
                                  <div class="nota">
                                    <input type="checkbox" value="PROJETO DE COMBATE � INC�NDIO: ___" />
                                    <label for="Tipo8">PROJETO DE COMBATE � INC�NDIO: 00 (QTDADE)<label>
                                  </div>
                                  <div class="nota">
                                    <input type="checkbox" value="EMAIL: ___" />
                                    <label for="Tipo8">EMAIL: 00 (QTDADE)<label>
                                  </div>
                                  <div class="nota">
                                    <input type="checkbox" value="M�DIA DIGITAL: ___" />
                                    <label for="Tipo8">M�DIA DIGITAL: 00 (QTDADE)<label>
                                  </div>
                                  <div class="nota">
                                    <input type="checkbox" value="OUTROS: ___" />
                                    <label for="Tipo8">OUTROS: 00 (QTDADE)</label>
                                  </div>
                                  <div class="nota">
                                    <input type="checkbox" value="NENHUM." />
                                    <label for="Tipo8">NENHUM.</label>     
                                  </div>
                                </div>
                              </div>
                              <!--/form-->
                            </div><!--/.box-->
                          </div><!--/.widget-main-->
                        </div><!--/.widget-body-->
                      </div><!--/widget-box transparent-->

                      <div class="input textarea">
                        <label for="alvo">Documentos</label>
                        <textarea name="data[EntradaProjeto][dsc_docs]" id="alvo" cols="30" rows="6" ></textarea>
                      </div>
                    </fieldset>
                    <div class="form-actions">
                      <div class="submit">
                        <input class="btn btn-success" type="submit" value="Salvar" />
                      </div>
                    </div>

                </form>
                </div>
              </div><!--/.widget-main -->
            </div><!--/.widget-body -->
          </div><!--/.widget-box -->
        </div><!-- #page-content -->
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
            alert('Digite a �era para calcular valor.');
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
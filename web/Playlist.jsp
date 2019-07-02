
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <script src="js/jquery-3.4.1.js" type="text/javascript"></script>
        <script src="js/jquery.validate.js" type="text/javascript"></script>
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="js/bootstrap-notify.min.js" type="text/javascript"></script>
        <script src="js/additional-methods.js" type="text/javascript"></script>
        <script src="js/messages_pt_BR.js" type="text/javascript"></script>
        <link href="css/TestCSS.css" rel="stylesheet" type="text/css"/>       
        <link rel="shortcut icon" href="image/Icon.jpg">
      
        
        
        
        
        <title>Playlist</title>
    </head>
    <body>
        
        <nav class="navbar navbar-default navbar-expand-lg navbar-light">
            <div class="navbar-header d-flex col">
                <a class="navbar-brand" href="index_1.jsp"><b>My</b>Listener</a>
                <button type="button" data-target="#navbarCollapse" data-toggle="collapse" class="navbar-toggle navbar-toggler ml-auto">
                    <span class="navbar-toggler-icon"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
            </div>


           
            <div id="navbarCollapse" class="collapse navbar-collapse justify-content-start">
                <ul class="nav navbar-nav">
                    <li class="nav-item"><a href="index_1.jsp" class="nav-link">Home</a></li>
                    <li class="nav-item"><a href="#" class="nav-link">Playlists</a></li>			

                    <li class="nav-item"><a href="Contato.jsp" class="nav-link">Contato</a></li>
                </ul>
                <ul class="nav navbar-nav navbar-right ml-auto">
                    <li class="nav-item"><a href="cadastro.jsp" class="nav-link">Cadastro</a></li>
                    <li class="nav-item"><a href="login.jsp" class="nav-link">Login</a></li>
                    <li class="navbar-form-wrapper">
                       
                    </li>

                </ul>
                <ul>
                </ul>
            </div>
        </nav> 
        
        
         <div class="container playlistt">
        <div class="row">
            <button class="btn btn-success butao">Cadastrar playlist</button>
            <button class="btn btn-success butao" id="addM">adicionar musica</button>
            <br>
            <br>
            <br>
                <div class="col-lg-12">
                    <div class="col-lg-1"></div>
                   <div class="col-lg-10 col-md-12 col-xs-12 " >
                        <ul  id="playlist">
                        <div class="card">
                            <li class="li-music">
                                <a id="escolhida" data-id="bp8nMS1LhMI" data-ps="0" data-banda="Jota Quest" data-nomeMusic="Pra Quando Você Se Lembrar de Mim" href="#">Pra Quando Você Se Lembrar de Mim - Jota Quest</a> 
                               
                            </li>
                             <li class="li-music">
                                <a id="escolhida" data-id="q3DiDlma-X4" data-ps="1" data-banda="Jota Quest" data-nomeMusic="Vem Andar Comigo"  href="#">Jota Quest - Vem Andar Comigo </a> 
                            </li>
                             <li class="li-music">
                                <a id="escolhida" data-id="9MHK6zx4evY" data-ps="2" data-banda="Sant " data-nomeMusic="Sant | LK o Marroquino | L7NNON - Alicerces "  href="#">PNC </a> 
                            </li>
                        </div>
                      </ul>
                   </div> 
                </div>
        </div>
    </div>

   

    <div class="container-fluid">
        <span>
          <center> 
            <b>Artista:</b> <i id='artista'></i> /
            <b>Musica:</b> <i id='music'></i>
          </center>
        </span>




    <div id='letra'>
      <div class="row">
          <div class="col-lg-6">
              <pre class=text>Buscando letra...</pre>
          </div>

          <div class="col-lg-6">
              <pre class=text2>Buscando letra...</pre>
          </div>
      </div>
   </div>
</div>

<br><br><br><br><br><br><br><br><br><br>


     <div class="container todo-player">
            <div style="position: absolute; margin-top: -350px;">
                <div id="player-view"class=" sumir">
                    <div class="row">
                        <div class="col-lg-6">
                             <div id="player"></div>
                        </div>
                    </div>
                </div>
                
            </div>
            <div class="row">
                  <div class="col-lg-11 col-xs-11">
                        <!-- input range with JqueryUI -->
                           <div id="slider"></div>
                    </div>

                      <div class="col-lg-1 col-xs-1 tamanho">
                        <!-- button volume -->
                        <span class="button-volume glyphicon glyphicon-volume-up"></span>
                        <span class="button-volume glyphicon glyphicon-volume-down" style="display:none"></span>                        
                    </div>

            </div>

            <div class="row">

                <div class="col-lg-12">
                  
                        <!-- button play/pause -->
                        <div class="col-lg-3 col-xs-3 text-center tamanho">
                           <span><a href="#voltar" id="voltar" title=""><<<</a> </span> 
                        </div>
                         
                        <div class="col-lg-3 col-xs-3 text-center tamanho"> 
                          <div class="fundo-btn-play">
                            <span class="button-play glyphicon glyphicon-play"></span>
                            <span class="button-play glyphicon glyphicon-pause" style="display:none"></span>
                          </div>
                            
                        </div>

                        <div class="col-lg-3 col-xs-3 text-center tamanho">
                            <span><a href="#pular" id="pular" title="">>>></a></span>

                        </div>

                        <div class="col-lg-3 col-xs-3 tamanho">
                             <!-- button fullscreen -->
                              <span class="button-resize glyphicon glyphicon-resize-full" id="fullsize"></span>
                        </div>
                  
                </div>

            </div>
        </div>



  <script type="text/javascript">
          $("#slider").slider({
                range: "min"
           });
        </script>
<script type="text/javascript" src="youtubeApi-e-playlist.js"></script>
<script src="js/youtubeApi-e-playlist.js" type="text/javascript"></script>
    </body>
</html>

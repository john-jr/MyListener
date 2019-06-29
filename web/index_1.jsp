<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <title>Home</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <script src="js/jquery-3.4.1.js" type="text/javascript"></script>
        <script src="js/jquery.validate.js" type="text/javascript"></script>
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="js/bootstrap-notify.min.js" type="text/javascript"></script>
        <script src="js/additional-methods.js" type="text/javascript"></script>
        <script src="js/messages_pt_BR.js" type="text/javascript"></script>
        <link href="css/TestCSS.css" rel="stylesheet" type="text/css"/>       
        <link rel="shortcut icon" href="image/Icon.png">
        

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
                    <li class="nav-item"><a href="#" class="nav-link">Home</a></li>
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
      
        <div id="carousel-id" class="carousel slide" data-ride="carousel">
            <ol class="carousel-indicators">
                <li data-target="#carousel-id" data-slide-to="0" class=""></li>
                <li data-target="#carousel-id" data-slide-to="1" class=""></li>
                <li data-target="#carousel-id" data-slide-to="2" class="active"></li>
            </ol>
            <div class="carousel-inner">
                <div class="item">
                    <img  alt="First slide" src="image/jazz.jpg">

                    <div class="container">
                        <div class="carousel-caption">
                            <h1>Jazz.</h1>
                         
                        </div>
                    </div>
                </div>
                <div class="item">
                    <img  alt="Second slide" src="image/hiphop.png">
                    <div class="container">
                        <div class="carousel-caption">
                            <h1>Hip Hop</h1>
                          
                        </div>
                    </div>
                </div>
                <div class="item active">
                    <img  alt="Third slide" src="image/eletronica.jpg">
                    <div class="container">
                        <div class="carousel-caption">
                            <h1>Eletrônica.</h1>
                          
                        </div>
                    </div>
                </div>
            </div>
            <a class="left carousel-control" href="#carousel-id" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a>
            <a class="right carousel-control" href="#carousel-id" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a>
        </div>
        <div>
            <div id="novoSom">
                 <h2 >
                Que tal descobrir novos sons?
            </h2>
            </div>
           
        </div>
        
        <audio controls>
            <source src="audio/02 Celebrate (feat. Rico Love).mp3" type="audio/mpeg">
            Your browser does not support the <code>audio</code> tag.
        </audio>
        <style>
            audio{
                width: 40%;
                float: right;
            }
        </style>
            
            
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        <div class="rodape">
    <div class="col-md-6 col-12"  id="divSoc">
                
                   <a href="https://www.facebook.com" target="_blank">   <img src="image/facebook.png" alt="" class="img-fluid social"  /></a>
                  
                  
                  <a href="https://www.instagram.com/?hl=pt-br" target="_blank"> <img src="image/instagram.png" alt="" class="img-fluid social"/></a>
          

                             <a href="https://twitter.com" target="_blank"> <img src="image/twitter.png" alt="" class="img-fluid social"/></a>
                 
                </div>
                <div class="col-md-6 col-12">
                    
                 <p id="Copyright">Este site tem como propósito apresentar um trabalho acadêmico. Todas suas informações aqui distribuídas podem ou não serem de cunho verídico. Não há nenhum vínculo com autor ou empresa real.</p>
                  </div>
        
        </div>

    </body>
</html>

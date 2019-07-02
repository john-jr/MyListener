<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <title>Contato</title>
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


        <script>
            $("#contato").validate({
                rules: {
                    email: {
                        required: true,
                        email: true

                    },

                    mesagem: {
                        required: true,
                        minlength: 20,
                        maxlength: 500,
                        minWords: 10
                    }


                }
            });
        </script> 
        <style>
            textarea {
                resize: none;
            }
            .textA{
                width: 100%;
                margin-top: 10px;
            }
            
            
            #textB{
                
                   margin-top: 5px;
            }
            
            
            
            @media (max-width: 991px) { 
                  .textA{
                width: 100%;
                margin-top: 10px;
                margin-left: 5px;
            }
            #textB{
                
                   margin-left: 20px;
            }
            
            }
            
            
            
        </style>
    </head>
    
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
                <li class="nav-item"><a href="Playlist.jsp" class="nav-link">Playlists</a></li>			

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


    <body> 

        

         <div class="modal-dialog modal-login" id="teste">
                <div class="modal-content">
                    <div class="modal-header">				
                        <h4 class="modal-title">Contato</h4>
                        
                    </div>  
                    <div class="modal-body">
                        <form name="formulario" id="contato" method="post" > 
                               
                            
                            <div class="form-group">
                                <input type="text" name="nomeC" id="user" placeholder="Nome" class="form-control"/>
                            </div>
                          
                            <div class="form-group">
                                <input type="email" name="emailC" id="senha" placeholder="Email" class="form-control"/>
                            </div>
                           
                            
                            
                            <div class="form-group">
                                
                            <textarea name="textarea"rows="10" cols="70"> 
                            
                            </textarea>
                                      

                                
                            </div>
                            
                            <div class="form-group">
                                <input type="submit" value="Enviar" class="btn btn-success btn-block btn-lg"/>
                            </div>
                            
                            <div class="clearfix">
         
        
        </div> 
                            
                        </form>   
                    </div>
                    <div class="modal-footer">
                        Não possui conta?<a href="cadastro.jsp"> Cadastre-se agora!</a>
                    </div>	
                </div>
            </div>
    </body>
</html>












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


        
        <style>
            textarea {
                resize: none;
                         -webkit-border-radius: 5px;
    -moz-border-radius: 5px;
    border-radius: 5px;
      display: block;
    margin-left: auto;
    margin-right: auto;
     -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;	
    width: 100%;
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
            .modal-header{
                padding-bottom: 0px;
            }     
        </style>
         <script type="text/javascript">
              $(document).ready(function () {                

                $("#contato").validate({
                    rules: {
                        nomeC: {
                           
                        },
                        
                        emailC: {
                            required: true,
                            email: true
                        },
                        MensagemC: {
                            required: true,
                             maxlength: 255
                        }
                    },
                    submitHandler: function(){
                        
                        $.ajax({
                            url: 'contato_controlador.jsp',
                      
                            data: {
                                nome: $("#nomeC").val(),
                                email: $("#emailC").val(),
                                mensagem: $("#MensagemC").val()
                              
                            },
                            type: 'POST',
                          
                            success: function (data, textStatus, jqXHR) {
                                if (data.message == "SUCCESS"){
                                    $.notify({
                                        message: 'Obrigado!'
                                    }, {
                                        type: 'success'
                                    });
                                 
                                }
                               else if (data.message == "FAIL"){
                                    $.notify({
                                        message: 'Erro! Consulte o manual do usuário página 235'
                                    }, {
                                        type: 'danger'
                                    });
                                 
                                }
                                 
                            },
                            error: function(Error) {
                                  console.log(Error);
                                $.notify({
                                    message: 'Erro!'
                                  
                                }, {
                                    // settings
                                    type: 'danger',
                                    animate: {
                                    enter: 'animated fadeInDown',
                                    exit: 'animated fadeOutUp'
                                    }
                                
        
        });
                            }

                        });
                    }

                });
            });
        </script>
    </head>
     <body> 
       <nav class="navbar navbar-default navbar-expand-lg navbar-light">
            <div class="navbar-header d-flex col">
                <a class="navbar-brand" href="index_logado.jsp"><b>My</b>Listener</a>
                <button type="button" data-target="#navbarCollapse" data-toggle="collapse" class="navbar-toggle navbar-toggler ml-auto">
                    <span class="navbar-toggler-icon"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
            </div>


           
            <div id="navbarCollapse" class="collapse navbar-collapse justify-content-start">
                <ul class="nav navbar-nav">
                    <li class="nav-item"><a href="index_logado.jsp" class="nav-link">Home</a></li>
                    <li class="nav-item"><a href="#" class="nav-link">Playlists</a></li>			

                    <li class="nav-item"><a href="#" class="nav-link">Contato</a></li>
                </ul>
                <ul class="nav navbar-nav navbar-right ml-auto">
                    <li class="nav-item"><a href="#" class="nav-link">Minhas Playlists</a></li>
                    <li class="nav-item"><a href="#" class="nav-link">Minha Conta</a></li>
                    <li class="nav-item"><a href="index_1.jsp" class="nav-link">Sair</a></li>
                    <li class="navbar-form-wrapper">
                       
                    </li>

                </ul>
                <ul>
                </ul>
            </div>
        </nav> 


   

        

         <div class="modal-dialog modal-login" id="teste">
                <div class="modal-content">
                    <div class="modal-header">				
                        <h4 class="modal-title">Contato</h4>
                        <h5 id="">Possui sugestões,críticas ou elogios? Mande um e-mail para a gente! </h5>
                    </div>  
                    <div class="modal-body">
                        <form name="contato" id="contato"> 
                            <div class="form-group">
                                <input type="text" name="nomeC" id="nomeC" placeholder="Nome" class="form-control"/>
                            </div>
                            <div class="form-group">
                                <input type="text" name="emailC" id="emailC" placeholder="Email" class="form-control"/>
                            </div>
                            <div class="form-group">   
                                <textarea id="MensagemC" name="MensagemC" placeholder="Mensagem..." rows="10" ></textarea>
                            </div>
                            
                            <div class="form-group">
                                <input type="submit" value="Enviar" class="btn btn-success btn-block btn-lg"/>
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












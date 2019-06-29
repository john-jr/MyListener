<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="js/jquery-3.4.1.js" type="text/javascript"></script>
        <script src="js/jquery.validate.js" type="text/javascript"></script>
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="js/bootstrap-notify.min.js" type="text/javascript"></script>
        <script src="js/additional-methods.js" type="text/javascript"></script>
        <script src="js/messages_pt_BR.js" type="text/javascript"></script>
        <link href="css/TestCSS.css" rel="stylesheet" type="text/css"/>       
        <link rel="shortcut icon" href="image/Icon.png">
        <title>Cadastro</title>

        <style type="text/css">
            .modal-login {		
                color: #636363;
                width:  350px;
            }

            .modal-dialog{
                margin:auto;
                margin-top: 10px;
            }


            .modal-login .modal-content {
                padding: 20px;
                border-radius: 5px;
                border: none;
            }
            .modal-login .modal-header {
                margin: -5px;
                border-bottom: none;   
                position: relative;
                justify-content: center;
            }
            .modal-login h4 {
                text-align: center;
                font-size: 26px;
            }
            .modal-login .form-control:focus {
                border-color: #70c5c0;
            }
            .modal-login .form-control, .modal-login .btn {
                min-height: 40px;
                border-radius: 3px; 
            }
            .modal-login .close {
                position: absolute;
                top: -5px;
                right: -5px;
            }	
            .modal-login .modal-footer {
                background: #ecf0f1;
                border-color: #dee4e7;
                text-align: center;
                justify-content: center;
                margin: 0 -20px -20px;
                border-radius: 5px;
                font-size: 13px;
            }
            .modal-login .modal-footer a {
                color: background;
            }		
            .modal-login .btn {
                color: #fff;
                border-radius: 4px;
                background: gray;
                text-decoration: none;
                transition: all 0.4s;
                line-height: normal;
                border: none;
            }
            .modal-login .btn:hover, .modal-login .btn:focus {
                background: black;
                outline: none;
            }
            .trigger-btn {
                display: inline-block;
                margin: 100px auto;
            }
        </style>

        <script type="text/javascript">
            $(document).ready(function () {                

                $("#formulario").validate({
                    rules: {
                        user: {
                            required: true
                        },
                        email: {
                            required: true,
                            email: true
                        },
                        senha: {
                            required: true,
                            maxlength: 50
                        },
                        Csenha: {
                            required: true,
                            maxlength: 50,
                            equalTo: "#senha"
                        }
                    },
                    submitHandler: function(){
                        
                        $.ajax({
                            url: 'cadastrar_controlador.jsp',
                            data: {
                                user: $("#user").val(),
                                senha: $("#senha").val(),
                                email: $("#email").val()
                            },
                            type: 'POST',
                            success: function (data, textStatus, jqXHR) {
                                if (data.message == "SUCCESS"){
                                    $.notify({
                                        message: 'Cadastrado com sucesso'
                                    }, {
                                        type: 'success'
                                    });
                                }else if(data.message == "EQUALUSER"){
                                    $.notify({
                                        message: 'Já existe um usuário com este e-mail'
                                    }, {
                                        type: 'danger'
                                    });
                                }
                                else if(data.message == "XMLNOTWORKING"){
                                    $.notify({
                                        message: 'Erro E&x35b - XML não está conectado corretamente'
                                    }, {
                                        type: 'danger'
                                    });
                                }
                                else if(data.message == "EXCEPTION"){
                                    $.notify({
                                        message: 'Erro B53ax - Exceção encontrada '
                                    }, {
                                        type: 'danger'
                                    });
                                }
                            },
                            error: function(error) {
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

                    <li class="nav-item"><a href="contato.jsp" class="nav-link">Contato</a></li>
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







        <div class="modal-dialog modal-login" id="teste">
            <div class="modal-content">
                <div class="modal-header">				
                    <h4 class="modal-title">Cadastre-se Gratuitamente!</h4>                   
                </div>  
                <div class="modal-body">
                    <form name="formulario" id="formulario"> 
                        <div class="form-group">
                            <input type="text" name="user" id="user" placeholder="Usuário" class="form-control"/>
                        </div>
                        <div class="form-group">
                            <input type="text" name="email" id="email"  placeholder="E-mail" class="form-control"/>
                        </div>
                        <div class="form-group">
                            <input type="text" name="senha" id="senha" placeholder="Senha" class="form-control"/>
                        </div>
                        <div class="form-group">
                            <input type="text" name="Csenha" id="Csenha" placeholder="Confirmar Senha" class="form-control"/>
                        </div>
                        <div class="form-group">
                            <input type="submit" id="CD" name="CD"  value="Fazer cadastro" class="btn btn-primary btn-block btn-lg"/>
                        </div>
                    </form>   
                </div>
                <div class="modal-footer">
                    Já possui cadastro?<a href="login.jsp"> Clique aqui para fazer login</a>
                </div>	
            </div>
        </div>

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

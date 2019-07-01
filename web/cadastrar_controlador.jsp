<%@page import="org.codehaus.jettison.json.JSONObject"%>
<%@page import="persistencia.ClienteBD"%>
<%@page import="dominio.Cliente"%>
<%
    response.setContentType("application/json");
    
    String usuario = request.getParameter("user");
    String email = request.getParameter("email");
    String senha = request.getParameter("senha");
    
    JSONObject json = new JSONObject();    
    try {
        Cliente C = new Cliente();
        C.setEmail(email);
        C.setSenha(senha);
        C.setUsuario(usuario);
        char res = ClienteBD.inserir(C);
        if(res == 'M'){
              json.put("message", "EQUALUSER");
        }
        else if(res == 'X'){
            json.put("message", "XMLNOTWORKING");
        }
        else if(res == 'C'){
            json.put("message", "SUCCESS");
        }
        else if(res == 'E'){
            json.put("message", "EXCEPTION");
        }
        
    } catch (Exception excecao) {

        json.put("message", "EXCEPTION_err");
       

    }
    out.println(json.toString());

    %>
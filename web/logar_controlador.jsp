<%@page import="org.codehaus.jettison.json.JSONObject"%>
<%@page import="persistencia.ClienteBD"%>
<%@page import="dominio.Cliente"%>
<%
      response.setContentType("application/json");
    
    String usuario = request.getParameter("user");
    String senha = request.getParameter("senha");
    
    JSONObject json = new JSONObject();  
    try {
     Cliente C = ClienteBD.procuraSessao(usuario, senha);
     if(C != null){
         json.put("message", "SESSION");
     }
     else{
         json.put("message", "USERNOTFOUND");
     }   
    } catch (Exception excecao) {

        json.put("message", "EXCEPTION_err");

    }

    %>

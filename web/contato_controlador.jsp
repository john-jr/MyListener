<%@page import="org.codehaus.jettison.json.JSONObject"%>
<%@page import="email.Email"%>
<%
    response.setContentType("application/json");
    JSONObject json = new JSONObject();
    try {
        Email enviar = new Email();
        String nome = request.getParameter("nome");
        String email = request.getParameter("email");
        String mensagem = request.getParameter("mensagem");
        mensagem = mensagem.replaceAll("\n", "\r\n");

        if (nome.equals(null) || nome.equals("") || nome.equals(" ")) {
            nome = "Usuário anonimo";
        }

        enviar.setDestinatario("projetomylistener@gmail.com");
        enviar.setAssunto("Feedback");

        StringBuffer texto = new StringBuffer();
        texto.append("Nome: ");
        texto.append(nome);
        texto.append("<br/>");
        texto.append("Email de contato: ");
        texto.append(email);
        texto.append("<br/>");
        texto.append("Mensagem: ");
        texto.append(mensagem);
        enviar.setMensagem(texto.toString());
        boolean enviou = enviar.enviarGmail();
        if (enviou = false) {
            json.put("message", "FAIL");
        } else {
            json.put("message", "SUCCESS");
        }

    } catch (Exception err) {
        json.put("message", "FAIL");
        err.printStackTrace();
    }
    out.println(json.toString());
%>
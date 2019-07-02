package email;

import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class Email {

    private String destinatario;
    private String assunto;
    private String mensagem;

    public String getDestinatario() {
        return destinatario;
    }

    public void setDestinatario(String destinatario) {
        this.destinatario = destinatario;
    }

    public String getAssunto() {
        return assunto;
    }

    public void setAssunto(String assunto) {
        this.assunto = assunto;
    }

    public String getMensagem() {
        return mensagem;
    }

    public void setMensagem(String mensagem) {
        this.mensagem = mensagem;
    }

    public boolean enviarGmail() {
        boolean retorno = false;

        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.socketFactory.port", "587");
        props.put("mail.smtp.socketFactory.class",
                "javax.net.ssl.SSLSocketFactory");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.starttls.enable", "true");

        Session s = Session.getInstance(props,
                new javax.mail.Authenticator() {

            @Override
            protected PasswordAuthentication getPasswordAuthentication() {

                return new PasswordAuthentication("projetomylistener@gmail.com", "MyListener123");//email e senha usuário 
            }

        });
        s.setDebug(true);

        //compose message  
        try {
            MimeMessage message = new MimeMessage(s);
            message.setFrom(new InternetAddress("projetomylistener@gmail.com"));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(this.destinatario));

            message.setSubject(this.assunto);
            message.setContent(this.mensagem, "text/html; charset=utf-8");

            Transport.send(message);
            retorno = true;

        } catch (MessagingException e) {
            retorno = false;

        }
        return retorno;
    }
}

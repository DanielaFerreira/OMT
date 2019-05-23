package com.br.OMT.Utils;

import java.net.MalformedURLException;
import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.HtmlEmail;

public class CommonsMail {

    public static void enviarEmail(String endereco) throws EmailException, MalformedURLException {
        // Cria o e-mail
        HtmlEmail email = new HtmlEmail();
        
        // Utilize o hostname do seu provedor de email
        email.setHostName("smtp.gmail.com");
        
        // Quando a porta utilizada não é a padrão (gmail = 465)
        email.setSmtpPort(465);
        
        // Adiciona os destinatários
        email.addTo(endereco);
        
        // Configura o seu email do qual enviará
        email.setFrom("eduardo.bitencourt007@gmail.com", "Eduardo Neves");
        
        // Adiciona um assunto
        email.setSubject("IFAM - Pesquisa de Egresso");

        // adiciona uma imagem ao corpo da mensagem e retorna seu id
        // URL url = new URL("http://www.apache.org/images/asf_logo_wide.gif");
        // String cid = email.embed(url, "Apache logo");

        // Adiciona a mensagem do email e configura a mensagem para o formato HTML
        // email.setHtmlMsg("<html>The apache logo - <img src=\"cid:" + cid + "\"></html>");
        email.setHtmlMsg("Acesse este <a href=\"http://localhost:8084/OMT/formEgresso.html\">link</a> para preencher o questionário e ter acesso ao sistema");

        // configura uma mensagem alternativa caso o servidor não suporte HTML
        email.setTextMsg("Seu servidor de e-mail não suporta mensagem HTML.");
        
        // Para autenticar no servidor é necessário chamar os dois métodos abaixo
        email.setSSL(true);
        email.setAuthentication("eduardo.bitencourt007@gmail.com", "32379365");
        
        // envia o e-mail
        email.send();
        
        System.out.println("Email enviado!");
    }
}

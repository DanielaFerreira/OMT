package com.br.OMT.Utils;

import java.net.MalformedURLException;
import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.MultiPartEmail;

// eddunic

public class CommonsMail {

    public static void enviarEmail(String endereco, String empresa) throws EmailException, MalformedURLException {

        try {
            MultiPartEmail email = new MultiPartEmail();
            email.setDebug(true);
            email.setHostName("smtp.gmail.com");
            email.setFrom("adopets.foundation@gmail.com", "IFAM");
            email.setAuthentication("adopets.foundation@gmail.com", "stephoda");
            email.setSSL(true);
            email.addTo(endereco);
            email.setFrom("adopets.foundation@gmail.com");
            email.setSubject("Indicação de Vaga");
            email.setMsg(empresa + " enviou uma indicação de reserva de vaga para você!");

            email.send();
        } catch (EmailException e) {
            e.printStackTrace();
        }
    }
}

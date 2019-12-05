/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.br.OMT.models;

import java.io.Serializable;
import java.util.List;
import static javax.persistence.CascadeType.ALL;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 *
 * @author daniela
 */

@Entity
@Table(name = "notificacao")
@Inheritance(strategy = InheritanceType.SINGLE_TABLE)
public class Notificacao implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "status", nullable = false)
    private String status;
    
    @Column(name = "tituloRemetente")
    private String tituloRemetente;
    
    @Column(name = "mensagemRemetente")
    private String mensagemdoRemetente;

    @Column(name = "tituloDestinatario")
    private String tituloDestinatario;
    
    @Column(name = "mensagemDestinatario")
    private String mensagemdoDestinatario;
    
    @ManyToOne
    @JoinColumn(name = "usuario")
    private Usuario destinatario;

    public Notificacao() {
    }
    
    /*
            String dateStr = request.getParameter("dataNasc");
            //Date date = df.parse(dateStr);
            //df = new SimpleDateFormat("dd-MM-yyyy");
            SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
            //Date date = df.parse(dateStr);
            //Date result = formater.parse(dateStr);
            //SimpleDateFormat AppDateFormat = new SimpleDateFormat("dd-MM-yyyy");
            //System.out.println(AppDateFormat.format(result))
            dataNasc = formatter.parse(dateStr);*/
    

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getTituloRemetente() {
        return tituloRemetente;
    }

    public void setTituloRemetente(String tituloRemetente) {
        this.tituloRemetente = tituloRemetente;
    }

    public String getMensagemdoRemetente() {
        return mensagemdoRemetente;
    }

    public void setMensagemdoRemetente(String mensagemdoRemetente) {
        this.mensagemdoRemetente = mensagemdoRemetente;
    }

    public String getTituloDestinatario() {
        return tituloDestinatario;
    }

    public void setTituloDestinatario(String tituloDestinatario) {
        this.tituloDestinatario = tituloDestinatario;
    }

    public String getMensagemdoDestinatario() {
        return mensagemdoDestinatario;
    }

    public void setMensagemdoDestinatario(String mensagemdoDestinatario) {
        this.mensagemdoDestinatario = mensagemdoDestinatario;
    }

    public Usuario getDestinatario() {
        return destinatario;
    }

    public void setDestinatario(Usuario destinatario) {
        this.destinatario = destinatario;
    }
    
    
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.br.OMT.models;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

/**
 *
 * @author daniela
 */
@Entity
@Table(name = "areadeatuacao")
public class AreadeAtuacao implements Serializable {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    Long id;
    
    @Column(name = "nome", nullable = false, length = 200)
    String nome;
    
    @Column(name = "situacao")
    String situacao;
    
    @ManyToOne
    @JoinColumn(name = "discente", nullable = false)
    private Discente discente;

    public Discente getDiscente() {
        return discente;
    }

    public void setDiscente(Discente discente) {
        this.discente = discente;
    }

    @Transient
    private static AreadeAtuacao getInstance;

    public AreadeAtuacao() {
    }

    public static AreadeAtuacao getInstance() {
        if (getInstance == null) {
            getInstance = new AreadeAtuacao();
        }
        return getInstance;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getSituacao() {
        return situacao;
    }

    public void setSituacao(String situacao) {
        this.situacao = situacao;
    }

    public static AreadeAtuacao getGetInstance() {
        return getInstance;
    }

    public static void setGetInstance(AreadeAtuacao getInstance) {
        AreadeAtuacao.getInstance = getInstance;
    }
    

}

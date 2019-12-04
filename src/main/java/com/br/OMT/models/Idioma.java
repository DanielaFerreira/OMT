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
@Table(name = "idioma")
public class Idioma implements Serializable {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    Long id;
    
    @Column(name = "nome", nullable = false, length = 200)
    String nome;
    
    @Column(name = "situacao", nullable = false)
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
    private static Idioma getInstance;

    public Idioma() {
    }

    public static Idioma getInstance() {
        if (getInstance == null) {
            getInstance = new Idioma();
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

    
    
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.br.OMT.models;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.*;

@Entity
@Table(name = "trabalho")
public class Trabalho implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "profissao", nullable = false, length = 50)
    private String profissao;

    @Column(name = "salario", nullable = false)
    private Double salario;

    @Column(name = "descricao", nullable = false)
    private String descricao;

    @Column(name = "quantidadeVagas", nullable = false)
    private int quantidadeVagas;

    @Column(name = "tempoInicio", nullable = true)
    @Temporal(TemporalType.TIMESTAMP)
    private Date tempoInicio;

    @Column(name = "tempoFinal", nullable = true)
    @Temporal(TemporalType.TIMESTAMP)
    private Date tempoFinal;

    @Column(name = "tipo")
    private String tipo;

    @OneToOne(mappedBy = "trabalho")
    private CandidatoVaga candidatoVaga;

    @ManyToOne
    @JoinColumn(name = "entidade")
    private Entidade entidade;

    @Transient
    private static Trabalho getInstance;

    public Trabalho() {
    }

    public static Trabalho getInstance() {
        if (getInstance == null) {
            getInstance = new Trabalho();
        }
        return getInstance;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getProfissao() {
        return profissao;
    }

    public void setProfissao(String profissao) {
        this.profissao = profissao;
    }

    public Double getSalario() {
        return salario;
    }

    public void setSalario(Double salario) {
        this.salario = salario;
    }
    
    
    public int getQuantidadeVagas() {
        return quantidadeVagas;
    }

    public void setQuantidadeVagas(int quantidadeVagas) {
        this.quantidadeVagas = quantidadeVagas;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public Date getTempoInicio() {
        return tempoInicio;
    }

    public void setTempoInicio(Date tempoInicio) {
        this.tempoInicio = tempoInicio;
    }

    public Date getTempoFinal() {
        return tempoFinal;
    }

    public void setTempoFinal(Date tempoFinal) {
        this.tempoFinal = tempoFinal;
    }

    public CandidatoVaga getCandidatoVaga() {
        return candidatoVaga;
    }

    public void setCandidatoVaga(CandidatoVaga candidatoVaga) {
        this.candidatoVaga = candidatoVaga;
    }

    public Entidade getEntidade() {
        return entidade;
    }

    public void setEntidade(Entidade entidade) {
        this.entidade = entidade;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

}

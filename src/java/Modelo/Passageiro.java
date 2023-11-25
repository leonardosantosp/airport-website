package Modelo;

import java.util.Calendar;

public class Passageiro {
    private Integer idPassageiro;
    private String nome,telefone,cpf;
    private Calendar nascimento;
    private Cidade cidade = new Cidade();

    public Integer getIdPassageiro() {
        return idPassageiro;
    }

    public void setIdPassageiro(Integer idPassageiro) {
        this.idPassageiro = idPassageiro;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getTelefone() {
        return telefone;
    }

    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }

    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    public Calendar getNascimento() {
        return nascimento;
    }

    public void setNascimento(Calendar nascimento) {
        this.nascimento = nascimento;
    }

    public Cidade getCidade() {
        return cidade;
    }

    public void setCidade(Cidade cidade) {
        this.cidade = cidade;
    }
    
    
    
}

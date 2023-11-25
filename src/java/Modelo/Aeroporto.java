package Modelo;

public class Aeroporto {
    private Integer idAeroporto;
    private String nome, endereco;
    private Cidade cidade = new Cidade();

    public Integer getIdAeroporto() {
        return idAeroporto;
    }

    public void setIdAeroporto(Integer idAeroporto) {
        this.idAeroporto = idAeroporto;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getEndereco() {
        return endereco;
    }

    public void setEndereco(String endereco) {
        this.endereco = endereco;
    }

    public Cidade getCidade() {
        return cidade;
    }

    public void setCidade(Cidade cidade) {
        this.cidade = cidade;
    }
    
    
    
}

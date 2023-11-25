package Modelo;

public class PassageiroViagem {
    private Integer idPassageiroViagem,idviagem;
    private double precoViagem;
    private Passageiro passageiro = new Passageiro();
    private Classe classe = new Classe();

    public Integer getIdPassageiroViagem() {
        return idPassageiroViagem;
    }

    public void setIdPassageiroViagem(Integer idPassageiroViagem) {
        this.idPassageiroViagem = idPassageiroViagem;
    }

    public double getPrecoViagem() {
        return precoViagem;
    }

    public void setPrecoViagem(double precoViagem) {
        this.precoViagem = precoViagem;
    }

    public Passageiro getPassageiro() {
        return passageiro;
    }

    public void setPassageiro(Passageiro passageiro) {
        this.passageiro = passageiro;
    }

    public Classe getClasse() {
        return classe;
    }

    public void setClasse(Classe classe) {
        this.classe = classe;
    }

    public Integer getIdviagem() {
        return idviagem;
    }

    public void setIdviagem(Integer idviagem) {
        this.idviagem = idviagem;
    }

}
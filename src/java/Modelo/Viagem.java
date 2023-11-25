package Modelo;

import java.util.Calendar;

public class Viagem {
    private Integer idViagem;
    private String linhaAerea;
    private Calendar data;
    private Rota rota = new Rota();

    public Integer getIdViagem() {
        return idViagem;
    }

    public void setIdViagem(Integer idViagem) {
        this.idViagem = idViagem;
    }

    public String getLinhaAerea() {
        return linhaAerea;
    }

    public void setLinhaAerea(String linhaAerea) {
        this.linhaAerea = linhaAerea;
    }

    public Calendar getData() {
        return data;
    }

    public void setData(Calendar data) {
        this.data = data;
    }

    public Rota getRota() {
        return rota;
    }

    public void setRota(Rota rota) {
        this.rota = rota;
    }

}

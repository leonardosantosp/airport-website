package Modelo;

public class Rota {
    private Integer idRota;
    private Cidade localSaida = new Cidade();
    private Cidade destino = new Cidade();
    private Aviao aviao = new Aviao();
    private double distanciaRota;
    private Aeroporto aeroportoSaida = new Aeroporto();
    private Aeroporto aeroportoDestino = new Aeroporto();

    public Integer getIdRota() {
        return idRota;
    }

    public void setIdRota(Integer idRota) {
        this.idRota = idRota;
    }

    public Cidade getLocalSaida() {
        return localSaida;
    }

    public void setLocalSaida(Cidade localSaida) {
        this.localSaida = localSaida;
    }

    public Cidade getDestino() {
        return destino;
    }

    public void setDestino(Cidade destino) {
        this.destino = destino;
    }

    public Aviao getAviao() {
        return aviao;
    }

    public void setAviao(Aviao aviao) {
        this.aviao = aviao;
    }

    public double getDistanciaRota() {
        return distanciaRota;
    }

    public void setDistanciaRota(double distanciaRota) {
        this.distanciaRota = distanciaRota;
    }

    public Aeroporto getAeroportoSaida() {
        return aeroportoSaida;
    }

    public void setAeroportoSaida(Aeroporto aeroportoSaida) {
        this.aeroportoSaida = aeroportoSaida;
    }

    public Aeroporto getAeroportoDestino() {
        return aeroportoDestino;
    }

    public void setAeroportoDestino(Aeroporto aeroportoDestino) {
        this.aeroportoDestino = aeroportoDestino;
    }

    
    
    
}

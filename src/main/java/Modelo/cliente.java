package Modelo;

public class cliente {

    private String cltId;
    private String cltEstado;
    private String cltCorreo;
    private String cltContraseña;

    public cliente() {
    }

    public cliente(String cltId, String cltEstado, String cltCorreo, String cltContraseña) {
        this.cltId = cltId;
        this.cltEstado = cltEstado;
        this.cltCorreo = cltCorreo;
        this.cltContraseña = cltContraseña;
    }

    public String getCltId() {
        return cltId;
    }

    public void setCltId(String cltId) {
        this.cltId = cltId;
    }

    public String getCltEstado() {
        return cltEstado;
    }

    public void setCltEstado(String cltEstado) {
        this.cltEstado = cltEstado;
    }

    public String getCltCorreo() {
        return cltCorreo;
    }

    public void setCltCorreo(String cltCorreo) {
        this.cltCorreo = cltCorreo;
    }

    public String getCltContraseña() {
        return cltContraseña;
    }

    public void setCltContraseña(String cltContraseña) {
        this.cltContraseña = cltContraseña;
    }

    @Override
    public String toString() {
        return "cliente{" + "cltId=" + cltId + ", cltEstado=" + cltEstado + ", cltCorreo=" + cltCorreo + ", cltContrase\u00f1a=" + cltContraseña + '}';
    }

}

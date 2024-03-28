
package Modelo;

public class cliente {
    private String cltId;
    private String cltCorreo;
    private String cltContraseña;

    public cliente() {
    }

    public String getCltId() {
        return cltId;
    }

    public void setCltId(String cltId) {
        this.cltId = cltId;
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

    public cliente(String cltId, String cltCorreo, String cltContraseña) {
        this.cltId = cltId;
        this.cltCorreo = cltCorreo;
        this.cltContraseña = cltContraseña;
    }

   
}

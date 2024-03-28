
package Modelo;

public class cotizante {
    private String cotizanteCorreo;
    private String cotizanteNombre;
    private String cotizanteApellido;
    private String cotizanteTelefono;

    public cotizante() {
    }

    public cotizante(String cotizanteCorreo, String cotizanteNombre, String cotizanteApellido, String cotizanteTelefono) {
        this.cotizanteCorreo = cotizanteCorreo;
        this.cotizanteNombre = cotizanteNombre;
        this.cotizanteApellido = cotizanteApellido;
        this.cotizanteTelefono = cotizanteTelefono;
    }

    public String getCotizanteCorreo() {
        return cotizanteCorreo;
    }

    public void setCotizanteCorreo(String cotizanteCorreo) {
        this.cotizanteCorreo = cotizanteCorreo;
    }

    public String getCotizanteNombre() {
        return cotizanteNombre;
    }

    public void setCotizanteNombre(String cotizanteNombre) {
        this.cotizanteNombre = cotizanteNombre;
    }

    public String getCotizanteApellido() {
        return cotizanteApellido;
    }

    public void setCotizanteApellido(String cotizanteApellido) {
        this.cotizanteApellido = cotizanteApellido;
    }

    public String getCotizanteTelefono() {
        return cotizanteTelefono;
    }

    public void setCotizanteTelefono(String cotizanteTelefono) {
        this.cotizanteTelefono = cotizanteTelefono;
    }
    
}

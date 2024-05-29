
package Modelo;

public class administrador {
    private int adminId;
    private String adminCorreo;
    private String adminContraseña;

    public administrador() {
    }

    public int getAdminId() {
        return adminId;
    }

    public void setAdminId(int adminId) {
        this.adminId = adminId;
    }

    public String getAdminCorreo() {
        return adminCorreo;
    }

    public void setAdminCorreo(String adminCorreo) {
        this.adminCorreo = adminCorreo;
    }

    public String getAdminContraseña() {
        return adminContraseña;
    }

    public void setAdminContraseña(String adminContraseña) {
        this.adminContraseña = adminContraseña;
    }

    public administrador(int adminId, String adminCorreo, String adminContraseña) {
        this.adminId = adminId;
        this.adminCorreo = adminCorreo;
        this.adminContraseña = adminContraseña;
    }

   
}

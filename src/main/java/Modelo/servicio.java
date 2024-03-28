/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

/**
 *
 * @author Felipe Rodriguez
 */
public class servicio {
    private String servicioId;
    private int servicioValor;
    private String servicioTipo;
    private String servicioDescripcion;

    public servicio() {
    }

    public servicio(String servicioId, int servicioValor, String servicioTipo, String servicioDescripcion) {
        this.servicioId = servicioId;
        this.servicioValor = servicioValor;
        this.servicioTipo = servicioTipo;
        this.servicioDescripcion = servicioDescripcion;
    }

    public String getServicioId() {
        return servicioId;
    }

    public void setServicioId(String servicioId) {
        this.servicioId = servicioId;
    }

    public int getServicioValor() {
        return servicioValor;
    }

    public void setServicioValor(int servicioValor) {
        this.servicioValor = servicioValor;
    }

    public String getServicioTipo() {
        return servicioTipo;
    }

    public void setServicioTipo(String servicioTipo) {
        this.servicioTipo = servicioTipo;
    }

    public String getServicioDescripcion() {
        return servicioDescripcion;
    }

    public void setServicioDescripcion(String servicioDescripcion) {
        this.servicioDescripcion = servicioDescripcion;
    }
    
    
}

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

public class cotizacionServicio {
    private cotizacion cotizacion;
    private servicio servicio;
    private int cantidad;
    private int precioTotal;

    public cotizacionServicio() {
    }

    public cotizacionServicio(cotizacion cotizacion, servicio servicio, int cantidad, int precioTotal) {
        this.cotizacion = cotizacion;
        this.servicio = servicio;
        this.cantidad = cantidad;
        this.precioTotal = precioTotal;
    }

    public cotizacion getCotizacion() {
        return cotizacion;
    }

    public void setCotizacion(cotizacion cotizacion) {
        this.cotizacion = cotizacion;
    }

    public servicio getServicio() {
        return servicio;
    }

    public void setServicio(servicio servicio) {
        this.servicio = servicio;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public int getPrecioTotal() {
        return precioTotal;
    }

    public void setPrecioTotal(int precioTotal) {
        this.precioTotal = precioTotal;
    }
    
}

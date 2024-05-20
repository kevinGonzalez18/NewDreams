/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

/**
 *
 * @author kevin
 */
public class eventoServicio {
    
    private evento evento;
    private servicio servicio;
    private int cantidad;
    private int precioTotal;

    public eventoServicio(evento evento, servicio servicio, int cantidad, int precioTotal) {
        this.evento = evento;
        this.servicio = servicio;
        this.cantidad = cantidad;
        this.precioTotal = precioTotal;
    }

    public eventoServicio() {
    }
    
    

    public evento getEvento() {
        return evento;
    }

    public void setEvento(evento evento) {
        this.evento = evento;
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

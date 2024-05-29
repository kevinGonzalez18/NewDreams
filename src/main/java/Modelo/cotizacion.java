/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

import java.util.Date;

/**
 *
 * @author Felipe Rodriguez
 */
public class cotizacion {
    private String codigoCotizacion;
    private String tipoCotizacion;
    private String ubicacion;
    private Date fechaParcialEvento;
    private Date fechaCotizacion;
    private int valorCotizacion;
    private int cantidadPersonas;
    private String correo;

    public cotizacion(String codigoCotizacion, String tipoCotizacion, String ubicacion, Date fechaParcialEvento, Date fechaCotizacion, int valorCotizacion, int cantidadPersonas, String correo) {
        this.codigoCotizacion = codigoCotizacion;
        this.tipoCotizacion = tipoCotizacion;
        this.ubicacion = ubicacion;
        this.fechaParcialEvento = fechaParcialEvento;
        this.fechaCotizacion = fechaCotizacion;
        this.valorCotizacion = valorCotizacion;
        this.cantidadPersonas = cantidadPersonas;
        this.correo = correo;
    }

    public cotizacion() {
    }

    public String getCodigoCotizacion() {
        return codigoCotizacion;
    }

    public void setCodigoCotizacion(String codigoCotizacion) {
        this.codigoCotizacion = codigoCotizacion;
    }

    public String getTipoCotizacion() {
        return tipoCotizacion;
    }

    public void setTipoCotizacion(String tipoCotizacion) {
        this.tipoCotizacion = tipoCotizacion;
    }

    public String getUbicacion() {
        return ubicacion;
    }

    public void setUbicacion(String ubicacion) {
        this.ubicacion = ubicacion;
    }

    public Date getFechaParcialEvento() {
        return fechaParcialEvento;
    }

    public void setFechaParcialEvento(Date fechaParcialEvento) {
        this.fechaParcialEvento = fechaParcialEvento;
    }

    public Date getFechaCotizacion() {
        return fechaCotizacion;
    }

    public void setFechaCotizacion(Date fechaCotizacion) {
        this.fechaCotizacion = fechaCotizacion;
    }

    public int getValorCotizacion() {
        return valorCotizacion;
    }

    public void setValorCotizacion(int valorCotizacion) {
        this.valorCotizacion = valorCotizacion;
    }

    public int getCantidadPersonas() {
        return cantidadPersonas;
    }

    public void setCantidadPersonas(int cantidadPersonas) {
        this.cantidadPersonas = cantidadPersonas;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }
}

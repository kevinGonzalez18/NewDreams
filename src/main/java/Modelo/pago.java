/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

import java.util.Date;

/**
 *
 * @author kevin
 */
public class pago {

    private String idPagos;
    private int referente;
    private Date fechaPagos;
    private int valorPagos;

    public pago(String idPagos, int referente, Date fechaPagos, int valorPagos) {
        this.idPagos = idPagos;
        this.referente = referente;
        this.fechaPagos = fechaPagos;
        this.valorPagos = valorPagos;
    }

    public pago() {
    }

    public String getIdPagos() {
        return idPagos;
    }

    public void setIdPagos(String idPagos) {
        this.idPagos = idPagos;
    }

    public int getReferente() {
        return referente;
    }

    public void setReferente(int referente) {
        this.referente = referente;
    }

    public Date getFechaPagos() {
        return fechaPagos;
    }

    public void setFechaPagos(Date fechaPagos) {
        this.fechaPagos = fechaPagos;
    }

    public int getValorPagos() {
        return valorPagos;
    }

    public void setValorPagos(int valorPagos) {
        this.valorPagos = valorPagos;
    }

}

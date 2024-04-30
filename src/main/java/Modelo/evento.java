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
public class evento {
    
    private int eventoId;
    private String tipoEvento;
    private int valorEvento;
    private Date fechaEvento;
    private String estadoEvento;
    private String tematicaEvento;
    private String descripccionEvento;
    
    public evento() {
    }

    public evento(int eventoId, String tipoEvento, int valorEvento, Date fechaEvento, String estadoEvento, String tematicaEvento, String descripccionEvento) {
        this.eventoId = eventoId;
        this.tipoEvento = tipoEvento;
        this.valorEvento = valorEvento;
        this.fechaEvento = fechaEvento;
        this.estadoEvento = estadoEvento;
        this.tematicaEvento = tematicaEvento;
        this.descripccionEvento = descripccionEvento;
    }

    public int getEventoId() {
        return eventoId;
    }

    public void setEventoId(int eventoId) {
        this.eventoId = eventoId;
    }

    public String getTipoEvento() {
        return tipoEvento;
    }

    public void setTipoEvento(String tipoEvento) {
        this.tipoEvento = tipoEvento;
    }

    public int getValorEvento() {
        return valorEvento;
    }

    public void setValorEvento(int valorEvento) {
        this.valorEvento = valorEvento;
    }

    public Date getFechaEvento() {
        return fechaEvento;
    }

    public void setFechaEvento(Date fechaEvento) {
        this.fechaEvento = fechaEvento;
    }

    public String getEstadoEvento() {
        return estadoEvento;
    }

    public void setEstadoEvento(String estadoEvento) {
        this.estadoEvento = estadoEvento;
    }

    public String getTematicaEvento() {
        return tematicaEvento;
    }

    public void setTematicaEvento(String tematicaEvento) {
        this.tematicaEvento = tematicaEvento;
    }

    public String getDescripccionEvento() {
        return descripccionEvento;
    }

    public void setDescripccionEvento(String descripccionEvento) {
        this.descripccionEvento = descripccionEvento;
    }
            
    
}

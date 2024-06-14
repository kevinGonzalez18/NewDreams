/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

import java.sql.Timestamp;
import java.util.Date;

/**
 *
 * @author kevin
 */
public class evento {
    
    private int eventoId;
    private String tipoEvento;
    private int valorEvento;
    private Timestamp fechaEvento;
    private String estadoEvento;
    private String tematicaEvento;
    private String descripcionEvento;
    private int valorFinal;
    
    public evento() {
    }

    public evento(int eventoId, String tipoEvento, int valorEvento, Timestamp fechaEvento, String estadoEvento, String tematicaEvento, String descripcionEvento) {
        this.eventoId = eventoId;
        this.tipoEvento = tipoEvento;
        this.valorEvento = valorEvento;
        this.fechaEvento = fechaEvento;
        this.estadoEvento = estadoEvento;
        this.tematicaEvento = tematicaEvento;
        this.descripcionEvento = descripcionEvento;
        this.valorFinal = valorFinal;
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

    public void setFechaEvento(Timestamp fechaEvento) {
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

    public String getDescripcionEvento() {
        return descripcionEvento;
    }

    public void setDescripcionEvento(String descripccionEvento) {
        this.descripcionEvento = descripccionEvento;
    }

    public int getValorFinal() {
        return valorFinal;
    }

    public void setValorFinal(int valorFinal) {
        this.valorFinal = valorFinal;
    }
    
            
    
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package practica_repaso.ejercicio1;

/**
 *
 * @author Valentin
 */
public class Subsidio {
    private double montoPedido;
    private String motivo;
    private boolean fueOtorgado;

    public Subsidio(double montoPedido, String motivo) {
        this.montoPedido = montoPedido;
        this.motivo = motivo;
        this.fueOtorgado = false;
    }

    public double getMontoPedido() {
        return montoPedido;
    }

    public void setMontoPedido(double montoPedido) {
        this.montoPedido = montoPedido;
    }

    public String getMotivo() {
        return motivo;
    }

    public void setMotivo(String motivo) {
        this.motivo = motivo;
    }

    public boolean isFueOtorgado() {
        return fueOtorgado;
    }

    public void setFueOtorgado(boolean fueOtorgado) {
        this.fueOtorgado = fueOtorgado;
    }
    
}

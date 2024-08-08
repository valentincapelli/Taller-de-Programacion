package finales.final_objetos_9_4_2024;

public class Poliza {
    private double monto;
    private double cuotaMensual;
    private Fecha fechaComienzo;
    private Fecha fechaFin;
    private Cliente dueño;
    
    public Poliza(double monto, double cuotaMensual, Fecha fechaComienzo, Fecha fechaFin, Cliente dueño) {
        this.monto = monto;
        this.cuotaMensual = cuotaMensual;
        this.fechaComienzo = fechaComienzo;
        this.fechaFin = fechaFin;
        this.dueño = dueño;
    }
    public double getMonto() {
        return monto;
    }
    public void setMonto(double monto) {
        this.monto = monto;
    }
    public double getCuotaMensual() {
        return cuotaMensual;
    }
    public void setCuotaMensual(double cuotaMensual) {
        this.cuotaMensual = cuotaMensual;
    }
    public Fecha getFechaComienzo() {
        return fechaComienzo;
    }
    public void setFechaComienzo(Fecha fechaComienzo) {
        this.fechaComienzo = fechaComienzo;
    }
    public Fecha getFechaFin() {
        return fechaFin;
    }
    public void setFechaFin(Fecha fechaFin) {
        this.fechaFin = fechaFin;
    }
    public Cliente getDueño() {
        return dueño;
    }
    public void setDueño(Cliente dueño) {
        this.dueño = dueño;
    }
    @Override
    public String toString() {
        return "Poliza [monto=" + monto + ", cuotaMensual=" + cuotaMensual + ", fechaComienzo=" + fechaComienzo.toString()
                + ", fechaFin=" + fechaFin.toString() + ", dueño=" + dueño.toString() + "]";
    }

}

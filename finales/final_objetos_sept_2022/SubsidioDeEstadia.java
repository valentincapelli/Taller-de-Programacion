package finales.final_objetos_sept_2022;

public class SubsidioDeEstadia extends Subsidio{
    private String lugarDeDestino;
    private double costoEnPasajes;
    private int diasDeEstadia;
    private double montoHotelPorDia;
    
    public SubsidioDeEstadia(String nombreDelInvestigador, String planDeTrabajo, String fechaDeSolicitud,
            String lugarDeDestino, double costoEnPasajes, int diasDeEstadia, double montoHotelPorDia) {
        super(nombreDelInvestigador, planDeTrabajo, fechaDeSolicitud);
        this.lugarDeDestino = lugarDeDestino;
        this.costoEnPasajes = costoEnPasajes;
        this.diasDeEstadia = diasDeEstadia;
        this.montoHotelPorDia = montoHotelPorDia;
    }
    public String getLugarDeDestino() {
        return lugarDeDestino;
    }
    public void setLugarDeDestino(String lugarDeDestino) {
        this.lugarDeDestino = lugarDeDestino;
    }
    public double getCostoEnPasajes() {
        return costoEnPasajes;
    }
    public void setCostoEnPasajes(double costoEnPasajes) {
        this.costoEnPasajes = costoEnPasajes;
    }
    public int getDiasDeEstadia() {
        return diasDeEstadia;
    }
    public void setDiasDeEstadia(int diasDeEstadia) {
        this.diasDeEstadia = diasDeEstadia;
    }
    public double getMontoHotelPorDia() {
        return montoHotelPorDia;
    }
    public void setMontoHotelPorDia(double montoHotelPorDia) {
        this.montoHotelPorDia = montoHotelPorDia;
    }

    public double montoTotal(){
        return this.costoEnPasajes + (this.diasDeEstadia * this.montoHotelPorDia);
    }
    @Override
    public String toString() {
        return super.toString() + "SubsidioDeEstadia [getLugarDeDestino()=" + getLugarDeDestino() + ", getDiasDeEstadia()="
                + getDiasDeEstadia() + ", montoTotal()=" + montoTotal() + "]";
    }

}

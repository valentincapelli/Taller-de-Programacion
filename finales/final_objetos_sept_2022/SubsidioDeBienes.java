package finales.final_objetos_sept_2022;

public class SubsidioDeBienes extends Subsidio{
    private Bien vector[];
    private int cantBienes;
    private int cantMaxBienes;
    public SubsidioDeBienes(String nombreDelInvestigador, String planDeTrabajo, String fechaDeSolicitud,
            int cantMaxBienes) {
        super(nombreDelInvestigador, planDeTrabajo, fechaDeSolicitud);
        this.cantMaxBienes = cantMaxBienes;
        this.cantBienes = 0;
        this.vector = new Bien[this.cantMaxBienes];
        for (int i = 0; i < this.cantMaxBienes; i++)
            this.vector[i] = null;
    }

    public void agregarBien(Bien bien){
        if (this.cantBienes < this.cantMaxBienes){
            this.vector[this.cantBienes] = bien;
            this.cantBienes++;
        }
    }

    public double montoTotal(){
        double monto = 0;
        for (int i = 0; i < this.cantBienes; i++)
            monto += this.vector[i].getCantidad() * this.vector[i].getCostoPorUnidad();
        return monto;    
    }

    @Override
    public String toString() {
        String aux = "";
        aux += super.toString() + "SubsidioDeBienes [montoTotal()=" + montoTotal() + "]" + "\n";
        for (int i = 0; i < this.cantBienes; i++)
            aux += "Bien " + (i+1) + " " + this.vector[i].getDescripcion() + "\n";
        return aux;
    }

    
}

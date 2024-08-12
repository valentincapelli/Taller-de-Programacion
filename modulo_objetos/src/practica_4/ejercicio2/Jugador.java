package practica_4.ejercicio2;

public class Jugador extends Empleado{
    private double partidos;
    private double goles;
    public Jugador(String nombre, double sueldo, int antiguedad, double partidos, double goles) {
        super(nombre, sueldo, antiguedad);
        this.partidos = partidos;
        this.goles = goles;
    }
    public double getPartidos() {
        return partidos;
    }
    public void setPartidos(double partidos) {
        this.partidos = partidos;
    }
    public double getGoles() {
        return goles;
    }
    public void setGoles(double goles) {
        this.goles = goles;
    }
    @Override
    public String toString() {
        return super.toString() + 
        "Jugador [partidos=" + partidos + 
        ", goles=" + goles + "]";
    }
    public double calcularEfectividad(){
        return (this.partidos/this.goles);
    }

    @Override
    public double calcularSueldoACobrar(){
        double result = super.calcularSueldoACobrar();
        if (this.calcularEfectividad() > 0.5)
            result += super.getSueldo();
        return result;
    }
}

package practica_4.ejercicio2;

public class Entrenador extends Empleado{
    private int campeonatosGanados;

    public Entrenador(String nombre, double sueldo, int antiguedad, int campeonatosGanados) {
        super(nombre, sueldo, antiguedad);
        this.campeonatosGanados = campeonatosGanados;
    }
    public int getCampeonatosGanados() {
        return campeonatosGanados;
    }
    public void setCampeonatosGanados(int campeonatosGanados) {
        this.campeonatosGanados = campeonatosGanados;
    }
    @Override
    public String toString() {
        return super.toString() + 
        "Entrenador [campeonatosGanados=" + campeonatosGanados + "]";
    }
    public double calcularEfectividad(){
        return (super.getAntiguedad()/this.campeonatosGanados);
    }
    @Override
    public double calcularSueldoACobrar(){
        double result = super.calcularSueldoACobrar();
        if (this.campeonatosGanados >= 1 && this.campeonatosGanados <= 4)
            result += 5000;
        else if (this.campeonatosGanados >= 5 && this.campeonatosGanados <= 10)
            result += 30000;
        else if (this.campeonatosGanados > 10)
            result += 50000;
        return result;
    }
}

package practica_repaso.ejercicio4;

public class Director extends Persona{
    private int antiguedad;
    
    public Director(String nombre, String dni, int edad, int antiguedad) {
        super(nombre, dni, edad);
        this.antiguedad = antiguedad;
    }

    public int getAntiguedad() {
        return antiguedad;
    }

    public void setAntiguedad(int antiguedad) {
        this.antiguedad = antiguedad;
    }

    @Override
    public String toString() {
        return super.toString() + "Director [antiguedad=" + antiguedad + "]";
    }
    
    
}

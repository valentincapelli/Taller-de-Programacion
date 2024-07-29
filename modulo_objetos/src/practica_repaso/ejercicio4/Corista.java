package practica_repaso.ejercicio4;

public class Corista extends Persona{
    private int tono;

    public Corista(String nombre, String dni, int edad, int tono) {
        super(nombre, dni, edad);
        this.tono = tono;
    }

    public int getTono() {
        return tono;
    }

    public void setTono(int tono) {
        this.tono = tono;
    }

    @Override
    public String toString() {
        return super.toString() + "Corista [tono=" + tono + "]";
    }

    
}

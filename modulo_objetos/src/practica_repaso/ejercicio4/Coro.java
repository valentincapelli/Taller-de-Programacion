package practica_repaso.ejercicio4;

public abstract class Coro {
    private String nombre;
    private Director director;

    public Coro(Director director){
        this.director = director;
    }

    public String getNombre() {
        return nombre;
    }
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public Director getDirector() {
        return director;
    }

    public void setDirector(Director director) {
        this.director = director;
    }

    @Override
    public String toString() {
        return "Coro [nombre=" + nombre + ", director=" + director.toString() + "]";
    }

    public abstract void agregarCorista(Corista corista);

    public abstract boolean estaLleno();

    public abstract boolean estaBienFormado();

    
}

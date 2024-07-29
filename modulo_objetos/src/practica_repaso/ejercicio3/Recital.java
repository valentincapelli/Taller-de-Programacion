package practica_repaso.ejercicio3;

public abstract class Recital {
    private String nombreBanda;
    private String vector[];
    private int cantTemas;
    private int diml;

    public String getNombreBanda() {
        return nombreBanda;
    }
    public void setNombreBanda(String nombreBanda) {
        this.nombreBanda = nombreBanda;
    }
    public int getCantTemas() {
        return cantTemas;
    }

    public Recital(String nombreBanda, int cantTemas){
        this.nombreBanda = nombreBanda;
        this.cantTemas = cantTemas;
        this.vector = new String[cantTemas];
        this.diml = 0;
        for (int i = 0; i < cantTemas; i++)
            this.vector[i] = null;
    }

    public void agregarTema(String nombreTema){
        if (this.diml < this.cantTemas){
            this.vector[this.diml] = nombreTema;
            this.diml++;
        }else
            System.out.println("No se puede agregar mas temas.");
    }

    public void actuar(){
        String aux = "";
        for (int i = 0; i < this.diml; i++)
            aux += "y ahora tocaremos " + this.vector[i] + "\n";
        System.out.println(aux);
    }

    public abstract double calcularCosto();

}

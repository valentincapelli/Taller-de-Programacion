package practica_repaso.ejercicio3;

public class Gira extends Recital{
    private String nombreGira;
    private Fecha vector[];
    private int cantFechas;
    private int fechaActual;
    private int diml;

    public Gira(String nombreBanda, int cantTemas, String nombreGira, int cantFechas) {
        super(nombreBanda, cantTemas);
        this.nombreGira = nombreGira;
        this.cantFechas = cantFechas;
        this.vector = new Fecha[cantFechas];
        this.diml = 0;
        this.fechaActual = 0;
        for (int i = 0; i < cantFechas; i++)
            this.vector[i] = null;
    }

    public String getNombreGira() {
        return nombreGira;
    }
    public void setNombreGira(String nombreGira) {
        this.nombreGira = nombreGira;
    }
    public int getCantFechas() {
        return cantFechas;
    }
    public int getFechaActual() {
        return fechaActual;
    }
    public void setFechaActual(int fechaActual) {
        this.fechaActual = fechaActual;
    }
    public void agregarFecha(Fecha fecha){
        if (this.diml < this.cantFechas){
            this.vector[this.diml] = fecha;
            this.diml++;
        }else
            System.out.println("No se pueden agregar mas fechas.");
    }
    @Override
    public void actuar(){
        System.out.println("Buenas noches " + this.vector[this.fechaActual].getCiudad() + "\n");
        super.actuar();
        this.fechaActual++;
    }
    public double calcularCosto(){
        double res = 30000 * this.cantFechas;
        return res;
    }
}

package practica_repaso.ejercicio2;

public class Auto {
    private String nombreDueño;
    private String patente;

    public Auto(String nombreDueño, String patente) {
        this.nombreDueño = nombreDueño;
        this.patente = patente;
    }
    public String getNombreDueño() {
        return nombreDueño;
    }
    public void setNombreDueño(String nombreDueño) {
        this.nombreDueño = nombreDueño;
    }
    public String getPatente() {
        return patente;
    }
    public void setPatente(String patente) {
        this.patente = patente;
    }
    @Override
    public String toString() {
        return "Auto [nombreDueño=" + nombreDueño + ", patente=" + patente + "]";
    }

}

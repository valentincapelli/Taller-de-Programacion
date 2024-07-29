package practica_repaso.ejercicio3;

public class EventoOcasional extends Recital{
    private String motivo;
    private String contratante;
    private String dia;

    public EventoOcasional(String nombreBanda, int cantTemas, String motivo, String contratante, String dia) {
        super(nombreBanda, cantTemas);
        this.motivo = motivo;
        this.contratante = contratante;
        this.dia = dia;
    }

    public String getMotivo() {
        return motivo;
    }
    public void setMotivo(String motivo) {
        this.motivo = motivo;
    }
    public String getContratante() {
        return contratante;
    }
    public void setContratante(String contratante) {
        this.contratante = contratante;
    }
    public String getDia() {
        return dia;
    }
    public void setDia(String dia) {
        this.dia = dia;
    }
    @Override
    public void actuar(){
        if (this.motivo.equals("Show de beneficiencia")){
            System.out.println("Recuerden colaborar con " + this.contratante + ".");
        } else if (this.motivo.equals("Show de TV")){
            System.out.println("Saludos amigos televidentes.");
        } else if (this.motivo.equals("Show privado")){
            System.out.println("Un feliz cumpleaños para " + this.contratante);
        }
        super.actuar();
    }

    public double calcularCosto(){
        double res = -1;
        if (this.motivo.equals("Show de beneficiencia"))
            res = 0;
        else if (this.motivo.equals("Show de tv"))
            res = 50000;
        else if (this.motivo.equals("Show privado"))
            res = 150000;
        return res;
    }
}
package practica_4.ejercicio1;

public class Circulo extends Figura{
    private double diametro;
    private double radio;
    
    public Circulo(String unCR, String unCL, double diametro) {
        super(unCR, unCL);
        this.diametro = diametro;
        this.radio = diametro/2;
    }
    public double getDiametro() {
        return diametro;
    }
    public void setDiametro(double diametro) {
        this.diametro = diametro;
    }
    public double getRadio() {
        return radio;
    }
    public void setRadio(double radio) {
        this.radio = radio;
    }
    @Override
    public double calcularArea() {
        return 3.14 * (this.radio*this.radio);
    }
    @Override
    public double calcularPerimetro() {
        return 2 * 3.14 * this.radio;
    }
    @Override
    public String toString() {
        return super.toString() + 
        " Circulo [diametro=" + diametro + 
        ", radio=" + radio + "]";
    }
    
}

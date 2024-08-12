package tema4;

public class Triangulo extends Figura{
    private double lado1;
    private double lado2;
    private double lado3;

    public Triangulo(String unCR, String unCL, double lado1, double lado2, double lado3) {
        super(unCR, unCL);
        this.lado1 = lado1;
        this.lado2 = lado2;
        this.lado3 = lado3;
    }
    public double getLado1() {
        return lado1;
    }
    public void setLado1(double lado1) {
        this.lado1 = lado1;
    }
    public double getLado2() {
        return lado2;
    }
    public void setLado2(double lado2) {
        this.lado2 = lado2;
    }
    public double getLado3() {
        return lado3;
    }
    public void setLado3(double lado3) {
        this.lado3 = lado3;
    }
    @Override
    public double calcularArea() {
        return ((this.lado1 * this.lado2)/2);
    }
    @Override
    public double calcularPerimetro() {
        return this.lado1 + this.lado2 + this.lado3;
    }
    @Override
    public String toString(){
        return super.toString() + " Lado1=" + this.lado1 + 
                                " Lado2=" + this.lado2 + 
                                " Lado3=" + this.lado3;
    }
}
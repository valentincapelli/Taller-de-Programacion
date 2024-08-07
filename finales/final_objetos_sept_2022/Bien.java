package finales.final_objetos_sept_2022;

public class Bien {
    private String descripcion;
    private int cantidad;
    private double costoPorUnidad;
    
    public Bien(String descripcion, int cantidad, double costoPorUnidad) {
        this.descripcion = descripcion;
        this.cantidad = cantidad;
        this.costoPorUnidad = costoPorUnidad;
    }
    public String getDescripcion() {
        return descripcion;
    }
    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }
    public int getCantidad() {
        return cantidad;
    }
    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }
    public double getCostoPorUnidad() {
        return costoPorUnidad;
    }
    public void setCostoPorUnidad(double costoPorUnidad) {
        this.costoPorUnidad = costoPorUnidad;
    }
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package practica_repaso.ejercicio1;

/**
 *
 * @author Valentin
 */
public class Investigador {
    private String nombre;
    private int categoria;
    private String especialidad;
    private Subsidio vector[];
    private int cantSubsidios;

    public Investigador(String nombre, int categoria, String especialidad) {
        this.nombre = nombre;
        this.categoria = categoria;
        this.especialidad = especialidad;
        this.vector = new Subsidio[5];
        for (int i = 0; i < 5; i++)
            this.vector[i] = null;
        this.cantSubsidios = 0;
    }
    
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getCategoria() {
        return categoria;
    }

    public void setCategoria(int categoria) {
        this.categoria = categoria;
    }

    public String getEspecialidad() {
        return especialidad;
    }

    public void setEspecialidad(String especialidad) {
        this.especialidad = especialidad;
    }

    public int getCantSubsidios() {
        return cantSubsidios;
    }
    
    public void agregarSubsidio(Subsidio unSubsidio){
        if (this.cantSubsidios < 5){
            this.vector[cantSubsidios] = unSubsidio;
            this.cantSubsidios++;
        }else
            System.out.println("No queda lugar para agregar otro subsidio.");
    }
    
    public double montoTotal(){
        double total = 0;
        for (int i = 0; i < this.getCantSubsidios(); i++)
            total += this.vector[i].getMontoPedido();
        return total;
    }

    @Override
    public String toString() {
        return "Investigador{" + "nombre=" + nombre + ", categoria=" + categoria + ", especialidad=" + especialidad + ", Total de dinero de subsidios otorgados=" + montoTotal() +"}";
    }
    
}

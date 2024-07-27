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
public class Proyecto {

    private String nombre;
    private int codigo;
    private String nombreDirector;
    private Investigador vector[];
    private int cantInvestigadores;
    
    public Proyecto(String nombre, int codigo, String nombreDirector){
        this.nombre = nombre;
        this.codigo = codigo;
        this.nombreDirector = nombreDirector;
        this.vector = new Investigador [50];
        for (int i = 0; i < 50; i++)
            this.vector[i] = null;
        this.cantInvestigadores = 0;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public String getNombreDirector() {
        return nombreDirector;
    }

    public void setNombreDirector(String nombreDirector) {
        this.nombreDirector = nombreDirector;
    }

    public int getCantInvestigadores() {
        return cantInvestigadores;
    }
    
    public void agregarInvestigador(Investigador unInvestigador){
        if (this.cantInvestigadores < 50){
            this.vector[this.cantInvestigadores] = unInvestigador;
            cantInvestigadores++;
        }else 
            System.out.println("No queda lugar para agregar otro investigador.");
    }
    
    public double dineroTotalOtorgado(){
        double total = 0;
        for (int i = 0; i < this.cantInvestigadores; i++)
            total += this.vector[i].montoTotal();
        return total;
    }
    
    public void otorgarTodos(String nombre){
        int pos = 0;
        while (pos < this.cantInvestigadores && !this.vector[pos].getNombre().equals(nombre))
            pos++;
        if (pos < this.cantInvestigadores){
            for (int i = this.vector[pos].getCantSubsidios(); i < 5 ; i++)
                this.vector[pos].agregarSubsidio(new Subsidio(500, "Porque quiero"));
        }
    }

    @Override
    public String toString() {
        String aux = "";
        aux = "Proyecto{" + "nombre=" + nombre + ", codigo=" + codigo + ", nombreDirector=" + nombreDirector + ", dinero total otorgado del proyecto=" + dineroTotalOtorgado() + "\n";
        for (int i = 0; i < this.cantInvestigadores; i++)
            aux += this.vector[i].toString()+ "\n";
        return aux;
    }

    
}

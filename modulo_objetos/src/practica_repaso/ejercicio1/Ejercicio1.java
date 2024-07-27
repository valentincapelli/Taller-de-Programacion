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
public class Ejercicio1 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Proyecto P = new Proyecto("Ejemplo", 1, "Valentin");
        
        Investigador I1 = new Investigador("Fabio", 1, "Hacer nada");
        Investigador I2 = new Investigador("Fausto", 2, "Joder");
        Investigador I3 = new Investigador("Mamu", 3, "Crypto");
        
        P.agregarInvestigador(I1);
        P.agregarInvestigador(I2);
        P.agregarInvestigador(I3);
        
        I1.agregarSubsidio(new Subsidio(500, "porque soy crack"));
        I1.agregarSubsidio(new Subsidio(1200, "porque soy crack x2"));
        
        I2.agregarSubsidio(new Subsidio(500, "porque soy crack"));
        I2.agregarSubsidio(new Subsidio(500, "porque soy crack x2"));
        
        I3.agregarSubsidio(new Subsidio(777, "porque soy crack"));
        I3.agregarSubsidio(new Subsidio(777, "porque soy crack x2"));

        P.otorgarTodos("Mamu");
        
        System.out.println(P.toString());
        
    }
    
}

package practica_repaso.ejercicio4;

import PaqueteLectura.Lector;

public class Ejercicio4 {
    public static void main(String[] args) {
        System.out.println("Ingrese el largo x");
        int ejex = Lector.leerInt();
        System.out.println("Ingrese el largo y");
        int ejey = Lector.leerInt();
        CoroHileras CH =  new CoroHileras(new Director("Valentin", "45620", 20, 2), ejex, ejey);

        System.out.println("Ingrese el largo z");
        int ejez = Lector.leerInt();
        CoroSemicircular CS = new CoroSemicircular(new Director("Fabio", "44555", 21, 3), ejez);

        for (int i = 0; i < ejex; i++){
            for (int j = 0; j < ejey; j++){
                System.out.println("Ingrese el nombre del corista, dni, edad y tono");
                CH.agregarCorista(new Corista(Lector.leerString(), Lector.leerString(), Lector.leerInt(), Lector.leerInt()));
            }
        }

        for (int i = 0; i < ejez; i++){
            System.out.println("Ingrese el nombre del corista, dni, edad y tono");
            CS.agregarCorista(new Corista(Lector.leerString(), Lector.leerString(), Lector.leerInt(), Lector.leerInt()));
        }
        
        System.out.println("Informacion del coro por hileras");
        System.out.println(CH.toString());
        System.out.println("Esta bien formado? " + CH.estaBienFormado());
        
        System.out.println("Informacion del coro semicircular");
        System.out.println(CS.toString());
        System.out.println("Esta bien formado? " + CS.estaBienFormado());
    }
}
    


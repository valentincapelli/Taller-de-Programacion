package practica_4.ejercicio1;

public class Main {
    
    public static void main(String[] args) {
        Circulo C = new Circulo("azul", "rojo", 20);
    
        Triangulo T = new Triangulo("rojo", "blanco", 4, 5, 6);
    
        System.out.println(C.toString());
        C.despintar();
        System.out.println(C.toString());

        System.out.println(T.toString());
    }
}

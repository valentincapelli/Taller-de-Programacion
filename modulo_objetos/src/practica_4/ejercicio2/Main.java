package practica_4.ejercicio2;

public class Main {
    public static void main(String[] args) {
        Jugador J = new Jugador("Valentin", 10500, 5, 30, 30);
    
        Entrenador E = new Entrenador("Popovich", 34000, 30, 5);
        
        System.out.println(J.toString());

        System.out.println(E.toString());
    }
}

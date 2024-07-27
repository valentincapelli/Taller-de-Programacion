package practica_repaso.ejercicio2;

public class Ejercicio2 {
    
    public static void main(String[] args) {
        Estacionamiento E = new Estacionamiento("Parking", "Jonas 768", "07:00", "22:00", 3, 3);

        E.agregarAuto(new Auto("Mamu", "123"), 0, 0);
        E.agregarAuto(new Auto("Faus", "321"), 0, 1);
        E.agregarAuto(new Auto("Fabio", "333"), 1, 0);
        E.agregarAuto(new Auto("Dana", "111"), 1, 1);
        E.agregarAuto(new Auto("Marian", "122"), 1, 2);
        E.agregarAuto(new Auto("Santi", "222"), 2, 1);

        System.out.println(E.representacion());

        System.out.println("La cantidad de autos en la plaza 1 son: " + E.autosEnDichaPos(1));

        System.out.println(E.buscarAuto("122"));
    }

}

package finales.final_objetos_9_4_2024;

public class Main {
    public static void main(String[] args) {
    
    Compañia C = new Compañia(10, 20);

    C.agregarPoliza(new Poliza(100, 150, new Fecha(31, 3, 2020), new Fecha(31, 3, 2025), new Cliente(456, "Valentin", "Capelli")), 0);
    
    C.agregarPoliza(new Poliza(120, 160, new Fecha(1, 5, 2020), new Fecha(31, 3, 2025), new Cliente(45, "Travis", "Scott")), 3);
    C.agregarPoliza(new Poliza(170, 220, new Fecha(13, 6, 2020), new Fecha(31, 8, 2027), new Cliente(45, "Travis", "Scott")), 2);
    C.agregarPoliza(new Poliza(130, 170, new Fecha(3, 6, 2021), new Fecha(1, 3, 2025), new Cliente(45455, "Asap", "Rocky")), 4);
    C.agregarPoliza(new Poliza(140, 180, new Fecha(4, 7, 2020), new Fecha(3, 5, 2024), new Cliente(459, "Tyler", "The Creator")), 5);
    C.agregarPoliza(new Poliza(150, 190, new Fecha(6, 5, 2021), new Fecha(4, 4, 2024), new Cliente(4588, "Justin", "Bieber")), 8);

    System.out.println(C.infoCliente(45)); // se debe leer por teclado
    
    C.aumentarCuotas(11, 3);

    System.out.println(C.infoCliente(45));

    System.out.println("La cantidad de polizas que se vencen en Abril de 2024 son: " + C.cantidadAVencer(4, 2024));
}
}

package finales.final_objetos_18_3_2021;

public class Main {
    public static void main(String[] args) {
        Concurso C = new Concurso(2);

        Participante p1 = new Participante(1, "Valentin", 20);
        Participante p2 = new Participante(2, "Fausto", 27);
        Participante p3 = new Participante(3, "Fabio", 22);
        Participante p4 = new Participante(4, "Mariano", 24);

        Pareja Pareja1 = new Pareja(p1, p2, "Folklore");
        Pareja Pareja2 = new Pareja(p3, p4, "Tango");

        C.agregarPareja(Pareja1);
        C.agregarPareja(Pareja2);

        System.out.println(C.getParejaConMayorDirefenciaDeEdad());
    }
}

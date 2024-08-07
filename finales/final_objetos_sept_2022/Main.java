package finales.final_objetos_sept_2022;

public class Main {
    public static void main(String[] args) {
        SubsidioDeBienes sb = new SubsidioDeBienes("Valentin", "Programar", "2/8/2024", 5);
        sb.agregarBien(new Bien("Bien fachero", 3, 300));
        System.out.println(sb.toString());

        SubsidioDeEstadia se = new SubsidioDeEstadia("Fabio", "Programar", "1/8/2024", "La Plata", 3500, 3, 6500);
        System.out.println(se.toString());
    }
}

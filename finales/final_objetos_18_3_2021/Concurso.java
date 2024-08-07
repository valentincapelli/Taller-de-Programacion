package finales.final_objetos_18_3_2021;

public class Concurso {
    private Pareja vector[];
    private int dimf;
    private int diml;

    public Concurso(int dimf) {
        this.dimf = dimf;
        this.diml = 0;
        this.vector = new Pareja[dimf];
        for (int i = 0; i < this.dimf; i++)
            this.vector[i] = null;
    }

    public int getDiml() {
        return diml;
    }

    public void agregarPareja(Pareja pareja){
        this.vector[this.diml] = pareja;
        this.diml++;
    }

    public Pareja getParejaConMayorDirefenciaDeEdad(){
        Pareja p = null;
        int max = -1;
        for (int i = 0; i < this.diml; i++){
            int aux = this.vector[i].getDiferenciaDeEdad();
            if (aux > max){
                max = aux;
                p = this.vector[i];
            }
        }
        return p;
    }
}

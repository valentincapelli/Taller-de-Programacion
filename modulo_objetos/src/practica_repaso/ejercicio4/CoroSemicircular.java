package practica_repaso.ejercicio4;

public class CoroSemicircular extends Coro{
    private Corista vector[];
    private int diml;
    private int dimf;

    public CoroSemicircular(Director director, int x){
        super(director);
        this.diml = 0;
        this.dimf = x;
        this.vector = new Corista[x];
        for (int i = 0; i < x; i++){
            this.vector[i] = null;
        }
    }
    public int getDiml() {
        return diml;
    }
    public int getDimf() {
        return dimf;
    }
    public void agregarCorista(Corista corista){
        if (this.diml < this.dimf){
            this.vector[diml] = corista;
            diml++;
        } else
            System.out.println("No se pueden agregar mas coristas.");
    }

    public boolean estaLleno(){
        return this.diml == this.dimf;
    }

    public boolean estaBienFormado(){
        boolean result = true;
        int pos = 1;
        while (pos < this.diml && result){
            if (!(this.vector[pos].getTono() < this.vector[pos-1].getTono()))
                result = false;
        }
        return result;
    }

    @Override
    public String toString() {
        String result = super.toString() + "\n";
        for (int i = 0; i < this.diml; i++)
            result += this.vector[i].toString() + "\n";
        return result;
    }
}

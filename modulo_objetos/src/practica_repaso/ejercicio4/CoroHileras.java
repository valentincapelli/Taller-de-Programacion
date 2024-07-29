package practica_repaso.ejercicio4;

public class CoroHileras extends Coro{
    private Corista matriz[][];
    private int dimlX;
    private int dimlY;
    private int diml;
    private int dimf;
    private int x;
    private int y;

    public CoroHileras(Director director, int x, int y){
        super(director);
        this.diml = 0;
        this.dimf = x * y;
        this.dimlX = 0;
        this.dimlY = 0;
        this.x = x;
        this.y = y;
        this.matriz = new Corista[x][y];
        for (int i = 0; i < x; i++){
            for (int j = 0; j < y; j++)
                this.matriz[i][j] = null;
        }
    }

    public int getDiml() {
        return diml;
    }

    public int getDimf() {
        return dimf;
    }

    public int getX() {
        return x;
    }

    public int getY() {
        return y;
    }

    public void agregarCorista(Corista corista) {
    if (this.diml < this.dimf) {
        this.matriz[this.dimlX][this.dimlY] = corista;
        this.diml++;
        this.dimlY++;
        if (this.dimlY == this.y) {
            this.dimlY = 0;
            this.dimlX++;
        }
    }
}

    public boolean estaLleno(){
        return this.diml == this.dimf;
    }

    public boolean estaBienFormado(){ // doy por sentado que la matriz esta llena
        boolean result = true;
        int tonoActual;
        if (estaLleno()){
            for (int i = 0; i < this.x; i++){
                tonoActual = matriz[i][0].getTono();
                for (int j = 0; j < this.y; j++){
                    if (matriz[i][j].getTono() != tonoActual)
                        return false;
                }
                if (i > 0){
                    if (!(matriz[i][0].getTono() < matriz[i-1][0].getTono()))
                        return false;
                }
            }
        } else
            result = false;
        return result;
    }
    @Override
    public String toString() {
        String result = super.toString() + "\n";
        for (int i = 0; i < this.x; i++){
            for (int j = 0; j < this.y; j++)
                result += matriz[i][j].toString() + "\n";
        }
        return result;
    }
}

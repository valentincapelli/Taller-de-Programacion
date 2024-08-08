package finales.final_objetos_9_4_2024;

public class Compañia {
    private Poliza[][] matriz;
    private int cantFilas;
    private int cantColumnas;
    private int[] vectorDiml;

    public Compañia(int cantFilas, int cantColumnas) {
        this.cantFilas = cantFilas;
        this.cantColumnas = cantColumnas;
        this.matriz = new Poliza[cantFilas][cantColumnas];
        this.vectorDiml = new int[cantFilas];
        for (int i = 0; i < cantFilas; i++){
            for (int j = 0; j < cantColumnas; j++)
                this.matriz[i][j] = null;
            this.vectorDiml[i] = 0;
        }
    }
    public int getCantFilas() {
        return cantFilas;
    }
    public int getCantColumnas() {
        return cantColumnas;
    }
    public void agregarPoliza(Poliza unaPoliza, int unRubro){
        int diml = this.vectorDiml[unRubro];
        if (diml < this.cantColumnas){
            this.matriz[unRubro][diml] = unaPoliza;
            this.vectorDiml[unRubro]++;
        }
        else
            System.out.println("No hay mas lugar para polizas en ese rubro.");
        
    }
    public String infoCliente(int unDNI){
        String aux = "Las polizas para el DNI " + unDNI + " son: " + "\n";
        for (int i = 0; i < this.cantFilas; i++){
            for (int j = 0; j < this.vectorDiml[i]; j++){
                if (unDNI == this.matriz[i][j].getDueño().getDni())
                    aux += matriz[i][j].toString() + " Rubro="+ i + "\n"; // si quiero agregar rubro al toString seria la variable i
            }
        }
        return aux;
    }
    public void aumentarCuotas(double unPorcentaje, int unRubro){
        for (int i = 0; i < this.vectorDiml[unRubro]; i++){
            double cuotaActual = this.matriz[unRubro][i].getCuotaMensual();
            this.matriz[unRubro][i].setCuotaMensual(cuotaActual * (1 + (unPorcentaje/100)));
        }
    }
    public int cantidadAVencer(int mes, int año){
        int cant = 0;
        int añoMatriz;
        int mesMatriz;
        for (int i = 0; i < this.cantFilas; i++){
            for (int j = 0; j < this.vectorDiml[i]; j++){
                añoMatriz = this.matriz[i][j].getFechaFin().getAño();
                mesMatriz = this.matriz[i][j].getFechaFin().getMes();
                if (añoMatriz == año && mesMatriz == mes)
                    cant++;
            }
        }
        return cant;
    }
}
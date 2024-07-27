package practica_repaso.ejercicio2;

public class Estacionamiento {
    private String nombre;
    private String direccion;
    private String horaDeApertura;
    private String horaDeCierre;
    private Auto matriz [][];
    private int cantPisos;
    private int cantPlazas;
    private int diml;
    private int dimf;

    public Estacionamiento(String nombre, String direccion){
        this.nombre = nombre;
        this.direccion = direccion;
        this.horaDeApertura =  "8:00";
        this.horaDeCierre = "21:00";
        this.cantPisos = 5;
        this.cantPlazas = 10;
        this.matriz = new Auto[this.cantPisos][this.cantPlazas];
        for (int i = 0; i < this.cantPisos; i++){
            for (int j = 0; j < this.cantPlazas; j++)
                matriz[i][j] = null;
        }
        this.diml = 0;
        this.dimf = this.cantPisos * this.cantPlazas;
    }

    public Estacionamiento(String nombre, String direccion, String horaDeApertura, String horaDeCierre, int numeroDePisos, int numeroDePlazas){
        this.nombre = nombre;
        this.direccion = direccion;
        this.horaDeApertura =  horaDeApertura;
        this.horaDeCierre = horaDeCierre;
        this.cantPisos = numeroDePisos;
        this.cantPlazas = numeroDePlazas;
        this.matriz = new Auto[this.cantPisos][this.cantPlazas];
        for (int i = 0; i < this.cantPisos; i++){
            for (int j = 0; j < this.cantPlazas; j++)
                this.matriz[i][j] = null;
        }
        this.diml = 0;
        this.dimf = this.cantPisos * this.cantPlazas;
    }

    public String getNombre() {
        return nombre;
    }
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    public String getDireccion() {
        return direccion;
    }
    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }
    public String getHoraDeApertura() {
        return horaDeApertura;
    }
    public void setHoraDeApertura(String horaDeApertura) {
        this.horaDeApertura = horaDeApertura;
    }
    public String getHoraDeCierre() {
        return horaDeCierre;
    }
    public void setHoraDeCierre(String horaDeCierre) {
        this.horaDeCierre = horaDeCierre;
    }

    public void agregarAuto(Auto A, int pisoX, int plazaY){
        if (this.diml < this.dimf){
            matriz[pisoX][plazaY] = A;
            this.diml++;
        }else
            System.out.println("No hay mas lugar.");
    }

    public String buscarAuto(String patente){
        String result = "Auto inexistente";
        int pisoX = 0;
        int plazaY = 0;
        boolean ok = false;
        while (pisoX < this.cantPisos && !ok){
            while (plazaY < this.cantPlazas && !ok){
                if (matriz[pisoX][plazaY] != null){
                    if (matriz[pisoX][plazaY].getPatente().equals(patente)){
                        ok = true;
                        result = "El auto esta en el piso "+ pisoX + " en la plaza " + plazaY;
                    }
                }
                plazaY++;
            }
            plazaY = 0;
            pisoX++;
        }
        return result;
    }

    public String representacion(){
        String result = "";
        for (int i = 0; i < this.cantPisos; i++){
            for (int j = 0; j < this.cantPlazas; j++){
                result += "Piso "+ i + " Plaza " + j + " : "; 
                if (matriz[i][j] != null)
                    result += matriz[i][j].toString();
                else
                    result += "libre";
                result += "\n";
            }
        }
        return result;
    }

    public int autosEnDichaPos(int plazaY){
        int cant = 0;
        for (int i = 0; i < this.cantPisos; i++){
            if (matriz[i][plazaY] != null)
                cant++;
        }
        return cant;
    }

}

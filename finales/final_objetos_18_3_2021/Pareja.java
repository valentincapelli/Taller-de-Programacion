package finales.final_objetos_18_3_2021;

public class Pareja {
    private Participante participanteA;
    private Participante participanteB;
    private String estiloDeBaile;

    public Pareja(Participante participanteA, Participante participanteB, String estiloDeBaile) {
        this.participanteA = participanteA;
        this.participanteB = participanteB;
        this.estiloDeBaile = estiloDeBaile;
    }
    public Participante getParticipanteA() {
        return participanteA;
    }
    public void setParticipanteA(Participante participanteA) {
        this.participanteA = participanteA;
    }
    public Participante getParticipanteB() {
        return participanteB;
    }
    public void setParticipanteB(Participante participanteB) {
        this.participanteB = participanteB;
    }
    public String getEstiloDeBaile() {
        return estiloDeBaile;
    }
    public void setEstiloDeBaile(String estiloDeBaile) {
        this.estiloDeBaile = estiloDeBaile;
    }
    public int getDiferenciaDeEdad(){
        if (this.participanteA.getEdad() >= this.participanteB.getEdad())
            return this.participanteA.getEdad() - this.participanteB.getEdad();
        else
            return this.participanteB.getEdad() - this.participanteA.getEdad();
    }
    @Override
    public String toString() {
        return "Pareja [participanteA=" + participanteA.toString() + ", participanteB=" + participanteB.toString() + ", estiloDeBaile="
                + estiloDeBaile + "]";
    }
    
}
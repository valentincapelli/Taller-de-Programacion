package finales.final_objetos_sept_2022;

/**
 *
 * @author Valentin
 */
public abstract class Subsidio {
    private String nombreDelInvestigador;
    private String planDeTrabajo;
    private String fechaDeSolicitud;

    public Subsidio(String nombreDelInvestigador, String planDeTrabajo, String fechaDeSolicitud) {
        this.nombreDelInvestigador = nombreDelInvestigador;
        this.planDeTrabajo = planDeTrabajo;
        this.fechaDeSolicitud = fechaDeSolicitud;
    }
    public String getNombreDelInvestigador() {
        return nombreDelInvestigador;
    }
    public void setNombreDelInvestigador(String nombreDelInvestigador) {
        this.nombreDelInvestigador = nombreDelInvestigador;
    }
    public String getPlanDeTrabajo() {
        return planDeTrabajo;
    }
    public void setPlanDeTrabajo(String planDeTrabajo) {
        this.planDeTrabajo = planDeTrabajo;
    }
    public String getFechaDeSolicitud() {
        return fechaDeSolicitud;
    }
    public void setFechaDeSolicitud(String fechaDeSolicitud) {
        this.fechaDeSolicitud = fechaDeSolicitud;
    }

    public abstract double montoTotal();
    
    @Override
    public String toString() {
        return "Subsidio [nombreDelInvestigador=" + nombreDelInvestigador + ", planDeTrabajo=" + planDeTrabajo
                + ", fechaDeSolicitud=" + fechaDeSolicitud + "]";
    }

}
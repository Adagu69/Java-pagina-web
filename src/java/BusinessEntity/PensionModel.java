/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BusinessEntity;


public class PensionModel {
    String id_pensiones;
   String id_matricula;
   String id_alumno;
   String pen_mescod;
   String pen_monto;
   String pen_dscto;
   String pen_mora;  
   int pen_estcod;
   
   
    public PensionModel() {
       
       
       
    }

    public PensionModel(String id_pensiones, String id_matricula, String id_alumno, String pen_mescod, String pen_monto, String pen_dscto, String pen_mora, int pen_estcod) {
        this.id_pensiones = id_pensiones;
        this.id_matricula = id_matricula;
        this.id_alumno = id_alumno;
        this.pen_mescod = pen_mescod;
        this.pen_monto = pen_monto;
        this.pen_dscto = pen_dscto;
        this.pen_mora = pen_mora;
        this.pen_estcod = pen_estcod;
    }

    public String getId_pensiones() {
        return id_pensiones;
    }

    public void setId_pensiones(String id_pensiones) {
        this.id_pensiones = id_pensiones;
    }

    public String getId_matricula() {
        return id_matricula;
    }

    public void setId_matricula(String id_matricula) {
        this.id_matricula = id_matricula;
    }

    public String getId_alumno() {
        return id_alumno;
    }

    public void setId_alumno(String id_alumno) {
        this.id_alumno = id_alumno;
    }

    public String getPen_mescod() {
        return pen_mescod;
    }

    public void setPen_mescod(String pen_mescod) {
        this.pen_mescod = pen_mescod;
    }

    public String getPen_monto() {
        return pen_monto;
    }

    public void setPen_monto(String pen_monto) {
        this.pen_monto = pen_monto;
    }

    public String getPen_dscto() {
        return pen_dscto;
    }

    public void setPen_dscto(String pen_dscto) {
        this.pen_dscto = pen_dscto;
    }

    public String getPen_mora() {
        return pen_mora;
    }

    public void setPen_mora(String pen_mora) {
        this.pen_mora = pen_mora;
    }

    public int getPen_estcod() {
        return pen_estcod;
    }

    public void setPen_estcod(int pen_estcod) {
        this.pen_estcod = pen_estcod;
    }
    
    
    
    
}

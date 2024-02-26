/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package BusinessEntity;


public class NotasModel {
  String id_notas; 
  String id_matricula; 
  String id_alumno; 
  String id_seccion; 
  String id_aula; 
  String cur_codigo;  
  String not_observ;
  int not_estcod;
  Double not_valor;

    public NotasModel() {
    }


    public NotasModel(String id_notas, String id_matricula, String id_alumno, String id_seccion, String id_aula, String cur_codigo, String not_observ, int not_estcod, Double not_valor) {
        this.id_notas = id_notas;
        this.id_matricula = id_matricula;
        this.id_alumno = id_alumno;
        this.id_seccion = id_seccion;
        this.id_aula = id_aula;
        this.cur_codigo = cur_codigo;
        this.not_observ = not_observ;
        this.not_estcod = not_estcod;
        this.not_valor = not_valor;
    }

    public String getId_notas() {
        return id_notas;
    }

    public void setId_notas(String id_notas) {
        this.id_notas = id_notas;
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

    public String getId_seccion() {
        return id_seccion;
    }

    public void setId_seccion(String id_seccion) {
        this.id_seccion = id_seccion;
    }

    public String getId_aula() {
        return id_aula;
    }

    public void setId_aula(String id_aula) {
        this.id_aula = id_aula;
    }

    public String getCur_codigo() {
        return cur_codigo;
    }

    public void setCur_codigo(String cur_codigo) {
        this.cur_codigo = cur_codigo;
    }

    public String getNot_observ() {
        return not_observ;
    }

    public void setNot_observ(String not_observ) {
        this.not_observ = not_observ;
    }

    public int getNot_estcod() {
        return not_estcod;
    }

    public void setNot_estcod(int not_estcod) {
        this.not_estcod = not_estcod;
    }

    public Double getNot_valor() {
        return not_valor;
    }

    public void setNot_valor(Double not_valor) {
        this.not_valor = not_valor;
    }
  
  
    
}

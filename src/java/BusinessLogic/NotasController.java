/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package BusinessLogic;

import BusinessEntity.AulaBean;
import BusinessEntity.NivelBean;
import BusinessEntity.NivelBean;
import DataAccessObject.ConexionMySQL;
import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import BusinessEntity.NivelBean;
import BusinessEntity.NotasBean;
import DataAccessObject.ConexionMySQL;
import java.sql.CallableStatement;
import java.sql.SQLException;
import java.util.ArrayList;

public class NotasController extends ConexionMySQL implements IControllerBase<NotasBean> {
    
     @Override
    public NotasBean SelectByCodigo(String codigo) {
         NotasBean cBE = new NotasBean();//NULA
        String call="{call prcNotasSelectByCodigo(?)}";
        CallableStatement cstm=null;
        ResultSet res = null;
        try{
            cstm = getConexion().prepareCall(call);
            cstm.setString(1, codigo);
            res = cstm.executeQuery();            
            while(res.next()){
                
        cBE.setId_notas(res.getString("id_notas"));
        cBE.setId_matricula(res.getString("id_matricula")); 
        cBE.setId_alumno(res.getString("id_alumno"));
        cBE.setId_seccion(res.getString("id_seccion"));
        cBE.setCur_codigo(res.getString("cur_codigo"));
        cBE.setNot_observ(res.getString("not_observ"));
        cBE.setNot_estcod(Integer.parseInt(res.getString("not_estcod")));
        cBE.setNot_valor(Double.parseDouble(res.getString("not_valor")));
        
        
       
            }
        }catch(Exception e){
        System.out.println(e.getMessage());
        
        }
        System.out.println("ERROR AL CONSULTAR");
        return cBE;
    }

    @Override
    public boolean Insert(NotasBean input) {
        //String call="{call prcNotasInsert(?,?,?,?)}";
        //PreparedStatement pst = null;
        CallableStatement cstm=null;
        int res = 0 ;
        try{
            cstm = getConexion().prepareCall("{call prcNotasInsert(?,?,?,?,?,?,?,?)}");
            
            //cstm.setString(1, input.getId_notas());
            cstm.setString(1, input.getId_matricula());
            cstm.setString(2, input.getId_alumno());
            cstm.setString(3, input.getId_seccion());
            cstm.setString(4, input.getId_aula());
            cstm.setString(5, input.getNot_observ());
            cstm.setInt(6, input.getNot_estcod());
            cstm.setDouble(7, input.getNot_valor());
          
            
            res = cstm.executeUpdate();           
        }catch(SQLException e){
            System.out.println(e.getMessage());
        }
        return res != 0;
    }

    @Override
    public ArrayList<NotasBean> SelectAll() {
        
        ArrayList<NotasBean> lista = new ArrayList<NotasBean>();//NULA
        String call="{call prcNotasSelectAll()}";
        CallableStatement cstm = null;
        ResultSet res = null;
        try{
            cstm = getConexion().prepareCall(call);
            cstm.execute();
            res=cstm.getResultSet();
            while(res.next()){
                NotasBean cNotas = new NotasBean ();
                
                cNotas.setId_notas(res.getString("id_notas")); 
                cNotas.setId_matricula(res.getString("id_matricula"));  
                cNotas.setNombre_alumno(res.getString("alu_nombres"));
                cNotas.setDescri_seccion(res.getString("sec_descri"));
                cNotas.setDescri_aula(res.getString("aul_descri"));
                cNotas.setDescri_curso(res.getString("descripcion_curso"));
                cNotas.setNot_observ(res.getString("not_observ"));
                cNotas.setNot_estcod(res.getInt("not_estcod"));
                cNotas.setNot_valor(res.getDouble("not_valor"));

         
                lista.add(cNotas); //AGREGAMOS EL ITEM                
            }
        }catch(SQLException e){
            System.out.println(e.getMessage());
        }
        return lista; 
    }

    @Override
    public boolean Update(NotasBean input) {
         String call="{call prcNotasUpdate(?,?,?,?,?,?,?,?)}";
         CallableStatement cstm=null;
            int ResultSet = 0 ;
        try{
            cstm = getConexion().prepareCall(call);
            
            
            cstm.setString(1, input.getId_notas());
            cstm.setString(2, input.getId_matricula());
            cstm.setString(3, input.getId_alumno());
            cstm.setString(4, input.getId_seccion());
            cstm.setString(5, input.getId_aula());
            cstm.setString(6, input.getNot_observ());
            cstm.setInt(7, input.getNot_estcod());
            cstm.setDouble(8, input.getNot_valor());
            
            ResultSet = cstm.executeUpdate(); 
            
        }catch(SQLException e){
            System.out.println("Procedimiento no funcionable"+e.getMessage());
        }
       
        return ResultSet != 0;
     
    }

    @Override
    public boolean Delete(String codigo) {
        CallableStatement cstm=null;
        int ResultSet = 0 ;
        String call="{call prcNotasDelete(?)}";
        try{
            cstm = getConexion().prepareCall(call);
            cstm.setString(1, codigo);
            ResultSet = cstm.executeUpdate();     
            
        }catch(SQLException e){
            System.out.println("Error al eliminar"+e.getMessage());}
        return ResultSet != 0;
    }

    @Override
    public int validar(NotasBean input) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
    
}
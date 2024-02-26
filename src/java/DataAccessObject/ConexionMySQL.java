package DataAccessObject;
import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.DriverManager;
import java.sql.SQLException;


public class ConexionMySQL implements IConexionBase {
     // Cadena Conexion MySQLString 
    String StrConxMySQL= "jdbc:mysql://localhost:3307/mydb";
    String StrUserMySQL= "root";
    String StrPassMySQL= "";
    //Declaraciones de Variables
    Connection Conexion;
  public ConexionMySQL(){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            DriverManager.registerDriver(new com.mysql.jdbc.Driver());
            //DriverManager.setLoginTimeout(300);
            Conexion=DriverManager.getConnection(StrConxMySQL, StrUserMySQL, StrPassMySQL);
            if (Conexion != null) {                
                DatabaseMetaData dm = (DatabaseMetaData) Conexion.getMetaData();
                System.out.println(this.getClass().getName()+ ": Conexion con MySQL Establecida..");
                System.out.println("Driver name: " + dm.getDriverName());
                System.out.println("Driver version: " + dm.getDriverVersion());
                System.out.println("Product name: " + dm.getDatabaseProductName());
                System.out.println("Product version: " + dm.getDatabaseProductVersion());
                System.out.println("Conexión exitosa, funciones disponibles");
            }  
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(e.getMessage());
            System.out.println("ERROR AL CONECTAR");
        }
    }

   
   
   public static void main(String[] args) {
        ConexionMySQL Cn=new ConexionMySQL();
   }

    @Override
    public Connection getConexion() {
        return this.Conexion;
    }

}

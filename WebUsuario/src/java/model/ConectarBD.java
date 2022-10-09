package model;
import java.sql.Connection;
import java.sql.DriverManager;

public class ConectarBD {
    public static Connection con;
    private static String bd="dbempresa";
    public static String usuario="root";
    public static String password="usbw";
    public static String url="jdbc:mysql://localhost:3307/"+bd;
     public static Connection Abrir()
    {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection(url,usuario,password);
        } catch (Exception ex) {
            System.out.print("Error conexion:"+ex);
        }
    return con;
    }
    public static void Cerrar()
    {
        try {
            if (con!=null)
                con.close();
        } catch (Exception ex) {
            System.out.print("Error cerrar:"+ex);
        }
       
    }
}

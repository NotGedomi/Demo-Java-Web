package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;


public class GestorVenta {
    Connection conn;
    Statement stm;
    ResultSet rs;
    PreparedStatement pstm;
    int resultado = 0;
    String consulta = "";
    public ArrayList<CProducto> Leerventas() {
        ArrayList<CProducto> listaventas = new ArrayList<CProducto>();
        try {
            conn = ConectarBD.Abrir();
            stm = conn.createStatement();
            consulta = "select * from tbventas";
            rs = stm.executeQuery(consulta);
            while (rs.next()) {
                CProducto cproducto = new CProducto();
                cproducto.setCodigo(rs.getString("codigo"));
                cproducto.setDescripcion(rs.getString("descripcion"));
                cproducto.setPrecio(rs.getFloat("precio"));
                cproducto.setStock(rs.getInt("stock"));
                listaventas.add(cproducto);
            }
            ConectarBD.Cerrar();
            System.out.print("Listado conforme");
        } catch (Exception ex) {
            System.out.print("Error:" + ex);
        }
        return listaventas;
    }
    public Boolean InsertarVenta(String auxcodigo, String auxdescripcion, float auxprecio, int auxstock) {
        try {
            conn = ConectarBD.Abrir();
            consulta = "insert into tbventas values(?,?,?,?)";
            PreparedStatement pstm = conn.prepareStatement(consulta);
            pstm.setString(1, auxcodigo);
            pstm.setString(2, auxdescripcion);
            pstm.setFloat(3, auxprecio);
            pstm.setInt(4, auxstock);
            resultado = pstm.executeUpdate();
            if (resultado != 0) {
                ConectarBD.Cerrar();
                System.out.print("Conforme al insertar registro");
                return true;
            } else {
                ConectarBD.Cerrar();
                System.out.print("Error al insertar registro");
                return false;
            }
        } catch (Exception ex) {
            System.out.print("Error al insertar registro:" + ex);
            return false;
        }
    }
    public CProducto Buscar(String auxcodigo) {
        CProducto auxproducto = new CProducto();
        try {

            conn = ConectarBD.Abrir();
            stm = conn.createStatement();
            consulta = "select * from tbproductos where codigo='" + auxcodigo + "'";
            rs = stm.executeQuery(consulta);
            if (rs.next()) {
                System.out.print("Registro encontrado");
                auxproducto.setCodigo(rs.getString("codigo"));
                auxproducto.setDescripcion(rs.getString("descripcion"));
                auxproducto.setPrecio(rs.getFloat("precio"));
                auxproducto.setStock(rs.getInt("stock"));
            } else {
                System.out.print("Registro no encontrado");
            }
        } catch (Exception ex) {
            System.out.print("Error:" + ex);
        }
        return auxproducto;
    }
    public Boolean Eliminar(String auxcodigo) {
        try {
            conn = ConectarBD.Abrir();
            consulta = "delete from tbventas where codigo=?";
            PreparedStatement pstm = conn.prepareStatement(consulta);
            pstm.setString(1, auxcodigo);
            resultado = pstm.executeUpdate();
            if (resultado != 0) {
                ConectarBD.Cerrar();
                System.out.print("Conforme al eliminar registro");
                return true;
            } else {
                ConectarBD.Cerrar();
                System.out.print("Error al eliminar registro");
                return false;
            }
        } catch (Exception ex) {
            System.out.print("Error al eliminar registro:" + ex);
            return false;
        }
    }
    
    
}

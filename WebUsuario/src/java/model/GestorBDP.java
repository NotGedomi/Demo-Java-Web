package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class GestorBDP {

    Connection conn;
    Statement stm;
    ResultSet rs;
    PreparedStatement pstm;
    int resultado = 0;
    String consulta = "";

    public ArrayList<CProducto> Leerproductos() {
        ArrayList<CProducto> listaproductos = new ArrayList<CProducto>();
        try {
            conn = ConectarBD.Abrir();
            stm = conn.createStatement();
            consulta = "select * from tbproductos";
            rs = stm.executeQuery(consulta);
            while (rs.next()) {
                CProducto cproducto = new CProducto();
                cproducto.setCodigo(rs.getString("codigo"));
                cproducto.setDescripcion(rs.getString("descripcion"));
                cproducto.setPrecio(rs.getFloat("precio"));
                cproducto.setStock(rs.getInt("stock"));
                cproducto.setCrt(rs.getString("caracteristicas"));
                listaproductos.add(cproducto);
            }
            ConectarBD.Cerrar();
            System.out.print("Listado conforme");
        } catch (Exception ex) {
            System.out.print("Error:" + ex);
        }
        return listaproductos;
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
                auxproducto.setCrt(rs.getString("caracteristicas"));
            } else {
                System.out.print("Registro no encontrado");
            }
        } catch (Exception ex) {
            System.out.print("Error:" + ex);
        }
        return auxproducto;
    }

    public Boolean Insertar(String auxcodigo, String auxdescripcion, float auxprecio, int auxstock, String auxcrt) {
        try {
            conn = ConectarBD.Abrir();
            consulta = "insert into tbproductos values(?,?,?,?,?)";
            PreparedStatement pstm = conn.prepareStatement(consulta);
            pstm.setString(1, auxcodigo);
            pstm.setString(2, auxdescripcion);
            pstm.setFloat(3, auxprecio);
            pstm.setInt(4, auxstock);
            pstm.setString(5, auxcrt);
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

    public Boolean Eliminar(String auxcodigo) {
        try {
            conn = ConectarBD.Abrir();
            consulta = "delete from tbproductos where codigo=?";
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

    public Boolean Actualizar(String auxcodigo, String auxdescripcion, float auxprecio, int auxstock, String auxcrt) {
        try {
            conn = ConectarBD.Abrir();
            consulta = "update tbproductos set descripcion=?, precio=?, stock=?, caracteristicas=?"
                    + " where codigo=?";
            PreparedStatement pstm = conn.prepareStatement(consulta);
            pstm.setString(1, auxdescripcion);
            pstm.setFloat(2, auxprecio);
            pstm.setInt(3, auxstock);
            pstm.setString(4, auxcrt);
            pstm.setString(5, auxcodigo);
            resultado = pstm.executeUpdate();
            if (resultado != 0) {
                ConectarBD.Cerrar();
                System.out.print("Conforme al actualizar registro");
                return true;
            } else {
                ConectarBD.Cerrar();
                System.out.print("Error al actualizar registro");
                return false;
            }
        } catch (Exception ex) {
            System.out.print("Error al actualizar registro:" + ex);
            return false;
        }
    }

}

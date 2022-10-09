package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.sql.DriverManager;


public class GestorBD {

    Connection conn;
    Statement stm;
    ResultSet rs;
    PreparedStatement pstm;
    int resultado = 0;
    String consulta = "";

    public ArrayList<CUsuario> Leertodos() {
        ArrayList<CUsuario> listausuarios = new ArrayList<CUsuario>();
        try {
            conn = ConectarBD.Abrir();
            stm = conn.createStatement();
            consulta = "select * from tbusuarios";
            rs = stm.executeQuery(consulta);
            while (rs.next()) {
                CUsuario cusuario = new CUsuario();
                cusuario.setCuenta(rs.getString("cuenta"));
                cusuario.setNombre(rs.getString("nombre"));
                cusuario.setClave(rs.getString("clave"));
                cusuario.setEmail(rs.getString("email"));
                listausuarios.add(cusuario);
            }
            ConectarBD.Cerrar();
            System.out.print("Listado conforme");
        } catch (Exception ex) {
            System.out.print("Error:" + ex);
        }
        return listausuarios;
    }

    public CUsuario Buscar(String auxcuenta) {
        CUsuario auxusuario = new CUsuario();
        try {

            conn = ConectarBD.Abrir();
            stm = conn.createStatement();
            consulta = "select * from tbusuarios where cuenta='" + auxcuenta + "'";
            rs = stm.executeQuery(consulta);
            if (rs.next()) {
                System.out.print("Registro encontrado");
                auxusuario.setCuenta(rs.getString("cuenta"));
                auxusuario.setNombre(rs.getString("nombre"));
                auxusuario.setClave(rs.getString("clave"));
                auxusuario.setEmail(rs.getString("email"));
            } else {
                System.out.print("Registro no encontrado");
            }
        } catch (Exception ex) {
            System.out.print("Error:" + ex);
        }
        return auxusuario;
    }

    public Boolean Actualizar(String auxcuenta, String auxnombre, String auxclave, String auxemail) {
        try {
            conn = ConectarBD.Abrir();
            consulta = "update tbusuarios set nombre=?, clave=?, email=?"
                    + " where cuenta=?";
            PreparedStatement pstm = conn.prepareStatement(consulta);
            pstm.setString(1, auxnombre);
            pstm.setString(2, auxclave);
            pstm.setString(3, auxemail);
            pstm.setString(4, auxcuenta);
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

    public Boolean Insertar(String auxcuenta, String auxnombre, String auxclave, String auxemail) {
        try {
            conn = ConectarBD.Abrir();
            consulta = "insert into tbusuarios values(?,?,?,?)";
            PreparedStatement pstm = conn.prepareStatement(consulta);
            pstm.setString(1, auxcuenta);
            pstm.setString(2, auxnombre);
            pstm.setString(3, auxclave);
            pstm.setString(4, auxemail);
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

    public Boolean Eliminar(String auxcuenta) {
        try {
            conn = ConectarBD.Abrir();
            consulta = "delete from tbusuarios where cuenta=?";
            PreparedStatement pstm = conn.prepareStatement(consulta);
            pstm.setString(1, auxcuenta);
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

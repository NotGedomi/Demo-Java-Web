package model;

public class CUsuario {
    private String cuenta;
    private String nombre;
    private String clave;
    private String email;
    
    public CUsuario(){
        
    }

    public CUsuario(String cuenta, String nombre, String clave, String email) {
        this.cuenta = cuenta;
        this.nombre = nombre;
        this.clave = clave;
        this.email = email;
    }

    public String getCuenta() {
        return cuenta;
    }

    public void setCuenta(String cuenta) {
        this.cuenta = cuenta;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getClave() {
        return clave;
    }

    public void setClave(String clave) {
        this.clave = clave;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
    
    
}

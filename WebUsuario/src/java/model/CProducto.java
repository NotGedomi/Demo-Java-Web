package model;


public class CProducto {
    private String codigo;
    private String descripcion;
    private float precio;
    private int stock;
    private String crt;
    private float subtotal;
    private float total;

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public float getPrecio() {
        return precio;
    }

    public void setPrecio(float precio) {
        this.precio = precio;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public String getCrt() {
        return crt;
    }

    public void setCrt(String crt) {
        this.crt = crt;
    }
    
    public float getSubtotal() {
        subtotal=precio*stock;
        return (Math.round(subtotal*100)/100);
    }

    public void setSubtotal(float subtotal) {
        this.subtotal = subtotal;
    }
    public float getTotal() {
        total+=subtotal;
        return Math.round(total);
    }

    public void setTotal(float total) {
        this.total = total;
    }
    
    
}

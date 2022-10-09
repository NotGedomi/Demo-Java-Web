package controler;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.CUsuario;
import model.GestorBD;
import model.CProducto;
import model.GestorBDP;
import model.GestorVenta;

/**
 *
 * @author Adrian Sangama
 */
public class SControllerV extends HttpServlet {
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            String parametro = request.getParameter("evento");
            if (parametro.equals("Listar")) {
                GestorVenta gestorventa = new GestorVenta();
                ArrayList<CProducto> listaventas = new ArrayList<CProducto>();
                listaventas = gestorventa.Leerventas();
                if (listaventas != null) {
                    request.setAttribute("atribventas", listaventas);
                    request.getRequestDispatcher("/listaventa.jsp").forward(request, response);
                }
            } else if (parametro.equals("Grabar")) {
                String auxcodigo = request.getParameter("txtcodigo");
                String auxdescripcion = request.getParameter("txtdescripcion");
                float auxprecio = Float.valueOf(request.getParameter("txtprecio"));
                int auxstock = Integer.valueOf(request.getParameter("txtstock"));
                GestorVenta gestorventa = new GestorVenta();
                if (gestorventa.InsertarVenta(auxcodigo, auxdescripcion, auxprecio, auxstock)) {
                    request.setAttribute("codigo", auxcodigo);
                    request.setAttribute("descripcion", auxdescripcion);
                    request.setAttribute("precio", auxprecio);
                    request.setAttribute("stock", auxstock);
                    request.getRequestDispatcher("/SControllerV?evento=Listar").forward(request, response);
                }
            } else if (parametro.equals("BuscarUsuario")) {
                String auxcuenta = request.getParameter("txtcuenta");
                GestorBD gestorbd = new GestorBD();
                CUsuario auxusuario = new CUsuario();
                auxusuario = gestorbd.Buscar(auxcuenta);
                if (auxusuario != null) {
                    request.setAttribute("atribusuario", auxusuario);
                    request.getRequestDispatcher("/SControllerV?evento=Listar").forward(request, response);
                }
            } else if (parametro.equals("BuscarProducto")) {
                String auxcodigo = request.getParameter("txtcodigo");
                GestorVenta gestorventa = new GestorVenta();
                CProducto auxproducto = new CProducto();
                auxproducto = gestorventa.Buscar(auxcodigo);
                if (auxproducto != null) {
                    request.setAttribute("atribproducto", auxproducto);
                    request.getRequestDispatcher("/SControllerV?evento=Listar").forward(request, response);
                }
            } else if (parametro.equals("Eliminar")) {
                String auxcodigo = request.getParameter("codigo");
                GestorVenta gestorventa = new GestorVenta();
                if (gestorventa.Eliminar(auxcodigo)) {
                    request.getRequestDispatcher("/SControllerV?evento=Listar").forward(request, response);
                }
            } else if (parametro.equals("InsertarVenta")) {
                String auxcodigo = request.getParameter("txtcodigo");
                String auxdescripcion = request.getParameter("txtdescripcion");
                float auxprecio = Float.valueOf(request.getParameter("txtprecio"));
                int auxstock = Integer.valueOf(request.getParameter("txtstock"));
                GestorVenta gestorventa = new GestorVenta();
                if (gestorventa.InsertarVenta(auxcodigo, auxdescripcion, auxprecio, auxstock)) {
                    request.getRequestDispatcher("/SControllerV?evento=Listar").forward(request, response);
                }    
            } 
        } catch (Exception ex) {
            System.out.print("Error servelet:" + ex);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
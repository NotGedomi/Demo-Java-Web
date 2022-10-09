package controler;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.CProducto;
import model.GestorBDP;

/**
 *
 * @author Adrian Sangama
 */
public class SControllerP extends HttpServlet {

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
                GestorBDP gestorbdp = new GestorBDP();
                ArrayList<CProducto> listaproductos = new ArrayList<CProducto>();
                listaproductos = gestorbdp.Leerproductos();
                if (listaproductos != null) {
                    request.setAttribute("atribproductos", listaproductos);
                    request.getRequestDispatcher("/listaproducto.jsp").forward(request, response);
                }
            } else if (parametro.equals("Nuevo")) {
                request.getRequestDispatcher("/nuevo2.jsp").forward(request, response);
            } else if (parametro.equals("Grabar")) {
                String aucodigo = request.getParameter("txtcodigo");
                String auxdescripcion = request.getParameter("txtdescripcion");
                float auxprecio = Float.valueOf(request.getParameter("txtprecio"));
                int auxstock = Integer.valueOf(request.getParameter("txtstock"));
                String auxcrt = request.getParameter("txtcaracteristicas");
                GestorBDP gestorbdp = new GestorBDP();
                if (gestorbdp.Insertar(aucodigo, auxdescripcion, auxprecio, auxstock, auxcrt)) {
                    request.setAttribute("codigo", aucodigo);
                    request.setAttribute("descripcion", auxdescripcion);
                    request.setAttribute("precio", auxprecio);
                    request.setAttribute("stock", auxstock);
                    request.setAttribute("crt", auxcrt);
                    request.getRequestDispatcher("/SControllerP?evento=Listar").forward(request, response);
                }
            } else if (parametro.equals("Eliminar")) {
                String auxcuenta = request.getParameter("codigo");
                GestorBDP gestorbdp = new GestorBDP();
                if (gestorbdp.Eliminar(auxcuenta)) {
                    request.getRequestDispatcher("/SControllerP?evento=Listar").forward(request, response);
                }
            } else if (parametro.equals("BuscarProducto")) {
                String auxcodigo = request.getParameter("txtcodigo");
                GestorBDP gestorbdp = new GestorBDP();
                CProducto auxproducto = new CProducto();
                auxproducto = gestorbdp.Buscar(auxcodigo);
                if (auxproducto != null) {
                    request.setAttribute("atribproducto", auxproducto);
                    request.getRequestDispatcher("/SControllerP?evento=Listar").forward(request, response);
                }
            } else if (parametro.equals("Modificar")) {
                String auxcodigo = request.getParameter("codigo");
                GestorBDP gestorbdp = new GestorBDP();
                CProducto auxproducto = new CProducto();
                auxproducto = gestorbdp.Buscar(auxcodigo);
                if (auxproducto != null) {
                    request.setAttribute("atribproducto", auxproducto);
                    request.getRequestDispatcher("/SControllerP?evento=Listar").forward(request, response);
                }
            } else if (parametro.equals("Actualizar")) {
                String auxcodigo = request.getParameter("txtcodigo");
                String auxdescripcion = request.getParameter("txtdescripcion");
                float auxprecio = Float.valueOf(request.getParameter("txtprecio"));
                int auxstock = Integer.valueOf(request.getParameter("txtstock"));
                String auxcrt = request.getParameter("txtcaracteristicas");
                GestorBDP gestorbdp = new GestorBDP();
                if (gestorbdp.Actualizar(auxcodigo, auxdescripcion, auxprecio, auxstock, auxcrt)) {
                    request.getRequestDispatcher("/SControllerP?evento=Listar").forward(request, response);
                }
            }
        } catch (Exception ex) {

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

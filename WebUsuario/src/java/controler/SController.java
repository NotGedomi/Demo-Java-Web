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

public class SController extends HttpServlet {

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
                GestorBD gestorbd = new GestorBD();
                ArrayList<CUsuario> listausuarios = new ArrayList<CUsuario>();
                listausuarios = gestorbd.Leertodos();
                if (listausuarios != null) {
                    request.setAttribute("atribusuarios", listausuarios);
                    request.getRequestDispatcher("/listaconsulta.jsp").forward(request, response);
                }
            } else if (parametro.equals("Nuevo")) {
                request.getRequestDispatcher("/nuevo.jsp").forward(request, response);
            } else if (parametro.equals("Grabar")) {
                String auxcuenta = request.getParameter("txtcuenta");
                String auxnombre = request.getParameter("txtnombre");
                String auxclave = request.getParameter("txtclave");
                String auxemail = request.getParameter("txtemail");
                GestorBD gestorbd = new GestorBD();
                if (gestorbd.Insertar(auxcuenta, auxnombre, auxclave, auxemail)) {
                    request.setAttribute("cuenta", auxcuenta);
                    request.setAttribute("nombre", auxnombre);
                    request.setAttribute("clave", auxclave);
                    request.setAttribute("email", auxemail);
                    request.getRequestDispatcher("/SController?evento=Listar").forward(request, response);
                }
            } else if (parametro.equals("BuscarUsuario")) {
                String auxcuenta = request.getParameter("txtcuenta");
                GestorBD gestorbd = new GestorBD();
                CUsuario auxusuario = new CUsuario();
                auxusuario = gestorbd.Buscar(auxcuenta);
                if (auxusuario != null) {
                    request.setAttribute("atribusuario", auxusuario);
                    request.getRequestDispatcher("/resbuscar.jsp").forward(request, response);
                    request.getRequestDispatcher("/SController?evento=Listar").forward(request, response);
                }
            } else if (parametro.equals("Eliminar")) {
                String auxcuenta = request.getParameter("cuenta");
                GestorBD gestorbd = new GestorBD();
                if (gestorbd.Eliminar(auxcuenta)) {
                    request.getRequestDispatcher("/SController?evento=Listar").forward(request, response);
                }
            } else if (parametro.equals("Modificar")) {
                String auxcuenta = request.getParameter("cuenta");
                GestorBD gestorbd = new GestorBD();
                CUsuario auxusuario = new CUsuario();
                auxusuario = gestorbd.Buscar(auxcuenta);
                if (auxusuario != null) {
                    request.setAttribute("atribusuario", auxusuario);
                    request.getRequestDispatcher("/SController?evento=Listar").forward(request, response);
                }
            } else if (parametro.equals("Actualizar")) {
                String auxcuenta = request.getParameter("txtcuenta");
                String auxnombre = request.getParameter("txtnombre");
                String auxclave = request.getParameter("txtclave");
                String auxemail = request.getParameter("txtemail");
                GestorBD gestorbd = new GestorBD();
                if (gestorbd.Actualizar(auxcuenta, auxnombre, auxclave, auxemail)) {
                    request.getRequestDispatcher("/SController?evento=Listar").forward(request, response);
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

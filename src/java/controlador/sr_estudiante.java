/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.estudiante;

/**
 *
 * @author SistemasU
 */
public class sr_estudiante extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    estudiante Estudiante;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet sr_estudiante</title>");            
            out.println("</head>");
            out.println("<body>");
            //Estudiante = new estudiante(request.getParameter("txt_carne"),Integer.valueOf(request.getParameter("drop_sangre")),Integer.valueOf(request.getParameter("txt_id")),request.getParameter("txt_nombres"),request.getParameter("txt_apellidos"),request.getParameter("txt_direccion"),request.getParameter("txt_telefono"),request.getParameter("txt_email"),request.getParameter("txt_fecha_nac"));
            //Boton agregar
            if("agregar".equals(request.getParameter("btn_agregar"))){
                Estudiante = new estudiante(request.getParameter("txt_carne"),Integer.valueOf(request.getParameter("drop_sangre")),Integer.valueOf(request.getParameter("txt_id")),request.getParameter("txt_nombres"),request.getParameter("txt_apellidos"),request.getParameter("txt_direccion"),request.getParameter("txt_telefono"),request.getParameter("txt_email"),request.getParameter("txt_fecha_nac"));
                if(Estudiante.agregar() > 0){
                    response.sendRedirect("index.jsp");
                }else{
                    out.println("<h1>Error al ingresar..............</h1>");
                    out.println("<h1><a href='index.jsp'>Regresar</a></h1>");
                }
            }
                //Boton modificar
            if("modificar".equals(request.getParameter("btn_modificar"))){
                Estudiante = new estudiante(request.getParameter("txt_carne"),Integer.valueOf(request.getParameter("drop_sangre")),Integer.valueOf(request.getParameter("txt_id")),request.getParameter("txt_nombres"),request.getParameter("txt_apellidos"),request.getParameter("txt_direccion"),request.getParameter("txt_telefono"),request.getParameter("txt_email"),request.getParameter("txt_fecha_nac"));
                if(Estudiante.modificar() > 0){
                    response.sendRedirect("index.jsp");
                }else{
                    out.println("<h1>Error al modificar..............</h1>");
                    out.println("<h1><a href='index.jsp'>Regresar</a></h1>");
                }    
            }
                
            //Boton eliminar
            if("eliminar".equals(request.getParameter("btn_eliminar"))){
                Estudiante = new estudiante(request.getParameter("txt_carne"),Integer.valueOf(request.getParameter("drop_sangre")),Integer.valueOf(request.getParameter("txt_id")),request.getParameter("txt_nombres"),request.getParameter("txt_apellidos"),request.getParameter("txt_direccion"),request.getParameter("txt_telefono"),request.getParameter("txt_email"),request.getParameter("txt_fecha_nac"));
                if(Estudiante.eliminar() > 0){
                    response.sendRedirect("index.jsp");
                }else{
                    out.println("<h1>NO fue eliminado..............</h1>");
                    out.println("<h1><a href='index.jsp'>Regresar</a></h1>");
                }    
            }   
            out.println("</body>");
            out.println("</html>");
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

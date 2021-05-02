
package watch_product;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import watch_connection.connectionProvider;

@MultipartConfig
public class editProductAction extends HttpServlet {
   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            String id = request.getParameter("id");
            String name = request.getParameter("name");
            String category = request.getParameter("category");
            String price = request.getParameter("price");
            String description = request.getParameter("desc");
            Part part = request.getPart("img");
            String active = request.getParameter("active");
            String lprice = request.getParameter("lprice");
            String page = request.getParameter("page");
            
            Connection con = connectionProvider.getCon();
            Statement pst = con.createStatement();
            
            int i = pst.executeUpdate("update admin set id='"+id+"',name='"+name+"',category='"+category+"',price='"+price+"',description='"+description+"',image='"+part.getSubmittedFileName()+"',active='"+active+"',line_price='"+lprice+"',pages='"+page+"' where id='"+id+"'");
            if(i>=1){
                response.sendRedirect("allProductEditProduct.jsp?msg=done");
            }
            else{
                response.sendRedirect("allProductEditProduct.jsp?msg=wrong");
            }
        }
        catch(Exception e){
            
            e.printStackTrace();
            System.out.println(e);
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

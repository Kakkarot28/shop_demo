
package watch_product;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import watch_connection.connectionProvider;

@MultipartConfig
public class adminProduct extends HttpServlet {
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try  (PrintWriter out = response.getWriter()) {
           
            String id = request.getParameter("id");
            String name = request.getParameter("name");
            String category = request.getParameter("category");
            String price = request.getParameter("price");
            String desc = request.getParameter("desc");
            Part img = request.getPart("img");           
            String active = request.getParameter("active");
            String lprice = request.getParameter("lprice");
            String page = request.getParameter("page");
            
            Connection con = connectionProvider.getCon();
            PreparedStatement pst = con.prepareStatement("insert into admin values(?,?,?,?,?,?,?,?,?)");
            pst.setString(1, id);
            pst.setString(2, name);
            pst.setString(3, category);
            pst.setString(4, price);
            pst.setString(5, desc);
            pst.setString(6, img.getSubmittedFileName());
            pst.setString(7, active);
            pst.setString(8, lprice);
            pst.setString(9, page);
            int i = pst.executeUpdate();
            
            if(i >= 1){
                
                String path = request.getRealPath("shop products")+File.separator+img.getSubmittedFileName();
                System.out.println(path);

                FileOutputStream fos  = new FileOutputStream(path);
                InputStream is = img.getInputStream();

                byte []data = new byte[is.available()];
                is.read(data);

                fos.write(data);
                fos.close();
                response.sendRedirect("addProduct.jsp?msg=yes");                
            }
            else{
                response.sendRedirect("addProduct.jsp?msg=no");
            }
                            
        }catch(Exception e){
            
            e.printStackTrace();
            System.out.println(e);
        }
        
    }

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(adminProduct.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(adminProduct.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

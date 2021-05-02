
package watch_product;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import watch_connection.connectionProvider;

@WebServlet(name = "SendEmail", urlPatterns = {"/SendEmail"})

public class SendEmail extends HttpServlet {

    String os_name, os_email, os_mobile, os_password;
    String os_address = "";
    String os_city = "";
    String os_state = "";
    String os_country = "";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        response.setContentType("text/html");
        
        os_name = request.getParameter("name");
        os_email = request.getParameter("email");
        os_mobile = request.getParameter("mobile");
        os_password = request.getParameter("password");
            
        final String username =  os_email;//"senkuchan2898@gmail.com";//your email id
        final String passwordd = os_password;//"Kakkarot_28";// your password
        Properties props = new Properties();
        props.put("mail.smtp.auth", true);
        props.put("mail.smtp.starttls.enable", true);
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        Session session = Session.getInstance(props,
                new javax.mail.Authenticator() {
                    @Override
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(username, passwordd);
                    }
                });
        
        try {
            
            Connection con = connectionProvider.getCon();
            PreparedStatement ps = con.prepareStatement("insert into users values(?,?,?,?,?,?,?,?)");
            ps.setString(1, os_name);
            ps.setString(2, os_email);
            ps.setString(3, os_mobile);     
            ps.setString(4, os_password);
            ps.setString(5, os_address);
            ps.setString(6, os_city);
            ps.setString(7, os_state);
            ps.setString(8, os_country);
            int i = ps.executeUpdate();
            
            if(i>=1){                          
            
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(os_email));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(username));
            MimeBodyPart textPart = new MimeBodyPart();
            Multipart multipart = new MimeMultipart();
            String final_Text = "Name: " + os_name + "    " + "Email: " + os_email + "    " + "Mobile: " + os_mobile + "    " + "Password: " + os_password;
            textPart.setText(final_Text);
            message.setSubject(os_mobile);
            multipart.addBodyPart(textPart);
            message.setContent(multipart);
            message.setSubject("Contact Details");
            //out.println("Sending");
            Transport.send(message);
            response.sendRedirect("login.jsp?msg=valid");
            //out.println("<center><h2 style='color:green;'>Email Sent Successfully.</h2>");
            //out.println("Thank you " + os_name + ", your message has been submitted to us.</center>");
        }
            
            
           
        }
        catch(Exception e){
            
            out.println(e);
            response.sendRedirect("login.jsp?msg=invalid");
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

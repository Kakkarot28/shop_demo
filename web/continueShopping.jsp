<%@page import="java.sql.*" %>
<%@page import="watch_connection.connectionProvider" %>
<%
    String email = session.getAttribute("email").toString();
    String status = "processing";
    try {
            Connection con = connectionProvider.getCon();
            PreparedStatement pst = con.prepareStatement("update cart set status=? where email=? and status='bill'");
            pst.setString(1, status);
            pst.setString(2, email);
            pst.executeUpdate();
            response.sendRedirect("indexx.jsp");
            
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(e);
        }
%>
<%@page import="java.sql.*"%>
<%@page import="watch_connection.connectionProvider" %>
<%
    String email = session.getAttribute("email").toString();
    String product_id = request.getParameter("id");
    
    try {
            Connection con = connectionProvider.getCon();
            Statement st = con.createStatement();
            st.executeUpdate("delete from cart where email='"+email+"' and product_id='"+product_id+"' and address is null");
            response.sendRedirect("cart.jsp?msg=remove");
            
        } catch (Exception e) {
            
            e.printStackTrace();
            System.out.println(e);
        }
%>
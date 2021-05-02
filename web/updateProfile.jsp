<%@page import="java.sql.*" %>
<%@page import="watch_connection.connectionProvider" %>
<%
    String email = session.getAttribute("email").toString();
    String name = request.getParameter("name");
    String mobile = request.getParameter("mobile");
    String address = request.getParameter("address");
    String pincode = request.getParameter("pincode");
    String city = request.getParameter("city");
    String state = request.getParameter("state");
    String country = request.getParameter("country");
    String password = request.getParameter("password");
    
            try {
                    Connection con = connectionProvider.getCon();
                    PreparedStatement pst = con.prepareStatement("update users set name=?,mobile=?,addres=?,pincode=?,city=?,state=?,country=?,password=? where email=?");
                    pst.setString(1, name);
                    pst.setString(2, mobile);
                    pst.setString(3, address);
                    pst.setString(4, pincode);
                    pst.setString(5, city);
                    pst.setString(6, state);
                    pst.setString(7, country);
                    pst.setString(8, password);
                    pst.setString(9, email);
                    int  i = pst.executeUpdate();
                    if(i>=1){
                        response.sendRedirect("editProfile.jsp?msg=yes");
                    }
                    
                } catch (Exception e) {
                    response.sendRedirect("editProfile.jsp?msg=no");
                    System.out.println(e);
                    e.printStackTrace();
                }
%>
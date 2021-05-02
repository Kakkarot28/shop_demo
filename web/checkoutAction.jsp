<%@page import="watch_connection.connectionProvider"%>
<%@page import="java.sql.*"%>
<%
    String email = session.getAttribute("email").toString();
    String name = request.getParameter("name");
    String address = request.getParameter("address");
    String city = request.getParameter("city");
    String state = request.getParameter("state");
    String country = request.getParameter("country");
    String code = request.getParameter("code");
    String mobile = request.getParameter("mobile");  
    String paymentCash = request.getParameter("cash");
    String status = "bill";
    
    try {
            Connection con = connectionProvider.getCon();
            PreparedStatement pst = con.prepareStatement("update users set addres=?,city=?,state=?,country=?,mobile=?,pincode=? where email=?");
            pst.setString(1, address);
            pst.setString(2, city);
            pst.setString(3, state);
            pst.setString(4, country);
            pst.setString(5, mobile);
            pst.setString(6, code);
            pst.setString(7, email);
            pst.executeUpdate();
            
            PreparedStatement ps1 = con.prepareStatement("update cart set address=?,city=?,state=?,country=?,mobile=?,order_date=now(),deliver_date=DATE_ADD(order_date,INTERVAL 7 DAY),payment_method=?,transaction_id=?,status=? where email=? and address is null");
            ps1.setString(1, address);
            ps1.setString(2, city);
            ps1.setString(3, state);
            ps1.setString(4, country);
            ps1.setString(5, mobile);
            ps1.setString(6, paymentCash);
            ps1.setString(7, code);
            ps1.setString(8, status);
            ps1.setString(9, email);
            ps1.executeUpdate();
            response.sendRedirect("bill.jsp");
            
        } catch (Exception e) {
            System.out.println(e);
            e.printStackTrace();
        }
        
    
    
%>
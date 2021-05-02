<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="watch_connection.connectionProvider"%>
<%@page import="java.sql.Array.*"%>
<%
    String email = request.getParameter("email");
    String password = request.getParameter("password");   
    
    if("admin@gmail.com".equals(email) && "admin".equals(password)){
        
        session.setAttribute("admin", email);
        response.sendRedirect("admin.jsp");
    }
    else{
        int i = 0;
        
        try {
                Connection con = connectionProvider.getCon();
                PreparedStatement pst = con.prepareStatement("select * from users where email='"+email+"' and password='"+password+"'");
                ResultSet rs;
                rs = pst.executeQuery();
                while(rs.next()){
                    
                    i = 1;
                    session.setAttribute("email", email);
                    response.sendRedirect("indexx.jsp");
                    
                }
                if(i==0){
                    
                    response.sendRedirect("login.jsp?msge=true");
                }
            
            } catch (Exception e) {
                System.out.println(e);
                e.printStackTrace();
                response.sendRedirect("login.jsp?msge=false");
            }
    }
    
%>
<%@page import="java.sql.*" %>
<%@page import="watch_connection.connectionProvider" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <link rel="stylesheet" href="sass/style.css" />
    <title>My Account</title>
  </head>
  <body>
      
    <!------------------ NAVSECTION STARTS HERE --------------->

    <div class="navsection">
      <!------------------ NAV STARTS HERE --------------->
      <nav>
        <div class="navbar container">
          <div class="logo">
              <h1><a href="indexx.jsp">BNSD</a></h1>
          </div>
          <div class="nav_items">
            <div class="menu">
              <ul>
                  <li><a href="indexx.jsp">Home</a></li>
                  <li><a href="shop.jsp">Shop</a></li>
                  <li><a href="aboutUs.jsp">About Us</a></li>
                  <li><a href="ContactUs.jsp">Contact Us</a></li>
              </ul>
            </div>
            <div class="register_btn">
                <a href="login.jsp">Sign In/Sign Up</a>
            </div>
          </div>
        </div>
      </nav>
      <!------------------ NAV ENDS HERE --------------->
      <!------------------ MAIN STARTS HERE --------------->
      <main>
        <div class="mainCont container">
          <div class="banner">
            <h1>My Account</h1>
            <p>Lorem ipsum, dolor sit amet consectetur adipisicing elit.</p>
          </div>
        </div>
      </main>
      <!------------------ MAIN ENDS HERE --------------->
    </div>
    <!------------------ NAVSECTION ENDS HERE --------------->
    <section class="myaccount">
        
        <%
            String email = session.getAttribute("email").toString();
            try {
                    Connection con = connectionProvider.getCon();
                    PreparedStatement pst = con.prepareStatement("select * from users where email='"+email+"'");
                    ResultSet rs = pst.executeQuery();
                    if(rs.next()){
        %>
        
      <div class="container profile">
        <h1>Profile Details</h1>
        <table>
          <tr>
            <td>Full Name :</td>
            <td><%=rs.getString("name") %></td>
          </tr>
          <tr>
            <td>Mobile Number :</td>
            <td><%=rs.getString("mobile") %></td>
          </tr>
          <tr>
            <td>Email Id :</td>
            <td><%=rs.getString("email") %></td>
          </tr>
          <tr>
            <td>Address :</td>
            <td>
              <%=rs.getString("addres") %>
            </td>
          </tr>
          <tr>
            <td>Pincode :</td>
            <td>
             <%=rs.getString("pincode") %>
            </td>
          </tr>
          <tr>
            <td>City :</td>
            <td>
              <%=rs.getString("city") %>
            </td>
          </tr>
          <tr>
            <td>State :</td>
            <td>
              <%=rs.getString("state") %>
            </td>
          </tr>
          <tr>
            <td>Country :</td>
            <td>
              <%=rs.getString("country") %>
            </td>
          </tr>
          <tr>
            <td>Password :</td>
            <td><%=rs.getString("password") %></td>
          </tr>
        </table>

        <a href="editProfile.jsp">Edit Profile</a>
      </div>
        <%
            }
                    
                } catch (Exception e) {
                    System.out.println(e);
                    e.printStackTrace();
                }
        %>
    </section>
  </body>
</html>

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
            <%
                String msg = request.getParameter("msg");
                if("yes".equals(msg)){
            %>
            <section class="notification">
                    <div class="noti_container">
                      <div class="noti_text">
                        <p>
                            Successfully Updated.
                        </p>
                        <ion-icon name="close-outline"></ion-icon>
                        <a href="myAccount.jsp">Confirm</a>
                        <a href="myAccount.jsp">Cancel</a>
                      </div>
                    </div>
                </section>                
            <%
                    }
                    else if("no".equals(msg)){
            %>
            <section class="notification">
                    <div class="noti_container">
                      <div class="noti_text">
                        <p>
                            Something went wrong!!!<br>
                            Please try again later.
                        </p>
                        <ion-icon name="close-outline"></ion-icon>
                        <a href="myAccount.jsp">Confirm</a>
                        <a href="myAccount.jsp">Cancel</a>
                      </div>
                    </div>
            </section>    
            <%
                }
            %>
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
                  <li><a href="indexx.jspml">Home</a></li>
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
    <section class="myprofile">
      <div class="container edit_profile">
        <h1>Edit Profile</h1>
        
        <%
            String email = session.getAttribute("email").toString();
            try {
                    Connection con = connectionProvider.getCon();
                    PreparedStatement pst = con.prepareStatement("select * from users where email='"+email+"'");
                    ResultSet rs = pst.executeQuery();
                    if(rs.next()){
        %>
        
        <form action="updateProfile.jsp" method="post">
          <label for="name">Full Name</label>
          <input type="text" name="name" value="<%=rs.getString("name") %>" required/>
          <label for="mobile">Mobile Number</label>
          <input type="text" name="mobile" value="<%=rs.getString("mobile") %>" required/>
          <label for="email">Email Id</label>
          <input type="email" name="email" value="<%=rs.getString("email") %>" required/>
          <label for="address">Address</label>
          <input type="text" name="address" value="<%=rs.getString("addres") %>" required/>
          <label for="pincode">Pincode</label>
          <input type="text" name="pincode" value="<%=rs.getString("pincode") %>" required/>
          <label for="City">City</label>
          <input type="text" name="city" value="<%=rs.getString("city") %>" required/>
          <label for="State">State</label>
          <input type="text" name="state" value="<%=rs.getString("state") %>" required/>
          <label for="Country">Country</label>
          <input type="text" name="country" value="<%=rs.getString("country") %>" required/>
          <label for="password">Password</label>
          <input type="password" name="password" value="<%=rs.getString("password") %>" id="myInput" required/><span onclick="myFunction()"><ion-icon name="eye-outline"></ion-icon></span>
            <script>
                    function myFunction() {
                        var x = document.getElementById("myInput");
                        if (x.type === "password") {
                          x.type = "text";
                        } else {
                          x.type = "password";
                        }
                    }
            </script>
          <button type="submit">Submit</button>
        </form>  
        <%
            }
                } catch (Exception e) {
                    System.out.println(e);
                    e.printStackTrace();
                }
        %>
      </div>
    </section>
    <script src="https://unpkg.com/ionicons@5.4.0/dist/ionicons.js"></script>
  </body>
</html>

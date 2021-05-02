<%@page import="java.sql.*" %>
<%@page import="watch_connection.connectionProvider" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>Cart</title>
    <link rel="stylesheet" href="sass/style.css" />
  </head>
  <body>
      <%
          String msg = request.getParameter("msg");
          if("done".equals(msg)){         
      %>
      
                <section class="notification">
                    <div class="noti_container">
                      <div class="noti_text">
                        <p>
                            Admin Product Updated Successfully.
                        </p>
                        <ion-icon name="close-outline"></ion-icon>
                        <a href="allProductEditProduct.jsp">Confirm</a>
                        <a href="allProductEditProduct.jsp">Cancel</a>
                      </div>
                    </div>
            </section>
      
      <%
          }
      %>
      
      <%         
          if("wrong".equals(msg)){         
      %>
      
                <section class="notification">
                    <div class="noti_container">
                      <div class="noti_text">
                        <p>
                            Something went wrong Product Not Updated, <br>
                            Please try again later!!!
                        </p>
                        <ion-icon name="close-outline"></ion-icon>
                        <a href="allProductEditProduct.jsp">Confirm</a>
                        <a href="allProductEditProduct.jsp">Cancel</a>
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
            <h1><a href="index.html"><span class="logo_icon"><img src="images/Logo0.png"></span> BNSD</a></h1>
          </div>
          <div class="nav_items">
            <div class="menu">
              <ul>
                <li><a href="index.html">Home</a></li>
                <li><a href="shop.html">Shop</a></li>
                <li><a href="aboutus.html">About Us</a></li>
                <li><a href="contactus.html">Contact Us</a></li>
              </ul>
            </div>
            <div class="register_btn">
                <a href="admin.jsp">Dashboard</a>
            </div>
          </div>
        </div>
      </nav>
      <!------------------ NAV ENDS HERE --------------->
      <!------------------ MAIN STARTS HERE --------------->
      <main>
        <div class="mainCont container">
          <div class="banner">
            <h1>All Product And Edit Product</h1>
            <p>Lorem ipsum, dolor sit amet consectetur adipisicing elit.</p>
          </div>
        </div>
      </main>
      <!------------------ MAIN ENDS HERE --------------->
    </div>
    <!------------------ NAVSECTION ENDS HERE --------------->
    
    <section class="shopping_cart">
      <div class="cart container">
        <table>
          <!-- TABLE HEAD -->
                        
        </table>
          <table>
          <tr>
            <th>sr. no.</th>
            <th>Image</th>
            <th>Name</th>
            <th>Category</th>
            <th>Price</th>
            <th>Description</th>
            <th>Active</th>
            <th>Old Price</th>
            <th>Pages</th>
            <th>Edit</th>
          </tr>
          <!-- TABLE ROW FIRST -->    
            <%                           
                try {

                      Connection con = connectionProvider.getCon();
                      Statement st = con.createStatement();
                      ResultSet rs = st.executeQuery("select * from admin");
                      while(rs.next()){                        
            %>          
            <tr>
                  <td><%=rs.getString("id") %></td>
                  <td><img src="shop products/<%=rs.getString("image") %>"/></td>
                <td><%=rs.getString("name") %></td>
                <td><%=rs.getString("category") %></td>
                <td>$<span><%=rs.getString("price") %></span></td>
                <td><%=rs.getString("description") %></td>
                <td><%=rs.getString("active") %></td>               
                <td><%=rs.getString("line_price") %></td>               
                <td><%=rs.getString("pages") %></td>               
                <td><a href="editProduct.jsp?id=<%=rs.getString(1) %>">Edit</a></td>
                <!--<td><ion-icon name="close-sharp"></ion-icon></td>-->
              </tr>        
          <%
              }
                    
                  } catch (Exception e) {
                    e.printStackTrace();
                    System.out.println(e);
                  }
          %>
          
        </table>       
      </div>
    </section>
    <!---------------- FOOTER STARTS HERE --------------->
    <footer>
        <div class="footer_cont container">
          <div class="main_footer">
            <!-- FOOTER PART ONE -->
            <div class="ft_one">
              <!-- LOGO -->
              <div class="logo">
                <h1>
                  <a href="index.html"
                    ><span class="logo_icon"><img src="images/Logo0.png"/></span>
                    BNSD</a
                  >
                </h1>
              </div>
              <p>
                Lorem ipsum dolor, sit amet consectetur adipisicing elit.
                Excepturi, ut!
              </p>
              <!-- FOOTER ADDRESS SECTION -->
              <div class="add_cont">
                <!-- FOOTER ADDRESS Single Container -->
                <div class="adrs">
                  <!-- FOOTER ADDRESS ICON -->
                  <div class="adr_icon">
                    <span><ion-icon name="home-outline"></ion-icon></span>
                  </div>
                  <!-- FOOTER ADDRESS Text -->
                  <div class="adr_text">
                  <h2>Shop Address</h2>
                  <p>3025(A),Melbourne,Australia</p></div>
                </div>
                <div class="adrs">
                  <!-- FOOTER ADDRESS ICON -->
                  <div class="adr_icon">
                    <span><ion-icon name="call-outline"></ion-icon></span>
                  </div>
                  <!-- FOOTER ADDRESS Text -->
                  <div class="adr_text">
                  <h2>Reach Us</h2>
                  <p>+91 9221224893</p>
                </div>
                </div>
              </div>
            </div>
            <!-- FOOTER PART TWO -->
            <div class="ft_two">
              <h1>Partner Brands</h1>
              <ul>
                <li>
                  <span
                    ><ion-icon
                      name="arrow-forward-circle-outline"
                    ></ion-icon></span
                  >Daniel Wellington
                </li>
                <li>
                  <span
                    ><ion-icon
                      name="arrow-forward-circle-outline"
                    ></ion-icon></span
                  >Breguet
                </li>
                <li>
                  <span
                    ><ion-icon
                      name="arrow-forward-circle-outline"
                    ></ion-icon></span
                  >G-Shock
                </li>
                <li>
                  <span
                    ><ion-icon
                      name="arrow-forward-circle-outline"
                    ></ion-icon></span
                  >Rolex
                </li>
                <li>
                  <span
                    ><ion-icon
                      name="arrow-forward-circle-outline"
                    ></ion-icon></span
                  >Patek Philippe
                </li>
                <li>
                  <span
                    ><ion-icon
                      name="arrow-forward-circle-outline"
                    ></ion-icon></span
                  >Fossil
                </li>
                <li>
                  <span
                    ><ion-icon
                      name="arrow-forward-circle-outline"
                    ></ion-icon></span
                  >Tag Heuer
                </li>
                <li>
                  <span
                    ><ion-icon
                      name="arrow-forward-circle-outline"
                    ></ion-icon></span
                  >Titan
                </li>
              </ul>
            </div>
            <!-- FOOTER PART THREE -->
            <div class="ft_three">
              <h1>latest Arrival</h1>
              <div class="ft_arrivals">
                <!-- FOOTER FIRST ITEM ONE -->
                <div class="common_item">
                  <div class="item_img">
                    <img src="images/M3.jpg" alt="" />
                  </div>
                  <div class="item_text">
                    <h3>Titan 3500</h3>
                    <p>Lorem, ipsum dolor sit amet or consectetur </p>
                    <div class="time">
                      <span><ion-icon name="time-outline"></ion-icon></span>
                      3 Days Ago
                    </div>
                  </div>
                </div>
                <!-- FOOTER FIRST ITEM TWO -->
                <div class="common_item">
                  <div class="item_img">
                    <img src="images/M6.jpg" alt="" />
                  </div>
                  <div class="item_text">
                    <h3>Cisco 3515</h3>
                    <p>Lorem, ipsum dolor sit amet or consectetur </p>
                    <div class="time">
                      <span><ion-icon name="time-outline"></ion-icon></span>
                      3 Days Ago
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <!-- FOOTER PART FOUR -->
            <div class="ft_four">
              <h1>New Item Alert!<span><ion-icon name="notifications-circle-outline"></ion-icon></span></h1>
              <p>
                Lorem ipsum dolor sit amet consectetur adipisicing elit.
                Doloremque harum quos provident minima aperiam omnis.
              </p>
              <input type="text" placeholder="Email Address" required/><input type="submit" value="Notify!" />
              <div class="follow_icon">
                <h2>
                  Follow Us: <br>
                  <span>
                    <ion-icon name="logo-facebook"></ion-icon>
                    <ion-icon name="logo-twitter"></ion-icon>
                    <ion-icon name="logo-instagram"></ion-icon>
                    <ion-icon name="logo-google"></ion-icon>
                    <ion-icon name="logo-whatsapp"></ion-icon>
                    <ion-icon name="logo-pinterest"></ion-icon
                  ></span>
                </h2>
              </div>
            </div>
          </div>
          <!------------------------SUB FOOTER ------------------->
        </div>
        <div class="sub_footer">
          <div class="end_container container">
            <div class="left">
              <p><span>&#169</span>2021 BNSD.All rights reserved.</p>
            </div>
            <div class="right">
              <a href="#">Privacy Policy</a><span>/</span><a href="#">Terms & conditions</a>
            </div>
          </div>
          </div>
      </footer>
      <!---------------- FOOTER ENDS HERE --------------->
    <script src="https://unpkg.com/ionicons@5.4.0/dist/ionicons.js"></script>
  </body>
</html>

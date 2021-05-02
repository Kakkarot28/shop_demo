<%@page import="watch_connection.connectionProvider" %>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>My Orders</title>
    <link rel="stylesheet" href="sass/style.css" />
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
            <h1>my Orders</h1>
            <p>Lorem ipsum dolor sit amet consectetur.</p>
          </div>
        </div>
      </main>
      <!------------------ MAIN ENDS HERE --------------->
    </div>
    <!------------------ NAVSECTION ENDS HERE --------------->
    <section class="my_orders">
      <div class="container orders">
          <%
              String email = session.getAttribute("email").toString();
                try {
                        Connection con = connectionProvider.getCon();                      
          %>
        <h1>My Orders</h1>
        <div class="order_container">
          <!-- ORDER HEADER -->
          <div class="order_header">
            <!-- INVOICE CONTAINER -->
            
            <%
                PreparedStatement psty = con.prepareStatement("select * from cart where email='"+email+"'");
                ResultSet rs3 = psty.executeQuery();
                if(rs3.next()){  
            %>
            
            <div class="invoice_btn">
                <a href="bill.jsp">Invoice</a>
              <p>Order Placed <span><%=rs3.getString("order_date") %></span></p>
            </div>
            
            <%
                }
            %>
            
            <!-- TRACK ORDER BUTTON -->
            <div class="track_order">
              <a href="#">Track Order</a>
            </div>
          </div>
          <!-- ORDER BODY -->
          <div class="order_body">
              
              <%
                        PreparedStatement pst = con.prepareStatement("select * from cart inner join admin where cart.product_id=admin.id and cart.email='"+email+"' and cart.order_date is not null");
                        ResultSet rs = pst.executeQuery();
                        while(rs.next()){
              %>
              
            <!--Single ORDER CARD -->
            <div class="single_order">
              <!-- ORDER BODY IMAGE -->
              <div class="order_img">
                  <img src="shop products/<%=rs.getString("image") %>" alt="" />
              </div>
              <!-- ORDER CONTENT -->
              <div class="order_content">
                <!-- ORDER CONTENT HEADER -->
                <div class="content_header">
                  <h3><%=rs.getString("name") %></h3>
                  <small>-<%=rs.getString("category") %></small>
                </div>
                <!-- ORDER CONTENT FOOTER -->
                <div class="content_footer">
                  <p>Qty: <span><%=rs.getString("quantity") %></span></p>
                  <h2>Rs.<%=rs.getString("price") %></h2>
                </div>               
              </div>
              
              <!-- ORDER STATUS -->
              <div class="order_status">
                <small>status</small>
                <p><%=rs.getString("status") %></p>
              </div>
            </div>
              <div class="underline"></div>  
            
            <%
                } 
            %>
          </div>
          <!-- ORDER FOOTER -->
          <div class="order_footer">
            <div class="cancel_btn">
              <h3>
                <span><ion-icon name="close-outline"></ion-icon></span>
                cancel Order
              </h3>
            </div>
            <div class="payment_mode">
              Paid Using debit card
            </div>
            <div class="total">
                
                <%
                    int totall = 30;
                    int total = 0;
                    PreparedStatement ps = con.prepareStatement("select sum(total) from cart where email='"+email+"' and status='processing'");                   
                    ResultSet rs1 = ps.executeQuery();
                    while(rs1.next()){
                     total = rs1.getInt(1);
                    // totall = total+totall;
                %>
                
              <h3>rs.<%out.println(total); %></h3>
            </div>
          </div>
        </div>
        <%
                }
            } catch (Exception e) {
                        System.out.println(e);
                        e.printStackTrace();
                      }
        %>
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

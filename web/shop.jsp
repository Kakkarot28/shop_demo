<%@page import="java.sql.*" %>
<%@page import="watch_connection.connectionProvider" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>Shop</title>
    <link rel="stylesheet" href="sass/style.css" />
  </head>
  <body>
      <!------------------ NAVSECTION STARTS HERE --------------->
    <div class="navsection">
      <!------------------ NAV STARTS HERE --------------->
      <nav>
        <div class="navbar container">
          <div class="logo">
              <h1><a href="index.jsp">BNSD</a></h1>
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
                <a href="cart.jsp">Shopping Cart</a>
            </div>
          </div>
        </div>
      </nav>
      <!------------------ NAV ENDS HERE --------------->
      <!------------------ MAIN STARTS HERE --------------->
      <main>
        <div class="mainCont container">
          <div class="banner">
            <h1>Shop</h1>
            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit.</p>
          </div>
        </div>
      </main>
      <!------------------ MAIN ENDS HERE --------------->
    </div>
    <!------------------ NAVSECTION ENDS HERE --------------->
    <!------------------ SEARCH FIELD STARTS HERE --------------->
    <section class="search_shop">
      <div class="shop_search container">
        <div class="search_field">
          <input type="text" placeholder="search your items here....." />
		  <button><ion-icon name="search-outline"></ion-icon></button>
        </div>
      </div>
    </section>
    <!------------------ SEARCH FIELD ENDS HERE --------------->
         <%
            String msg = request.getParameter("msg");
            if("added".equals(msg)){
        %>
        
                <section class="notification">
                    <div class="noti_container">
                      <div class="noti_text">
                        <p>
                            Your Product Successfully added in cart
                        </p>
                        <ion-icon name="close-outline"></ion-icon>
                        <a href="shop.jsp">Confirm</a>
                        <a href="shop.jsp">Cancel</a>
                      </div>
                    </div>
            </section>
                
        <%
            }
        %>
        
        <%           
            if("exist".equals(msg)){
        %>
        
            <section class="notification">
                    <div class="noti_container">
                      <div class="noti_text">
                        <p>
                            Product already exist in you cart! Quantity  increased!!!
                        </p>
                        <ion-icon name="close-outline"></ion-icon>
                        <a href="shop.jsp">Confirm</a>
                        <a href="shop.jsp">Cancel</a>
                      </div>
                    </div>
            </section>
                
        <%
            }
        %>
        
        <%           
            if("invalid".equals(msg)){
        %>
        
            <section class="notification">
                    <div class="noti_container">
                      <div class="noti_text">
                        <p>
                            Something went wrong please, try again later!!!
                        </p>
                        <ion-icon name="close-outline"></ion-icon>
                        <a href="shop.jsp">Confirm</a>
                        <a href="shop.jsp">Cancel</a>
                      </div>
                    </div>
            </section>
                
        <%
            }
        %>
    
    <!------------------ SHOP CARDS STARTS HERE --------------->
    <section class="shop_cards_panel">
      <div class="shop_cards_cont container">
        <div class="single_cards">
            
            <%
                try {
                        
                    
                Connection con = connectionProvider.getCon();
                PreparedStatement pst = con.prepareStatement("select * from admin where active='Yes'");
                ResultSet rs = pst.executeQuery();
                while(rs.next()){
            %>
       
          <!------------------ SHOP SINGLE CARD STARTS HERE --------------->
          <div class="shop_card">
            <div class="card_image">
                <a href="product.jsp?id=<%=rs.getString(1) %>">
                    <img src="shop products/<%=rs.getString(6) %>" alt="watch" />
                </a>
            </div>
            <div class="card_text">
              <h2><%=rs.getString(2) %></h2>
              <small><%=rs.getString(3) %></small>
              <p>price: <span><%=rs.getString(4) %>/-</span><label for="sign">&#8377</label></p>
              <div class="cart_btn">
                  <a href="cartAction.jsp?id=<%=rs.getString(1) %>">Add to Cart</a>
              </div>
            </div>
          </div>
          
          <%
              }
              } catch (Exception e) {
                e.printStackTrace();
                System.out.println(e);
               }
          %>
          
          
        </div>
        <div class="shop_pagination">
          <div class="pagination">
            <a href="shop.jsp">1</a>
            <a href="#">2</a>
            <a href="#">3</a>
            <a href="#">4</a>
            <a href="#">5</a>

            <!-- <a href="#"><ion-icon name="chevron-forward-circle-outline"></ion-icon></a> -->
          </div>
        </div>
      </div>   
    </section>
    <!------------------ SHOP CARDS ENDS HERE --------------->
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

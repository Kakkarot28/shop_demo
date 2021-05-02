<%@page import="java.sql.*" %>
<%@page import="watch_connection.connectionProvider" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>BNSD</title>
    <link rel="stylesheet" href="sass/style.css" />
  </head>
  <body>
    <!------------------ HEADER STARTS HERE --------------->
    <header>
      <!------------------ NAV STARTS HERE --------------->
      <nav>
        <div class="navbar container">
          <div class="logo">
            <h1><a href="index.jsp"><span class="logo_icon"><img src="images/Logo0.png"></span> BNSD</a></h1>
          </div>
          <div class="nav_items">
            <div class="menu">
              <ul>
                <li><a href="index.jsp">Home</a></li>
                <li><a href="shop.jsp">Shop</a></li>
                <li><a href="aboutUs.jsp">About Us</a></li>
                <li><a href="contactUs.jsp">Contact Us</a></li>
              </ul>
            </div>
            <div class="register_btn">
              <div class="menu_btn">
              <a href="login.jsp">Sign In/Sign Up</a>
              </div>            
            </div>
          </div>
        </div>
      </nav>
      <!------------------ NAV ENDS HERE --------------->
      <!------------------ MAIN STARTS HERE --------------->
      <main>
        <div class="mainCont container">
          <div class="banner">
            <h3>BNSD</h3>
            <h1>Grooming Watches</h1>
            <p>YOUR ONLINE FASHION DESTINATION</p>
            <a href="shop.html">Shop Now</a>
          </div>
        </div>
      </main>
      <!------------------ MAIN ENDS HERE --------------->
    </header>
    <!------------------ HEADER ENDS HERE --------------->
    <!------------------ OFFERS STARTS HERE --------------->

    <section class="container" id="offers">
      <div class="offer_container">
        <div class="offer_pt_1">
          <div class="offer_clock">
            <div class="offer_clk_img">
              <img src="images/BannerClock.png" alt="Vintage Wall Clock" />
            </div>
            <div class="offer_clk_text">
              <p><span>35%</span>off</p>
              <h3>Money Saving Week</h3>
              <h1>
                Vintage Wall <br />
                Clocks.
              </h1>
              <a href="#">Shop Now</a>
            </div>
          </div>
        </div>
        <div class="offer_pt_2">
          <!-- MENS OFFER STARTS HERE -->
          <div class="offer_men offer">
            <div class="offer_men_img">
              <img src="images/BannerMen.png" alt="Virat Kohli" />
            </div>
            <div class="offer_men_text">
              <p><span>15%</span>off</p>
              <h3>Special Offers</h3>
              <h1>Mens Wrist Watches.</h1>
              <a href="#">Shop Now</a>
            </div>
          </div>
          <!-- SMART OFFER STARTS HERE -->
          <div class="offer_smart offer">
            <div class="offer_smart_text">
              <p><span>5%</span>off</p>
              <h3>Black Friday Sale</h3>
              <h1>Smart Watches.</h1>
              <a href="#">Shop Now</a>
            </div>
            <div class="offer_smart_img">
              <img src="images/BannerSmart.png" alt="Smart Watches" />
            </div>
          </div>
          <!-- GIRLS OFFER STARTS HERE -->
          <div class="offer_girls offer">
            <div class="offer_girls_img">
              <img src="images/BannerGirl5.png" alt="Jennifer Lawrence" />
            </div>
            <div class="offer_girls_text">
              <p><span>25%</span>off</p>
              <h3>womens day Special</h3>
              <h1>Wrist Watches.</h1>
              <a href="#">Shop Now</a>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!------------------ OFFERS ENDS HERE --------------->

    <!---------------- LATEST ARRIVALS STARTS HERE --------------->
    <section class="latest_arrivals">
      <div class="arrivals container">
        <h1>Latest Arrivals</h1>
        <!-- ARRIVALS CARDS -->
        <div class="arrivals_cards">
            
            <%
                try {
                        Connection con = connectionProvider.getCon();
                        PreparedStatement pst = con.prepareStatement("select * from admin where active='Yes' and pages='pg1'");
                        ResultSet rs = pst.executeQuery();
                        while(rs.next()){
            %>            
            
          <!-- ARRIVALS SINGLE PRODUCT CARD -->
          <div class="latest_product_card">
              <a href="product.jsp?id=<%=rs.getString("id") %>">
            <div class="latest_product_card_img">
                <img src="shop products/<%=rs.getString("image") %>" alt="Clock" />
            </div>
            <div class="latest_product_card_txt">
              <h2><%=rs.getString("name") %></h2>
              <label for="stock">in stock</label>
              <div class="card_price_sec">
                <p>Rs.<span><%=rs.getString("price") %></span></p>
                <input type="number" min="1" max="5" value="1" />
                <ion-icon name="cart-outline"></ion-icon>
              </div>
            </div>
                </a>
          </div>
            <%
                }
                    } catch (Exception e) {
                    }
            %>          
        </div>
        <div class="arrivals_shop_btn">
          <a href="#">View More</a>
        </div>
      </div>
    </section>
    <!---------------- LATEST ARRIVALS ENDS HERE --------------->
  <!---------------- SERVICES STARTS HERE --------------->
  <section class="container" id="services">
    <div class="services_cont">
      <h1>Our Services</h1>
      <div class="services_deals">
          <div class="services_shipping ser">
              <div class="service_icon"><ion-icon name="airplane-outline"></ion-icon></div>
              <div class="service_text">
                <h2>Free shipping</h2>
                <div class="service_underline">
      
                </div>
                <p>Most product are free
                  shipping.</p>
              </div>
            </div>
            <div class="services_support ser">
              <div class="service_icon"><ion-icon name="headset-outline"></ion-icon></div>
              <div class="service_text">
                <h2>Customer Support</h2>
                <div class="service_underline">
                </div>
                <p>24x7 Customer Support</p>
              </div>
            </div>
            <div class="services_payment ser">
              <div class="service_icon"><ion-icon name="card-outline"></ion-icon></div>
              <div class="service_text">
                <h2>Secure Payment
                </h2>
                <div class="service_underline">
                </div>
                <p>Most Secure Payment
                  for customer.</p>
              </div>
            </div>
      </div>

    </div>
  </section>
  <!---------------- SERVICES ENDS HERE ---------------> 
    <!---------------- GALLERY STARTS HERE --------------->
<section class="gal_sec">
  <div class="gal_heading container">
      <h1>Gallery</h1>
  </div>
    <div class="gallery">  
      <img src="images/S3.jpg" alt="01">
      <img src="images/L1.jpg" alt="01">
      <img src="images/L2.jpg" alt="01">
      <img src="images/C1.jpg" alt="01">
      <img src="images/S1.jpg" alt="01">
      <img src="images/C2.jpg" alt="01">
      <img src="images/M3.jpg" alt="01">
      <img src="images/L3.jpg" alt="01">
      <img src="images/S2.jpg" alt="01">
      <img src="images/M1.jpg" alt="01">
      <img src="images/C4.jpg" alt="01">
      <img src="images/M4.jpg" alt="01">
      <img src="images/M5.jpg" alt="01">
      <img src="images/C5.jpg" alt="01">
      <img src="images/C3.jpg" alt="01">
      <img src="images/M6.jpg" alt="01">
      <img src="images/L4.jpg" alt="01">
      <img src="images/M2.jpg" alt="01">
    </div>
</section>
  <!---------------- GALLERY ENDS HERE --------------->
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

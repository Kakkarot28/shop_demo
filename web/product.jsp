<%@page import="java.sql.*" %>
<%@page import="watch_connection.connectionProvider" %>
<!DOCTYPE html>
<html lang="en">  
  <head>     
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>Product</title>
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
                  <li><a href="index.jsp">Home</a></li>
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
            <h1>Product</h1>
            <p>SIGNIN OR SIGNUP FOR FURTHER SHOPPING</p>
          </div>
        </div>
      </main>
      <!------------------ MAIN ENDS HERE --------------->
    </div>
    <!------------------ NAVSECTION ENDS HERE --------------->
    <!------------------ PRODUCT STARTS HERE --------------->
    
    <section class="products">
      <div class="container single_product_info">                   
                       
            <%

              String id = request.getParameter("id");
              try {
                    Connection con = connectionProvider.getCon();
                    PreparedStatement pst = con.prepareStatement("select * from admin where id='"+id+"'");
                    ResultSet rs = pst.executeQuery();
                    while(rs.next()){
                  
            %>          
          
        <!------------- Product Header Starts Here ------->
        <form action="cartAction.jsp?id=<%=rs.getString("id") %>" method="post">
        <div class="product_header">
          <div class="product_img">
              <img src="shop products/<%=rs.getString("image") %>" alt="Watch" />
          </div>
          <div class="product_info">
            <h1><%=rs.getString("name") %></h1>
            <p>
              <%=rs.getString("description") %>
            </p>
            <hr />
            <h2>Rs.<span><%=rs.getString("price") %></span></h2>
            <h5>Rs.<span><%=rs.getString("line_price") %></span></h5>
            <strong>Size :</strong>
            <div class="watch_size">
              <address>Dial width: 30 mm</address>
              <address>Strap Width: 25 mm</address>
              <address>Category: <%=rs.getString("category") %></address>
            </div>
            <button type="submit">Add To Bag</button>
          </div>
        </div>
        </form>                       
        
            <%
                        }
                    }                              
                   catch (Exception e) {
                            System.out.println(e);
                            e.printStackTrace();
                      }               
            %> 
            
        <hr />
        <!------------- Product Details Starts Here ------->
        <div class="product_details">
          <h1>
            Product Details
            <span><ion-icon name="file-tray-full-outline"></ion-icon></span>
          </h1>
          <p>
            This Watch Offers The Priceless Looks And Class You Always Wanted.
            This Watch Offers True Craftsmanship That Only People With A
            Distinct Taste Can Identify. This Watch Is Designed Using Technology
            And Innovation, All Of Which Is Wrapped Up In Eye-catchy Dials
            Encased In quality Case That Can Be Beautifully Placed On Your Wrist
            Using Its Comfortable And Luxuriously Finished Leather
            Strap/Matel/Rubber or bracelets . Being Battery Powered, This Watch
            Offers Amazing Long Life And Durability That You Would Look For. We
            Are Sure That This Watch Is Going To Be Your Favorite For All Those
            Business Meetings, Events, Outings And Special Occasions Because
            It?s Not A Watch, It?s Your Identity.
          </p>
        </div>
        <hr />
        <!------------- Product Reviews Starts Here ------->
        <div class="product_reviews">
          <h1>
            Product Reviews<span
              ><ion-icon name="chatbox-ellipses-outline"></ion-icon
            ></span>
          </h1>
          <!----------- SINGLE REVIEW ----------->
          <div class="review">
            <div class="review_header">
              <div class="review_img">
                <img src="images/BannerMen.png" alt="" />
              </div>
              <div class="review_name">
                <h2>-Virat Kohali</h2>
              </div>
            </div>
            <div class="review_comment">
              <address>
                " Lorem ipsum dolor sit amet consectetur adipisicing elit.
                Culpa, perspiciatis. Nobis assumenda magni omnis aliquid a,
                maxime totam!"
              </address>
            </div>
            <hr />
          </div>
          <!----------- SINGLE REVIEW ----------->
          <div class="review">
            <div class="review_header">
              <div class="review_img">
                <img src="images/Bg2.jpg" alt="" />
              </div>
              <div class="review_name">
                <h2>-John Doe</h2>
              </div>
            </div>
            <div class="review_comment">
              <address>
                " Lorem ipsum Lorem ipsum dolor sit amet. dolor sit amet
                consectetur adipisicing elit. Culpa, perspiciatis. Nobis
                assumenda magni omnis aliquid a, maxime totam!"
              </address>
            </div>
            <hr />
          </div>
          <!----------- SINGLE REVIEW ----------->
          <div class="review">
            <div class="review_header">
              <div class="review_img">
                <img src="images/BannerGirl5.png" alt="" />
              </div>
              <div class="review_name">
                <h2>-Nico Robin</h2>
              </div>
            </div>
            <div class="review_comment">
              <address>
                " Lorem ipsum dolor sit amet consectetur adipisicing elit.
                Culpa, perspiciatis."
              </address>
            </div>
            <hr />
          </div>
        </div>
      </div>
    </section>
    <hr>
    <!------------------ PRODUCT ENDS HERE --------------->
    <hr>
    <section class="suggestions">
      <div class="container suggest">
        <h1>Suggestions <span><ion-icon name="bag-check-outline"></ion-icon></span> </h1>
        <div class="single_cards">
<!------------------ SHOP SINGLE CARD STARTS HERE --------------->
               <div class="shop_card">
                   <div class="card_image">
                     <img src="shop products/001.jpg" alt="watch" />
                   </div>
                   <div class="card_text">
                     <h2>Oris Aquis Date Calibre 400</h2>
                     <small>Men</small>
                     <p>price: <span>2500/-</span><label for="sign">&#8377</label></p>
                     <div class="cart_btn">
                       <a href="#">Add to Cart</a>
                     </div>
                   </div>
                 </div>
<!------------------ SHOP SINGLE CARD STARTS HERE --------------->
          <div class="shop_card">
                   <div class="card_image">
                     <img src="shop products/002.jpg" alt="watch" />
                   </div>
                   <div class="card_text">
                     <h2>Zenith Defy El Primero 21</h2>
                     <small>Men</small>
                     <p>price: <label for="sign">&#8377</label> <span>55</span></p>
                     <div class="cart_btn">
                       <a href="#">Add to Cart</a>
                     </div>
                   </div>
          </div>
<!------------------ SHOP SINGLE CARD STARTS HERE --------------->
          <div class="shop_card">
                   <div class="card_image">
                     <img src="shop products/003.jpg" alt="watch" />
                   </div>
                   <div class="card_text">
                     <h2>Aquis Date Calibre 500</h2>
                     <small>Men</small>
                     <p>price:$<span>25</span></p>
                     <div class="cart_btn">
                       <a href="#">Add to Cart</a>
                     </div>
                   </div>
          </div>
<!------------------ SHOP SINGLE CARD STARTS HERE --------------->
          <div class="shop_card">
                                      <div class="card_image">
                                        <img src="shop products/003.jpg" alt="watch" />
                                      </div>
                                      <div class="card_text">
                                        <h2>Aquis Date Calibre 500</h2>
                                        <small>Men</small>
                                        <p>price:$<span>25</span></p>
                                        <div class="cart_btn">
                                          <a href="#">Add to Cart</a>
                                        </div>
                                      </div>
          </div>
        </div>
        <div class="visit">
          <a href="#">Visit Shop</a>
        </div>
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


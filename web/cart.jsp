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
                <a href="indexx.jsp">Go to back</a>
            </div>
          </div>
        </div>
      </nav>
      <!------------------ NAV ENDS HERE --------------->
      <!------------------ MAIN STARTS HERE --------------->
      <main>
        <div class="mainCont container">
          <div class="banner">
            <h1>SHOPPING Cart</h1>
            <p>Lorem ipsum, dolor sit amet consectetur adipisicing elit.</p>
          </div>
        </div>
      </main>
      <!------------------ MAIN ENDS HERE --------------->
    </div>
    <!------------------ NAVSECTION ENDS HERE --------------->
    <%
        String msg = request.getParameter("msg");
        if("notpossible".equals(msg)){
    %>
    
        <section class="notification">
                    <div class="noti_container">
                      <div class="noti_text">
                        <p>
                            There is only one Quantity! So click on remove!!!
                        </p>
                        <ion-icon name="close-outline"></ion-icon>
                        <a href="cart.jsp">Confirm</a>
                        <a href="cart.jsp">Cancel</a>
                      </div>
                    </div>
        </section>
    
    <%
        }
        if("inc".equals(msg)){       
    %>
    
        <section class="notification">
                    <div class="noti_container">
                      <div class="noti_text">
                        <p>
                            Product Quantity Increased !!!
                        </p>
                        <ion-icon name="close-outline"></ion-icon>
                        <a href="cart.jsp">Confirm</a>
                        <a href="cart.jsp">Cancel</a>
                      </div>
                    </div>
        </section>   
    
    <%
        }
        if("dec".equals(msg)){       
    %>
    
        <section class="notification">
                    <div class="noti_container">
                      <div class="noti_text">
                        <p>
                            Product Quantity Decreased !!!
                        </p>
                        <ion-icon name="close-outline"></ion-icon>
                        <a href="cart.jsp">Confirm</a>
                        <a href="cart.jsp">Cancel</a>
                      </div>
                    </div>
        </section>   
    
    <%
        }
        if("remove".equals(msg)){ 
    %>
    
        <section class="notification">
                    <div class="noti_container">
                      <div class="noti_text">
                        <p>
                            Product Removed Successfully in Cart
                        </p>
                        <ion-icon name="close-outline"></ion-icon>
                        <a href="cart.jsp">Confirm</a>
                        <a href="cart.jsp">Cancel</a>
                      </div>
                    </div>
        </section>   
    
    <%
        }
        
    %>
    
        
    
    <section class="shopping_cart">
      <div class="cart container">
        <table>
          <!-- TABLE HEAD -->
          
          <%
              int total = 0;
              int srno = 0;
              
              try {
                    String email = session.getAttribute("email").toString();
                      
                    Connection con = connectionProvider.getCon();
                    Statement st = con.createStatement();
                    ResultSet rs = st.executeQuery("select sum(total) from cart where email='"+email+"' and address is null");
                    while(rs.next()){ 
                        total = rs.getInt(1);
          %>
                        
        </table>
          <table>
          <tr>
            <th>sr. no.</th>
            <th>image</th>
            <th>Product name</th>
            <th>category</th>
            <th>unit price</th>
            <th>Increment / decrement</th>
            <th>quantity</th>
            <th>subtotal</th>
            <th>remove</th>
          </tr>
          <!-- TABLE ROW FIRST -->
                     
              <%
                  ResultSet rs1 = st.executeQuery("select * from admin inner join cart on admin.id=cart.product_id and cart.email='"+email+"' and cart.address is null");
                  while(rs1.next()){
              %>
              
            <tr>
              <%srno = srno+1; %>
            <td><%out.println(srno); %></td>        
            <td><img src="shop products/<%=rs1.getString("image") %>" alt="#" /></td>
            <td><a href="#"><%=rs1.getString("name") %></a></td>
            <td><%=rs1.getString("category") %></td>
            <td>$<span><%=rs1.getString("price") %></span></td>
            <td>
              <div class="inc_dic">
                  <a href="incDecQuantityAction.jsp?id=<%=rs1.getString(1) %>&quantity=inc"><ion-icon name="add-sharp"></ion-icon></a>
                  <a href="incDecQuantityAction.jsp?id=<%=rs1.getString(1) %>&quantity=dec"><ion-icon name="remove-sharp"></ion-icon></a>
              </div>
            </td>
            <td><%=rs1.getString("quantity") %></td>
            <td>$<span><%=rs1.getString("total") %></span></td>
            <td><a href="removeFromCart.jsp?id=<%=rs1.getString(1) %>"><ion-icon name="close-sharp"></ion-icon></a></td>
          </tr>
     
          <%
              }
          %>
          
          <%
              }
                    
                  } catch (Exception e) {
                    e.printStackTrace();
                    System.out.println(e);
                  }
          %>
          
        </table>
          
        <div class="cart_checkout">
            <h2>Total in Rs:<span><%out.println(total);%></span></h2>
            <%
                if(total>0){
            %>
            <a href="checkout.jsp">Proceed to Checkout</a>
            <%
                }
            %>
            
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

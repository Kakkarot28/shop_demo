<%@page import="watch_connection.connectionProvider" %>
<%@page import="java.sql.*" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>Sign In/ Sign Up</title>
    <link rel="stylesheet" href="sass/style.css" />
    <script>
    if(window.history.forward(1) !=null)
        window.history.forward(1);</script>
  </head>
  <body>
    <!------------------ NAV SECTION STARTS HERE --------------->

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
            <h1>checkout</h1>
            <p>Complete your order here</p>
          </div>
        </div>
      </main>
      <!------------------ MAIN ENDS HERE --------------->
    </div>
    <!------------------ NAV SECTION ENDS HERE --------------->
    <section class="checkout">
            <%
                  String email = session.getAttribute("email").toString();
                  try {
                            Connection con = connectionProvider.getCon();
                            Statement st = con.createStatement();
                            ResultSet rs2 =  st.executeQuery("select * from users where email='"+email+"'");
                            if(rs2.next()){
            %>
            <form action="checkoutAction.jsp" method="post">
      <div class="container check_cont">
        <!-- Billing details -->
        <div class="billing_details">
          <h1>Billing details</h1>           
          <div class="checkout_form">             
            <!-- NAMES -->
            <div class="common_input name">
              <div class="fname">
                <label for="fname"> First Name <span>*</span></label>
                <input type="text" name="name" value="<%=rs2.getString("name") %>" required/>
              </div>
              <!--<div class="lname">
                <label for="lname"> Last Name <span>*</span></label>
                <input type="text" />
              </div>-->
            </div>
            <!-- COUNTRY -->
            <div class="common_input">
              <label for="country">Country / Region <span>*</span> </label>
              <input type="text" placeholder="India" name="country" value="<%=rs2.getString("country") %>" required/>
            </div>
            <!-- STREET ADDRESS -->
            <div class="common_input">
              <label for="address">Street Address <span>*</span> </label>
              <input type="text" class="adr" name="address" value="<%=rs2.getString("addres") %>" required/>
              <input type="text" placeholder="Important Landmark(optional)" />
            </div>
            <!-- CITY -->
            <div class="common_input">
              <label for="country">Town / City <span>*</span> </label>
              <input type="text" name="city" value="<%=rs2.getString("city") %>" required/>
            </div>
            <!-- STATE -->
            <div class="common_input">
              <label for="country">State / Country <span>*</span> </label>
              <input type="text" name="state" value="<%=rs2.getString("state") %>" required/>
            </div>
            <!-- ZIPCODE -->
            <div class="common_input">
              <label for="country">Postcode / Zip <span>*</span> </label>
              <input type="text" name="code" value="<%=rs2.getString("pincode") %>" required/>
            </div>
            <!-- PHONE NUMBER -->
            <div class="common_input">
              <label for="country">Phone Number <span>*</span> </label>
              <input type="text" name="mobile" value="<%=rs2.getString("mobile") %>" required/>
            </div>
            <!-- EMAIL ADDRESS -->
            <div class="common_input">
              <label for="country">Email Address <span>*</span> </label>
              <input type="email" name="email" value="<%=rs2.getString("email") %>" required/>
            </div>
            <hr />
            <!-- DIFFERENT ADDRESS -->
            <div class="diff_add">
              <div class="diff">
                <input type="checkbox" name="add" />
                <h2>Ship to a different address?</h2>
              </div>

              <textarea name="add" rows="3"></textarea>
            </div>
          </div>
        </div>
        
        <%
            }
        %>
        <!-- YOUR ORDER -->
        <div class="your_order">
          <h1>Your order</h1>
          <div class="orders">
              
              <!-- Table Created here -->
              
            <table>
              <thead>
                <th>Product</th>
                <th>Price</th>
              </thead>
              <tbody>
                  
                  <%
                    ResultSet rs = st.executeQuery("select * from admin inner join cart on admin.id=cart.product_id and cart.email='"+email+"' and cart.address is null");                       
                    while(rs.next()){
                  %>                  
                <tr>
                  <td>
                      <%=rs.getString("name") %>
                    <span><ion-icon name="close-outline"></ion-icon></span>
                    <%=rs.getString("quantity") %> = <%=rs.getString("total") %>
                  </td>
                  <td>
                    <%=rs.getString("price") %>
                  </td>
                </tr>
                           
                <%
                   }
                %>

                <tr>
                  <td>
                    shipping charges
                  </td>
                  <td>30rs.</td>
                </tr>

                <%  
                    int totall = 30;
                    int total = 0;
                    ResultSet rs1 = st.executeQuery("select sum(total) from cart where email='"+email+"' and address is null");
                    while(rs1.next()){
                     total = rs1.getInt(1);
                     totall = total+totall;
                %>
                <tr>    
                  <td>Total</td>
                  <td><%out.println(totall); %></td>
                </tr> 
                <%
                    }
                %>
              </tbody>
            </table>
              
              <!-- Table closed here -->
              
            <hr />
            <!-- CARD -->
            <div class="payments_mode card">               
                <div class="pay_head">
                    <input type="checkbox" name="card" onclick="myFunction()"/>      
                    <h2>Card Payment</h2>
                </div>              
                    <div class="pay_text" id="myInput">
                        <input type="text" placeholder="Enter Name on Card" />
                        <input type="text" placeholder="Enter Card Number" />
                        <input type="text" placeholder="Enter Expiry date 00/0000" />
                        <input type="text" placeholder="Enter cvv" />
                    </div>
                <div class="bt_img">
                    <img
                        src="images/mastercard-discover-card-payment-american-express-visa-visa-master-card-a5b3cbe5f0bff6851e6fee2d99322bdd.png"
                        alt="Accepted Cards"/>
                </div>
                
            </div>
            <!-- CASH ON DELIVERY -->
            <div class="payments_mode cash">
              <div class="pay_head">
                  <input type="checkbox" name="cash" value="Cash on Delivery" required/>
                <h2>cash on delivery</h2>
              </div>
              <div class="pay_text">
                <p>Pay with cash upon delivery.</p>
              </div>
            </div>
            <!-- ONLINE PAYMENT -->
            <div class="payments_mode online">
              <div class="pay_head">
                <input type="checkbox" name="online" />
                <h2>paytm/google pay</h2>
              </div>
              <div class="pay_text">
                <a href="#">
                  Pay via Paytm.
                </a>
                <a href="#">Pay via G-Pay.</a>
              </div>
              <div class="op_img">
                <img
                  src="images/google-pay-send-mobile-payment-google-09ab23ce2e58fa683e4560970bf19ebf.png"
                  alt="G-Pay"
                />
                <img
                  src="images/paytm-logo-brand-service-product-paytm-logo-0b46404036f3696be534de4a958df844.png"
                  alt="PAYTM"
                />
              </div>
            </div>
            <div class="submit_btn">
              <button>Place Order</button>
            </div>
          </div>
        </div>
      </div>
        </form>
             <%
                }catch(Exception e){
                    System.out.println(e);
                    e.printStackTrace();
                }
             %>
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

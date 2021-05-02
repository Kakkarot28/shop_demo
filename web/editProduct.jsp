<%@page import="watch_connection.connectionProvider" %>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>Admin Page</title>
    <link rel="stylesheet" href="sass/style.css" />
  </head>
  <body>
   
    <!------------------ NAVSECTION LOST PASSWORD STARTS HERE --------------->

    <div class="navsection">
      <!------------------ NAV STARTS HERE --------------->
      <nav>
        <div class="navbar container">
          <div class="logo">
              <h1><a href="admin.jsp">BNSD</a></h1>
          </div>
          <div class="nav_items">
            <div class="menu">
              <ul>
                  <li><a href="admin.jsp">Home</a></li>
                  <li><a href="shop.jsp">Shop</a></li>
                  <li><a href="aboutUs.jsp">About Us</a></li>
                  <li><a href="ContactUs.jsp">Contact Us</a></li>
              </ul>
            </div>
            <div class="register_btn">
                <a href="allProductEditProduct.jsp">Back</a>
            </div>
          </div>
        </div>
      </nav>
      <!------------------ NAV ENDS HERE --------------->
      <!------------------ MAIN STARTS HERE --------------->
      <main>
        <div class="mainCont container">
          <div class="banner">
            <h1>ADD New Product</h1>
            <p>ADMIN'S WORK PLACE</p>
          </div>
        </div>
      </main>
      <!------------------ MAIN ENDS HERE --------------->
    </div>
    <!------------------ ADMIN STARTS HERE --------------->
    <section class="admin_work">
      <div class="admin_cont container">
        <div class="admin_form">
          <h1>Edit Product</h1>
          
          <%
              try {
                  String id = request.getParameter("id");
                      Connection con = connectionProvider.getCon();
                      PreparedStatement pst = con.prepareStatement("select * from admin where id='"+id+"'");
                      ResultSet rs = pst.executeQuery();
                      if(rs.next()){
                      
          %>
          
          <form action="editProductAction" method="post" enctype="multipart/form-data">
            <label>Product Id</label>
            <input type="text" name="id" value="<%=rs.getString("id") %>" required/>
            <label>Product Name</label>
            <input type="text" name="name" value="<%=rs.getString("name") %>" required/>
            <label for="category">Product Category</label>
            <input type="text" name="category" value="<%=rs.getString("category") %>" required/>
            <label for="category">Product Price</label>
            <input type="text" name="price" value="<%=rs.getString("price") %>" required/>           
            <label>Active Or Not</label>
            <input type="text" name="active" value="<%=rs.getString("active") %>" required/>
            <label>Product old prices</label>
            <input type="text" name="lprice" value="<%=rs.getString("line_price") %>" required/>
            <label>Product pages</label>
            <input type="text" name="page" value="<%=rs.getString("pages") %>" required/>
            <label>Product Description</label>
            <textarea name="desc" id="desc" rows="3" required></textarea>
            <label for="img">Product Image</label>
            <input type="file" name="img" required/>
            <input type="submit" value="Submit" />           
          </form>
          
          <%
              }
                  } catch (Exception e) {
                    System.out.println(e);
                    e.printStackTrace();
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

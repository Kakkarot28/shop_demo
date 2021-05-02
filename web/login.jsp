<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>Sign In/ Sign Up</title>
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
                <a href="index.jsp">Back to Page</a>
            </div>
          </div>
        </div>
      </nav>
      <!------------------ NAV ENDS HERE --------------->
      <!------------------ MAIN STARTS HERE --------------->
      <main>
        <div class="mainCont container">
          <div class="banner">
            <h1>Sign in / sign up</h1>
            <p>SIGNIN OR SIGNUP FOR FURTHER SHOPPING</p>
          </div>
        </div>
      </main>
      <!------------------ MAIN ENDS HERE --------------->
    </div>
    <!------------------ NAVSECTION ENDS HERE --------------->
    <!------------------ SIGN UP STARTS HERE --------------->

    <section class="sign">
      <div class="signContainer container">
        <!------------------ LOG IN STARTS HERE --------------->
        <div class="log_in">
          <h1>Login</h1>
          <div class="login_form">              
            <form action="loginAction1.jsp" method="post">
              <div class="login_email">
                <label for="email">email address <span>*</span> </label>
                <input type="email" name="email" required />
              </div>
              <div class="login_password">
                <label for="password">password<span>*</span></label>
                <input type="password" name="password" id="myInput" required />
                <span onclick="myFunction()"><ion-icon name="eye-outline"></ion-icon></span>
                
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
                
              </div>
              <div class="login_footer">
                <input type="submit" value="Login" />
                <div class="remember_me">
                  <input type="checkbox" />
                  <label>Rember Me</label>
                </div>
                <u><a href="getPassword.jsp">lost your password ?</a></u>
              </div>                 
            </form>
            <%
                String msge = request.getParameter("msge");
                if("true".equals(msge)){
            %>
            <section class="notification">
                    <div class="noti_container">
                      <div class="noti_text">
                        <p>
                            Enter Correct Email ID & Password!!!
                        </p>
                        <ion-icon name="close-outline"></ion-icon>
                        <a href="login.jsp">Confirm</a>
                        <a href="login.jsp">Cancel</a>
                      </div>
                    </div>
            </section>                
            <%
                  }
            %>
          </div>
        </div>
        <!------------------ LOG IN ENDS HERE --------------->
        <!------------------ REGISTER STARTS HERE --------------->
        <div class="register">
          <h1>register</h1>
          <div class="register_form">
            <form action="SendEmail" method="post">
                
              <!------------------ REGISTER NAME --------------->
              <div class="register_name">
                <label>Full Name <span>*</span></label>
                <input type="text" name="name" required />
              </div>
              <!------------------ REGISTER EMAIL --------------->
              <div class="register_email">
                <label>Email Address <span>*</span></label>
                <input type="email" name="email" required />
              </div>
              <!------------------ REGISTER PHONE NUMBER --------------->
              <div class="register_phone">
                <label>Phone Number <span>*</span></label>
                <input type="text" name="mobile" required />
              </div>
              <!------------------ REGISTER PASSWORD --------------->
              <div class="register_password">
                <label>Password <span>*</span></label>
                <input type="password" name="password" id="password2" required />
                <span onclick="myfunction2()"><ion-icon name="eye-outline"></ion-icon></span>
              </div>
              
              <script>
                  function myfunction2() {
                        var x = document.getElementById("password2");
                        if (x.type === "password") {
                          x.type = "text";
                        } else {
                          x.type = "password";
                        }
                    }
              </script>
              
              <!------------------ REGISTER POLICY --------------->
              <div class="policy">
                <p>
                  Your personal data will be used to support your experience
                  throughout this website, to manage access to your account, and
                  for other purposes described in our
                  <u><a href="#">privacy policy</a></u
                  >.
                </p>
              </div>
              <!------------------ REGISTER SUBMIT BTN --------------->
              <div class="register_btn">
                <input type="submit" value="Register" />
              </div>              
                <%
                  String msg = request.getParameter("msg");
                  if("valid".equals(msg)){
                %>
                
                <section class="notification">
                    <div class="noti_container">
                      <div class="noti_text">
                        <p>
                            You are Successfully Registered in our Site.
                        </p>
                        <ion-icon name="close-outline"></ion-icon>
                        <a href="login.jsp">Confirm</a>
                        <a href="login.jsp">Cancel</a>
                      </div>
                    </div>
                </section>
                            
              <%
                  }else if("invalid".equals(msg)){
              %> 
                    <section class="notification">
                    <div class="noti_container">
                      <div class="noti_text">
                        <p>
                           Sorry unfortunately your email is not registered in BNSD!!!
                        </p>
                        <ion-icon name="close-outline"></ion-icon>
                        <a href="login.jsp">Confirm</a>
                        <a href="login.jsp">Cancel</a>
                      </div>
                    </div>
                </section>
              <%
                  }else if("error".equals(msg)){
              %> 
                    <section class="notification">
                    <div class="noti_container">
                      <div class="noti_text">
                        <p>
                            Something Went Wrong !! Please try Again!!
                        </p>
                        <ion-icon name="close-outline"></ion-icon>
                        <a href="login.jsp">Confirm</a>
                        <a href="login.jsp">Cancel</a>
                      </div>
                    </div>
                </section>
              <%
                  }
              %>
            </form>           
          </div>
        </div>
        <!------------------ REGISTER ENDS HERE --------------->
      </div>
    </section>
    <!------------------ SIGN UP ENDS HERE --------------->
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

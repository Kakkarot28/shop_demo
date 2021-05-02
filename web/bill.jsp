<%@page import="watch_connection.connectionProvider" %>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>Bill</title>
    <link rel="stylesheet" href="sass/style.css" />
  </head>
  <body>
    <section class="bill">
        
        <%
            String email = session.getAttribute("email").toString();
            try {
                    Connection con = connectionProvider.getCon();
                    Statement st = con.createStatement();                  
        %>
        
      <table>
              <thead>
                <th>Product</th>
                <th>Price</th>
              </thead>
              <tbody>
                  
                  <%                    
                    ResultSet rs = st.executeQuery("select * from cart inner join admin on cart.product_id=admin.id and cart.email='"+email+"' and cart.status='bill'");                       
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
                    ResultSet rs1 = st.executeQuery("select sum(total) from cart where email='"+email+"' and status='bill'");
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
             
      <div class="bill_part_two">
          
          <%
                ResultSet rs3 = st.executeQuery("select * from users inner join cart where cart.email='"+email+"' and cart.status='bill'");
                if(rs3.next()){
          %>
          
          <h1>Name: <span><%=rs3.getString("name") %></span></h1>
        <h1>Contact No: <span><%=rs3.getString("mobile") %></span></h1>
        <h1>Email Add: <span><%=rs3.getString("email") %></span></h1>
        <h1>Payment Mode: <span><%=rs3.getString("payment_method") %></span></h1>
        <h1>Order Date: <span><%=rs3.getString("order_date") %></span></h1>
        <h1>Deliver Date: <span><%=rs3.getString("deliver_date") %></span></h1>
        <h1>
          Billing Address:
          <span>
              <%=rs3.getString("address") %> ,<%=rs3.getString("city") %> ,
              <%=rs3.getString("state") %> ,<%=rs3.getString("country") %> ,
              <%=rs3.getString("transaction_id") %>
          </span>
        </h1>
        <h1>Total: <span><%out.println(totall); %></span></h1>
        <%
            }
        %>
      </div>
      <p>
        Thank You For Shopping With Us!
      </p>
      <div class="logo">
        <h1>
          <a href="index.html"
            ><span class="logo_icon"><img src="images/Logo0.png"/></span>
            BNSD</a
          >
        </h1>
      </div>
      
      <%
          } catch (Exception e) {
                e.printStackTrace();
                System.out.println(e);
            }
      %>
      
    </section>
    <section class="bfbtns">
      <div class="bf container">
          <a href="continueShopping.jsp"
          ><span><ion-icon name="arrow-back-outline"></ion-icon></span> Continue
          Shopping</a
        >
        <a onclick="window.print();"
          >Print Bill <span><ion-icon name="print-outline"></ion-icon></span
        ></a>
      </div>
    </section>
    <script src="https://unpkg.com/ionicons@5.4.0/dist/ionicons.js"></script>
  </body>
</html>

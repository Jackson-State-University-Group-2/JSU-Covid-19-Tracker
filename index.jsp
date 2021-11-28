<%@page import="java.sql.Connection"%>
<%@page import = "java.sql.DriverManager" %>
<%@page import = "java.sql.ResultSet"%>
<%@page import = "java.sql.SQLException" %>
<%@ page import = "java.sql.Statement" %>
<%@page import = "java.util.Properties"%>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- JAVA SCRIPT -->
<script type="text/javascript">

    function showRegisterPage(){
        
        window.open("/WebApplication1/RegisterPage.html","_self");
        
    }
    
    function ValidateUser(){
        <%
            String email = request.getParameter("email");
            String password = request.getParameter("psw");
            //System.out.println("Check 1: " + password);

            try {
                
                Class.forName("org.postgresql.Driver");
                Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/covidtrackerdb", "postgres", "password");
                Statement st = conn.createStatement();
                
                String sql = "SELECT userPassword FROM USERS WHERE userEmail LIKE '" + email + "'";
                ResultSet result = st.executeQuery(sql);
                
                String sqlDorm = "SELECT userDorm FROM USERS WHERE userEmail LIKE '" + email + "'";
                ResultSet result1 = st.executeQuery(sqlDorm);
                
                String sqlName = "SELECT userName FROM USERS WHERE userEmail LIKE '" + email + "'";
                ResultSet result2 = st.executeQuery(sqlName);
                
                if (result.next() & result1.next() & result2.next()){
                    String dbpsw = result.getString("userPassword");
                    //System.out.println("Check 2: " + dbpsw);
                    if(dbpsw.equals(password)){
                        
                        //TEST PRINT
                        String dorm = result1.getString("userDorm");
                        //System.out.println("Dorm: " + dorm);
                        
                        String name = result2.getString("userName");
                        //System.out.println("Name: " + name);
                        
                        System.out.println("hi");
                        //TEST PRINT
                       
                        request.setAttribute("name", name);
                        request.setAttribute("email", email);
                        request.setAttribute("dorm", dorm);
                        request.getRequestDispatcher("/LoginDashboardPage.jsp").forward( request, response );
                        //response.sendRedirect("DashboardPage.jsp?namePassed=name&emailPassed=${param.email}&dormPassed=${param.dorm}");

                        //window.open("/WebApplication1/DashboardPage.jsp?namePassed=${param.name}&email=${param.email}&dormPassed=${param.dorm}","_self");
                      
                    }
                    
                    else {}
                }

            } catch (Exception e) {
                System.out.print(e);
                e.printStackTrace();
            }
%>


        
    }
</script>

<style>
body {font-family: Arial, Helvetica, sans-serif;}
form {border: 3px solid #f1f1f1;}

input[type=text], input[type=password] {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  box-sizing: border-box;
}

button {
  background-color: #04AA6D;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 100%;
}

button:hover {
  opacity: 0.8;
}

.cancelbtn {
  width: auto;
  padding: 10px 18px;
  background-color: #f44336;
}

.imgcontainer {
  text-align: center;
  margin: 24px 0 12px 0;
}

img.avatar {
  width: 40%;
  border-radius: 50%;
}

.container {
  padding: 16px;
}

span.psw {
  float: right;
  padding-top: 16px;
}

/* Change styles for span and cancel button on extra small screens */
@media screen and (max-width: 300px) {
  span.psw {
     display: block;
     float: none;
  }
  .cancelbtn {
     width: 100%;
  }
}
</style>
</head>
<body>

<h2>Login Form</h2>

<form action="" method="post">
  <div class="imgcontainer">
    <img src="C:\Users\beebo\Downloads\Logo.jpg" alt="Avatar" class="avatar">
  </div>

  <div class="container">
    <label for="uname"><b>Email</b></label>
    <input type="text" placeholder="Enter Email" name="email" required>
    
    <label for="psw"><b>Password</b></label>
    <input type="password" placeholder="Enter Password" name="psw" required>
     
    <button onclick="ValidateUser()">Login</button>
    
    <button onclick="showRegisterPage()" >Create An Account</button>
   
    
  </div>

  <div class="container" style="background-color:#f1f1f1">
    <button type="button" class="cancelbtn">Cancel</button>
    <span class="psw">Forgot <a href="#">password?</a></span>
    <center><label> In Respect To HIPPA - Your Personal Information Will Not Be Disclosed </center></label>
  </div>
    
</form>

</body>
</html>


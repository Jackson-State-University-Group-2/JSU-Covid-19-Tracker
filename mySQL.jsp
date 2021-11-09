<%@page import="java.sql.Connection"%>
<%@page import = "java.sql.DriverManager" %>
<%@page import = "java.sql.ResultSet"%>
<%@page import = "java.sql.SQLException" %>
<%@ page import = "java.sql.Statement" %>
<%@page import = "java.util.Properties"%>
<html>
<!-- JAVA SCRIPT FOR REDIRECT-->
<script type="text/javascript">

    function showDashboardPage(){
        //alert("${param.name}");
        window.open("/WebApplication1/DashboardPage.jsp?namePassed=${param.name}&emailPassed=${param.email}&dormPassed=${param.dorm}","_self");
        
    }
 </script>
<!-- JAVA SCRIPT FOR REDIRECT -->
    
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

<head> 
<title>Connection With JSU mySql Database</title> 
</head> 
<body>

    <h1> <center>THANK YOU FOR JOINING!</center> </h1>
<% 

/*
try {
    Connection conn1 = null;
// connect way #1
            String url1 = "jdbc:mysql://localhost:3306/covidtrackerdb?autoReconnect=true&useSSL=false";
            String user = "root";
            String password = "Beeboy9!";
            Class.forName("com.mysql.jdbc.Driver");
            conn1 = DriverManager.getConnection(url1, user, password);
            if (conn1 != null) {
                System.out.println("Connected to the database covidtrackerdb1");
            }

            Statement st = conn1.createStatement();
            ResultSet rs = st.executeQuery("select * from users");
            
            while (rs.next()) {
                System.out.println(rs.getString("userDorm")); //gets the first column's rows.
            }
            
        } catch (SQLException ex) {
            System.out.println("An error occurred. Maybe user/password is invalid");
            ex.printStackTrace();
        }

*/
%>

<div>
    <b> <center>Welcome to our JSU Covid tracker!</center> </b>
    
<% 
String name = request.getParameter("name");
String email = request.getParameter("email");
String password = request.getParameter("psw");
String dorm = request.getParameter("dorm");

try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/covidtrackerdb?autoReconnect=true&useSSL=false", "root", "Beeboy9!");
Statement st=conn.createStatement();

int i=st.executeUpdate("insert into users(userName,userEmail,userPassword,userDorm)values('"+name+"','"+email+"','"+password+"','"+dorm+"')");
//out.println("Data is successfully inserted!");*
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>
    

</div>

<!-- ALL BUTTONS AND INTERACTIVES IN WEBSITE -->
<div class="container">
    <button onclick="showDashboardPage()" >DASHBOARD</button>
</div>
<!-- ALL BUTTONS AND INTERACTIVES IN WEBSITE -->
</body> 
</html>

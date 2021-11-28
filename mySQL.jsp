<%@page import="java.sql.Connection"%>
<%@page import = "java.sql.DriverManager" %>
<%@page import = "java.sql.ResultSet"%>
<%@page import = "java.sql.SQLException" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@page import = "java.util.Properties"%>

<html>
<!-- JAVA SCRIPT FOR REDIRECT-->
<script type="text/javascript">

    function showIndexPage(){
        //alert("${param.name}");
        window.open("/WebApplication1/index.jsp","_self");
        
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

<head> <title>Connection With JSU mySql Database</title> </head> 

<body>

    <h1> <center>THANK YOU FOR JOINING!</center> </h1>
    
<div>
    <b> <center>Welcome to our JSU Covid tracker!</center> </b>
    
<% 
String name = request.getParameter("name");
String email = request.getParameter("email");
String password = request.getParameter("psw");
String dorm = request.getParameter("dorm");
//POSTGRES INFORMATION
String url = "jdbc:postgresql://localhost:5432/covidtrackerdb";
String user = "postgres";
String postgresPassword = "password";
String INSERT_USERS_SQL = "INSERT INTO users" +"  (userName, userEmail, userPassword, userDorm) VALUES " + " (?, ?, ?, ?);";

Class.forName("org.postgresql.Driver");
try(Connection connection = DriverManager.getConnection(url, user, postgresPassword);
        
        PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USERS_SQL)){
            preparedStatement.setString(1, name);
            preparedStatement.setString(2, email);
            preparedStatement.setString(3, password);
            preparedStatement.setString(4, dorm);
            preparedStatement.execute();
            
            System.out.println("Data is successfully inserted!");
        }catch(SQLException e){
            System.out.print(e);
            e.printStackTrace();
            }
%>
    

</div>

<!-- ALL BUTTONS AND INTERACTIVES IN WEBSITE -->
<div class="container">
    <button onclick="showIndexPage()" >LOGIN</button>
</div>
<!-- ALL BUTTONS AND INTERACTIVES IN WEBSITE -->
</body> 
</html>

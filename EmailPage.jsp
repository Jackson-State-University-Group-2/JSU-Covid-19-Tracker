<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import = "java.util.Properties"%>
<%@page import = "java.sql.DriverManager" %>
<%@page import = "java.sql.ResultSet"%>
<%@page import = "java.sql.SQLException" %>
<%@ page import = "java.sql.Statement" %>
<%@page import = "java.util.Properties"%>

<html lang="en">
    
    <%
        Class.forName("org.postgresql.Driver");
        Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/covidtrackerdb", "postgres", "password");
        Statement st = conn.createStatement();

        String sql = "SELECT DISTINCT userEmail FROM users";
        ResultSet result = st.executeQuery(sql);
        
        String sqlEmail = request.getParameter("emailPassed");
        //System.out.println(sqlEmail);
        
        String sqlDorm = "SELECT userDorm FROM USERS WHERE userEmail LIKE '" + sqlEmail + "'";
        ResultSet result1 = st.executeQuery(sqlDorm);
        
        String dorm = request.getParameter("dormPassed");
        //System.out.println("LOOK AT ME " + dorm);
        
        
        
        if(result1.next()){
            int count = 0;
        while (result.next() ) {
            System.out.println("IM HERE");
            //String dorm = result1.getString("userDorm");
            String email = result.getString("userEmail");
            String s = null;
            
            String command = "sendEmail -f noreply@jsums.edu -t " + email + " -s smtp.gmail.com:587 -xu  beeboy894@gmail.com -xp Dixonfam1! -u '!POSITIVE COVID-19 RESULT REPORTED ON CAMPUS!' -m 'Hello all, there has been a recent report of a positive Covid-19 case on campus. It was reported by a student lodged in Dorm: " + dorm + ". This is a reminder for everyone to be safe and please wear your masks! Thank you! -o tls=yes";
            Process p = Runtime.getRuntime().exec(command);

            count++;
            //System.out.println("Email: " + count + " " + email );
            //Process p = Runtime.getRuntime().exec("C:\\Email\\SimpleEmailFormat.bat");
            
            
        BufferedReader stdInput = new BufferedReader(new 
            InputStreamReader(p.getInputStream()));

            BufferedReader stdError = new BufferedReader(new 
                InputStreamReader(p.getErrorStream()));

            // read the output from the command
            System.out.println("Here is the standard output of the command:\n");
            while ((s = stdInput.readLine()) != null) {
                System.out.println(s);
            }
            
            // read any errors from the attempted command
            System.out.println("Here is the standard error of the command (if any):\n");
            while ((s = stdError.readLine()) != null) {
                System.out.println(s);
            }
        }  
        }
        
    %>






    <!-- STYLE AND BODY -->

    
<head>
	<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title></title>
	<link href='https://fonts.googleapis.com/css?family=Lato:300,400|Montserrat:700' rel='stylesheet' type='text/css'>
	<style>
		@import url(//cdnjs.cloudflare.com/ajax/libs/normalize/3.0.1/normalize.min.css);
		@import url(//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css);
	</style>
	<link rel="stylesheet" href="https://2-22-4-dot-lead-pages.appspot.com/static/lp918/min/default_thank_you.css">
	<script src="https://2-22-4-dot-lead-pages.appspot.com/static/lp918/min/jquery-1.9.1.min.js"></script>
	<script src="https://2-22-4-dot-lead-pages.appspot.com/static/lp918/min/html5shiv.js"></script>
</head>
<body>
	<header class="site-header" id="header">
		<h1 class="site-header__title" data-lead-id="site-header-title">THANK YOU!</h1>
	</header>

	<div class="main-content">
		<i class="fa fa-check main-content__checkmark" id="checkmark"></i>
		<p class="main-content__body" data-lead-id="main-content-body">We appreciate and thank you for helping lessen the exposure of Covid-19 by letting others know that you have been exposed! Please stay safe and get well soon!   - JSUCovid19 Tracker Team</p>
	</div>


	</footer>
</body>


</html>

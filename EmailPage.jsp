<html>

<!-- COMPILING AND IMPORTING LIBRARIES -->
<script type="text/javascript">
    compile 'com.sendgrid:sendgrid-java:4.0.1'
</script>
<%@page import = "com.sendgrid.*" %> 
<%@page import = "java.io.IOException" %> 
<!-- COMPILING AND IMPORTING LIBRARIES -->



<!-- JAVA SCRIPT FOR TWILIO-->
<script type="text/javascript">
    Email from = new Email("beeboy894@yahoo.com");
    Email to = new Email("beeboy894@gmail.com");
    String subject = "JSU Covid-19 Alert Test";
    Content content = new Content(type:"text/plain", value:"ALERT ALERT SOMEONE HAS COVID-19");
    Mail mail = new Mail(from, subject, to, content);
    
    SendGrid sg = new Sendgrid(System.getnev(name:"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"));
    Request request = new Request();
    
    try{
        request.setMethod(Method.POST);
        request.setEndpoint("mail/send");
        request.setBody(mail.build());
        Response response = sg.api(request);
        System.out.println(response.getStatusCode());
        System.out.println(response.getBody());
        System.out.println(response.getHeaders());
    } 
    catch (IOException ex) {
        throw ex;
    }
</script>
<!-- JAVA SCRIPT FOR TWILIO-->


<b> <center>!Thank You For Submitting Your Positive Covid-19 Result!</center> </b>
</html>
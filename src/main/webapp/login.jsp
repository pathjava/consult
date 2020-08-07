<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
   <head>
      <title>Title</title>
      <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
      <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
      <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
      <link href="css/login.css" rel="stylesheet" id="login-css">
   </head>
   <body>
      <div class="wrapper fadeInDown">
         <div id="formContent">
            <!-- Tabs Titles -->
            <!-- Icon -->
            <div class="fadeIn first">
               <img src="images/progwards-logo-gold.png" id="icon" alt="User Icon" />
            </div>
            <!-- Login Form -->
            <form method="post" action="show">
               <input type="text" id="login" class="fadeIn second" name="login" placeholder="login">
               <input type="text" id="password" class="fadeIn third" name="password" placeholder="password">
               <input type="submit" class="btn btn-primary btn-lg" value="Log In">
            </form>
            <!-- Remind Password -->
            <div id="formFooter">
               <a class="underlineHover" href="#">Forgot Password?</a>
            </div>
         </div>
      </div>
   </body>
</html>



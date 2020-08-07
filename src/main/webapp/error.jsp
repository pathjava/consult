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
      <div class="container">
         <div class="row">
            <div class="col-md-12">
               <div class="error-template">
                  <h1>Что-то пошло не так...</h1>
                  <h2>Ошибка</h2>
                  <div class="error-details">
                     <%= request.getAttribute("error-description")%>
                  </div>
                  <div class="error-actions">
                     <a href="javascript:history.back()" class="btn btn-primary btn-lg"><span class="glyphicon glyphicon-home"></span>
                     Вернуться
                     </a>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </body>
</html>
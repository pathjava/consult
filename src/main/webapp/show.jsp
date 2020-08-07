<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
   <head>
      <meta charset=\"utf-8\">
      <title>Результат</title>
   </head>
   <body>
      <div align='center' style="font-size:25px; color:#002480">
         Имя пользователя: <%= request.getParameter("login") %> <br>
         Пароль:  <%= request.getParameter("password") %>
      </div>
   </body>
</html>
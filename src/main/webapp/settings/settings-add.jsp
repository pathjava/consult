<%@ page contentType="text/html;charset=UTF-8" %>
<html>
   <head>
      <title>Настройки</title>
            <%@include file="/common-head.jsp"%>
            <link rel="stylesheet" type="text/css" href="/css/consult-app.css" id="consult-app-css">
            <link rel="stylesheet" type="text/css" href="/css/all.min.css">
   </head>
   <body>
      <header>
         <div class="page-header">
            <p class="h5">Настройки: добавление</p>
         </div>
      </header>
      <main>
         <div class="text-center">
            <form method="post" action="settings-save">
               <div class="form-group">
                  <input type="text" class="input-text" name="name" placeholder="Название параметра">
               </div>
               <div class="form-group">
                  <input type="text" class="input-text" name="value" placeholder="Значение параметра">
               </div>
               <input type="submit" class="input-submit" value="Добавить">
            </form>
         </div>
      </main>
      <footer>
         <div></div>
      </footer>
   </body>
</html>
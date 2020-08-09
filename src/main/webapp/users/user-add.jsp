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
                  <label>
                  <input type="text" class="input-text" name="login" placeholder="Логин">
                  </label>
               </div>
               <div class="form-group">
                  <label>
                  <input type="text" class="input-text" name="password" placeholder="Пароль">
                  </label>
               </div>
               <div class="form-group">
                  <label>
                  <input type="text" class="input-text" name="name" placeholder="Имя">
                  </label>
               </div>
               <div class="form-group">
                  <label>
                  <input type="checkbox" class="input-checkbox" id="is_mentor" name="is_mentor" value="yes">
                  <label for="is_mentor">Наставник</label>
                  </label>
               </div>
               <div class="form-group">
                  <label>
                  <input type="text" class="input-text" name="image" placeholder="Аватарка">
                  </label>
               </div>
               <input type="submit" class="submit-text" value="Добавить">
            </form>
         </div>
      </main>
      <footer>
         <div></div>
      </footer>
   </body>
</html>
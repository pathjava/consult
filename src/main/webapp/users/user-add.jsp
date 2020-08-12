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
            <form method="post" action="user-save">
               <div class="form-group">
                  <input type="text" class="input-text" name="login" placeholder="Логин" minlength="3" maxlength="20" required>
               </div>
               <div class="form-group">
                  <input type="text" class="input-text" name="name" placeholder="Имя" minlength="2" maxlength="20" required>
               </div>
               <div class="form-group">
                   <input type="password" class="input-text" name="password" placeholder="Пароль" minlength="8" maxlength="20" required>
               </div>
               <div class="form-group">
                  <input type="checkbox" class="input-checkbox" id="is_mentor" name="is_mentor">
                  <label for="is_mentor">Наставник</label>
               </div>
               <div class="form-group">
                  <input type="file" name="image" id="file" class="input-file" accept="image/jpeg,image/jpg,image/png,image/gif">
                  <label for="file" class="btn btn-file js-labelFile">
                  <i class="icon fa fa-check"></i>
                  <span class="js-fileName">Загрузить аватарку</span>
                  </label>
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
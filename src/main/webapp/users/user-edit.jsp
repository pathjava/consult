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
            <p class="h5">User: редактирование</p>
         </div>
      </header>
      <main>
         <div class="text-center">
            <form method="post" action="users-info">
               <div class="form-group">
                  <input type="text" class="input-text" name="login" value="${param.login}" placeholder="Логин" readonly>
               </div>
               <div class="form-group">
                  <input type="text" class="input-text" name="name" value="${param.name}" placeholder="Имя" required>
               </div>
               <div class="form-group">
                  <input type="password" class="input-text" name="password" value="${param.password}" placeholder="Пароль" required>
               </div>

               <div class="form-group">
                  <% boolean x = param.is_mentor; %>
                  <input type="checkbox" name="is_mentor" <% if (x) { %> checked <% } %> />
                  <label for="is_mentor">Наставник</label>
               </div>

               <div class="form-group">
                  <img class="user-avatar" name="image" src="${param.image}" alt="${param.name}">
               </div>


               <%-- Элемент для определения редактирования из SettingsSave --%>
               <input type="text" name="edit" value="true" hidden>
               <input type="submit" class="input-submit" value="Сохранить">
            </form>
         </div>
      </main>
      <footer>
         <div></div>
      </footer>
   </body>
</html>
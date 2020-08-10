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
            <p class="h5">Настройки: редактирование</p>
         </div>
      </header>
      <main>
         <div class="text-center">
            <form method="post" action="settings-save">
               <div class="form-group">
                  <input type="text" class="input-text" name="name" value="${param.name}" placeholder="Название параметра" readonly>
               </div>
               <div class="form-group">
                  <input type="text" class="input-text" name="value" placeholder="Значение параметра" value="${param.value}">
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
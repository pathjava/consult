<%@ page import="ru.progwards.java2.db.DataBase" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Comparator" %>
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
            <p class="h5">Список пользователей</p>
         </div>
      </header>
      <main>
         <div class="table-wrapper">
            <div class="text-center">
               <div class="add-edit-user">
                  <a href="/users/user-add.jsp"><span class="add-user"></span></a>
               </div>
            </div>
            <div>
               <table class="table table-striped">
                  <thead>
                     <tr>
                        <th scope="col">Имя</th>
                        <th scope="col">Логин</th>
                        <th scope="col">Статус</th>
                        <th scope="col">Аватарка</th>
                        <th scope="col">Удалить</th>
                        <th scope="col">Редактировать</th>
                     </tr>
                  </thead>
                  <tbody>
                    <tr>
                       <td>${param.login}</td>
                    </tr>

                  </tbody>
               </table>
            </div>
         </div>
      </main>
      <footer>
         <div></div>
      </footer>
   </body>
</html>
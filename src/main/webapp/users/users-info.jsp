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
                     <%
                        List<DataBase.Users.User> users =
                                new ArrayList<DataBase.Users.User>(DataBase.INSTANCE.users.getAll());
                        users.sort(new Comparator<DataBase.Users.User>() {
                            @Override
                            public int compare(DataBase.Users.User o1, DataBase.Users.User o2) {
                                return o1.name.compareTo(o2.name);
                            }
                        });
                        for (DataBase.Users.User user : users) {
                            String status = user.is_mentor ? "Наставник" : "Студент";
                            String img = !user.image.isEmpty() ? user.image : "/avatars/no-avatar.png";
                            out.write("<tr>");
                            out.write("<td width='17%'>" + user.name + "</td>");
                            out.write("<td width='17%'>" + user.login + "</td>");
                            out.write("<td width='17%'>" + status + "</td>");
                            out.write("<td width='17%'><img class='user-avatar' src=" + img + " alt=" + user.name + "></td>");
                            // действия
                            out.write("<td width='16%'>");
                            // кнопка удалить
                            out.write("<form action='/user/user-delete' method='post'>");
                            out.write("<span class='trash'><input class='btn-del' type='submit' name='" + user.login + "' value=''/></span>");
                            out.write("</form>");
                            out.write("</td>");
                            // кнопка редактировать
                            out.write("<td width='16%'>");
                            out.write("<form action='/users/user-edit.jsp' method='post'>");
                            out.write("<input class='btn-edit' type='text' name='name' value='" + user.name + "' hidden />");
                            out.write("<input class='btn-edit' type='text' name='login' value='" + user.login + "' hidden />");
                            out.write("<input class='btn-edit' type='password' name='password' value='" + user.password + "' hidden />");
                            out.write("<input class='btn-edit' type='text' name='is_mentor' value='" + status + "' hidden />");
                            out.write("<input class='btn-edit' type='file' name='image' value='" + img + "' hidden />");
                            out.write("<span class='edit'><input class='btn-edit' type='submit' value=''/></span>");
                            out.write("</form>");
                            out.write("</td>");
                            out.write("</tr>");
                        }
                        %>
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
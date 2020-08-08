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
      <p class="h5">
         Настройки
      </p>
      <div class="table-wrapper">
         <div class="text-center">
            <div class="add-edit-user">
               <a href="/settings/settings-add.jsp"><span class="add-user"></span></a>
            </div>
         </div>
         <table class="table table-striped">
            <thead>
               <tr>
                  <th scope="col">Название</th>
                  <th scope="col">Значение</th>
                  <th scope="col"></th>
                  <th scope="col"></th>
               </tr>
            </thead>
            <tbody>
               <%
                  List<DataBase.Settings.Record> settings =
                          new ArrayList<DataBase.Settings.Record>(DataBase.INSTANCE.settings.getAll());
                  settings.sort(new Comparator<DataBase.Settings.Record>() {
                      @Override
                      public int compare(DataBase.Settings.Record o1, DataBase.Settings.Record o2) {
                          return o1.name.compareTo(o2.name);
                      }
                  });
                  for (DataBase.Settings.Record elem : settings) {
                      out.write("<tr>");

                      out.write("<td width='35%'>" + elem.name + "</td><td width='35%'>" + elem.value + "</td>");
                      // действия
                      out.write("<td width='15%'>");
                      // кнопка удалить
                      out.write("<form action='settings-delete' method='post'>");
                      out.write("    <span class='trash'><input class='btn-del' type='submit' name='" + elem.name + "' value=''/></span>");
                      out.write("</form>");
                      out.write("</td>");
                      // кнопка редактировать
                      out.write("<td width='15%'>");
                      out.write("<form action='settings-edit.jsp' method='post'>");
                      out.write("    <input class='btn-edit' type='text' name='name' value='" + elem.name + "' hidden />");
                      out.write("    <input class='btn-edit' type='text' name='value' value='" + elem.value + "' hidden />");
                      out.write("    <span class='edit'><input class='btn-edit' type='submit' value=''/></span><span class='edit-text'>Редактировать</span>");
                      out.write("</form>");
                      out.write("</td>");

                      out.write("</tr>");
                  }
                  %>
            </tbody>
         </table>
      </div>
      </div>
   </body>
</html>
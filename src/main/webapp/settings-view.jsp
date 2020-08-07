<%@ page import="ru.progwards.java2.lib.DataBase" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Comparator" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Настройки</title>

    <%@include file="common-head.jsp"%>

    <link href="css/consult-app.css" rel="stylesheet" id="consult-app-css">
</head>
<body>
<p class="h5">
    Настройки
</p>
<div class="float-right text-center">
    <a href="settings-add.jsp"><img class="w-50" src="images/add-settings.png" alt="Добавить"></a>
</div>
<table class="table table-striped">
    <thead>
    <tr>
        <th scope="col">Название</th>
        <th scope="col">Значение</th>
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

            out.write("<td>" + elem.name + "</td><td>" + elem.value + "</td>");
            // действия
            out.write("<td>");
            // кнопка редактировать
            out.write("<form action='settings-edit.jsp' method='post'>");
            out.write("    <input class='btn-edit' type='text' name='name' value='" + elem.name + "' hidden />");
            out.write("    <input class='btn-edit' type='text' name='value' value='" + elem.value + "' hidden />");
            out.write("    <input class='btn-edit' type='submit' value=''/>");
            out.write("</form>");
            // кнопка удалить
            out.write("<form action='settings-delete' method='post'>");
            out.write("    <input class='btn-del' type='submit' name='" + elem.name + "' value=''/>");
            out.write("</form>");

            out.write("</td>");
            out.write("</tr>");
        }
    %>
    </tbody>
</table>
</body>
</html>

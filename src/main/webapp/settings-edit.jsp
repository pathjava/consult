<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Настройки</title>

    <%@include file="common-head.jsp"%>
    <link href="css/login.css" rel="stylesheet" id="login-css">
</head>
<body>
<p class="h5">
    Настройки: редактирование
</p>

<div class="text-center">
    <form method="post" action="settings-save">
        <div class="form-group">
            <label>
                Название параметра
                <input type="text" class="fadeIn second" name="name" value="${param.name}" readonly>
            </label>
        </div>
        <div class="form-group">
            <label>
                Значение параметра
                <input type="text" class="fadeIn third" name="value" value="${param.value}">
            </label>
        </div>

        <%-- Элемент для определения редактирования из SettingsSave --%>
        <input type="text" name="edit" value="true" hidden>

        <input type="submit" class="btn btn-primary" value="Сохранить">
    </form>
</div>
</body>
</html>

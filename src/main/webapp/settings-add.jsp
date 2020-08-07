<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Настройки</title>

    <%@include file="common-head.jsp"%>
    <link href="css/login.css" rel="stylesheet" id="login-css">
</head>
<body>
<p class="h5">
    Настройки: добавление
</p>
<div class="text-center">
    <form method="post" action="settings-save">
        <div class="form-group">
            <label>
                Название параметра
                <input type="text" class="fadeIn second" name="name">
            </label>
        </div>
        <div class="form-group">
            <label>
                Значение параметра
                <input type="text" class="fadeIn third" name="value">
            </label>
        </div>
        <input type="submit" class="btn btn-primary" value="Добавить">
    </form>
</div>
</body>
</html>

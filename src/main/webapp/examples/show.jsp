<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:template>
    <jsp:attribute name="title">
        <title>Результат</title>
    </jsp:attribute>
    <jsp:body>
        <div class="text-center alert alert-success">
            Имя пользователя: ${pageContext.request.getParameter("login")} <br>
        </div>
        <div class="text-center alert alert-info">
            Пароль:  ${pageContext.request.getParameter("password")} <br>
        </div>
    </jsp:body>
</t:template>

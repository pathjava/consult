<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:template>
   <jsp:attribute name="title">
    <title>Вход в систему</title>
</jsp:attribute>
    <jsp:body>
        <main class="mainContent col-md-9 col-xl-8 py-md-3">
            <div class="content-text-center">
                <div class="page-header">
                    <h1>Авторизация</h1>
                </div>
                <form method="post" action="${pageContext.request.contextPath}/users/user-auth">
                    <label for="login" class="sr-only"></label>
                    <input type="text" id="login" name="login" class="form-control" placeholder="Логин" required
                           autofocus>
                    <label for="password" class="sr-only"></label>
                    <input type="password" id="password" name="password" class="form-control" placeholder="Пароль"
                           required>
                    <div class="custom-control custom-checkbox mb-3">
                        <input type="checkbox" class="custom-control-input" id="remember" name="is_mentor">
                        <label class="custom-control-label" for="remember"></label>
                        <span class="showPassword">Запомнить</span>
                    </div>
                    <div class="">
                        <input type="submit" class="btn btn-primary btn-block" value="Добавить">
                    </div>
                    <p class="mt-5 mb-3 text-muted">&copy; 2019-2020</p>
                </form>
            </div>
        </main>
    </jsp:body>
</t:template>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:template>
   <jsp:attribute name="title">
    <title>Вход в систему</title>
</jsp:attribute>
    <jsp:body>
        <header>
            <div>
                <img class="logo-img" src="${pageContext.request.contextPath}/images/progwards_ru.jpg"
                     alt="progwards.ru">
            </div>
        </header>
        <main class="mainContent col-md-9 col-xl-8 py-md-3 pl-md-5">
            <div class="content-text-center">
                <div class="page-header">
                    <h1>Авторизация</h1>
                </div>
                <form method="post">
                    <label for="inputEmail" class="sr-only"></label>
                    <input type="email" id="inputEmail" class="form-control" placeholder="Логин" required autofocus>
                    <label for="inputPassword" class="sr-only"></label>
                    <input type="password" id="inputPassword" class="form-control" placeholder="Пароль" required>
                    <div class="custom-control custom-checkbox mb-3">
                        <input type="checkbox" class="custom-control-input" id="remember" name="is_mentor">
                        <label class="custom-control-label" for="remember"></label>
                        <span class="showPassword">Запомнить</span>
                    </div>
                    <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
                    <p class="mt-5 mb-3 text-muted">&copy; 2019-2020</p>
                </form>
            </div>
        </main>
        <footer>
            <div></div>
        </footer>
    </jsp:body>
</t:template>
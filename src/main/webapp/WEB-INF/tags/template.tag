<%@tag description="Template tag for consult" pageEncoding="UTF-8" %>
<%@attribute name="title" fragment="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <jsp:invoke fragment="title"/>
    <link rel="apple-touch-icon" sizes="180x180" href="${pageContext.request.contextPath}/images/apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="${pageContext.request.contextPath}/images/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath}/images/favicon-16x16.png">
    <link rel="manifest" href="${pageContext.request.contextPath}/images/site.webmanifest">
    <link rel="mask-icon" href="${pageContext.request.contextPath}/images/safari-pinned-tab.svg" color="#5bbad5">
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/images/favicon.ico">
    <meta name="msapplication-TileColor" content="#2b5797">
    <meta name="msapplication-config" content="${pageContext.request.contextPath}/images/browserconfig.xml">
    <meta name="theme-color" content="#ffffff">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/consult-app.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/all.min.css">
</head>
<body>
<header>
    <img class="logo-img" src="${pageContext.request.contextPath}/images/progwards_ru.jpg"
         alt="progwards.ru">

    <nav class="navbar navbar-expand-lg navbar-light mainContent bg-light col-md-9 col-xl-8 py-md-3">
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown"
                aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNavDropdown">
            <ul class="navbar-nav">
                <c:if test="${sessionScope.login != null}">
                    <li class="nav-item active">
                        <a class="nav-link" href="${pageContext.request.contextPath}/">Главная<span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link"
                           href="${pageContext.request.contextPath}/users-view?login=${sessionScope.login}">Личный
                            кабинет</a>
                    </li>

                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button"
                           data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Админ-панель
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                            <a class="dropdown-item"
                               href="${pageContext.request.contextPath}/settings-view">Настройки</a>
                            <a class="dropdown-item"
                               href="${pageContext.request.contextPath}/schedule-view">График консультаций</a>
                            <a class="dropdown-item"
                               href="${pageContext.request.contextPath}/users-view">Пользователи</a>
                            <a class="dropdown-item"
                               href="${pageContext.request.contextPath}/consults-view">Список консультаций</a>
                        </div>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/login?logout=true">Выйти</a>
                    </li>
                </c:if>
                <c:if test="${sessionScope.login == null}">
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/login">Войти</a>
                    </li>
                </c:if>
            </ul>
        </div>
    </nav>
</header>
<div>
    <jsp:doBody/>
</div>
<footer>
    <div class="mainContent col-md-9 col-xl-8 py-md-3">
        <p>&copy; 2019-2020</p>
    </div>
</footer>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/customize.js"></script>
</body>
</html>
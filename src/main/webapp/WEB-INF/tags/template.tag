<%@tag description="Template tag for consult" pageEncoding="UTF-8"%>
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
      <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.css">
      <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/consult-app.css">
      <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/all.min.css">
   </head>
   <body>
       <header>
           <img class="logo-img" src="${pageContext.request.contextPath}/images/progwards_ru.jpg"
                alt="progwards.ru">
           <nav class="mainContent col-md-9 col-xl-8 py-md-3">
               <ul class="nav justify-content-center">
                   <li class="nav-item">
                       <a class="nav-link active" href="${pageContext.request.contextPath}/settings-view">Настройки</a>
                   </li>
                   <li class="nav-item">
                       <a class="nav-link" href="${pageContext.request.contextPath}/">Главная</a>
                   </li>
                   <li class="nav-item">
                       <a class="nav-link" href="${pageContext.request.contextPath}/users-info">Пользователи</a>
                   </li>
                   <li class="nav-item">
                       <c:if test="${login == null}">
                           <a class="nav-link" href="${pageContext.request.contextPath}/login">Войти</a>
                       </c:if>
                   </li>
                   <li class="nav-item">
                       <c:if test="${login != null}">
                           <a class="nav-link" href="${pageContext.request.contextPath}/login?logout=true">Выйти</a>
                       </c:if>
                   </li>
               </ul>
           </nav>
       </header>
       <div>
            <jsp:doBody/>
       </div>
       <footer>
           <div></div>
       </footer>
       <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.bundle.js"></script>
       <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
       <script type="text/javascript" src="${pageContext.request.contextPath}/js/customize.js"></script>
       <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
   </body>
</html>
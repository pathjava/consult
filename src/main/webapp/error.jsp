<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:template>
    <jsp:attribute name="title">
        <title>Ошибка</title>
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
                    <h1>Ошибка!</h1>
                </div>
                <div class="alert alert-danger" role="alert">
                    <p>Что-то пошло не так...</p>
                    <p>${pageContext.request.getAttribute("error-description")}</p>
                </div>
                <div class="error-actions">
                    <a href="javascript:history.back()" class="btn btn-primary"><span
                            class="glyphicon glyphicon-home"></span>Вернуться</a>
                </div>
            </div>
        </main>
        <footer>
            <div></div>
        </footer>
    </jsp:body>
</t:template>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:template>
    <jsp:attribute name="title">
        <title>Консультации Progwards</title>
    </jsp:attribute>
    <jsp:body>
        <main class="mainContent col-md-9 col-xl-8 py-md-3">
            <div class="content-text-center">
                <div class="page-header">
                    <h1>Какой-то заголовок</h1>
                </div>
                <a href="${pageContext.request.contextPath}/settings-view">Настройки</a>
            </div>
        </main>
    </jsp:body>
</t:template>
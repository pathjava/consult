<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:template>
   <jsp:attribute name="title">
      <title>Настройки</title>
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
                    <h1>Настройки</h1>
                </div>
                <div class="text-center">
                    <div class="add-edit-user">
                        <a href="${pageContext.request.contextPath}/settings-view?add=true"><span
                                class="add-user"></span></a>
                    </div>
                </div>
                <div>
                    <table class="table table-striped">
                        <thead>
                        <tr>
                            <th scope="col">Название</th>
                            <th scope="col">Значение</th>
                            <th scope="col">Удалить</th>
                            <th scope="col">Редактировать</th>
                        </tr>
                        </thead>
                        <tbody>
                        <jsp:useBean id="settings" scope="request" type="java.util.List"/>
                        <c:forEach var="setting" items="${settings}">
                            <tr>
                                <td>${setting.name}</td>
                                <td>${setting.value}</td>
                                <td>
                                    <form action="${pageContext.request.contextPath}/settings-delete"
                                          method="post">
                                        <span class="trash"><input class='btn-del' type='submit' name='${setting.name}'
                                                                   value=""
                                                                   onclick="return confirm('Вы подтверждаете удаление?')"/></span>
                                    </form>
                                </td>
                                <td>
                                    <form action="${pageContext.request.contextPath}/settings-view?edit=true"
                                          method="post">
                                        <label>
                                            <input type="text" name="name" value="${setting.name}" hidden/>
                                        </label>
                                        <label>
                                            <input type="text" name="value" value="${setting.value}" hidden/>
                                        </label>
                                        <span class="edit"><input class="btn-edit" type="submit" value=""/></span>
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </main>
        <footer>
            <div></div>
        </footer>
    </jsp:body>
</t:template>
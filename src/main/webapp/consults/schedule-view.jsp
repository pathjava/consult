<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:template>
   <jsp:attribute name="title">
      <title>Настройки</title>
   </jsp:attribute>
    <jsp:body>
        <main class="mainContent col-md-9 col-xl-8 py-md-3">
            <div class="content-text-center">
                <div class="text-center">
                    <div class="add-edit-user">
                        <a href="${pageContext.request.contextPath}/schedule-view?add=true"><span
                                class="add-user"></span></a>
                    </div>
                </div>
                <div class="page-header">
                    <h2>Настройки наставников</h2>
                </div>
                <div>
                    <table class="table table-striped">
                        <thead class="thead-dark">
                        <tr>
                            <th scope="col">Логин</th>
                            <th scope="col">Значение</th>
                            <th scope="col">Удалить</th>
                            <th scope="col">Редактировать</th>
                        </tr>
                        </thead>
                        <tbody>
                        <jsp:useBean id="settings" scope="request" type="java.util.List"/>
                        <jsp:useBean id="mentors" scope="request" type="java.util.List"/>
                        <c:forEach var="setting" items="${settings}">
                            <c:forEach var="mentor" items="${mentors}">
                                <c:if test="${setting.name == mentor.login}">
                                    <tr>
                                        <td>${setting.name}</td>
                                        <td>${setting.value}</td>
                                        <td>
                                            <form action="${pageContext.request.contextPath}/schedule-delete"
                                                  method="post">
                                        <span class="trash"><input class='btn-del' type='submit' name='${setting.name}'
                                                                   value=""
                                                                   onclick="return confirm('Вы подтверждаете удаление?')"/></span>
                                            </form>
                                        </td>
                                        <td>
                                            <form action="${pageContext.request.contextPath}/schedule-view?edit=true"
                                                  method="post">
                                                <label>
                                                    <input type="text" name="name" value="${setting.name}" hidden/>
                                                </label>
                                                <label>
                                                    <input type="text" name="value" value="${setting.value}" hidden/>
                                                </label>
                                                <span class="edit"><input class="btn-edit" type="submit"
                                                                          value=""/></span>
                                            </form>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4">
                                            <h6>График ментора ${mentor.name}</h6>
                                            <jsp:useBean id="daysAndTime" scope="request" type="java.util.Map"/>
                                            <c:forEach items="${daysAndTime}" var="entry">
                                                <span class="textSchedule">
                                                <c:forEach items="${entry.value}" var="item" varStatus="loop">
                                                    <c:if test="${entry.key == mentor.login}"><p>${item}</p></c:if>
                                                </c:forEach>
                                                </span>
                                            </c:forEach>
                                        </td>
                                    </tr>
                                </c:if>
                            </c:forEach>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </main>
    </jsp:body>
</t:template>
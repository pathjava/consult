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
                            <th scope="col">#</th>
                            <th scope="col">Логин</th>
                            <th scope="col">День недели</th>
                            <th scope="col">Время консультации</th>
                            <th scope="col">Удалить</th>
                            <th scope="col">Редактировать</th>
                        </tr>
                        </thead>
                        <tbody>
                        <jsp:useBean id="schedules" scope="request" type="java.util.List"/>
                        <c:forEach var="schedule" items="${schedules}" varStatus="loop">
                            <tr>
                                <td>${loop.index+1}</td>
                                <td>${schedule.mentor}</td>
                                <td>${schedule.day_of_week}</td>
                                <td>с ${schedule.start} до ${schedule.duration}</td>
                                <td>
                                    <form action="${pageContext.request.contextPath}/schedule-delete"
                                          method="post">
                                        <span class="trash">
                                            <input class='btn-del' type='submit' name="" value=""
                                                   onclick="return confirm('Вы подтверждаете удаление?')"/>
                                        </span>
                                    </form>
                                </td>
                                <td>
                                    <form action="${pageContext.request.contextPath}/schedule-view?edit=true"
                                          method="post">
                                        <label>
                                            <input type="text" name="name" value="" hidden/>
                                        </label>
                                        <label>
                                            <input type="text" name="value" value="" hidden/>
                                        </label>
                                        <span class="edit"><input class="btn-edit" type="submit"
                                                                  value=""/></span>
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </main>
    </jsp:body>
</t:template>
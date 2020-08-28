<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
                <div class="table-responsive">
                    <table class="table table-striped">
                        <thead class="thead-dark">
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">Наставник</th>
                            <th scope="col">День недели</th>
                            <th scope="col">Время</th>
                            <th scope="col">Удалить</th>
                            <th scope="col">Редакт.</th>
                        </tr>
                        </thead>
                        <tbody>
                        <jsp:useBean id="mentors" scope="request" type="java.util.List"/>
                        <jsp:useBean id="schedules" scope="request" type="java.util.List"/>
                        <jsp:useBean id="startTime" class="java.util.Date"/>
                        <jsp:useBean id="endTime" class="java.util.Date"/>
                        <c:forEach var="schedule" items="${schedules}" varStatus="loop">
                            <jsp:setProperty name="startTime" property="time" value="${schedule.start}"/>
                            <jsp:setProperty name="endTime" property="time"
                                             value="${schedule.start + schedule.duration}"/>
                            <fmt:setTimeZone value="UTC"/>
                            <tr>
                                <td>${loop.index+1}</td>
                                <td>
                                    <c:forEach var="mentor" items="${mentors}">
                                        <c:if test="${schedule.mentor == mentor.login}">
                                            ${mentor.name}
                                        </c:if>
                                    </c:forEach>
                                </td>
                                <td>
                                    <c:if test="${schedule.day_of_week eq 1}">Понедельник</c:if>
                                    <c:if test="${schedule.day_of_week eq 2}">Вторник</c:if>
                                    <c:if test="${schedule.day_of_week eq 3}">Среда</c:if>
                                    <c:if test="${schedule.day_of_week eq 4}">Четверг</c:if>
                                    <c:if test="${schedule.day_of_week eq 5}">Пятница</c:if>
                                    <c:if test="${schedule.day_of_week eq 6}">Суббота</c:if>
                                    <c:if test="${schedule.day_of_week eq 7}">Воскресенье</c:if>
                                </td>
                                <td>с <fmt:formatDate value="${startTime}" pattern="HH:mm"/> до <fmt:formatDate
                                        value="${endTime}" pattern="HH:mm"/>
                                </td>
                                <td>
                                    <form action="${pageContext.request.contextPath}/schedule-delete" method="post">
                                        <label class="hiddenLabel">
                                            <input type="hidden" name="mentorLogin" value="${schedule.mentor}"/>
                                        </label>
                                        <label class="hiddenLabel">
                                            <input type="hidden" name="timeStart" value="${schedule.start}"/>
                                        </label>
                                        <label class="hiddenLabel">
                                            <input type="hidden" name="dayOfWeek" value="${schedule.day_of_week}"/>
                                        </label>
                                        <span class="trash">
                                            <input class="btn-del" type="submit" value=""
                                                   onclick="return confirm('Вы подтверждаете удаление?')"/>
                                        </span>
                                    </form>
                                </td>
                                <td>
                                    <form action="${pageContext.request.contextPath}/schedule-view?edit=true"
                                          method="post">
                                        <label class="hiddenLabel">
                                            <input type="hidden" name="mentorLogin" value="${schedule.mentor}"/>
                                        </label>
                                        <label class="hiddenLabel">
                                            <input type="hidden" name="currentDayOfWeek"
                                                   value="${schedule.day_of_week}"/>
                                        </label>
                                        <label class="hiddenLabel">
                                            <input type="hidden" name="currentTimeStart" value="${schedule.start}"/>
                                        </label>
                                        <label class="hiddenLabel">
                                            <input type="hidden" name="currentTimeDuration"
                                                   value="${schedule.duration}"/>
                                        </label>
                                        <span class="edit">
                                            <input class="btn-edit" type="submit" value=""/>
                                        </span>
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
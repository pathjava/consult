<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<t:template>
   <jsp:attribute name="title">
      <title>user.Mentors</title>
   </jsp:attribute>
    <jsp:body>
        <main class="mainContent col-md-9 col-xl-8 py-md-3">
            <div class="content-text-center">
                <div class="page-header">
                    <h1>Mentors</h1>
                </div>
                <div>
                    <div class="row row-cols-1 row-cols-md-2">
                        <c:forEach var="mentor" items="${requestScope.mentors}">
                            <div class="col mb-4">
                                <div class="card">
                                    <div class="mentorsImage">
                                        <div class="img"
                                             style="background-image:url(${pageContext.request.contextPath}/avatars/${mentor.image});"></div>
                                    </div>
                                    <div class="card-body">
                                        <h5 class="card-title">${mentor.name}</h5>
                                        <div class="card-text">
                                            <jsp:useBean id="startTime" class="java.util.Date"/>
                                            <jsp:useBean id="endTime" class="java.util.Date"/>
                                            <c:forEach var="schedule" items="${requestScope.schedules}">
                                                <c:if test="${schedule.mentor == mentor.login}">
                                                    <jsp:setProperty name="startTime" property="time"
                                                                     value="${schedule.start}"/>
                                                    <jsp:setProperty name="endTime" property="time"
                                                                     value="${schedule.start + schedule.duration}"/>
                                                    <fmt:setTimeZone value="UTC"/>
                                                    <p>
                                                        <c:if test="${schedule.day_of_week eq 1}">Понедельник</c:if>
                                                        <c:if test="${schedule.day_of_week eq 2}">Вторник</c:if>
                                                        <c:if test="${schedule.day_of_week eq 3}">Среда</c:if>
                                                        <c:if test="${schedule.day_of_week eq 4}">Четверг</c:if>
                                                        <c:if test="${schedule.day_of_week eq 5}">Пятница</c:if>
                                                        <c:if test="${schedule.day_of_week eq 6}">Суббота</c:if>
                                                        <c:if test="${schedule.day_of_week eq 7}">Воскресенье</c:if>
                                                        с <fmt:formatDate value="${startTime}" pattern="HH:mm"/> до
                                                        <fmt:formatDate value="${endTime}" pattern="HH:mm"/>
                                                    </p>
                                                </c:if>
                                            </c:forEach>
                                        </div>
                                        <form action="${pageContext.request.contextPath}/consults-add">
                                            <label class="hiddenLabel">
                                                <input type="hidden" name="login" value="${mentor.login}"/>
                                            </label>
                                            <input type="submit" class="btn btn-primary btn-block" value="Записаться">
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
                <div class="error-actions">
                    <a href="javascript:history.back()" class="btn btn-primary"><span
                            class="glyphicon glyphicon-home"></span><i class="far fa-reply"></i></a>
                </div>
            </div>
        </main>
    </jsp:body>
</t:template>
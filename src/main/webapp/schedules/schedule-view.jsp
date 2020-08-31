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
                <div class="table-responsive">
                    <table class="table table-striped">
                        <thead class="thead-dark">
                        <tr>
                            <th scope="col"><i class="far fa-hashtag"></i></th>
                            <th scope="col"><i class="fas fa-user-headset"></i></th>
                            <th scope="col"><i class="far fa-calendar-week"></i></th>
                            <th scope="col"><i class="far fa-clock"></i></th>
                            <th scope="col"><i class="fas fa-trash"></i></th>
                            <th scope="col"><i class="far fa-cog"></i></th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="map" items="${requestScope.schedules}">
                            <tr>
                                <td>${map.key}</td>
                                <c:forEach var="schedule" items="${map.value}">
                                <td>${schedule.mentorName}</td>
                                <td>${schedule.dayOfWeek}</td>
                                <td>${schedule.startAndEndTime}</td>
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
                                </c:forEach>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </main>
    </jsp:body>
</t:template>
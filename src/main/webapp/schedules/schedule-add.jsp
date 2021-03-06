<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:template>
   <jsp:attribute name="title">
      <title>Добавление консультаций</title>
      </jsp:attribute>
    <jsp:body>
        <main class="mainContent col-md-9 col-xl-8 py-md-3">
            <div class="content-text-center">
                <div class="page-header">
                    <h1>Добавление графика консультаций</h1>
                </div>
                <form method="post" action="${pageContext.request.contextPath}/schedule-save">
                    <label>
                        <input type="hidden" name="daysSettings" value="true">
                    </label>
                    <div class="form-group row">
                        <label for="mentor" class="col-sm-2 col-form-label">Наставник</label>
                        <div class="col-sm-10">
                            <select id="mentor" name="mentor" class="custom-select mr-sm-2" required>
                                <option selected>выберите...</option>
                                <c:forEach var="mentor" items="${requestScope.mentors}">
                                    <option value="${mentor.login}">${mentor.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="selectDay" class="col-sm-2 col-form-label">День недели</label>
                        <div class="col-sm-10">
                            <select id="selectDay" name="day_of_week" class="custom-select mr-sm-2" required>
                                <option selected>выберите...</option>
                                <option value="1">Понедельник</option>
                                <option value="2">Вторник</option>
                                <option value="3">Среда</option>
                                <option value="4">Четверг</option>
                                <option value="5">Пятница</option>
                                <option value="6">Суббота</option>
                                <option value="7">Воскресенье</option>
                            </select>
                            <label for="selectDay" style="display: none"></label>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="timeStart" class="col-sm-2 col-form-label">Время начала</label>
                        <div class="col-sm-10">
                            <input type="time" class="form-control" id="timeStart" name="timeStart" required>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="duration" class="col-sm-2 col-form-label">Длительность</label>
                        <div class="col-sm-10">
                            <input type="time" class="form-control" id="duration" name="duration" required>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-sm-2"></div>
                        <div class="col-sm-10">
                            <input type="submit" class="btn btn-primary btn-block" value="Добавить">
                        </div>
                    </div>
                </form>
                <div class="error-actions">
                    <a href="javascript:history.back()" class="btn btn-primary"><span
                            class="glyphicon glyphicon-home"></span><i class="far fa-reply"></i></a>
                </div>
            </div>
        </main>
    </jsp:body>
</t:template>
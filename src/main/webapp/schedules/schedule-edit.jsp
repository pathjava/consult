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
                <div class="page-header">
                    <h1>Edit дней консультаций</h1>
                </div>
                <form method="post" action="${pageContext.request.contextPath}/schedule-save">
                    <label>
                        <input type="hidden" name="daysSettings" value="true">
                    </label>
                    <div class="form-group row">
                        <label for="mentor" class="col-sm-2 col-form-label">Наставник</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="mentor" name="mentor"
                                   value="${param.mentor}" readonly>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="day_of_week" class="col-sm-2 col-form-label">День недели</label>
                        <div class="col-sm-10">
                            <select id="day_of_week" name="day_of_week" class="custom-select mr-sm-2" required>
                                <option selected>выберите...</option>
                                <option value="1" <c:if test="${param.day_of_week eq 1}">selected</c:if>>
                                    Понедельник
                                </option>
                                <option value="2" <c:if test="${param.day_of_week eq 2}">selected</c:if>>Вторник
                                </option>
                                <option value="3" <c:if test="${param.day_of_week eq 3}">selected</c:if>>Среда
                                </option>
                                <option value="4" <c:if test="${param.day_of_week eq 4}">selected</c:if>>Четверг
                                </option>
                                <option value="5" <c:if test="${param.day_of_week eq 5}">selected</c:if>>Пятница
                                </option>
                                <option value="6" <c:if test="${param.day_of_week eq 6}">selected</c:if>>Суббота
                                </option>
                                <option value="7" <c:if test="${param.day_of_week eq 7}">selected</c:if>>
                                    Воскресенье
                                </option>
                            </select>
<%--                            <label for="day_of_week" style="display: none"></label>--%>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="timeStart" class="col-sm-2 col-form-label">Время начала</label>
                        <div class="col-sm-10">
                            <jsp:useBean id="currentTime" class="java.util.Date"/>
                            <fmt:setTimeZone value="UTC"/>
                            <jsp:setProperty name="currentTime" property="time" value="${param.start}"/>
                            <input type="time" class="form-control" id="timeStart" name="timeStart"
                                   value="<fmt:formatDate value="${currentTime}" pattern="HH:mm"/>" required>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="duration" class="col-sm-2 col-form-label">Длительность</label>
                        <div class="col-sm-10">
                            <jsp:useBean id="currentDuration" class="java.util.Date"/>
                            <jsp:setProperty name="currentDuration" property="time"
                                             value="${param.duration}"/>
                            <input type="time" class="form-control" id="duration" name="duration"
                                   value="<fmt:formatDate value="${currentDuration}" pattern="HH:mm"/>" required>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-sm-2"></div>
                        <label class="hiddenLabel">
                            <input type="hidden" name="edit" value="true">
                        </label>
                        <label class="hiddenLabel">
                            <input type="hidden" name="old_day_of_week" value="${param.day_of_week}"/>
                        </label>
                        <label class="hiddenLabel">
                            <input type="hidden" name="start" value="${param.start}"/>
                        </label>
                        <div class="col-sm-10">
                            <input type="submit" class="btn btn-primary btn-block" value="Сохранить">
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
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
                <div class="page-header">
                    <h1>Настройки: добавление</h1>
                </div>
                <form method="post" action="${pageContext.request.contextPath}/settings-save">
                    <div class="form-group row">
                        <label for="controlName" class="col-sm-2 col-form-label">Название параметра</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="controlName" name="name" placeholder="параметр"
                                   required>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="controlValue" class="col-sm-2 col-form-label">Значение параметра</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="controlValue" name="value"
                                   placeholder="параметр" required>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-sm-2"></div>
                        <div class="col-sm-10">
                            <input type="submit" class="btn btn-primary btn-block" value="Добавить">
                        </div>
                    </div>
                </form>
                <div class="page-header">
                    <h2>Настройки дней консультаций</h2>
                </div>
                <form method="post" action="${pageContext.request.contextPath}/settings-save" name="daysSettings">
                    <div class="form-group row">
                        <label for="controlName" class="col-sm-2 col-form-label">Наставник</label>
                        <div class="col-sm-10">
                            <select id="selectMentor" class="custom-select mr-sm-2" required>
                                <option selected>выберите...</option>
                                <jsp:useBean id="mentors" scope="request" type="java.util.List"/>
                                <c:forEach var="mentor" items="${mentors}">
                                    <option value="${mentor.login}">${mentor.name}</option>
                                </c:forEach>
                            </select>
                            <label for="selectMentor" style="display: none"></label>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label">Дни недели,<br/>время начала,<br/>длительность</label>
                        <div class="col-sm-10">
                            <jsp:useBean id="daysOfWeek" scope="request" type="java.util.List"/>
                            <c:forEach var="day" items="${daysOfWeek}" varStatus="loop">
                                <div class="custom-control custom-checkbox">
                                    <input type="checkbox" class="custom-control-input" id="${loop.index+1}"
                                           name="${loop.index+1}-check">
                                    <label class="custom-control-label" for="${loop.index+1}">${day}</label>
                                    <div class="hidden">
                                        <div class="form-group row">
                                            <label for="${loop.index+1}t" class="col-sm-2 col-form-label">Время</label>
                                            <div class="col-sm-10">
                                                <input type="time" class="form-control" id="${loop.index+1}t"
                                                       name="${loop.index+1}-time" required>
                                            </div>
                                            <label for="${loop.index+1}d"
                                                   class="col-sm-2 col-form-label">Длительность</label>
                                            <div class="col-sm-10">
                                                <input type="time" class="form-control" id="${loop.index+1}d"
                                                       name="${loop.index+1}-duration" required>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
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
                            class="glyphicon glyphicon-home"></span>Вернуться</a>
                </div>
            </div>
        </main>
    </jsp:body>
</t:template>
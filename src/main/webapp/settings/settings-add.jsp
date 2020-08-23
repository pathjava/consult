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
                <form method="post" action="${pageContext.request.contextPath}/settings-save">
                    <div class="form-group row">
                        <label for="controlName" class="col-sm-2 col-form-label">Наставник</label>
                        <div class="col-sm-10">
                            <select class="custom-select mr-sm-2" required>
                                <option selected>выберите...</option>
                                <jsp:useBean id="mentors" scope="request" type="java.util.List"/>
                                <c:forEach var="mentor" items="${mentors}" varStatus="loop">
                                    <option value="${loop.index+1}">${mentor.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="controlTime" class="col-sm-2 col-form-label">Время</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="controlTime" name="time"
                                   placeholder="введите время в формате 11-00"
                                   pattern="^(([0,1][0-9])|(2[0-3]))-[0-5][0-9]" required>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="controlDuration" class="col-sm-2 col-form-label">Длительность</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="controlDuration" name="duration"
                                   placeholder="введите время в формате 02-00"
                                   pattern="^(([0,1][0-9])|(2[0-3]))-[0-5][0-9]" required>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="controlDuration" class="col-sm-2 col-form-label">Дни недели</label>
                        <div class="col-sm-10">
                            <div class="custom-control custom-checkbox">
                                <input type="checkbox" class="custom-control-input" value="1" id="1">
                                <label class="custom-control-label" for="1">Понедельник</label>
                            </div>
                            <div class="custom-control custom-checkbox">
                                <input type="checkbox" class="custom-control-input" value="2" id="2">
                                <label class="custom-control-label" for="2">Вторник</label>
                            </div>
                            <div class="custom-control custom-checkbox">
                                <input type="checkbox" class="custom-control-input" value="3" id="3">
                                <label class="custom-control-label" for="3">Среда</label>
                            </div>
                            <div class="custom-control custom-checkbox">
                                <input type="checkbox" class="custom-control-input" value="4" id="4">
                                <label class="custom-control-label" for="4">Четверг</label>
                            </div>
                            <div class="custom-control custom-checkbox">
                                <input type="checkbox" class="custom-control-input" value="5" id="5">
                                <label class="custom-control-label" for="5">Пятница</label>
                            </div>
                            <div class="custom-control custom-checkbox">
                                <input type="checkbox" class="custom-control-input" value="6" id="6">
                                <label class="custom-control-label" for="6">Суббота</label>
                            </div>
                            <div class="custom-control custom-checkbox">
                                <input type="checkbox" class="custom-control-input" value="7" id="7">
                                <label class="custom-control-label" for="7">Воскресенье</label>
                            </div>
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
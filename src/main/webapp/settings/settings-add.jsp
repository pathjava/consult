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
                                <c:forEach var="mentor" items="${mentors}">
                                    <option value="${mentor.login}">${mentor.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="controlTime" class="col-sm-2 col-form-label">Время</label>
                        <div class="col-sm-10">
                            <input type="time" class="form-control" id="controlTime" name="time" required>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="controlDuration" class="col-sm-2 col-form-label">Длительность</label>
                        <div class="col-sm-10">
                            <input type="time" class="form-control" id="controlDuration" name="duration" required>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="controlDuration" class="col-sm-2 col-form-label">Дни недели,<br/>время начала,<br/>длительность</label>
                        <div class="col-sm-10">
                            <div class="custom-control custom-checkbox">
                                <input type="checkbox" class="custom-control-input" value="1" id="1">
                                <label class="custom-control-label" for="1">Понедельник</label>
                                <span class="hidden">
                                    <div class="form-group row">
                                        <label for="1t" class="col-sm-2 col-form-label">Время</label>
                                        <div class="col-sm-10">
                                            <input type="time" class="form-control" id="1t" name="time" required>
                                        </div>
                                        <label for="1d" class="col-sm-2 col-form-label">Длительность</label>
                                        <div class="col-sm-10">
                                            <input type="time" class="form-control" id="1d" name="duration" required>
                                        </div>
                                    </div>
                                </span>
                            </div>
                            <div class="custom-control custom-checkbox">
                                <input type="checkbox" class="custom-control-input" value="2" id="2">
                                <label class="custom-control-label" for="2">Вторник</label>
                                <span class="hidden">
                                    <div class="form-group row">
                                        <label for="2t" class="col-sm-2 col-form-label">Время</label>
                                        <div class="col-sm-10">
                                            <input type="time" class="form-control" id="2t" name="time" required>
                                        </div>
                                        <label for="2d" class="col-sm-2 col-form-label">Длительность</label>
                                        <div class="col-sm-10">
                                            <input type="time" class="form-control" id="2d" name="duration" required>
                                        </div>
                                    </div>
                                </span>
                            </div>
                            <div class="custom-control custom-checkbox">
                                <input type="checkbox" class="custom-control-input" value="3" id="3">
                                <label class="custom-control-label" for="3">Среда</label>
                                <span class="hidden">
                                    <div class="form-group row">
                                        <label for="3t" class="col-sm-2 col-form-label">Время</label>
                                        <div class="col-sm-10">
                                            <input type="time" class="form-control" id="3t" name="time" required>
                                        </div>
                                        <label for="3d" class="col-sm-2 col-form-label">Длительность</label>
                                        <div class="col-sm-10">
                                            <input type="time" class="form-control" id="3d" name="duration" required>
                                        </div>
                                    </div>
                                </span>
                            </div>
                            <div class="custom-control custom-checkbox">
                                <input type="checkbox" class="custom-control-input" value="4" id="4">
                                <label class="custom-control-label" for="4">Четверг</label>
                                <span class="hidden">
                                    <div class="form-group row">
                                        <label for="4t" class="col-sm-2 col-form-label">Время</label>
                                        <div class="col-sm-10">
                                            <input type="time" class="form-control" id="4t" name="time" required>
                                        </div>
                                        <label for="4d" class="col-sm-2 col-form-label">Длительность</label>
                                        <div class="col-sm-10">
                                            <input type="time" class="form-control" id="4d" name="duration" required>
                                        </div>
                                    </div>
                                </span>
                            </div>
                            <div class="custom-control custom-checkbox">
                                <input type="checkbox" class="custom-control-input" value="5" id="5">
                                <label class="custom-control-label" for="5">Пятница</label>
                                <span class="hidden">
                                    <div class="form-group row">
                                        <label for="5t" class="col-sm-2 col-form-label">Время</label>
                                        <div class="col-sm-10">
                                            <input type="time" class="form-control" id="5t" name="time" required>
                                        </div>
                                        <label for="5d" class="col-sm-2 col-form-label">Длительность</label>
                                        <div class="col-sm-10">
                                            <input type="time" class="form-control" id="5d" name="duration" required>
                                        </div>
                                    </div>
                                </span>
                            </div>
                            <div class="custom-control custom-checkbox">
                                <input type="checkbox" class="custom-control-input" value="6" id="6">
                                <label class="custom-control-label" for="6">Суббота</label>
                                <span class="hidden">
                                    <div class="form-group row">
                                        <label for="6t" class="col-sm-2 col-form-label">Время</label>
                                        <div class="col-sm-10">
                                            <input type="time" class="form-control" id="6t" name="time" required>
                                        </div>
                                        <label for="6d" class="col-sm-2 col-form-label">Длительность</label>
                                        <div class="col-sm-10">
                                            <input type="time" class="form-control" id="6d" name="duration" required>
                                        </div>
                                    </div>
                                </span>
                            </div>
                            <div class="custom-control custom-checkbox">
                                <input type="checkbox" class="custom-control-input" value="7" id="7">
                                <label class="custom-control-label" for="7">Воскресенье</label>
                                <span class="hidden">
                                    <div class="form-group row">
                                        <label for="7t" class="col-sm-2 col-form-label">Время</label>
                                        <div class="col-sm-10">
                                            <input type="time" class="form-control" id="7t" name="time" required>
                                        </div>
                                        <label for="7d" class="col-sm-2 col-form-label">Длительность</label>
                                        <div class="col-sm-10">
                                            <input type="time" class="form-control" id="7d" name="duration" required>
                                        </div>
                                    </div>
                                </span>
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
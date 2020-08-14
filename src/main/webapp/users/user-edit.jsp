<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:template>
   <jsp:attribute name="title">
      <title>Настройки пользователя</title>
   </jsp:attribute>
    <jsp:body>
        <header>
            <div class="page-header">
                <p class="h5">User: редактирование</p>
            </div>
        </header>
        <main class="mainContent col-md-9 col-xl-8 py-md-3 pl-md-5">
            <div class="content-text-center">
                <form method="post" action="user-save">
                    <div class="form-group row">
                        <label for="controlLogin" class="col-sm-2 col-form-label">Логин</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="controlLogin" name="login"
                                   value="${param.login}" readonly>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="controlName" class="col-sm-2 col-form-label">Имя</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="controlName" name="name" value="${param.name}"
                                   required>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="controlPassword" class="col-sm-2 col-form-label">Пароль</label>
                        <div class="col-sm-10">
                            <input type="password" class="form-control" id="controlPassword" name="password"
                                   value="${param.password}" required>
                        </div>
                    </div>

                    <div class="form-group row">
                        <div class="col-sm-2">Наставник</div>
                        <div class="col-sm-10">
                            <div class="form-check">
                                <c:choose>
                                    <c:when test="${!param.is_mentor}">
                                        <input type="checkbox" class="form-check-input" id="is_mentor" name="is_mentor">
                                    </c:when>
                                    <c:otherwise>
                                        <input type="checkbox" class="form-check-input" id="is_mentor" name="is_mentor"
                                               checked>
                                    </c:otherwise>
                                </c:choose>
                                <label class="form-check-label" for="is_mentor"></label>
                            </div>
                        </div>
                    </div>
                </form>

                <div class="form-group row">
                    <div class="col-sm-2">
                        <img class="user-avatar"
                             src=${!param.image.isEmpty() ? param.image : '/avatars/no-avatar.png'} alt="${param.name}">
                    </div>
                </div>

                    <%-- Элемент для определения редактирования из SettingsSave --%>
                <div class="form-group row">
                    <div class="col-sm-2"></div>
                    <div class="col-sm-10">
                        <label>
                            <input type="text" name="edit" value="true" hidden>
                        </label>
                        <input type="submit" class="btn btn-primary btn-lg btn-block" value="Сохранить">
                    </div>
                </div>
                </form>
            </div>
        </main>
        <footer>
            <div></div>
        </footer>
    </jsp:body>
</t:template>
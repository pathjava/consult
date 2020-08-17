<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:template>
   <jsp:attribute name="title">
      <title>Настройки пользователя</title>
   </jsp:attribute>
    <jsp:body>
        <header>
            <div>
                <img class="logo-img" src="${pageContext.request.contextPath}/images/progwards.ru.png"
                     alt="progwards.ru">
            </div>
        </header>
        <main class="mainContent col-md-9 col-xl-8 py-md-3 pl-md-5">
            <div class="content-text-center">
                <div class="page-header">
                    <h1>User: редактирование</h1>
                </div>
                <form method="post" action="${pageContext.request.contextPath}/user/user-save"
                      enctype="multipart/form-data">
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
                            <input type="password" class="form-control" id="controlPassword" name="password" value="">
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-sm-2">Наставник</div>
                        <div class="col-sm-10">
                            <div class="custom-control custom-checkbox">
                                <c:choose>
                                    <c:when test="${!param.is_mentor}">
                                        <input type="checkbox" class="custom-control-input" id="is_mentor"
                                               name="is_mentor">
                                    </c:when>
                                    <c:otherwise>
                                        <input type="checkbox" class="custom-control-input" id="is_mentor"
                                               name="is_mentor" checked>
                                    </c:otherwise>
                                </c:choose>
                                <label class="custom-control-label" for="is_mentor"></label>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-sm-2">Текущий аватар</div>
                        <div class="col-sm-10">
                            <img class="user-avatar"
                                 src="${pageContext.request.contextPath}/avatars/${!param.image.isEmpty() ? param.image : 'no-avatar.png'}"
                                 alt="${param.name}">
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-sm-2">Обновить аватар</div>
                        <div class="col-sm-10">
                            <div class="form-group">
                                <input type="file" name="image" class="form-control-file" onchange="ValidateSize(this)"
                                       accept="image/jpeg,image/jpg,image/png,image/gif">
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-sm-2"></div>
                        <div class="col-sm-10">
                            <label>
                                <input type="text" name="edit" value="true" hidden>
                            </label>
                            <input type="submit" class="btn btn-primary btn-block" value="Сохранить">
                        </div>
                    </div>
                </form>
                <div class="error-actions">
                    <a href="javascript:history.back()" class="btn btn-primary"><span
                            class="glyphicon glyphicon-home"></span>Вернуться</a>
                </div>
            </div>
        </main>
        <footer>
            <div></div>
        </footer>
    </jsp:body>
</t:template>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:template>
   <jsp:attribute name="title">
      <title>Настройки пользователя</title>
   </jsp:attribute>
    <jsp:body>
        <main class="mainContent col-md-9 col-xl-8 py-md-3">
            <div class="content-text-center">
                <div class="page-header">
                    <h1>Редактирование пользователя</h1>
                </div>
                <form method="post" action="${pageContext.request.contextPath}/user-save"
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
                            <input type="text" class="form-control" id="controlName" name="name"
                                   minlength="${requestScope.minLoginName}" maxlength="${requestScope.maxLoginName}"
                                   value="${param.name}" required>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="email" class="col-sm-2 col-form-label">Email</label>
                        <div class="col-sm-10">
                            <input type="email" class="form-control" id="email" name="email" value="${param.email}"
                                   pattern="^[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$" required>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="urlProgwards" class="col-sm-2 col-form-label">Progwards</label>
                        <div class="col-sm-10">
                            <input type="url" class="form-control" id="urlProgwards" name="progwardsAccountLink"
                                   value="${param.progwardsAccountLink}" required>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="urlDiscord" class="col-sm-2 col-form-label">Discord</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="urlDiscord" name="discordName"
                                   value="${param.discordName}" pattern="^((.+?)#\d{4})" required>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="controlPassword" class="col-sm-2 col-form-label">Пароль</label>
                        <div class="col-sm-10">
                            <input type="password" class="form-control" id="controlPassword" name="password" value=""
                                   minlength="${requestScope.minPass}" maxlength="${requestScope.maxPass}"
                                   placeholder="от ${requestScope.minPass} до ${requestScope.maxPass} символов">
                            <div class="custom-control custom-checkbox">
                                <input type="checkbox" class="custom-control-input" id="showPassword"
                                       onclick="showFunction()">
                                <label class="custom-control-label" for="showPassword"></label>
                                <span class="showPassword">Показать пароль</span>
                            </div>
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
                            <div class="avatar">
                                <div class="user-avatar">
                                    <div class="img"
                                         style="background-image:url(${pageContext.request.contextPath}/${requestScope.avatarsDirectory}/${!param.image.isEmpty() ? param.image : "no-avatar.png"});"></div>
                                </div>
                            </div>
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
                            <label class="hiddenLabel">
                                <input type="hidden" name="edit" value="true"/>
                            </label>
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
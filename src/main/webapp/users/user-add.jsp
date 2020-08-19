<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:template>
   <jsp:attribute name="title">
    <title>Добавление пользователя в базу данных</title>
    </jsp:attribute>
    <jsp:body>
        <main class="mainContent col-md-9 col-xl-8 py-md-3">
            <div class="content-text-center">
                <div class="page-header">
                    <h1>Добавление пользователя</h1>
                </div>
                <form method="post" action="${pageContext.request.contextPath}/user/user-save"
                      enctype="multipart/form-data">
                    <div class="form-group row">
                        <label for="controlLogin" class="col-sm-2 col-form-label">Логин</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="controlLogin" name="login" minlength="2"
                                   maxlength="20" pattern="[a-zA-Z0-9.]+" placeholder="латинские буквы и цифры"
                                   required>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="controlName" class="col-sm-2 col-form-label">Имя</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="controlName" name="name" minlength="2"
                                   maxlength="20" required>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="controlPassword" class="col-sm-2 col-form-label">Пароль</label>
                        <div class="col-sm-10">
                            <input type="password" class="form-control" id="controlPassword" name="password"
                                   minlength="8" maxlength="20" placeholder="от 8 до 20 символов" required>
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
                                <input type="checkbox" class="custom-control-input" id="is_mentor" name="is_mentor">
                                <label class="custom-control-label" for="is_mentor"></label>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-sm-2">Аватарка</div>
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
        <footer>
            <div></div>
        </footer>
    </jsp:body>
</t:template>
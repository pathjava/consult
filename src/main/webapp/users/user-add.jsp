<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:template>
   <jsp:attribute name="title">
    <title>Настройки</title>
    </jsp:attribute>
    <jsp:body>
        <header>
            <div class="page-header">
                <h1>Добавление пользователя</h1>
            </div>
        </header>
        <main class="mainContent col-md-9 col-xl-8 py-md-3 pl-md-5">
            <div class="content-text-center">
                <form method="post" action="${pageContext.request.contextPath}/user/user-save" enctype="multipart/form-data">
                    <div class="form-group row">
                        <label for="controlLogin" class="col-sm-2 col-form-label">Логин (латиница)</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="controlLogin" name="login" minlength="3"
                                   maxlength="20" pattern="[a-zA-Z0-9\s\.\-_]+" required>
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
                                   minlength="8" maxlength="20" required>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-sm-2">Наставник</div>
                        <div class="col-sm-10">
                            <div class="form-check">
                                <input type="checkbox" class="form-check-input" id="is_mentor" name="is_mentor">
                                <label class="form-check-label" for="is_mentor"></label>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-sm-2">Аватарка</div>
                        <div class="col-sm-10">
                            <div class="custom-file">
                                <input type="file" name="image" class="custom-file-input" id="customFile"
                                       accept="image/jpeg,image/jpg,image/png,image/gif">
                                <label class="custom-file-label" for="customFile">Выберите изображение</label>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-sm-2"></div>
                        <div class="col-sm-10">
                            <input type="submit" class="btn btn-primary btn-lg btn-block" value="Добавить">
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
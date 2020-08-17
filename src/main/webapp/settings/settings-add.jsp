<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:template>
   <jsp:attribute name="title">
      <title>Настройки</title>
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
                    <h1>Настройки: добавление</h1>
                </div>
                <form method="post" action="${pageContext.request.contextPath}/settings/settings-save">
                    <div class="form-group row">
                        <label for="controlName" class="col-sm-2 col-form-label">Название параметра</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="controlName" name="name" required>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="controlValue" class="col-sm-2 col-form-label">Значение параметра</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="controlValue" name="value" required>
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
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:template>
   <jsp:attribute name="title">
      <title>Настройки - редактирование</title>
      </jsp:attribute>
    <jsp:body>
        <main class="mainContent col-md-9 col-xl-8 py-md-3">
            <div class="content-text-center">
                <div class="page-header">
                    <h1>Редактирование настроек</h1>
                </div>
                <form method="post" action="${pageContext.request.contextPath}/settings-save">
                    <div class="form-group row">
                        <label for="controlName" class="col-sm-2 col-form-label">Название параметра</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="controlName" name="name" value="${param.name}"
                                   readonly>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="controlValue" class="col-sm-2 col-form-label">Значение параметра</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="controlValue" name="value"
                                   value="${param.value}">
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
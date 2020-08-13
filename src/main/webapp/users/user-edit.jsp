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
        <main>
            <div class="text-center">
                <form method="post" action="user-save">
                    <div class="form-group">
                        <label>
                            <input type="text" class="input-text" name="login" value="${param.login}"
                                   placeholder="Логин" readonly>
                        </label>
                    </div>
                    <div class="form-group">
                        <label>
                            <input type="text" class="input-text" name="name" value="${param.name}" placeholder="Имя"
                                   required>
                        </label>
                    </div>
                    <div class="form-group">
                        <label>
                            <input type="password" class="input-text" name="password" value="${param.password}"
                                   placeholder="Пароль" required>
                        </label>
                    </div>

                    <div class="form-group">
<%--                        <%--%>
<%--                            String str = request.getParameter("is_mentor");--%>
<%--                            if ("true".equals(str)) {--%>
<%--                    <input type = "checkbox" class="input-checkbox" id = "is_mentor" name = "is_mentor" checked >--%>
<%--                            } else {--%>
<%--                    <input type = "checkbox" class="input-checkbox" id = "is_mentor" name = "is_mentor" checked >--%>
<%--                            }--%>
<%--                        %>--%>
<%--                        <label for="is_mentor">Наставник</label>--%>
                    </div>

                    <div class="form-group">
                        <img class="user-avatar" name="image" src=${!param.image.isEmpty() ? param.image : '/avatars/no-avatar.png'} alt="${param.name}" alt="${param.name}">
                    </div>


                        <%-- Элемент для определения редактирования из SettingsSave --%>
                    <label>
                        <input type="text" name="edit" value="true" hidden>
                    </label>
                    <input type="submit" class="input-submit" value="Сохранить">
                </form>
            </div>
        </main>
        <footer>
            <div></div>
        </footer>
    </jsp:body>
</t:template>
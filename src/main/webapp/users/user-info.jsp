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
                    <h1>Информация пользователя</h1>
                </div>
                <div>
                    <table class="table table-striped">
                        <thead>
                        <tr>
                            <th scope="col">Имя</th>
                            <th scope="col">Логин</th>
                            <th scope="col">Статус</th>
                            <th scope="col">Аватарка</th>
                            <th scope="col">Редактировать</th>
                        </tr>
                        </thead>
                        <tbody>
                        <jsp:useBean id="user" scope="request" type="ru.progwards.java2.db.DataBase.Users.User"/>
                        <tr>
                            <td>${user.name}</td>
                            <td>${user.login}</td>
                            <td>${user.is_mentor ? "Наставник" : "Студент"}</td>
                            <td><img class="user-avatar"
                                     src="${pageContext.request.contextPath}/avatars/${!user.image.isEmpty() ? user.image : 'no-avatar.png'}"
                                     alt="${user.name}">
                            </td>
                            <td>
                                <form action="${pageContext.request.contextPath}/users-info?edit=true&el=${user.login}"
                                      method="post">
                                    <label>
                                        <input type="text" name="name" value="${user.name}" hidden/>
                                    </label>
                                    <label>
                                        <input type="text" name="login" value="${user.login}" hidden/>
                                    </label>
                                    <label>
                                        <input type="password" name="password" value="${user.password}" hidden/>
                                    </label>
                                    <label>
                                        <input type="text" name="is_mentor" value="${user.is_mentor}" hidden/>
                                    </label>
                                    <label>
                                        <input type="text" name="image" value="${user.image}" hidden/>
                                    </label>
                                    <span class="edit"><input class="btn-edit" type="submit" value=""/></span>
                                </form>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <div class="error-actions">
                    <a href="javascript:history.back()" class="btn btn-primary"><span
                            class="glyphicon glyphicon-home"></span>Вернуться</a>
                </div>
            </div>
        </main>
    </jsp:body>
</t:template>
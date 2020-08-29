<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<t:template>
   <jsp:attribute name="title">
      <title>Все пользователи</title>
   </jsp:attribute>
    <jsp:body>
        <main class="mainContent col-md-9 col-xl-8 py-md-3">
            <div class="content-text-center">
                <div class="page-header">
                    <h1>Список пользователей</h1>
                </div>
                <div class="text-center">
                    <div class="add-edit-user">
                        <a href="${pageContext.request.contextPath}/users-view?add=true"><span
                                class="add-user"></span></a>
                    </div>
                </div>
                <div class="table-responsive">
                    <table class="table table-striped">
                        <thead class="thead-dark">
                        <tr>
                            <th scope="col"><i class="far fa-hashtag"></i></th>
                            <th scope="col">Имя</th>
                            <th scope="col">Логин</th>
                            <th scope="col"><i class="far fa-at"></i></th>
                            <th scope="col"><i class="fal fa-university"></i></th>
                            <th scope="col"><i class="fab fa-discord"></i></th>
                            <th scope="col"><i class="far fa-user-chart"></i></th>
                            <th scope="col"><i class="far fa-user-tag"></i></th>
                            <th scope="col"><i class="far fa-user-slash"></i></th>
                            <th scope="col"><i class="far fa-user-cog"></i></th>
                        </tr>
                        </thead>
                        <tbody>
                        <jsp:useBean id="users" scope="request" type="java.util.List"/>
                        <c:forEach var="user" items="${users}" varStatus="loop">
                            <tr>
                                <td>${loop.index+1}</td>
                                <td>${user.name}</td>
                                <td>
                                    <a href="${pageContext.request.contextPath}/users-view?login=${user.login}">${user.login}</a>
                                </td>
                                <td>${user.email}</td>
                                <td>
                                    <c:set value="${fn:split(user.progwardsAccountLink,'?')}" var="indexId"/>
                                    <a href="${user.progwardsAccountLink}"><c:out
                                            value="${indexId[fn:length(indexId)-1]}"/></a>
                                </td>
                                <td>${user.discordName}</td>
                                <td>${user.is_mentor ? "<i class=\"fas fa-user-headset isMentor\"></i>" : "<i class=\"far fa-digging\"></i>"}</td>
                                <td>
                                    <div class="avatar avatarView">
                                        <div class="user-avatar">
                                            <div class="img"
                                                 style="background-image:url(${pageContext.request.contextPath}/${requestScope.avatarsDirectory}/${!user.image.isEmpty() ? user.image : "no-avatar.png"});"></div>
                                        </div>
                                    </div>
                                </td>
                                <td>
                                    <form action="${pageContext.request.contextPath}/user-delete" method="post">
                                        <span class="trash"><input class='btn-del' type='submit' name='${user.login}'
                                                                   value=""
                                                                   onclick="return confirm('Вы подтверждаете удаление?')"/></span>
                                    </form>
                                </td>
                                <td>
                                    <form action="${pageContext.request.contextPath}/users-view?edit=true&el=${user.login}"
                                          method="post">
                                        <label class="hiddenLabel">
                                            <input type="hidden" name="name" value="${user.name}"/>
                                        </label>
                                        <label class="hiddenLabel">
                                            <input type="hidden" name="login" value="${user.login}"/>
                                        </label>
                                        <label class="hiddenLabel">
                                            <input type="hidden" name="email" value="${user.email}"/>
                                        </label>
                                        <label class="hiddenLabel">
                                            <input type="hidden" name="progwardsAccountLink"
                                                   value="${user.progwardsAccountLink}"/>
                                        </label>
                                        <label class="hiddenLabel">
                                            <input type="hidden" name="discordName" value="${user.discordName}"/>
                                        </label>
                                        <label class="hiddenLabel">
                                            <input type="hidden" name="password" value="${user.password}"/>
                                        </label>
                                        <label class="hiddenLabel">
                                            <input type="hidden" name="is_mentor" value="${user.is_mentor}"/>
                                        </label>
                                        <label class="hiddenLabel">
                                            <input type="hidden" name="image" value="${user.image}"/>
                                        </label>
                                        <span class="edit"><input class="btn-edit" type="submit" value=""/></span>
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </main>
    </jsp:body>
</t:template>
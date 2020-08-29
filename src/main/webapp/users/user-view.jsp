<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
                <div class="table-responsive">
                    <table class="table table-striped">
                        <thead class="thead-dark">
                        <tr>
                            <th scope="col">Имя</th>
                            <th scope="col">Логин</th>
                            <th scope="col"><i class="far fa-at"></i></th>
                            <th scope="col"><i class="fal fa-university"></i></th>
                            <th scope="col"><i class="fab fa-discord"></i></th>
                            <th scope="col"><i class="far fa-user-chart"></i></th>
                            <th scope="col"><i class="far fa-user-tag"></i></th>
                            <th scope="col"><i class="far fa-user-cog"></i></th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>${requestScope.user.name}</td>
                            <td>${requestScope.user.login}</td>
                            <td>${requestScope.user.email}</td>
                            <td>
                                <c:set value="${fn:split(requestScope.user.progwardsAccountLink,'?')}" var="indexId"/>
                                <a href="${requestScope.user.progwardsAccountLink}" target="_blank"><c:out
                                        value="${indexId[fn:length(indexId)-1]}"/></a>
                            </td>
                            <td>${requestScope.user.discordName}</td>
                            <td>${requestScope.user.is_mentor ? "<i class=\"fas fa-user-headset isMentor\"></i>" : "<i class=\"far fa-digging\"></i>"}</td>
                            <td>
                                <div class="avatar avatarView">
                                    <div class="user-avatar">
                                        <div class="img"
                                             style="background-image:url(${pageContext.request.contextPath}/avatars/${!requestScope.user.image.isEmpty() ? requestScope.user.image : "no-avatar.png"});"></div>
                                    </div>
                                </div>
                            </td>
                            <td>
                                <form action="${pageContext.request.contextPath}/users-view?edit=true&el=${requestScope.user.login}"
                                      method="post">
                                    <label class="hiddenLabel">
                                        <input type="hidden" name="name" value="${requestScope.user.name}"/>
                                    </label>
                                    <label class="hiddenLabel">
                                        <input type="hidden" name="login" value="${requestScope.user.login}"/>
                                    </label>
                                    <label class="hiddenLabel">
                                        <input type="hidden" name="email" value="${requestScope.user.email}"/>
                                    </label>
                                    <label class="hiddenLabel">
                                        <input type="hidden" name="progwardsAccountLink"
                                               value="${requestScope.user.progwardsAccountLink}"/>
                                    </label>
                                    <label class="hiddenLabel">
                                        <input type="hidden" name="discordName"
                                               value="${requestScope.user.discordName}"/>
                                    </label>
                                    <label class="hiddenLabel">
                                        <input type="hidden" name="password" value="${requestScope.user.password}"/>
                                    </label>
                                    <label class="hiddenLabel">
                                        <input type="hidden" name="is_mentor" value="${requestScope.user.is_mentor}"/>
                                    </label>
                                    <label class="hiddenLabel">
                                        <input type="hidden" name="image" value="${requestScope.user.image}"/>
                                    </label>
                                    <span class="edit"><input class="btn-edit" type="submit" value=""/></span>
                                </form>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <div class="page-header">
                    <h2>Список консультаций</h2>
                </div>
                <div class="table-responsive">
                    <table class="table table-striped">
                        <thead class="thead-dark">
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">Дата и время</th>
                            <th scope="col">Отменить</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <th scope="row">1</th>
                            <td>Mark</td>
                            <td>Otto</td>
                        </tr>
                        <tr>
                            <th scope="row">2</th>
                            <td>Jacob</td>
                            <td>Thornton</td>
                        </tr>
                        <tr>
                            <th scope="row">3</th>
                            <td>Larry</td>
                            <td>the Bird</td>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <div class="error-actions">
                    <a href="javascript:history.back()" class="btn btn-primary"><span
                            class="glyphicon glyphicon-home"></span><i class="far fa-reply"></i></a>
                </div>
            </div>
        </main>
    </jsp:body>
</t:template>
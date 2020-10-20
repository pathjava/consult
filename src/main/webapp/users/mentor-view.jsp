<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<t:template>
   <jsp:attribute name="title">
      <title>Данные наставника</title>
   </jsp:attribute>
    <jsp:body>
        <main class="mainContent col-md-9 col-xl-8 py-md-3">
            <div class="content-text-center">
                <div class="page-header">
                    <h1>Информация ментора</h1>
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
                            <td>
                                <div class="avatar avatarView">
                                    <div class="user-avatar">
                                        <div class="img"
                                             style="background-image:url(${pageContext.request.contextPath}/${requestScope.avatarsDirectory}/${!requestScope.user.image.isEmpty() ? requestScope.user.image : "no-avatar.png"});"></div>
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
                    <h2>Список консультаций Mentor</h2>
                </div>
                <c:forEach var="mapFuture" items="${requestScope.futureMentor}" varStatus="id">
                    <div class="accordion" id="accordion${id.index+1}">
                        <div class="card">
                            <div class="card-header" id="heading${id.index+1}">
                                <h5 class="mb-0">
                                    <button class="btn btn-link" type="button" data-toggle="collapse"
                                            data-target="#collapse${id.index+1}" aria-expanded="true"
                                            aria-controls="collapse${id.index+1}">
                                            ${mapFuture.key}
                                    </button>
                                </h5>
                            </div>
                            <div id="collapse${id.index+1}" class="collapse <c:if test="${id.index eq 0}">show</c:if>"
                                 aria-labelledby="heading${id.index+1}"
                                 data-parent="#accordion${id.index+1}">
                                <div class="card-body table-responsive">
                                    <table class="table">
                                        <thead class="thead-dark">
                                        <tr>
                                            <th scope="col"><i class="far fa-hashtag"></i></th>
                                            <th scope="col"><i class="far fa-clock"></i></th>
                                            <th scope="col"><i class="far fa-digging"></i></th>
                                            <th scope="col"><i class="far fa-align-slash"></i></th>
                                            <th scope="col"><i class="far fa-user-edit"></i></th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach var="data" items="${mapFuture.value}" varStatus="loop">
                                            <tr>
                                                <td>${loop.index+1}</td>
                                                <td>${data.startEndTime}</td>
                                                <td>
                                                    <c:choose>
                                                        <c:when test="${data.student ne ''}">
                                                            <a href="${pageContext.request.contextPath}/users-view?login=${data.student}">${data.student}</a>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <i class="far fa-user-slash fadedIcon"></i>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </td>
                                                <td>
                                                    <c:choose>
                                                        <c:when test="${data.student ne ''}">
                                                            <form action="${pageContext.request.contextPath}/consults-save"
                                                                  method="post">
                                                                <label class="hiddenLabel">
                                                                    <input type="hidden" name="mentor"
                                                                           value="${data.mentor}"/>
                                                                </label>
                                                                <label class="hiddenLabel">
                                                                    <input type="hidden" name="start"
                                                                           value="${data.start}"/>
                                                                </label>
                                                                <label class="hiddenLabel">
                                                                    <input type="hidden" name="student"
                                                                           value="${data.student}"/>
                                                                </label>
                                                                <label class="hiddenLabel">
                                                                    <input type="hidden" name="deletesMentor"
                                                                           value="true"/>
                                                                </label>
                                                                <span class="trash"><input class="btn-del" type='submit'
                                                                                           value=""
                                                                                           onclick="return confirm('Вы подтверждаете удаление?')"/></span>
                                                            </form>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <i class="far fa-trash-alt fadedIcon"></i>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </td>
                                                <td>
                                                    <c:choose>
                                                        <c:when test="${data.student ne ''}">
                                                            <form action="${pageContext.request.contextPath}/consults-edit"
                                                                  method="post">
                                                                <label class="hiddenLabel">
                                                                    <input type="hidden" name="start"
                                                                           value="${data.start}"/>
                                                                </label>
                                                                <label class="hiddenLabel">
                                                                    <input type="hidden" name="student"
                                                                           value="${data.student}"/>
                                                                </label>
                                                                <label class="hiddenLabel">
                                                                    <input type="hidden" name="mentor"
                                                                           value="${data.mentor}"/>
                                                                </label>
                                                                <label class="hiddenLabel">
                                                                    <input type="hidden" name="mentorEdit" value="true">
                                                                </label>
                                                                <span class="edit"><input class="btn-edit" type="submit"
                                                                                          value=""/></span>
                                                            </form>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <i class="far fa-edit fadedIcon"></i>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
                    <%--                <div class="accordion" id="accordionExample">--%>
                    <%--                    <div class="card">--%>
                    <%--                        <div class="card-header" id="headingOne">--%>
                    <%--                            <h5 class="mb-0">--%>
                    <%--                                <button class="btn btn-link" type="button" data-toggle="collapse"--%>
                    <%--                                        data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">--%>
                    <%--                                    Прошлые консультации--%>
                    <%--                                </button>--%>
                    <%--                            </h5>--%>
                    <%--                        </div>--%>
                    <%--                        <div id="collapseOne" class="collapse" aria-labelledby="headingOne"--%>
                    <%--                             data-parent="#accordionExample">--%>
                    <%--                            <div class="card-body">--%>
                    <%--                                <div class="table-responsive">--%>
                    <%--                                    <table class="table table-striped">--%>
                    <%--                                        <thead class="thead-light">--%>
                    <%--                                        <tr>--%>
                    <%--                                            <th scope="col"><i class="fas fa-hashtag"></i></th>--%>
                    <%--                                            <th scope="col"><i class="fas fa-user-headset"></i></th>--%>
                    <%--                                            <th scope="col"><i class="fas fa-history"></i></th>--%>
                    <%--                                        </tr>--%>
                    <%--                                        </thead>--%>
                    <%--                                        <tbody>--%>
                    <%--                                        <c:forEach var="consultation" items="${requestScope.userPast}" varStatus="loop">--%>
                    <%--                                            <tr>--%>
                    <%--                                                <td>${loop.index+1}</td>--%>
                    <%--                                                <td>${consultation.mentorName}</td>--%>
                    <%--                                                <td>--%>
                    <%--                                                    <div class="dayTimeConsult">${consultation.startDate}--%>
                    <%--                                                        - ${consultation.startTime}</div>--%>
                    <%--                                                </td>--%>
                    <%--                                            </tr>--%>
                    <%--                                        </c:forEach>--%>
                    <%--                                        </tbody>--%>
                    <%--                                    </table>--%>
                    <%--                                </div>--%>
                    <%--                            </div>--%>
                    <%--                        </div>--%>
                    <%--                    </div>--%>
                    <%--                </div>--%>
                <div class="error-actions">
                    <a href="javascript:history.back()" class="btn btn-primary"><span
                            class="glyphicon glyphicon-home"></span><i class="far fa-reply"></i></a>
                </div>
            </div>
        </main>
    </jsp:body>
</t:template>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:template>
   <jsp:attribute name="title">
      <title>user.Mentors</title>
   </jsp:attribute>
    <jsp:body>
        <main class="mainContent col-md-9 col-xl-8 py-md-3">
            <div class="content-text-center">
                <div class="page-header">
                    <h1>All consults</h1>
                </div>

                <c:forEach var="mapFuture" items="${requestScope.futureConsultations}" varStatus="id">
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
                            <div id="collapse${id.index+1}" class="collapse <c:if test="${id.index le 1}">show</c:if>"
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
                                                            <form action="${pageContext.request.contextPath}/consults-add"
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
                                                                    <input type="hidden" name="deletes"
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
                <div class="page-header">
                    <h2>Past consults</h2>
                </div>
                <div class="accordion" id="accordionTwo">
                    <div class="card">
                        <div class="card-header" id="headingTwo">
                            <h5 class="mb-0">
                                <button class="btn btn-link" type="button" data-toggle="collapse"
                                        data-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
                                    Прошлые консультации
                                </button>
                            </h5>
                        </div>

                        <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo"
                             data-parent="#accordionTwo">
                            <div class="card-body table-responsive">
                                <table class="table">
                                    <thead class="thead-light">
                                    <tr>
                                        <th scope="col"><i class="far fa-hashtag"></i></th>
                                        <th scope="col"><i class="far fa-clock"></i></th>
                                        <th scope="col"><i class="far fa-digging"></i></th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="mapPast" items="${requestScope.pastConsultations}">
                                        <tr class="consultTime">
                                            <td colspan="5">${mapPast.key}</td>
                                        </tr>
                                        <c:forEach var="data" items="${mapPast.value}" varStatus="loop">
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
                                            </tr>
                                        </c:forEach>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="error-actions">
                    <a href="javascript:history.back()" class="btn btn-primary"><span
                            class="glyphicon glyphicon-home"></span><i class="far fa-reply"></i></a>
                </div>
            </div>
        </main>
    </jsp:body>
</t:template>
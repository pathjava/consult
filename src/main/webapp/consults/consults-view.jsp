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
                <div class="table-responsive">
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
                        <c:forEach var="mapFuture" items="${requestScope.futureConsultations}">
                            <tr class="consultTime">
                                <td colspan="5">${mapFuture.key}</td>
                            </tr>
                            <c:forEach var="data" items="${mapFuture.value}" varStatus="loop">
                                <tr>
                                    <td>${loop.index+1}</td>
                                    <td>${data.startEndTime}</td>
                                    <td>
                                        <a href="${pageContext.request.contextPath}/users-view?login=${data.student}">${data.student}</a>
                                    </td>
                                    <td>
                                        <form action="${pageContext.request.contextPath}/consults-add" method="post">
                                            <label class="hiddenLabel">
                                                <input type="hidden" name="login" value="${data.mentor}"/>
                                            </label>
                                            <label class="hiddenLabel">
                                                <input type="hidden" name="time" value="${data.start}"/>
                                            </label>
                                            <label class="hiddenLabel">
                                                <input type="hidden" name="loginStudentRemoveSlot"
                                                       value="${data.student}"/>
                                            </label>
                                            <label class="hiddenLabel">
                                                <input type="hidden" name="deletesMentor" value="true"/>
                                            </label>
                                            <span class="trash">
                                                <input class="btn-del" type='submit' value=""
                                                       onclick="return confirm('Вы подтверждаете удаление?')"/>
                                            </span>
                                        </form>
                                    </td>
                                    <td>
                                        <form action="${pageContext.request.contextPath}/consults-edit" method="post">
                                            <label class="hiddenLabel">
                                                <input type="hidden" name="time" value="${data.start}"/>
                                            </label>
                                            <label class="hiddenLabel">
                                                <input type="hidden" name="time" value="${data.student}"/>
                                            </label>
                                            <label class="hiddenLabel">
                                                <input type="hidden" name="time" value="${data.mentor}"/>
                                            </label>
                                            <span class="edit">
                                                <input class="btn-edit" type="submit" value=""/>
                                            </span>
                                        </form>
                                    </td>
                                </tr>
                            </c:forEach>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
                <div class="accordion" id="accordionExample">
                    <div class="card">
                        <div class="card-header" id="headingOne">
                            <h5 class="mb-0">
                                <button class="btn btn-link" type="button" data-toggle="collapse"
                                        data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                    Прошлые консультации
                                </button>
                            </h5>
                        </div>

                        <div id="collapseOne" class="collapse" aria-labelledby="headingOne"
                             data-parent="#accordionExample">
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
                                                    <a href="${pageContext.request.contextPath}/users-view?login=${data.student}">${data.student}</a>
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
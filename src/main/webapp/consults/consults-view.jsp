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
                        <c:forEach var="map" items="${requestScope.consults}">
                            <tr class="consultTime">
                                <td colspan="5">${map.key}</td>
                            </tr>
                            <c:forEach var="data" items="${map.value}" varStatus="loop">
                                <tr>
                                    <td>${loop.index+1}</td>
                                    <td>${data.startEndTime}</td>
                                    <td>
                                        <a href="${pageContext.request.contextPath}/users-view?login=${data.student}">${data.student}</a>
                                    </td>
                                    <td><i class="far fa-trash-alt"></i></td>
                                    <td><i class="far fa-edit"></i></td>
                                </tr>
                            </c:forEach>
                        </c:forEach>
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
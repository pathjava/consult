<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:template>
   <jsp:attribute name="title">
      <title>Запись на консультацию</title>
   </jsp:attribute>
    <jsp:body>
        <main class="mainContent col-md-9 col-xl-8 py-md-3">
            <div class="content-text-center">
                <div class="page-header">
                    <h1>Менторы</h1>
                </div>
                <div>
                    <div class="row row-cols-1 row-cols-md-2">
                        <c:forEach var="mentor" items="${requestScope.mentors}">
                            <div class="col mb-4">
                                <div class="card">
                                    <div class="mentorsImage">
                                        <div class="img"
                                             style="background-image:url(${pageContext.request.contextPath}/avatars/${mentor.image});"></div>
                                    </div>
                                    <div class="card-body">
                                        <h5 class="card-title">${mentor.name}</h5>
                                        <div class="card-text">
                                            <c:forEach var="map" items="${requestScope.schedules}">
                                                <c:if test="${map.key eq mentor.login}">
                                                    <c:forEach var="schedule" items="${map.value}">
                                                        <div class="mentorSchedulesDay">${schedule}</div>
                                                    </c:forEach>
                                                </c:if>
                                            </c:forEach>
                                        </div>
                                        <form action="${pageContext.request.contextPath}/consults-save">
                                            <label class="hiddenLabel">
                                                <input type="hidden" name="mentor" value="${mentor.login}"/>
                                            </label>
                                            <input type="submit" class="btn btn-primary btn-block" value="Записаться">
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </main>
    </jsp:body>
</t:template>
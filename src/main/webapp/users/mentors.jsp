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
                    <h1>user.Mentors</h1>
                </div>
                <div>
                    <div class="row row-cols-1 row-cols-md-2">
                        <jsp:useBean id="mentors" scope="request" type="java.util.List"/>
                        <c:forEach var="mentor" items="${mentors}">
                            <div class="col mb-4">
                                <div class="card">
                                    <div class="mentorsImage">
                                        <div class="img"
                                             style="background-image:url(${pageContext.request.contextPath}/avatars/${mentor.image});"></div>
                                    </div>
                                    <div class="card-body">
                                        <h5 class="card-title">${mentor.name}</h5>
                                        <div class="card-text">
                                            <jsp:useBean id="days" scope="request" type="java.util.List"/>
                                            <c:forEach var="day" items="${days}">
                                                <c:if test = "${day.name == mentor.login}">${day}</c:if>
                                            </c:forEach>
                                        </div>
                                        <form action="${pageContext.request.contextPath}/consults" method="post">
                                            <label>
                                                <input type="text" name="mentorLogin" value="${mentor.login}" hidden/>
                                            </label>
                                            <label>
                                                <input type="text" name="name" value="${mentor.name}" hidden/>
                                            </label>
                                            <input type="submit" class="btn btn-primary btn-block" value="Записаться">
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
                <div class="error-actions">
                    <a href="javascript:history.back()" class="btn btn-primary"><span
                            class="glyphicon glyphicon-home"></span>Вернуться</a>
                </div>
            </div>
        </main>
    </jsp:body>
</t:template>
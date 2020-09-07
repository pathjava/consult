<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:template>
   <jsp:attribute name="title">
      <title>Consults</title>
   </jsp:attribute>
    <jsp:body>
        <main class="mainContent col-md-9 col-xl-8 py-md-3">
            <div class="content-text-center">
                <div class="page-header">
                    <h1>Изменение консультации ${param.student}</h1>
                </div>
                <div>
                    <form method="post" action="${pageContext.request.contextPath}/consults-edit">
                        <div class="row row-cols-1">
                            <div class="col mb-4">
                                <div class="card cardForm">
                                    <div class="consultationsSlots">
                                        <c:forEach var="map" items="${requestScope.consultationsEdit}"
                                                   varStatus="outerLoop">
                                            <div class="slotsBlock">
                                                <div class="dayConsult">${map.key}</div>
                                                <ul class="slotsUlBlock">
                                                    <c:forEach var="consultation" items="${map.value}" varStatus="loop">
                                                        <li>
                                                            <c:choose>
                                                                <c:when test="${consultation.student eq ''}">
                                                                    <input type="radio" name="start"
                                                                           id="${outerLoop.index+1}${loop.index+1}"
                                                                           value="${consultation.start}"/>
                                                                    <label for="${outerLoop.index+1}${loop.index+1}">${consultation.startTime}</label>
                                                                </c:when>
                                                                <c:when test="${consultation.start eq param.start}">
                                                                    <input type="hidden" name="oldStart"
                                                                           value="${param.start}"/>
                                                                    <div class="slotTempBusy">${consultation.startTime}</div>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <div class="slotIsBusy <c:if test="${consultation.student eq param.student}">slotIsBusyStudent</c:if>">${consultation.startTime}</div>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </li>
                                                    </c:forEach>
                                                </ul>
                                            </div>
                                        </c:forEach>
                                    </div>
                                    <div class="">
                                        <label class="hiddenLabel">
                                            <input type="hidden" name="student" value="${param.student}"/>
                                        </label>
                                        <label class="hiddenLabel">
                                            <input type="hidden" name="mentor" value="${param.mentor}"/>
                                        </label>
                                        <label class="hiddenLabel">
                                            <input type="hidden" name="edit" value="true"/>
                                        </label>
                                        <c:if test="${param.mentorEdit ne null}">
                                            <label class="hiddenLabel">
                                                <input type="hidden" name="mentorEdit" value="true"/>
                                            </label>
                                        </c:if>
                                        <input type="submit" class="btn btn-primary btn-block"
                                               value="Изменить время консультации">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="error-actions">
                    <a href="javascript:history.back()" class="btn btn-primary"><span
                            class="glyphicon glyphicon-home"></span><i class="far fa-reply"></i></a>
                </div>
            </div>
        </main>
    </jsp:body>
</t:template>
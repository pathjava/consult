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
                    <h1>Запись на консультацию к ${requestScope.name}</h1>
                </div>
                <div>
                    <form method="post" action="${pageContext.request.contextPath}/consults-add">
                        <div class="row row-cols-1 row-cols-md-2">
                            <div class="col mb-4">
                                <div class="card cardForm">
                                    <div class="form-group">
                                        <label for="inputLogin">Имя</label>
                                        <input type="text" name="studentLogin" class="form-control" id="inputLogin"
                                               value="${sessionScope.login}" readonly>
                                    </div>
                                    <div class="form-group">
                                        <label for="inputEmail">Email</label>
                                        <input type="email" name="email" class="form-control" id="inputEmail">
                                    </div>
                                    <div class="form-group">
                                        <label for="inputComment">Примечание</label>
                                        <input type="text" name="comment" class="form-control" id="inputComment">
                                    </div>
                                    <div class="">
                                        <label class="hiddenLabel">
                                            <input type="hidden" name="login" value="${requestScope.login}"/>
                                        </label>
                                        <input type="submit" class="btn btn-primary btn-block" value="Отправить заявку">
                                    </div>
                                    <div class="privacy">
                                        Записываясь, вы даете согласие на обработку своих персональных данных и
                                        принимаете условия пользовательского соглашения. Ознакомьтесь с правилами
                                        оплаты и отмены.
                                    </div>
                                </div>
                            </div>
                            <div class="col mb-4">
                                <div class="card cardForm">
                                    <div class="consultationsSlots">
                                        <c:forEach var="map" items="${requestScope.consultations}"
                                                   varStatus="outerLoop">
                                            <div class="slotsBlock">
                                                <div class="dayConsult">${map.key}</div>
                                                <ul class="slotsUlBlock">
                                                    <c:forEach var="consultation" items="${map.value}" varStatus="loop">
                                                        <li>
                                                            <c:choose>
                                                                <c:when test="${consultation.student eq ''}">
                                                                    <input type="radio" name="time"
                                                                           id="${outerLoop.index+1}${loop.index+1}"
                                                                           value="${consultation.start}"/>
                                                                    <label for="${outerLoop.index+1}${loop.index+1}">${consultation.startTime}</label>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <div class="slotIsBusy">${consultation.startTime}</div>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </li>
                                                    </c:forEach>
                                                </ul>
                                            </div>
                                        </c:forEach>
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
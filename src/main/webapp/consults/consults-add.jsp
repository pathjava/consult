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
                    <div class="row row-cols-1 row-cols-md-2">
                        <div class="col mb-4">
                            <div class="card cardForm">
                                <form method="post">
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
                                        <input type="submit" class="btn btn-primary btn-block" value="Отправить заявку">
                                    </div>
                                </form>
                                <div class="privacy">
                                    Записываясь, вы даете согласие на обработку своих персональных данных и
                                    принимаете условия пользовательского соглашения. Ознакомьтесь с правилами
                                    оплаты и отмены.
                                </div>
                            </div>
                        </div>
                        <div class="col mb-4">
                            <div class="card cardForm">
                                <div class="">
                                    <jsp:useBean id="consultations" scope="request" type="java.util.List"/>
                                    <c:forEach var="consultation" items="${consultations}" varStatus="loop">
                                    <div class="dayConsult">${consultation.start}</div>
                                    <button type="button" class="btn btn-outline-secondary">${consultation.start}</button>
                                    </c:forEach>
                                </div>
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
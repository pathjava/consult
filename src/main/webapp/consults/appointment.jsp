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
                    <h1>Consults</h1>
                </div>
                <div>
                    <div class="row row-cols-1 row-cols-md-2">
                        <div class="col mb-4">
                            <div class="card cardForm">
                                <form>
                                    <div class="form-group">
                                        <label for="inputAddress">Address</label>
                                        <input type="text" class="form-control" id="inputAddress"
                                               placeholder="1234 Main St">
                                    </div>
                                    <div class="form-row">
                                        <div class="form-group col-md-6">
                                            <label for="inputEmail4">Email</label>
                                            <input type="email" class="form-control" id="inputEmail4">
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label for="inputPassword4">Phone</label>
                                            <input type="tel" class="form-control" id="inputPassword4">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="inputAddress2">Address 2</label>
                                        <input type="text" class="form-control" id="inputAddress2"
                                               placeholder="Apartment, studio, or floor">
                                    </div>
                                    <div class="">
                                        <input type="submit" class="btn btn-primary btn-block"
                                               value="Отправить заявку">
                                    </div>
                                    <div class="privacy">
                                        Записываясь, вы даете согласие на обработку своих персональных данных и
                                        принимаете условия пользовательского соглашения. Ознакомьтесь с правилами
                                        оплаты и отмены.
                                    </div>
                                </form>
                            </div>
                        </div>
                        <div class="col mb-4">
                            <div class="card cardForm">
                                <div class="">
                                    <div class="dayConsult">Пятница, 21.08.2020</div>
                                    <button type="button" class="btn btn-outline-secondary">20:30</button>
                                    <button type="button" class="btn btn-outline-secondary">20:30</button>
                                    <button type="button" class="btn btn-outline-secondary">20:30</button>
                                    <button type="button" class="btn btn-outline-secondary">20:30</button>
                                    <button type="button" class="btn btn-outline-secondary">20:30</button>
                                    <button type="button" class="btn btn-outline-secondary">20:30</button>
                                </div>
                                <div class="">
                                    <div class="dayConsult">Понедельник, 24.08.2020</div>
                                    <button type="button" class="btn btn-outline-secondary">20:30</button>
                                    <button type="button" class="btn btn-outline-secondary">20:30</button>
                                    <button type="button" class="btn btn-outline-secondary">20:30</button>
                                    <button type="button" class="btn btn-outline-secondary">20:30</button>
                                    <button type="button" class="btn btn-outline-secondary">20:30</button>
                                    <button type="button" class="btn btn-outline-secondary">20:30</button>
                                </div>
                                <div class="">
                                    <div class="dayConsult">Вторник, 25.08.2020</div>
                                    <button type="button" class="btn btn-outline-secondary">20:30</button>
                                    <button type="button" class="btn btn-outline-secondary">20:30</button>
                                    <button type="button" class="btn btn-outline-secondary">20:30</button>
                                    <button type="button" class="btn btn-outline-secondary">20:30</button>
                                    <button type="button" class="btn btn-outline-secondary">20:30</button>
                                    <button type="button" class="btn btn-outline-secondary">20:30</button>
                                </div>
                            </div>
                        </div>
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
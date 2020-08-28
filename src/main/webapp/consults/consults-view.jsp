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
                            <th scope="col">Время</th>
                            <th scope="col">Студент</th>
                            <th scope="col">Отменить</th>
                            <th scope="col">Изменить</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr class="consultTime">
                            <td colspan="5">Валерий - дата: 22.08.2020</td>
                        </tr>
                        <tr>
                            <th scope="row">1</th>
                            <td>Mark</td>
                            <td>Mark</td>
                            <td>Otto</td>
                            <td>Otto</td>
                        </tr>
                        <tr>
                            <th scope="row">2</th>
                            <td>Jacob</td>
                            <td>Jacob</td>
                            <td>Thornton</td>
                            <td>Thornton</td>
                        </tr>
                        <tr>
                            <th scope="row">3</th>
                            <td>Larry</td>
                            <td>Larry</td>
                            <td>the Bird</td>
                            <td>the Bird</td>
                        </tr>
                        <tr class="consultTime">
                            <td colspan="5">Никита - дата: 23.08.2020</td>
                        </tr>
                        <tr>
                            <th scope="row">1</th>
                            <td>Mark</td>
                            <td>Mark</td>
                            <td>Otto</td>
                            <td>Otto</td>
                        </tr>
                        <tr>
                            <th scope="row">2</th>
                            <td>Jacob</td>
                            <td>Jacob</td>
                            <td>Thornton</td>
                            <td>Thornton</td>
                        </tr>
                        <tr>
                            <th scope="row">3</th>
                            <td>Larry</td>
                            <td>Larry</td>
                            <td>the Bird</td>
                            <td>the Bird</td>
                        </tr>
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
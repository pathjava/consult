<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:template>
   <jsp:attribute name="title">
      <title>Настройки</title>
   </jsp:attribute>
    <jsp:body>
        <main class="mainContent col-md-9 col-xl-8 py-md-3">
            <div class="content-text-center">
                <div class="text-center">
                    <div class="add-edit-user">
                        <a href="${pageContext.request.contextPath}/settings-view?add=true"><span
                                class="add-user"></span></a>
                    </div>
                </div>
                <div class="page-header">
                    <h1>Общие настройки</h1>
                </div>
                <div class="table-responsive">
                    <table class="table table-striped">
                        <thead class="thead-dark">
                        <tr>
                            <th scope="col"><i class="far fa-hashtag"></i></th>
                            <th scope="col">Название</th>
                            <th scope="col">Значение</th>
                            <th scope="col"><i class="fas fa-trash"></i></th>
                            <th scope="col"><i class="far fa-cog"></i></th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="setting" items="${requestScope.settings}" varStatus="loop">
                            <tr>
                                <td>${loop.index+1}</td>
                                <td>${setting.name}</td>
                                <td>${setting.value}</td>
                                <td>
                                    <form action="${pageContext.request.contextPath}/settings-delete" method="post">
                                        <span class="trash">
                                            <input class="btn-del" type="submit" name="${setting.name}" value=""
                                                   onclick="return confirm('Вы подтверждаете удаление?')"/>
                                        </span>
                                    </form>
                                </td>
                                <td>
                                    <form action="${pageContext.request.contextPath}/settings-view?edit=true"
                                          method="post">
                                        <label class="hiddenLabel">
                                            <input type="hidden" name="name" value="${setting.name}"/>
                                        </label>
                                        <label class="hiddenLabel">
                                            <input type="hidden" name="value" value="${setting.value}"/>
                                        </label>
                                        <span class="edit"><input class="btn-edit" type="submit" value=""/></span>
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </main>
    </jsp:body>
</t:template>
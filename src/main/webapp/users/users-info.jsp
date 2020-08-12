<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:template>
   <jsp:attribute name="title">
      <title>Настройки</title>
   </jsp:attribute>
   <jsp:body>
      <header>
         <div class="page-header">
            <p class="h5">Список пользователей</p>
         </div>
      </header>
      <main>
         <div class="table-wrapper">
            <div class="text-center">
               <div class="add-edit-user">
                  <a href="/users/user-add.jsp"><span class="add-user"></span></a>
               </div>
            </div>
            <div>
               <table class="table table-striped">
                  <thead>
                     <tr>
                        <th scope="col">Имя</th>
                        <th scope="col">Логин</th>
                        <th scope="col">Статус</th>
                        <th scope="col">Аватарка</th>
                        <th scope="col">Удалить</th>
                        <th scope="col">Редактировать</th>
                     </tr>
                  </thead>
                  <tbody>
                     <c:forEach var="user" items="${users}">
                        <tr>
                           <td width='17%'>${user.name}</td>
                           <td width='17%'>
                              <a href='user-info.jsp?login=${user.login}'>${user.login}</a>
                           </td>
                           <td width='17%'>${user.is_mentor}</td>
                           <td width='17%'><img class='user-avatar' src='${user.image}' alt='${user.name}'></td>
                           <td width='16%'>
                              <form action='/user/user-delete' method='post'>
                                 <span class='trash'><input class='btn-del' type='submit' name='${user.login}' value='' onclick=\"return confirm('Вы подтверждаете удаление?')\"/></span>
                              </form>
                           </td>
                           <td width='16%'>
                              <form action='/users/user-edit.jsp' method='post'>
                                 <input type='text' name='name' value='${user.name}' hidden />
                                 <input type='text' name='login' value='${user.login}' hidden />
                                 <input type='password' name='password' value='${user.password}' hidden />
                                 <input type='text' name='is_mentor' value='${user.is_mentor}' hidden />
                                 <input type='text' name='image' value='${user.image}' hidden />
                                 <span class='edit'><input class='btn-edit' type='submit' value=''/></span>
                              </form>
                           </td>
                        </tr>
                     </c:forEach>
                  </tbody>
               </table>
            </div>
         </div>
      </main>
      <footer>
         <div></div>
      </footer>
   </jsp:body>
</t:template>
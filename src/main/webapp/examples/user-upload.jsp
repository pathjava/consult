<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:template>
   <jsp:attribute name="title">
    <title>Title</title>
</jsp:attribute>
    <jsp:body>
        <div>
            <form action="${pageContext.request.contextPath}/user/multipart" method="post" enctype="multipart/form-data">
                <div>
                    <input type="text" class="form-control" id="controlLogin" name="login" minlength="3"
                           maxlength="20" required>
                </div>
                <div>
                <input type="file" name="imageFile"/>
                <input type="submit"/>
                </div>
            </form>
        </div>
    </jsp:body>
</t:template>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:template>
   <jsp:attribute name="title">
    <title>Title</title>
</jsp:attribute>
    <jsp:body>
        <div>
            <form action="${pageContext.request.contextPath}/user/upload" method="post" enctype="multipart/form-data">
                <label>
                    <input type="text" name="description"/>
                </label>
                <input type="file" name="file"/>
                <input type="submit"/>
            </form>
        </div>
    </jsp:body>
</t:template>
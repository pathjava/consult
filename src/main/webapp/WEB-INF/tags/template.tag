<%@tag description="Template tag for consultapp" pageEncoding="UTF-8"%>
<%@attribute name="title" fragment="true" %>
<html>
<head>
    <jsp:invoke fragment="title"/>

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.css" id="bootstrap-css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
</head>
<body>
    <jsp:doBody/>
</body>
</html>
<%@tag description="Template tag for consult" pageEncoding="UTF-8"%>
<%@attribute name="title" fragment="true" %>
<!doctype html>
<html>
   <head>
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
      <jsp:invoke fragment="title"/>
      <link rel="apple-touch-icon" sizes="180x180" href="${pageContext.request.contextPath}/images/apple-touch-icon.png">
      <link rel="icon" type="image/png" sizes="32x32" href="${pageContext.request.contextPath}/images/favicon-32x32.png">
      <link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath}/images/favicon-16x16.png">
      <link rel="manifest" href="${pageContext.request.contextPath}/images/site.webmanifest">
      <link rel="mask-icon" href="${pageContext.request.contextPath}/images/safari-pinned-tab.svg" color="#5bbad5">
      <link rel="shortcut icon" href="${pageContext.request.contextPath}/images/favicon.ico">
      <meta name="msapplication-TileColor" content="#2b5797">
      <meta name="msapplication-config" content="${pageContext.request.contextPath}/images/browserconfig.xml">
      <meta name="theme-color" content="#ffffff">
      <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.css">
      <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/consult-app.css">
      <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/all.min.css">
   </head>
   <body>
      <jsp:doBody/>
      <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
      <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.bundle.js"></script>
      <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
      <script type="text/javascript" src="${pageContext.request.contextPath}/js/customize.js"></script>
   </body>
</html>
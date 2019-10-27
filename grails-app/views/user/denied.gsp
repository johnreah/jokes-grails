<%@ page import="com.jokeemporium.jokes.User" %>

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="main" />
    <title>Access Denied</title>
  </head>
  <body>
    <div class="nav">
      <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
    </div>
    <div class="body">
      <h1>Access Denied</h1>
      <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
      </g:if>
      <p>Bad news - you've followed a link that you don't have access to.</p>
      <p>This application has several levels of access control.
      The most basic level is guest access, which doesn't require you to log in.
      Other levels require a login, and the application should only offer you links and commands that your account has access to.
      In this case it seems that you've followed a link that you don't have access to, so it probably means a bug.
      Sorry about that. Perhaps you'd like to report it.</p>
    </div>
  </body>
</html>

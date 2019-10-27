<%@ page import="com.jokeemporium.jokes.User" %>

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="main" />
    <g:set var="entityName" value="User" />
    <title>Login</title>
  </head>
  <body>
    <div class="nav">
      <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
    </div>
    <div class="body">
      <h1>Login page</h1>
      <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
      </g:if>
      <g:form action="validate">
        <input type="hidden" name="cName" value="${cName}">
        <input type="hidden" name="aName" value="${aName}">
        <table>
          <tr class="prop">
            <td class="name">
              <label for="username">Username:</label>
            </td>
            <td class="value">
              <input type="text" id="username" name="username" value="" />
            </td>
          </tr>
          <tr class="prop">
            <td class="name">
              <label for="password">Password:</label>
            </td>
            <td class="value">
              <input type="password" id="password" name="password" value="" />
            </td>
          </tr>
          <tr>
            <td></td>
            <td><input type="submit" value="login" /></td>
          </tr>
        </table>
      </g:form>
    </div>
  </body>
</html>

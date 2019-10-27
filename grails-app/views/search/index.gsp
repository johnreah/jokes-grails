<%@ page import="com.jokeemporium.jokes.Joke" %>
<%@ page import="com.jokeemporium.jokes.Category" %>
<%@ page import="com.jokeemporium.jokes.Categorisation" %>
<%@ page import="com.jokeemporium.jokes.User" %>

<html>
  <head>
    <title>Joke Search</title>
    <meta name="layout" content="main" />
    <link rel="stylesheet" href="<g:resource file='homePagePanel.css' />" />
    <g:javascript library="IETableHack" />
    <link rel="stylesheet" href="<g:resource file='IETableHack.css' />" />
  </head>
  <body>
    <g:render template="/menuBar" />
    <div id="nav">
      <div class="homePagePanel">
        <div class="panelTop"></div>
        <div class="panelBody">
          <h1>Search by Keyword</h1>
          <g:render template="/searchByKeyword" />
          <br/>
          <br/>
          <h1>Search by Category</h1>
          <g:render template="/searchByCategory" />
        </div>
        <div class="panelBtm"></div>
      </div>
    </div>
    <div id="pageBody">
      <h1>Search results</h1>
      <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
      </g:if>
      <g:if test="${flash.error}">
        <div class="errors">${flash.error}</div>
      </g:if>
      <g:if test="${params?.jokes?.size}">
        <g:render template="/searchResults" />
      </g:if>
    </div>
  </body>
</html>

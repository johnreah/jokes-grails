<%--
  Created by IntelliJ IDEA.
  User: John Reah
  Date: 20/10/2019
  Time: 14:53
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'joke.label', default: 'Joke')}" />
    <title><g:message code="default.list.label" args="[entityName]" /></title>

    <g:javascript library="IETableHack" />
    <link rel="stylesheet" href="<g:resource file='IETableHack.css' />" />
</head>

<body>
<g:render template="/menuBar" />
<div class="body">
    <h1><g:message code="default.list.label" args="[entityName]" /></h1>
    <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
    </g:if>
    <div class="paginateButtons" style="border-top-width:1px; border-top-style:solid;border-top-color: #cccccc;border-bottom: 0;">
        <g:paginate total="${jokeInstanceTotal}" />
    </div>
    <div class="list">
        <table>
            <thead>
            <tr>
                <g:sortableColumn property="id" title="${message(code: 'joke.id.label', default: 'Id')}" />
                <g:sortableColumn property="summary" title="${message(code: 'joke.summary.label', default: 'Summary')}" />
                <g:sortableColumn property="body" title="${message(code: 'joke.body.label', default: 'Body')}" />
                <g:sortableColumn property="dateAdded" title="${message(code: 'joke.dateAdded.label', default: 'Date Added')}" />
            </tr>
            </thead>
            <tbody>
            <g:set var="rowAction" value="${session.user.hasEditorRights() ? 'edit' : 'show'}" />
            <g:each in="${jokeInstanceList}" status="i" var="jokeInstance">
                <tr class="${(i % 2) == 0 ? 'odd' : 'even'}" onclick="DoNav('<g:createLink action='${rowAction}' id='${jokeInstance.id}' />');" >
                    <td><g:link action="show" id="${jokeInstance.id}">${fieldValue(bean: jokeInstance, field: "id")}</g:link></td>
                    <td>${fieldValue(bean: jokeInstance, field: "summary")}</td>
                    <td>${fieldValue(bean: jokeInstance, field: "body")}</td>
                    <td><g:formatDate format="dd-MMM-yyyy" date="${jokeInstance.dateAdded}" /></td>
                </tr>
            </g:each>
            </tbody>
        </table>
    </div>
    <div class="paginateButtons">
        <g:paginate total="${jokeInstanceTotal}" />
    </div>
</div>
</body>
</html>

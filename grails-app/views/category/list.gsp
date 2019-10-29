<%@ page import="com.jokeemporium.jokes.Category" %>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'category.label', default: 'Category')}" />
    <title><g:message code="default.list.label" args="[entityName]" /></title>

    <g:javascript library="IETableHack" />
    <link rel="stylesheet" href="<g:createLinkTo dir='css' file='IETableHack.css' />" />
</head>

<body>
<g:render template="/menuBar" />
<div class="body">
    <h1><g:message code="default.list.label" args="[entityName]" /></h1>
    <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
    </g:if>
    <div class="paginateButtons" style="border-top-width:1px; border-top-style:solid;border-top-color: #cccccc;border-bottom: 0;">
        <g:paginate total="${categoryInstanceTotal}" />
    </div>
    <div class="list">
        <table>
            <thead>
            <tr>
                <g:sortableColumn property="id" title="${message(code: 'category.id.label', default: 'Id')}" />
                <g:sortableColumn property="name" title="${message(code: 'category.name.label', default: 'Name')}" />
                <g:sortableColumn property="displayOrder" title="${message(code: 'category.displayOrder.label', default: 'Display order')}" />
            </tr>
            </thead>
            <tbody>
            <g:set var="rowAction" value="${session.user.hasEditorRights() ? 'edit' : 'show'}" />
            <g:each in="${categoryInstanceList}" status="i" var="categoryInstance">
                <tr class="${(i % 2) == 0 ? 'odd' : 'even'}" onclick="DoNav('<g:createLink action='${rowAction}' id='${categoryInstance.id}' />');" >
                    <td><g:link action="show" id="${categoryInstance.id}">${fieldValue(bean: categoryInstance, field: "id")}</g:link></td>
                    <td>${fieldValue(bean: categoryInstance, field: "name")}</td>
                    <td>${fieldValue(bean: categoryInstance, field: "displayOrder")}</td>
                </tr>
            </g:each>
            </tbody>
        </table>
    </div>
    <div class="paginateButtons">
        <g:paginate total="${categoryInstanceTotal}" />
    </div>
</div>
</body>
</html>

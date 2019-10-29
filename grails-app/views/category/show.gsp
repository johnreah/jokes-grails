<%@ page import="com.jokeemporium.jokes.Category" %>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'category.label', default: 'Category')}" />
    <title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
<g:render template="/menuBar" />
<div class="body">
    <h1><g:message code="default.show.label" args="[entityName]" /></h1>
    <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
    </g:if>
    <div class="dialog">
        <table>
            <tbody>
            <tr class="prop">
                <td valign="top" class="name"><g:message code="category.id.label" default="Id" /></td>
                <td valign="top" class="value">${fieldValue(bean: categoryInstance, field: "id")}</td>
            </tr>
            <tr class="prop">
                <td valign="top" class="name"><g:message code="category.name.label" default="Name" /></td>
                <td valign="top" class="value">${fieldValue(bean: categoryInstance, field: "name")}</td>
            </tr>
            <tr class="prop">
                <td valign="top" class="name"><g:message code="category.displayOrder.label" default="Display order" /></td>
                <td valign="top" class="value">${fieldValue(bean: categoryInstance, field: "displayOrder")}</td>
            </tr>
            <tr class="prop">
                <td valign="top" class="name"><g:message code="category.description.label" default="Description" /></td>
                <td valign="top" class="value">${fieldValue(bean: categoryInstance, field: "description")}</td>
            </tr>
            </tbody>
        </table>
    </div>
    <g:if test="${session.user?.hasEditorRights()}">
        <div class="buttons">
            <g:form>
                <g:hiddenField name="id" value="${categoryInstance?.id}" />
                <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
            </g:form>
        </div>
    </g:if>
</div>
</body>
</html>

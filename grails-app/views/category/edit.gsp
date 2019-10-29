<%@ page import="com.jokeemporium.jokes.Category" %>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'category.label', default: 'Category')}" />
    <title><g:message code="default.edit.label" args="[entityName]" /></title>
</head>
<body>
<g:render template="/menuBar" />
<div class="body">
    <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
    <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${categoryInstance}">
        <div class="errors">
            <g:renderErrors bean="${categoryInstance}" as="list" />
        </div>
    </g:hasErrors>
    <g:form method="post" >
        <g:hiddenField name="id" value="${categoryInstance?.id}" />
        <g:hiddenField name="version" value="${categoryInstance?.version}" />
        <div class="dialog">
            <table>
                <tbody>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="name"><g:message code="category.name.label" default="Name" /></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: categoryInstance, field: 'name', 'errors')}">
                        <g:textField name="name" value="${categoryInstance?.name}" />
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="displayOrder"><g:message code="category.displayOrder.label" default="Display order" /></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: categoryInstance, field: 'displayOrder', 'errors')}">
                        <g:textField name="displayOrder" value="${categoryInstance?.displayOrder}" />
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="description"><g:message code="category.description.label" default="Description" /></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: categoryInstance, field: 'description', 'errors')}">
                        <g:textArea name="description" cols="40" rows="5" value="${categoryInstance?.description}" />
                    </td>
                </tr>

                </tbody>
            </table>
        </div>
        <div class="buttons">
            <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
            <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
        </div>
    </g:form>
</div>
</body>
</html>

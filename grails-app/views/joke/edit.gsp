<%@ page import="com.jokeemporium.jokes.Joke" %>
<%@ page import="com.jokeemporium.jokes.Category" %>
<%@ page import="com.jokeemporium.jokes.Categorisation" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'joke.label', default: 'Joke')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
    <g:render template="/menuBar" />
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${jokeInstance}">
            <div class="errors">
                <g:renderErrors bean="${jokeInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${jokeInstance?.id}" />
                <g:hiddenField name="version" value="${jokeInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="summary"><g:message code="joke.summary.label" default="Summary" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: jokeInstance, field: 'summary', 'errors')}">
                                    <g:textField name="summary" value="${jokeInstance?.summary}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="body"><g:message code="joke.body.label" default="Body" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: jokeInstance, field: 'body', 'errors')}">
                                    <g:textArea name="body" cols="40" rows="5" value="${jokeInstance?.body}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="dateAdded"><g:message code="joke.dateAdded.label" default="Date Added" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: jokeInstance, field: 'dateAdded', 'errors')}">
                                    <g:datePicker name="dateAdded" precision="day" value="${jokeInstance?.dateAdded}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="categorisations"><g:message code="joke.categorisations.label" default="Categorisations" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: jokeInstance, field: 'categorisations', 'errors')}">
                                    <g:each in="${com.jokeemporium.jokes.Category.list(sort:'displayOrder')}" var="c">
                                        <g:checkBox name="cb${c.id}" value="${jokeInstance.inCategory(c.id)}"></g:checkBox>
                                        <label for="cb${c.id}">${c.name}</label>
                                        <br />
                                    </g:each>
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

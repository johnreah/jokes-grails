<%@ page import="com.jokeemporium.jokes.Joke" %>

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'joke.label', default: 'Joke')}" />
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
              <td valign="top" class="name"><g:message code="joke.id.label" default="Id" /></td>
              <td valign="top" class="value">${fieldValue(bean: jokeInstance, field: "id")}</td>
            </tr>
            <tr class="prop">
              <td valign="top" class="name"><g:message code="joke.summary.label" default="Summary" /></td>
              <td valign="top" class="value">${fieldValue(bean: jokeInstance, field: "summary")}</td>
            </tr>
            <tr class="prop">
              <td valign="top" class="name"><g:message code="joke.body.label" default="Body" /></td>
              <td valign="top" class="value">${jokeInstance.formatBody()}</td>
            </tr>
            <tr class="prop">
              <td valign="top" class="name"><g:message code="joke.dateAdded.label" default="Date Added" /></td>
              <td valign="top" class="value"><g:formatDate format="dd-MMM-yyyy" date="${jokeInstance?.dateAdded}" /></td>
            </tr>
            <tr class="prop">
              <td valign="top" class="name"><g:message code="joke.categorisations.label" default="Categorisations" /></td>
              <td valign="top" style="text-align: left;" class="value">
                <ul>
                  <g:each in="${jokeInstance.categorisations}" var="c">
                    <li><g:link controller="categorisation" action="show" id="${c.id}">${c.category.name}</g:link></li>
                  </g:each>
                </ul>
              </td>
            </tr>
          </tbody>
        </table>
      </div>
      <g:if test="${session.user?.hasEditorRights()}">
        <div class="buttons">
          <g:form>
            <g:hiddenField name="id" value="${jokeInstance?.id}" />
            <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
            <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
          </g:form>
        </div>
      </g:if>
    </div>
  </body>
</html>

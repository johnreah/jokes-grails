<p>${params?.total} result(s) found</p>

<div class="paginateButtons" style="border-top-width:1px; border-top-style:solid;border-top-color: #cccccc;border-bottom: 0;">
  <g:paginate action="${params.searchAction}" total="${params.total}" params="${params.args}" />
</div>

<div class="list">
  <table>
    <thead>
      <tr>
        <g:sortableColumn property="id" title="${message(code: 'joke.id.label', default: 'Id')}" params="${params.args}" />
        <g:sortableColumn property="summary" title="${message(code: 'joke.summary.label', default: 'Summary')}" params="${params.args}" />
        <g:sortableColumn property="body" title="${message(code: 'joke.body.label', default: 'Body')}" params="${params.args}" />
        <g:sortableColumn property="dateAdded" title="${message(code: 'joke.dateAdded.label', default: 'Date Added')}" params="${params.args}" />
      </tr>
    </thead>
    <tbody>
      <g:set var="rowAction" value="${session.user.hasEditorRights() ? 'edit' : 'show'}" />
      <g:each in="${params.jokes}" status="i" var="joke">
        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}" onclick="DoNav('<g:createLink controller='joke' action='${rowAction}' id='${joke.id}' />');" >
          <td><g:link controller="joke" action="show" id="${joke.id}">${fieldValue(bean: joke, field: "id")}</g:link></td>
          <td>${fieldValue(bean: joke, field: "summary")}</td>
          <td>${fieldValue(bean: joke, field: "body")}</td>
          <td><g:formatDate format="dd-MMM-yyyy" date="${joke.dateAdded}" /></td>
        </tr>
      </g:each>
    </tbody>
  </table>
</div>

<div class="paginateButtons">
  <g:paginate action="${params.searchAction}" total="${params?.total}" params="${params.args}" />
</div>

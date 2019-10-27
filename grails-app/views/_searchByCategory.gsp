<g:form method="post">
  Click some categories<br/><br/>
  <g:each in="${com.jokeemporium.jokes.Category.list(sort:'displayOrder')}" var="c">
    <g:checkBox name="cb${c.id}" value="${params.categoryList?.contains(c.id)}"></g:checkBox>
    <label for="cb${c.id}">${c.name}</label>
    <br/>
  </g:each>
  <br/>
  <div class="buttons">
      <span class="button"><g:actionSubmit class="search" action="searchByCategory" value="Search by Category" /></span>
  </div>
</g:form>

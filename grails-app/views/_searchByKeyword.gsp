<g:form method="post">
  <label for="keyword">Text to search for</label>
  <g:textField name="keyword" value="${params['keyword']}" />
  <div class="buttons">
      <span class="button"><g:actionSubmit class="search" action="searchByKeyword" value="Search by Keyword" /></span>
  </div>
</g:form>

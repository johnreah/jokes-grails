<div class="nav">
    <g:if test="${session.user == null}">
        <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Home</a></span>
        <span class="menuButton"><g:link controller="joke" action="randomCleanJoke">Random Clean Joke</g:link></span>
    </g:if>
    <g:else>
        <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Home</a></span>
        <span class="menuButton"><a class="home" href="${createLink(uri: '/dashboard')}">Admin</a></span>
        <span class="menuButton"><g:link controller="joke" action="randomJoke">Random Joke</g:link></span>
        <span class="menuButton"><g:link controller="joke" action="randomCleanJoke">Random Clean Joke</g:link></span>
        <span class="menuButton"><g:link class="search" controller="search" >Search</g:link></span>
        <span class="menuButton"><g:link class="list" controller="joke" action="list">List Jokes</g:link></span>
        <span class="menuButton"><g:link class="create" controller="joke" action="create">New Joke</g:link></span>
    </g:else>
</div>

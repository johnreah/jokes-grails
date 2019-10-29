<%@ page import="com.jokeemporium.jokes.Joke" %>
<%@ page import="com.jokeemporium.jokes.Category" %>

<html>
<head>
    <title>Joke Database</title>
    <meta name="layout" content="main" />
    <link rel="stylesheet" href="<g:resource file='homePagePanel.css' />" />
    <asset:javascript src="application" />
</head>

<body>
<g:render template="/menuBar" />
<div id="nav">
    <div class="homePagePanel">
        <div class="panelTop"></div>
        <div class="panelBody">
            <h1>Database Status</h1>
            <ul>
                <li>Jokes: ${Joke.count()}</li>
                <li>Categories: ${Category.count()}</li>
            </ul>
        </div>
        <div class="panelBtm"></div>
    </div>
</div>
<div id="pageBody">
    <h1>Welcome to the Joke Database</h1>
    <p>This is the publicly-accessible home page.</p>
    <br />
    <h1>Random Joke</h1>
    <div id="divRandomJoke"></div>
    <g:remoteLink controller="joke" action="ajaxRandomCleanJoke" update="divRandomJoke">
        Get a random (clean) joke from the database
    </g:remoteLink>
</div>
</body>
</html>

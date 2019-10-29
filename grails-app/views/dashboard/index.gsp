<%@ page import="com.jokeemporium.jokes.Joke" %>
<%@ page import="com.jokeemporium.jokes.Category" %>
<%@ page import="com.jokeemporium.jokes.Categorisation" %>
<%@ page import="com.jokeemporium.jokes.User" %>

<html>
  <head>
    <title>Jokes Admin</title>
    <meta name="layout" content="main" />
    <asset:stylesheet src="homePagePanel.css" />
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
            <li>Categorisations: ${Categorisation.count()}</li>
            <li>Users: ${User.count()}</li>
          </ul>
          <h1>Application Status</h1>
          <ul>
            <li>App version: ${grailsApplication.metadata.info.app.version}</li>
            <li>Grails version: ${grailsApplication.metadata.info.app.grailsVersion}</li>
            <li>Groovy version: ${GroovySystem.version}</li>
            <li>JVM version: ${System.getProperty('java.version')}</li>
            <li>Controllers: ${grailsApplication.controllerClasses.size()}</li>
            <li>Domains: ${grailsApplication.domainClasses.size()}</li>
            <li>Services: ${grailsApplication.serviceClasses.size()}</li>
            <li>Tag Libraries: ${grailsApplication.tagLibClasses.size()}</li>
          </ul>
          <h1>Installed Plugins</h1>
          <ul>
            <g:set var="pluginManager" value="${applicationContext.getBean('pluginManager')}"></g:set>
            <g:each var="plugin" in="${pluginManager.allPlugins.sort {it.name}}">
              <li>${plugin.name}: ${plugin.version}</li>
            </g:each>
          </ul>
        </div>
        <div class="panelBtm"></div>
      </div>
    </div>
    <div id="pageBody">
      <h1>Welcome to the Joke Database admin pages</h1>
      <p>Congratulations, you have successfully logged into the Jokes database! This really
      just presents a view onto some default Grails functionality that lets you edit the database
      content, plus some extra convenience actions.</p><br />
      <p>Below is a list of controllers that are currently deployed in this application. Click on
      each to execute its default action:</p>
      <div id="controllerList" class="dialog">
        <h2>Available Controllers:</h2>
        <ul>
          <g:each var="c" in="${grailsApplication.controllerClasses.sort { it.fullName } }">
            <li class="controller"><g:link controller="${c.logicalPropertyName}">${c.fullName}</g:link></li>
          </g:each>
        </ul>
      </div>
      <br/>
      <p>Application: ${grailsApplication.metadata.info.app.name} ${grailsApplication.metadata.info.app.version}</p>
      <p>Environment: ${grails.util.Environment.current.name}</p>
    </div>
  </body>
</html>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
    <head>
        <title><g:layoutTitle default="Grails" /></title>
        <g:if test="${[null, 'dashboard', 'joke', 'user', 'category', 'search'].contains(controllerName)}">
            <asset:stylesheet src="main1.css" />
        </g:if>
        <g:else>
            <asset:stylesheet src="main4.css" />
        </g:else>
        <link rel="shortcut icon" href="${resource(dir:'images',file:'jester.ico')}" type="image/x-icon" />
        <g:layoutHead />
        <asset:javascript src="application.js" />
    </head>
    <body>
        <div id="spinner" class="spinner" style="display:none;">
            <img src="${resource(dir:'images',file:'spinner.gif')}" alt="${message(code:'spinner.alt',default:'Loading...')}" />
        </div>
        <div id="grailsLogo">
            <a href="${session.user?.hasAdminRights() ? createLink(uri:'/dashboard') : createLink(uri: '/')}"><img src="${resource(dir:'images',file:'jester_logo.png')}" alt="Jokes Database" border="0" /></a>
            <g:loginToggle />
        </div>
        <g:layoutBody />
    </body>
</html>

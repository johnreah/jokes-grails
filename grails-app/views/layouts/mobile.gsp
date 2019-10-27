<html>
    <head>
        <title><g:layoutTitle default="Jokes" /></title>
        <meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0;" />
        <link rel="stylesheet" href="${resource(dir:'css',file:'main1.css')}" />
        <link rel="shortcut icon" href="${resource(dir:'images',file:'jester.ico')}" type="image/x-icon" />
        <g:layoutHead />
    </head>
    <body>
        <div id="spinner" class="spinner" style="display:none;">
            <img src="${resource(dir:'images',file:'spinner.gif')}" alt="${message(code:'spinner.alt',default:'Loading...')}" />
        </div>
        <img src="${resource(dir:'images',file:'jester_logo_mobile.png')}" />
        <g:layoutBody />
    </body>
</html>
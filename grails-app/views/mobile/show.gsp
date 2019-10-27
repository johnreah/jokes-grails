<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="mobile" />
        <title>Mobile Joke</title>
        <style type="text/css">
            .mobileBody p {
                margin-left: 5px;
                margin-right: 5px;
            }
            .mobileBody a {
                font-size: 1.4em;
                color: #00f;
            }
        </style>
    </head>
    <body>
        <div class="mobileBody">
            <p>${jokeInstance.formatBody()}</p>
            <br />
            <div style="text-align:center;">
                <g:link action="randomCleanJoke">Another</g:link>
            </style>
            <br />
            <br />
        </div>
    </body>
</html>

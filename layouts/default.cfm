<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>RailoDoc, from Railo Technologies</title>
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Le HTML5 shim, for IE6-8 support of HTML elements -->
    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

    <!-- Le styles -->
    <link href="/css/bootstrap.css" rel="stylesheet">
    <style type="text/css">
      body {
        padding-top: 60px;
      }
    </style>

    <!-- Le fav and touch icons 
    <link rel="shortcut icon" href="images/favicon.ico">
    <link rel="apple-touch-icon" href="images/apple-touch-icon.png">
    <link rel="apple-touch-icon" sizes="72x72" href="images/apple-touch-icon-72x72.png">
    <link rel="apple-touch-icon" sizes="114x114" href="images/apple-touch-icon-114x114.png">
	-->
  </head>

  <body>

    <cfoutput>
	<div class="topbar">
      <div class="topbar-inner">
        <div class="container-fluid">
          <a class="brand" href="#buildURL("home")#">Railo Docs</a>
          <ul class="nav">
            <li class="active"><a href="#buildURL("home")#">Home</a></li>
            <li><a href="#buildURL("current.tags")#">Tags</a></li>
            <li><a href="#buildURL("current.functions")#">Functions</a></li>
          </ul>
        
		  <form class="pull-left" action="/index.cfm">
			 <input type="hidden" name="action" value="current.search">
            <input type="text" placeholder="Tag or Function" name="q">
          </form>
        </div>
      </div>
    </div>
	</cfoutput>


	
    <div class="container-fluid">
	  <div class="sidebar">
        <div class="well">
          <h5>Sidebar</h5>
          <ul>
            <li><a href="#">Link</a></li>
            <li><a href="#">Link</a></li>
            <li><a href="#">Link</a></li>
            <li><a href="#">Link</a></li>
          </ul>
          <h5>Previous Versions:</h5>
          <ul>
            <!--- <li><a href="#">Link</a></li>
            <li><a href="#">Link</a></li>
            <li><a href="#">Link</a></li>
            <li><a href="#">Link</a></li>
            <li><a href="#">Link</a></li>
            <li><a href="#">Link</a></li> --->
          </ul>
          
        </div>
      </div>
      <div class="content">
	
		<cfoutput>#body#</cfoutput>

        <cfoutput>
		<footer>
          <p>&copy; Railo Technologies Gmbh #DateFormat(Now(), "yyyy")#</p>
        </footer>
		</cfoutput>
      </div>
    </div>

  </body>
</html>
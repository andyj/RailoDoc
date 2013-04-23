<!DOCTYPE html>
  <cfoutput>
    
  
<html lang="en">
  <head>
    <cfparam name="rc.versionlist" default="#[]#">
    <cfparam name="rc.tflist" default="#[]#">
    <meta charset="utf-8">
    <title>RailoDoc, from The Railo Company</title>
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
  <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css" />
  <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
  <script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>
    <!-- Le fav and touch icons 
    <link rel="shortcut icon" href="images/favicon.ico">
    <link rel="apple-touch-icon" href="images/apple-touch-icon.png">
    <link rel="apple-touch-icon" sizes="72x72" href="images/apple-touch-icon-72x72.png">
    <link rel="apple-touch-icon" sizes="114x114" href="images/apple-touch-icon-114x114.png">
	-->

  <script>
  //Add functionality to the String object
  if (typeof String.prototype.startsWith != 'function') {
  
    String.prototype.startsWith = function (str){
     return this.indexOf(str) == 0;
    };
  }

  $(function() {
    var availableTags = #SerializeJSON(rc.tflist)#;
    $( "##tags" ).autocomplete({
      source: availableTags,
      select: function( event, ui ) {

              if(ui.item.value.startsWith("cf")){
                window.location = "#buildURL("current.tag&item=")#" + ui.item.value;
              }
              else {
                window.location = "#buildURL("current.function&item=")#" + ui.item.value; 
              }

               
              }
    });
  });
  </script>
  </head>

  <body>

    
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
            <input type="text" id="tags" placeholder="Tag or Function" name="q">
          </form>
        </div>
      </div>
    </div>
	


	
    <div class="container-fluid">
	  <div class="sidebar">
        <div class="well">
          <h5>#server.railo.version# (#server.railo.versionName#)</h5>
          <ul>
            <li><a href="#buildURL("current.tags")#">Tags</a></li>
            <li><a href="#buildURL("current.functions")#">Functions</a></li>
          </ul>
          <h5>Previous Versions:</h5>
          <ul>
			<cfloop array="#rc.versionlist#" index="ver">
            <li><a href="##" title="#ver.getCodeName()#">#ver.getVersionNumber()#</a></li>
			</cfloop>
          </ul>
          
        </div>
      </div>
      <div class="content">
        #body#

        
		    <footer>
          <p>&copy; The Railo Company Limited #DateFormat(Now(), "yyyy")#</p>
        </footer>
		
      </div>
    </div>
</cfoutput>
  </body>
</html>
<cfcomponent extends="org.corfield.framework"><cfscript>
	// Either put the org folder in your webroot or create a mapping for it!
	
	this.name = 'railodocs_org';
	// FW/1 - configuration:
	variables.framework = structNew();
	// controllers/layouts/services/views are in this folder (allowing for non-empty context root):
	// If your CFML engine supports it, you can create the framework struct like this:
	// variables.framework = {
	// 		base = getDirectoryFromPath( CGI.SCRIPT_NAME ) & 'introduction'
	// }

</cfscript></cfcomponent>
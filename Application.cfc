component extends="org.corfield.framework"{
	// Either put the org folder in your webroot or create a mapping for it!
	
	this.name = hash(getCurrentTemplatePath());
	this.datasource = "railodocs";
	this.ormEnabled = true;
	// FW/1 - configuration:
	variables.framework = {
		reload = 'reload',
		password = 'true',
		reloadApplicationOnEveryRequest = true, 
		unhandledPaths='/railo-context/admin/',
		usingSubsystems=false
	};
	
	// controllers/layouts/services/views are in this folder (allowing for non-empty context root):
	// If your CFML engine supports it, you can create the framework struct like this:
	// variables.framework = {
	// 		base = getDirectoryFromPath( CGI.SCRIPT_NAME ) & 'introduction'
	// }
	
	
	function setupApplication(){
		bf = createObject('component','coldspring.beans.DefaultXmlBeanFactory').init();
		bf.loadBeans( expandPath('config/coldspring.xml.cfm') );
		setBeanFactory(bf);
	}
	
	function setupRequest() {
		ORMReload();
		controller('versions.list');
		controller('current.tagfunctionlist');
	}

}
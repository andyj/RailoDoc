component output="false"{

	function init(){
		return this;
	}
	
	function list(){
		var retLastVersion = []	
		var versions = EntityLoad("Version", {}, "versionNumber desc");
		var codeName = "";
		
		for(v in versions){
			if(v.getCodeName() NEQ codeName){
				ArrayAppend(retLastVersion, v);
				codeName = v.getCodeName();
			}
		}
	
		return retLastVersion;
	}

	function majorList(){

		var majorVersions = {};
		var versions = EntityLoad("Version", {}, "versionNumber asc");


		for(local.v in versions){
			var maj  = ListGetAt(v.getVersionNumber(), 1, ".");
			if(!majorVersions.keyExists(maj)){
				majorVersions[maj] = [];
			}
			majorVersions[maj].append(v);

		}

		return majorVersions;
	}
	

}
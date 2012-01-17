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
	

}
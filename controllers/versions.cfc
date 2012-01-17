component output="false"{

	function init( fw ) {
    	variables.fw = fw;
	}

	function list(rc){
		variables.fw.service( "versions.list", "versionlist");	
	}

}
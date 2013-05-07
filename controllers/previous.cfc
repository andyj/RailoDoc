component {

	function init(fw){
		variables.fw = arguments.fw;
	}

	function before(){

	}


	function tags(rc){
		//Load a Version, and we can get the tags and stuff
		var version = EntityLoad("Version", {versionNumber=rc.version}, true);
	
		rc.tags = version.getTags();
	}

	function tag(rc){



		dump(EntityLoad("Attribute",17,true));
		abort;

		if(rc.item.startsWith("cf")){
			rc.item = Right(rc.item, Len(rc.item)-2);
		}

		var version = EntityLoad("Version", {versionNumber=rc.version}, true);
		var mytag = EntityLoad("Tag", {tagname=rc.item, Version=version} ,true);
		rc.TAGINFO = myTag;
	}
}
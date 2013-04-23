component {
	

	function onMissingMethod(methodName){

		if(LCase(methodName).startsWith("cf")){
			rc.item = LCase(Right(arguments.methodName, Len(arguments.methodName)-2));

			//Need to really check if this exists
			var tagData = getTagList();

			if(!StructKeyExists(tagData.cf, rc.item)){

				return;
			}
				
			savecontent variable="tagView"{
				include template="/views/current/tag.cfm";
			}
			
			//In theory this would not happen if the file exists but let's just check

			var viewFile = expandPath("/views/tag/cf#rc.item#.cfm");

			if(!fileExists(viewFile)){
				FileWrite(viewFile, tagView);
			}
			

			

		}
		
		
	}
}
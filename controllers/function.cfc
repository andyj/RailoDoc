component {
	

	function onMissingMethod(methodName){

			//Need to really check if this exists
			var funcList = getFunctionList();

			
			if(!funcList.keyExists(arguments.methodName)){

				return;
			}
				
			savecontent variable="funcView"{
				include template="/views/current/function.cfm";
			}
			
			//In theory this would not happen if the file exists but let's just check

			var viewFile = expandPath("/views/function/#arguments.methodName#.cfm");
			rc.item = arguments.methodName;
			
			if(!fileExists(viewFile)){
				FileWrite(viewFile, funcView);
			}
			

			

		
		
	}
}
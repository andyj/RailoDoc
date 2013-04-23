component {
	
	variables.tflist = [];

	function tagfunctionlist(rc){
		

		if(!ArrayLen(variables.tflist)){
			variables.tflist = populateTagFuncList();
		}
		
		rc.tflist = variables.tflist;

	}


	private function populateTagFuncList(){
		var mylist = [];
		var tags = getTagList();
		for(local.t in tags.cf){
			if(ListFind("x_,_", t)){
				continue;
			}
			mylist.append("cf#t#");
			
		}

		var funcs = getFunctionList();

		for(local.f in funcs){
			if(local.f.startsWith("_")){
				continue;
			}
			mylist.append(f);
			
		}
		arraySort(mylist, "text");

		return mylist;
	}
}
<cfcomponent output="false">

	<cfset this.groups = []>
	<cfset this.list = "">
	<cfset this.collection = {}>
	<cfset this.ignoredGroups = "">
	<cffunction name="init">
		<cfargument name="TheList" type="Array">
		<cfargument name="sorttype" default="">
		<cfargument name="ignoredGroups" default="">

		<cfset this.list = TheList>
		<cfif Len(sorttype)>
			<cfset ArraySort(this.list, sorttype)>
		</cfif>
		<cfset this.ignoredGroups = arguments.ignoredGroups>
		<cfset setupGroups()>
		<cfreturn this />
	</cffunction>
	
<cfscript>
	
	
	Array function getGroupNames(){
		return this.groups;
	}
	
	void function setupGroups(){
		var agroup = [];
		var currLetter = "";
		
		loop array="#this.list#" index="local.c"{
			var startLetter = Left(c,1);
			addItemToCollection(startLetter, c);
			if(startLetter NEQ currLetter AND !ListFind(this.ignoredGroups, startLetter)){
				ArrayAppend(agroup, startLetter);
				currLetter = startLetter;
			}
		}

		this.groups = agroup;
	}
	

	function getItemsInGroup(key){
		return this.collection[key];
	}

	function addItemToCollection(key, value){
		if(!StructKeyExists(this.collection, key)){
			this.collection[key] = [];
		}
		ArrayAppend(this.collection[key], value);
	}
	
	function getHalfWayGroup(){
		var halfitem = Left(this.list[Ceiling(ArrayLen(this.list)/2)],1);
			halfitem = this.groups[ArrayFind(this.groups, halfitem)+1];
		//Get it from the aAlphabet, then get the next one
		return halfitem;
	}

</cfscript>

</cfcomponent>
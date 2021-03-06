	<cfscript>
		//	Setup the GroupList
		prefix = "cf";
		tagList = getTagList();
		tagList = StructKeyArray(tagList[prefix]);
		
		list = new cfc.lists.GroupedList(tagList, "text", "_");
		aAlphabet = list.getGroupNames();
		HalfLetter = list.getHalfWayGroup();
		litems = "_,x_";
		aBodyTypes = {};
	</cfscript>
<section id="tags">
  <div class="page-header">
    <h1>Tags </h1>
  </div>
	<div class="row">
    	<div class="span16">
	      <h3>Current Tags for Railo Server</h3>
		</div>

	<div class="span16">
	<cfset counter = 1>
	<cfloop array="#aAlphabet#" index="al">
		<cfoutput><a href="###al#">#UCase(al)#</a>
			<cfif counter NEQ ArrayLen(aAlphabet)> - </cfif>
			<cfset counter++>
		</cfoutput>
	</cfloop>
		</div>
	
    	<div class="span8">
	<cfoutput>
	<cfloop array="#aAlphabet#" index="al">
	
		<cfif al EQ HalfLetter>
			</div>
	    	<div class="span8">
		</cfif>				
		
			<h4><a name="#al#">#UCase(al)#</a></h4>
			<cfset items = list.getItemsInGroup(al)>
			
			<ul>
				<cfloop array="#items#" index="i">				
				
					<cfset taginfo = getTagData(prefix,i)>
					<cfset aBodyTypes[tagInfo.bodyType] = "">
					
					<cfif taginfo.status == "implemeted">
						<li><a href="#buildURL("current.tag&item=#i#")#">#prefix##i#</li>
					<cfelse>
						<li><strike>#prefix##i#</strike> (#taginfo.status#)</li> 
					</cfif>
				
				</cfloop>
			</ul>
	</cfloop>
	</cfoutput>
	    </div>
	</div>
	
</section>
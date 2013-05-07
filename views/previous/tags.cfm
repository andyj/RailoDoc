<cfoutput>

	<cfscript>
		tagList = [];

		for(tag in rc.tags){
			tagList.append(tag.getTagName());
		}

		//	Setup the GroupList
		//This should be done at controller level 
		prefix = "cf";
		//tagList = getTagList();
		//tagList = StructKeyArray(tagList[prefix]);
		
		list = new cfc.lists.GroupedList(tagList, "text", "_");
		aAlphabet = list.getGroupNames();
		HalfLetter = list.getHalfWayGroup();
		litems = "_,x_";
		aBodyTypes = {};
		

		function getTagFromArray(tagName){
			for(tag in rc.tags){
				if(tag.getTagName() EQ tagName){
					return tag;
				}
			}
			return "";
		}

	</cfscript>


<section id="tags">
  <div class="page-header">
    <h1>Tags for <a href="#buildURL("previous.default?version=#rc.version#")#">#rc.version#</a></h1>
  </div>
	<div class="row">
    
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
					<li>			
						<a href="#buildURL("previous.tag?version=#rc.version#&amp;item=#i#")#">#prefix##i#</a>
					</li> 
				</cfloop>
			</ul>
	</cfloop>
	</cfoutput>
	    </div>
	</div>
	
</section>
</cfoutput>
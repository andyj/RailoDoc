	<cfscript>
		//	Setup the GroupList
		funclist = getFunctionList();
		funclist = StructKeyArray(funclist);
		list = new cfc.lists.GroupedList(funclist, "text");
		aAlphabet = list.getGroupNames();
		HalfLetter = list.getHalfWayGroup();
		
	</cfscript>
<section id="functions">
  <div class="page-header">
    <h1>Functions </h1>
  </div>
	<div class="row">
    	<div class="span16">
	      <h3>Current Functions for Railo Server</h3>
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
				<li>
					<cfset funcinfo = getFunctionData(i)>
					<cfif funcinfo.status == "implemeted">
					<a href="#buildURL("current.function&item=#i#")#">#i#</a>
					<cfelse>
						<strike>#i#</strike>	(#funcinfo.status#)
					</cfif>
				</li>
				</cfloop>
			</ul>
	</cfloop>
	</cfoutput>
	    </div>
	</div>
  
</section>
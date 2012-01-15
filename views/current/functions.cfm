<section id="about">
  <div class="page-header">
    <h1>Functions </h1>
  </div>
  <div class="row">
    <div class="span16">
      <h3>Current Functions for Railo Server</h3>
	<cfset funclist = getFunctionList()>
	<cfset aFuncs = StructKeyArray(funclist)>
	<cfset ArraySort(aFuncs, "textnocase")>
	<cfset ignorelist = "">
	<ul>
		<cfloop array="#aFuncs#" index="f">
		<cfif ListFindNoCase(ignorelist, f)><cfcontinue/></cfif>
		<cfoutput><li><a href="#buildURL("current.function&item=#f#")#">#f#</li></cfoutput>
		</cfloop>
	
	</ul>
    </div>
  
</section>
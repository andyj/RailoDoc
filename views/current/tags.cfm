<section id="about">
  <div class="page-header">
    <h1>Tags </h1>
  </div>
  <div class="row">
    <div class="span16">
      <h3>Current Tags for Railo Server</h3>
      
	<cfset prefix = "cf">
	<cfset tagList = getTagList()>
	<cfset aTags = StructKeyArray(tagList[prefix])>
	<cfset ArraySort(aTags, "textnocase")>
    <cfset ignoreList = "_,x_">
	<ul>
		<cfloop array="#aTags#" index="t">
		<cfif ListFindNoCase(ignorelist, t)><cfcontinue/></cfif>
		<cfoutput><li><a href="#buildURL("current.#prefix##t#")#">#prefix##t#</li></cfoutput>
		</cfloop>
	
	</ul>
    </div>
  
</section>
<cfoutput>
<h1>Previous Versions</h1>
<cfparam name="rc.majorversionlist" default="#{}#">
<cfparam name="rc.majorversion" default="0">

<cfset selectedVersions = rc.majorversionlist[rc.majorversion]>
<section id="version_list">
<ul>
<cfloop array="#selectedVersions#" index="v">


	<li><a href="#buildURL("previous.default&version=")##v.getVersionNumber()#">#v.getVersionNumber()#</a>
	#v.getCodeName()#</l1>
</cfloop>
	
</ul>

</section>
</cfoutput>
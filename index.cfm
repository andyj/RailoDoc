<cfabort>

<cfdump var="#URL#">
<cfparam name="url.version" default="current">
<cfparam name="url.item" default="">
<cfset type = "function">
<cfdump var="#Left(url.item,2)#">
<cfif Left(url.item,2) EQ "cf">
	<cfset type="tag">
</cfif>



<!--- if we are current, we include the current version --->
<cfif type IS "tag">
	<cfset tagname = Mid(url.item,3,Len(url.item))>
	
	<cfdump var="#tagname#">
	<cfset info = getTagData("cf", tagname)>
<cfelse>
	<cfset info = getFunctionData(url.item)>

</cfif>
<cfdump var="#info#">


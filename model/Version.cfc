<cfcomponent output="false" persistent="true" table="engines">
	<cfproperty name="id" column="engineID" fieldtype="id">
	<cfproperty name="versionNumber">
	<cfproperty name="codeName">
	<cfproperty name="releaseDate" ormType="timestamp">
</cfcomponent>
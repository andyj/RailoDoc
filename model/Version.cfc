component output="false" persistent="true" table="engines" {
	property name="id" column="engineID" fieldtype="id";
	property name="versionNumber";
	property name="codeName";
	property name="releaseDate" ormType="timestamp";

	property name="Tags" fieldtype="one-to-many" cfc="Tag" fkcolumn="engineID" orderby="tagname" lazy="true"; 
	property name="Functions" fieldtype="one-to-many" cfc="Function" fkcolumn="engineID" orderby="name" lazy="true"; 

}
	


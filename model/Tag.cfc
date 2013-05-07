component output="false" persistent="true" table="tags"{

	//Columns
	property name="id" column="tagID" fieldtype="id";
	property name="tagname";
	property name="description";
	property name="bodyType";

	//Relationships
	property name="version" fieldtype="many-to-one" cfc="Version" fkcolumn="engineID";
	property name="attributes" fieldtype="one-to-many" cfc="Attribute" fkcolumn="tagID";
}
component output="false" persistent="true" table="functions"{
	property name="id" column="functionID" fieldtype="id";
	property name="name";
	property name="description";

	//property name="Version" fieldtype="many-to-one" cfc="Version" column="engineID" fkcolumn="engineID" lazy="true"; 
}
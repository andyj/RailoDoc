/**
*
* @file  /Users/markdrew/Sites/railodoc.local/model/Attributes.cfc
* @author  
* @description
*
*/

component output="false" persistent="true" table="attributes" displayname=""  {

	property name="id" column="attributeID" fieldtype="id";
	property name="name";
	property name="required" column="required" type="boolean";

	property name="type" fieldtype="one-to-one" cfc="Type" fkcolumn="type_id";
}	
<cfparam name="rc.item">

<cfif rc.item.startsWith("cf")> 
	<cfset rc.item = Right(rc.item, Len(rc.item)-2)>
</cfif>



<cfoutput>
<cfset prefix = "cf">
<cfset tagInfo = getTagData(prefix,rc.item)>


<section id="function_description">
  <div class="page-header">
    <h1>#prefix##rc.item# <small>Information about the #prefix##rc.item# tag</small></h1>
  </div>
	<div class="row">
		<div class="span16">
			<h3>Description</h3>
			<p>#tagInfo.description#</p>
		</div>	
		<div class="span16">
			<h3>Syntax</h3>
			
			<code>
				<!--- Body type: free, prohibited --->
				&lt;#prefix##rc.item#
				<cfloop collection="#tagInfo.attributes#" item="attr">
				<cfif tagInfo.attributes[attr].required>
				#attr# = "#tagInfo.attributes[attr].type#"<br>
				<cfelse>
				[#attr# = "#tagInfo.attributes[attr].type#"]<br>				
				</cfif>
				</cfloop>

				<cfif tagInfo.bodyType EQ "prohibited">
					/&gt;
				</cfif>
				
			</code>
			<br>



			
			This tag also supports CFSCript syntax:
			<code>
			
			</code>
		</div>
		
		
		<div class="span16">
			<h3>Attributes</h3>
			<table>
				<thead>
					<tr>
						<th>Attributes</th>
						<th>Required</th>
						<th>Description</th>
						<th>Status</th>
					</tr>
				</thead>
				<tbody>
					<cfloop collection="#tagInfo.attributes#" item="attr">
						<cfset data = tagInfo.attributes[attr]>
					<tr>
						<td>#attr#</td>
						<td>#data.required#</td>
						<td>#data.description#</td>
						<td>#data.status#</td>
					</tr>
					</cfloop>
				</tbody>
			</table>
			<cfdump var="#tagInfo#" expand="false">
		</div>	

	</div>
	
</section>

</cfoutput>
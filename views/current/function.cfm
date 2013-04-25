<cfparam name="rc.item">
<cfoutput>
<cfset funcInfo = getFunctionData(rc.item)>
<section id="function_description">
  <div class="page-header">
    <h1>#rc.item# <small>Information about the #rc.item# function</small></h1>
  </div>
	<div class="row">
		<div class="span16">
			<h3>Description</h3>
			<p>#funcInfo.description#</p>
		</div>	
		
		<div class="span16">
			<h3>Returns</h3>
			<p>#funcInfo.returnType#</p>
		</div>	


		<div class="span16">
			<h3>Syntax</h3>
			
			<code>
				<cfset argList = "">
				<cfloop array="#funcInfo.arguments#" index="argmt">
					<cfif !argmt.required>
						<cfset argList = ListAppend(argList, "[#argmt.name#]")>
					<cfelse>
						<cfset argList = ListAppend(argList, argmt.name)>
					</cfif>
				</cfloop>


				<!--- Body type: free, prohibited --->
				&lt;cfset #rc.item#(#argList#)&gt;


<!---
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
--->				
			</code>
		</div>

		<div class="span16">
			<h3>Arguments</h3>

			<table>
				<thead>
					<tr>
						<th>Argument</th>
						<th>Required</th>
						<th>Description</th>
						<th>Status</th>
					</tr>
				</thead>
				<tbody>
					<cfloop array="#funcInfo.arguments#" index="argmt">
					<tr>
						<td>#argmt.name#</td>
						<td>#argmt.required#</td>
						<td>#argmt.description#</td>
						<td>#argmt.status#</td>
					</tr>
					</cfloop>
				</tbody>
			</table>

			<cfdump var="#funcInfo#" expand="false">
		</div>	

	</div>
	
</section>

</cfoutput>
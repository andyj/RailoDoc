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
		</div>	

	</div>
	
</section>

</cfoutput>
<cfparam name="rc.item">
<cfoutput>
<cfset prefix = "cf">
<cfset tagInfo = getTagData(prefix,rc.item)>
<section id="function_description">
  <div class="page-header">
    <h1>#rc.item# <small>Information about the #rc.item# tag</small></h1>
  </div>
	<div class="row">
		<div class="span16">
			<h3>Description</h3>
			<p>#tagInfo.description#</p>
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
		</div>	

	</div>
	
</section>

</cfoutput>
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
			<p>#formatText(tagInfo.description)#</p>
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



			<!---			
			This tag also supports CFSCript syntax:
			<code>
			
			</code>
			--->
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
						<td>#formatText(data.description)#</td>
						<td>#replace(data.status, 'implemeted', 'implemented')#</td>
					</tr>
					</cfloop>
				</tbody>
			</table>
			<cfdump var="#tagInfo#" expand="false">
		</div>	

		<div class="span16 well">
			<div id="disqus_thread"></div>
		    <script type="text/javascript">
		        /* * * CONFIGURATION VARIABLES: EDIT BEFORE PASTING INTO YOUR WEBPAGE * * */
		        var disqus_shortname = 'railodocs'; // required: replace example with your forum shortname
				var disqus_identifier = "tag_#rc.item#"; //Tag identifier
				
		        /* * * DON'T EDIT BELOW THIS LINE * * */
		        (function() {
		            var dsq = document.createElement('script'); dsq.type = 'text/javascript'; dsq.async = true;
		            dsq.src = '//' + disqus_shortname + '.disqus.com/embed.js';
		            (document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(dsq);
		        })();
		    </script>
		    <noscript>Please enable JavaScript to view the <a href="http://disqus.com/?ref_noscript">comments powered by Disqus.</a></noscript>
		    <a href="http://disqus.com" class="dsq-brlink">comments powered by <span class="logo-disqus">Disqus</span></a>
    

		</div>

	</div>
	
</section>

</cfoutput>

<cffunction name="formatText">
	<cfargument name="text"/>
	<cfset local.inList = false />
	<cfif find(chr(10)&chr(10), text)>
		<cfset text = replace(text, chr(10)&chr(10), '#chr(10)# #chr(10)#', 'all')/>
	</cfif>
	<cfloop list="#text#" delimiters="#chr(10)#" index="local.line">
		<cfif left(line, 2) eq "- ">
			<cfif not inList>
				<cfoutput><ul></cfoutput>
				<cfset inList = true />
			<cfelse>
				<cfoutput></li></cfoutput>
			</cfif>
			<cfoutput><li>#replace(line, '- ', '')#</cfoutput>
			<cfcontinue/>
		<cfelseif local.inList>
			<cfoutput></li></ul></cfoutput>
			<cfset local.inList = false />
		</cfif>
		<cfif right(listFirst(line, ' '), 1) eq ':'>
			<cfoutput><b>#listFirst(line, ' ')#</b> &nbsp;#listRest(line, ' ')#<br/></cfoutput>
		<cfelse>
			<cfoutput>#line#<br/></cfoutput>
		</cfif>
	</cfloop>
	<cfif local.inlist>
		<cfoutput></li></ul></cfoutput>
	</cfif>
</cffunction>
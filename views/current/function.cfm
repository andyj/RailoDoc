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
			<p>#formatText(funcInfo.description)#</p>
		</div>	
		
		<div class="span16">
			<h3>Returns</h3>
			<p>#funcInfo.returnType#</p>
		</div>	


		<div class="span16">
			<h3>Syntax</h3>
			
			<cfset argList = "">
			<cfloop array="#funcInfo.arguments#" index="argmt">
				<cfif !argmt.required>
					<cfset argList = ListAppend(argList, "[#argmt.name#]", chr(65535))>
				<cfelse>
					<cfset argList = ListAppend(argList, argmt.name, chr(65535))>
				</cfif>
			</cfloop>
			<code>
				<!--- Body type: free, prohibited --->
				&lt;cfset<cfif funcInfo.returnType neq 'void'> my#UCFirst(funcInfo.returnType)# =</cfif> #rc.item#(#replace(argList, chr(65535), ', ', 'all')#)&gt;


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
						<td>#formatText(argmt.description)#</td>
						<td>#replace(argmt.status, 'implemeted', 'implemented')#</td>
					</tr>
					</cfloop>
				</tbody>
			</table>

			<cfdump var="#funcInfo#" expand="false">
		</div>	


		<div class="span16 well">
			<div id="disqus_thread"></div>
		    <script type="text/javascript">
		        /* * * CONFIGURATION VARIABLES: EDIT BEFORE PASTING INTO YOUR WEBPAGE * * */
		        var disqus_shortname = 'railodocs'; // required: replace example with your forum shortname
				var disqus_identifier = "function_#rc.item#"; //Tag identifier
				
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
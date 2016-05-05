<!--- Written by JM 05/2014 
	Purpose: Easily redirect to cx details with appropriate options
	Requests come from: Anywhere
	Sends requests to: cx_details_list.cfm (cflocation)
--->

<cftry>
	
	<cfif isDefined("URL.cid")>
		<cflocation url="cx_details_list.cfm?cid=#cid#&clickthrough" addToken="no">
	</cfif>
	
	<cfif isDefined("URL.HCOcombo") AND URL.HCOcombo NEQ ''>
		<cfset SESSION.cx_comboList = URL.HCOcombo>
	<cfelse>
		<cfset SESSION.cx_comboList = ''>
	</cfif>
	
	<!---			New Dynamic options (can combine)		--->
	<cfif isDefined("URL.HCOcombo_d") AND URL.HCOcombo_d NEQ ''>
		<cfset SESSION.cx_comboList_dyn = URL.HCOcombo_d>
	<cfelse>
		<cfset SESSION.cx_comboList_dyn = ''>
	</cfif>
	
	<cfif isDefined("URL.HCO_d") AND URL.HCO_d NEQ ''>
		<cfset session.cx_hco_dyn = URL.HCO_d>
	<cfelse>
		<cfset session.cx_hco_dyn = ''>
	</cfif>
	
	<cfif isDefined("URL.HCOnot_d") AND URL.HCOnot_d NEQ ''>
		<cfset session.cx_not_hco_dyn = URL.HCOnot_d>
	<cfelse>
		<cfset session.cx_not_hco_dyn = ''>
	</cfif>
	
	
	<!---			/New Dynamic options (can combine)		--->
	
	<cfif isDefined("URL.this_start")>
		<cfset SESSION.cx_date_start = dateFormat(URLDecode(URL.this_start),'yyyy-mm-dd')>
	<cfelse>
		<cfset SESSION.cx_date_start = ''>
	</cfif>
	
	<cfif isDefined("URL.this_end")>
		<cfset SESSION.cx_date_end = dateFormat(URLDecode(URL.this_end),'yyyy-mm-dd')>
	<cfelse>
		<cfset SESSION.cx_date_end = ''>
	</cfif>
	
	<cfif isDefined("URL.pcode") AND URL.pcode NEQ 0>
		<cfset SESSION.cx_phonecode = URL.pcode>
	<cfelseif isdefined("phid")>
		<cfset session.cx_phonecode = url.phid />
	<cfelse>
		<cfset SESSION.cx_phonecode = ''>
	</cfif>
	
	<!--- get hcat_options from hcat option IDs or hcat IDs --->
	<cfif isDefined("URL.hcat") OR isDefined("URL.hco")>
		<cfif isDefined("URL.hcat")>
			<cfquery datasource="GIT_variable_CM" name="pull_hcat">
				SELECT hcat_optionid 
				FROM hcat_option
				WHERE frn_hcatid in (<cfqueryParam value="#URL.hcat#" list="yes" CFSQLType = 'CF_SQL_INTEGER'>)
			</cfquery>
			
			<cfset SESSION.cx_hco = ValueList(pull_hcat.hcat_optionid)>
		</cfif>
		
		<cfif isDefined("URL.hco")>
			<cfset SESSION.cx_hco = URL.hco>
		</cfif>
	<cfelse>
		<cfset SESSION.cx_hco = 'clickthrough'>
	</cfif>
	
	<!--- specify GIT_PhNumtag --->
	<cfif isDefined("URL.GIT_PhNumtag")>			
		<cfset SESSION.GIT_PhNumtag = GIT_PhNumtag>
	</cfif>
	
	<cfif isdefined("session.axreport_lskin")>
	<cfcookie name="loggedin_cookie" httponly="true"/>
	</cfif>
	
	<!--- get GIT_PhNum lists from label1 value, explicit GIT_PhNum list, or a typeRef (inbound/outbound),
																or GIT_PhNumPath (cf_frn_GIT_PhNumid + extension_frn_GIT_PhNumid combo--->
	<cfif isDefined("URL.label1") OR isDefined("URL.GIT_PhNum") OR isDefined("URL.typeRef") OR isdefined("url.GIT_PhNumPath")>
		<cfif isDefined("URL.label1") and isDefined("URL.double_decode")>
			<cfquery datasource="GIT_variable_CM" name="pull_label">
				SELECT GIT_PhNumid 
				FROM GIT_table_that_holds_numbers 
				WHERE add_FROM GIT_account IN (<cfqueryParam value="#SESSION.GIT_variable_CM_lskin_all#" list="yes" CFSQLType = 'CF_SQL_INTEGER'>)
					AND label1 = <cfqueryParam value="#URLDecode(URL.label1)#" CFSQLType = 'CF_SQL_VARCHAR'>
			</cfquery>
			<cfset SESSION.GIT_variable_CM_cx_GIT_PhNum = ValueList(pull_label.GIT_PhNumid)>
			
		<cfelseif isDefined("URL.label1")>
			<cfquery datasource="GIT_variable_CM" name="pull_label">
				SELECT GIT_PhNumid 
				FROM GIT_table_that_holds_numbers 
				WHERE add_FROM GIT_account IN (<cfqueryParam value="#SESSION.GIT_variable_CM_lskin_all#" list="yes" CFSQLType = 'CF_SQL_INTEGER'>)
					AND label1 = <cfqueryParam value="#URL.label1#" CFSQLType = 'CF_SQL_VARCHAR'>
			</cfquery>
			
			<cfset SESSION.GIT_variable_CM_cx_GIT_PhNum = ValueList(pull_label.GIT_PhNumid)>
		</cfif>
		
		<cfif isDefined("URL.typeRef")>
			<cfif URL.typeRef EQ 'inbound'>
				<cfquery datasource="GIT_variable_CM" name="pull_GIT_PhNum">
					SELECT GIT_PhNumid 
					FROM xGIT_PhNum 
					WHERE add_FROM GIT_account IN (<cfqueryParam value="#SESSION.GIT_variable_CM_lskin_all#" list="yes" CFSQLType = 'CF_SQL_INTEGER'>)
						AND frn_GIT_PhNumfunctionid = 1
				</cfquery>
				
				<cfset SESSION.GIT_variable_CM_cx_GIT_PhNum = ValueList(pull_GIT_PhNum.GIT_PhNumid)>
			<cfelseif URL.typeRef EQ 'outbound'>
				<cfquery datasource="GIT_variable_CM" name="pull_GIT_PhNum">
					SELECT GIT_PhNumid
					FROM xGIT_PhNum 
					WHERE add_FROM GIT_account IN (<cfqueryParam value="#SESSION.GIT_variable_CM_lskin_all#" list="yes" CFSQLType = 'CF_SQL_INTEGER'>)
						AND frn_GIT_PhNumfunctionid = 2
				</cfquery>
				
				<cfset SESSION.GIT_variable_CM_cx_GIT_PhNum = ValueList(pull_GIT_PhNum.GIT_PhNumid)>
			<cfelse>
				<!---Nothing to do, here --->
			</cfif>
		</cfif>
		
		<cfif isDefined("URL.GIT_PhNum")>
			<cfif URL.GIT_PhNum contains 'e'>	<!--- e+GIT_PhNumid signifies a bridge extension --->
				<cfset session.GIT_variable_CM_cx_GIT_PhNum = ''>
				<cfset session.GIT_variable_CM_cx_GIT_PhNum_extensions = ''>
				<cfset GIT_PhNum_arr = ListToArray(URL.GIT_PhNum)>
				<cfloop index="i" from="1" to="#ArrayLen(GIT_PhNum_arr)#">
					<cfif GIT_PhNum_arr[i] contains 'e'> 
						<cfset session.GIT_variable_CM_cx_GIT_PhNum_extensions = ListAppend(session.GIT_variable_CM_cx_GIT_PhNum_extensions, Replace(GIT_PhNum_arr[i], 'e', ''))>
					<cfelse>
						<cfset session.GIT_variable_CM_cx_GIT_PhNum = ListAppend(session.GIT_variable_CM_cx_GIT_PhNum, GIT_PhNum_arr[i])>
					</cfif>
				</cfloop><!---cfoutput>#session.GIT_variable_CM_cx_GIT_PhNum_extensions#xxx#session.GIT_variable_CM_cx_GIT_PhNum#</cfoutput--->
			<cfelse>
				<cfset session.GIT_variable_CM_cx_GIT_PhNum = URL.GIT_PhNum>
				<cfset session.GIT_variable_CM_cx_GIT_PhNum_extensions = ''>
			</cfif>	
			<cfset session.GIT_variable_CM_GIT_PhNumPath = ''> <!--- so they won't conflict --->
		</cfif>
		<cfif IsDefined("url.GIT_PhNumPath")>
			<cfset session.GIT_variable_CM_GIT_PhNumPath = url.GIT_PhNumPath> <!--- cf_frn_GIT_PhNumid , extension_frn_GIT_PhNumid --->
			<cfset SESSION.GIT_variable_CM_cx_GIT_PhNum = ''> <!--- so they won't conflict --->
			<cfset session.GIT_variable_CM_cx_GIT_PhNum_extensions = ''>
		</cfif>
	<cfelse>
		<cfset SESSION.GIT_variable_CM_cx_GIT_PhNum = ''>
		<cfset session.GIT_variable_CM_GIT_PhNumPath = ''>
		<cfset session.GIT_variable_CM_cx_GIT_PhNum_extensions = ''>
	</cfif>
	
	<!---Check for humanatic data--->
	<cfif isDefined('chxHum')>
		<cfset session.chxHum=1>
	<cfelse>
		<cfset session.chxHum=0>
	</cfif>
	
	<!--- filter out spam --->
	<cfif isDefined("URL.filterSpam") AND URL.filterSpam NEQ ''>
		<cfset SESSION.cx_filter_spam = 1>
	</cfif>

	<!--- Dnis Pool --->
	<cfif isDefined("URL.GIT_PhNumpool")>
		<cfset SESSION.cx_GIT_PhNumpool = #URL.GIT_PhNumpool# >
	</cfif>
	
	<!--- Website Calls --->
	<cfif isDefined("URL.webref") AND URL.webref NEQ ''>
		<cfset additions = 'webref='&#URL.webref# >
	</cfif>
	<cfif isDefined("URL.kwords") AND URL.kwords NEQ ''>
		<cfset additions = 'kwords='&#URL.kwords# >
	</cfif>
	<!--- Paid Calls --->
	<cfif IsDefined("URL.paid")>
		<cfset additions = 'paid='&#URL.paid#>
	</cfif>
	<!---WSC--->
	<cfif isdefined('WSC_source')>
		<cfset additions = 'WSC_source='&#WSC_source#>
	</cfif>
	
	
	<!--- Special Dnis Vendors --->
	<cfif IsDefined("URL.vendor_lskin") AND URL.vendor_lskin NEQ ''>
		<cfquery datasource="GIT_variable_CM" name="pull_special_GIT_PhNum">
			SELECT sv.frn_GIT_PhNumid
			FROM special_GIT_PhNum_vendors sv
				FROM GIT_table_that_holds_numbers d ON d.GIT_PhNumid = sv.frn_GIT_PhNumid
			WHERE d.add_FROM GIT_account = <cfqueryParam value="#URL.vendor_lskin#" CFSQLType = 'CF_SQL_INTEGER'>
		</cfquery>
		
		<cfset additions = "vendorLskin="&URL.vendor_lskin>
		
		<cfset session.GIT_variable_CM_cx_GIT_PhNum = ValueList(pull_special_GIT_PhNum.frn_GIT_PhNumid)>
		<cfset session.GIT_variable_CM_cx_GIT_PhNum_extensions = ''>
	</cfif>
	
	<cfif isDefined('additions') AND additions NEQ ''>
		<cflocation url="cx_details_list.cfm?#additions#&clickthrough" addToken="no">
	<cfelse>
		<cflocation url="cx_details_list.cfm?clickthrough" addToken="no">
	</cfif>

<cfcatch>
	<cfdump var="#cfcatch#">
</cfcatch>
</cftry>
<!---Added session.chxHum . Case 86679--->
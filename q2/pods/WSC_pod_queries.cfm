<!--- The siteID var is the GIT_PhNumpoolid selected from the dropdown. --->

<cftry>
	<cfif NOT isDefined('this_start')>
		<cfif isDefined('SESSION.GIT_variable_CM_start')>
			<cfset this_start = DateFormat(SESSION.GIT_variable_CM_start,'yyyy-mm-dd')>
			<script>
				$('.date-picker-box').text("<cfoutput>#DateFormat(this_start, "mm dd, yyyy")# - #DateFormat(this_end, "mm dd, yyyy")#</cfoutput>")
				$('.date-picker-box2').text("<cfoutput>#DateFormat(this_start, "mm dd, yyyy")# - #DateFormat(this_end, "mm dd, yyyy")#</cfoutput>")
				$('.datepicker1').text("<cfoutput>#DateFormat(this_start, "mm dd, yyyy")#</cfoutput>")
			</script>
		</cfif>
	</cfif>

	<cfif NOT isDefined('this_end')>
		<cfif isDefined('SESSION.GIT_variable_CM_end')>
			<cfset this_end = DateFormat(SESSION.GIT_variable_CM_end,'yyyy-mm-dd')>
			<script>
				$('.date-picker-box').text("<cfoutput>#DateFormat(this_start, "mm dd, yyyy")# - #DateFormat(this_end, "mm dd, yyyy")#</cfoutput>")
				$('.date-picker-box2').text("<cfoutput>#DateFormat(this_start, "mm dd, yyyy")# - #DateFormat(this_end, "mm dd, yyyy")#</cfoutput>")
				$('.datepicker2').text("<cfoutput>#DateFormat(this_end, "mm dd, yyyy")#</cfoutput>")
			</script>
		</cfif>
	</cfif>
	
	<cfinclude template="../query_table_call.cfm">

	<cfswitch expression="#session.GIT_variable_CMGIT_verticalID#"> 
		<cfcase value="1"> 
			<cfset sales_opp_hco = '60' >
			<cfset booked_appt_hco = '241060,241061'>
		</cfcase> 
		<cfcase value="2"> 
			<cfset sales_opp_hco = '222670' >
			<cfset booked_appt_hco = '95'>
		</cfcase> 
		<cfcase value="3"> 
			<cfset sales_opp_hco = '68291' >
			<cfset booked_appt_hco = '46856,468571'>
		</cfcase> 
		<cfcase value="6"> 
			<cfset sales_opp_hco = '56716' >
			<cfset booked_appt_hco = '56672,56643'>
		</cfcase> 
		<cfcase value="9"> 
			<cfset sales_opp_hco = '91273' >
			<cfset booked_appt_hco = '370853,370854'>
		</cfcase> 
		<cfcase value="12"> 
			<cfset sales_opp_hco = '60' >
			<cfset booked_appt_hco = '241060,241061'>
		</cfcase>
		<cfcase value="15"> 
			<cfset sales_opp_hco = '56716' >
			<cfset booked_appt_hco = '56672,56643'>
		</cfcase> 
	</cfswitch> 

	<cfoutput>

		<cfquery datasource="#GIT_protected_system_variable#" name="pull_websites">
			SELECT GIT_PhNumpoolid, GIT_name_of_phone_pool
			FROM GIT_table_that_holds_groups_of_rotating_numbers 
			WHERE frn_FROM GIT_account = <cfqueryparam value="#session.GIT_variable_CM_lskin#" CFSQLType="CF_SQL_INTEGER">
				AND dpactive = 1;
		</cfquery>
		
		<cfquery name='is_pro' datasource='#application.ds#'>
			Select GIT_PhNumpoolid
			FROM GIT_table_that_holds_groups_of_rotating_numbers
			WHERE frn_FROM GIT_account = <cfqueryparam value="#session.GIT_variable_CM_lskin#" CFSQLType="CF_SQL_INTEGER">
			<cfif isdefined('siteID')>
				and GIT_PhNumpoolid = #siteID#
		   </cfif>
				and WSC_Pro = 1
		</cfquery>
		
		<cfif isdefined('spoof_bottom')>
			<cfset is_pro = QueryNew("GIT_PhNumpolid")>
			<cfset newrow = QueryAddRow(is_pro,3)>
			<cfset temp = QuerySetCell(is_pro, 'GIT_PhNumpolid', '1',1)>		
		</cfif>
		
		<cfif !isdefined('siteID')>
			<cfquery name='pull_siteid' datasource='#application.ds#'>
				select top 1 GIT_PhNumpoolid 
				from GIT_group_of_numbers 
				where frn_FROM GIT_account = <cfqueryparam value="#session.GIT_variable_CM_lskin#" CFSQLType="CF_SQL_INTEGER">
				order by GIT_PhNumpoolid
			</cfquery>
			<cfset siteID = pull_siteid.GIT_PhNumpoolid>
		</cfif>	

		<cfquery name='pull_sources' datasource='#application.ds#'>
			with csv_query as
			(
				SELECT 
					l.FROM GIT_account AS accountID, 
					l.refname AS account, 
					c.GIT_ID_for_call AS Call_ID, 
					c.GIT_the_date as Date,
					CONVERT(VARCHAR, cd.tz_time, 120) as Time,   
					dld.GIT_PhNum_label AS 'Tracking Number', 
					dl4.GIT_PhNum_label AS Refer_Source, 
					ext.GIT_PhNum_label AS Extension, 
					cp.dc_dialstring AS 'Ring to', 
					c.leminutes AS 'Call Duration', 
					xd.disposition AS Disposition,  
					cp.ani AS caller_phone,
					dpd.FROM GIT_group_of_numbers_ID as 'GIT_PhNumpoolid',
					CASE WHEN a.frn_GIT_ID_for_call IS NOT NULL THEN 'google'
						   WHEN var.frn_web_variableid = 2 THEN var.variable_value
							 END AS UTM_source,  
					CASE WHEN a.frn_GIT_ID_for_call IS NOT NULL THEN 'cpc' 
							 WHEN var.frn_web_variableid = 4 THEN var.variable_value
							 END AS UTM_medium,  
					CASE WHEN var.frn_web_variableid = 3 THEN var.variable_value
							END AS UTM_campaign,    
					CASE WHEN var.frn_web_variableid = 6 THEN var.variable_value
							END AS UTM_term,    
					CASE WHEN var.frn_web_variableid = 7 THEN var.variable_value
							END AS UTM_content,
					a.campaign_name AS 'AdWords Campaign',  a.ad_group_name AS 'AdWords Ad Group',
					case when GIT_frn_id_of_humanatic_call_review_question in (#sales_opp_hco#) then 1 else 0 end AS Sales_Opps,
					case when GIT_frn_id_of_humanatic_call_review_question in (#booked_appt_hco#) then 1 else 0 end AS Booked_Appt
				FROM GIT_table_that_holds_accounts l
					FROM GIT_table_holding_phone_numbers d ON d.add_FROM GIT_account = l.FROM GIT_account and add_FROM GIT_account = 20433
					FROM GIT_table_holding_number_labels dld ON dld.frn_GIT_PhNumid = d.GIT_PhNumid AND dld.label_place = 0
					FROM GIT_table_holding_number_labels dl4 ON dl4.frn_GIT_PhNumid = d.GIT_PhNumid AND dl4.label_place = 4  
					INNER JOIN #TheTable# c ON c.cf_frn_GIT_PhNumid = d.GIT_PhNumid
					INNER JOIN #TheTable#_details cd ON cd.frn_GIT_ID_for_call = c.GIT_ID_for_call
					LEFT JOIN #TheTable#_hcat ch on c.GIT_ID_for_call = ch.frn_GIT_ID_for_call
					INNER JOIN #TheTable#_platform cp ON cp.frn_GIT_ID_for_call = c.GIT_ID_for_call
					FROM GIT_table_holding_number_labels ext ON ext.frn_GIT_PhNumid = c.extension_frn_GIT_PhNumid AND ext.label_place = -1 
					FROM GIT_table_that_holds_call_data_disposition xd ON xd.xcall_dispositionid = c.frn_xcall_dispositionid
					FROM GIT_table_holding_calls_from_adwords_long a ON a.frn_GIT_ID_for_call = c.GIT_ID_for_call         
					FROM GIT_table_holding_web_sessions_action_call_long dpac ON dpac.frn_GIT_ID_for_call = c.GIT_ID_for_call
					FROM GIT_table_holding_web_sessions_long dpd ON dpd.dpdid = dpac.frn_dpdid
					FROM GIT_table_holding_web_sessions_variable_long var ON var.frn_dpdid = dpac.frn_dpdid  
				WHERE c.GIT_the_date >= #createodbcdate(this_start)# 
					AND c.GIT_the_date < #createodbcdate(this_end)# 
					and dpd.FROM GIT_group_of_numbers_ID is not null
					and dpd.FROM GIT_group_of_numbers_ID = #siteID#		
			)
				select
					utm_source, GIT_PhNumpoolid,
					COUNT(distinct Call_ID) as Total_Calls,
					sum(sales_opps) as 'sales_opps',
					sum(Booked_Appt) as 'Booked_Appt'
				from csv_query
				where utm_source is not null
				group by utm_source,GIT_PhNumpoolid
		</cfquery>
		<cfdump var='#pull_sources#'>
		<cfabort>
		
		<!---
		<cfquery name="pull_sources" datasource="#GIT_protected_system_variable#">
			SELECT
				isnull(CASE WHEN a.frn_GIT_ID_for_call IS NOT NULL THEN 'google'
						   WHEN var.frn_web_variableid = 2 THEN var.variable_value
							 END, 'No UTM Name Provided') AS 'UTM_Source',
				COUNT(distinct c.GIT_ID_for_call) as Total_Calls,
				COUNT(distinct case when GIT_frn_id_of_humanatic_call_review_question in (#sales_opp_hco#) then c.GIT_ID_for_call else null end) AS Sales_Opps,
				COUNT(distinct case when GIT_frn_id_of_humanatic_call_review_question in (#booked_appt_hco#) then c.GIT_ID_for_call else null end) AS Booked_Appt,
				dpd.FROM GIT_group_of_numbers_ID as 'GIT_PhNumpoolid'
			FROM GIT_table_that_holds_accounts l
				FROM GIT_table_holding_phone_numbers d ON d.add_FROM GIT_account = l.FROM GIT_account and add_FROM GIT_account = #session.GIT_variable_CM_lskin#
				FROM GIT_table_holding_number_labels dld ON dld.frn_GIT_PhNumid = d.GIT_PhNumid AND dld.label_place = 0
				FROM GIT_table_holding_number_labels dl4 ON dl4.frn_GIT_PhNumid = d.GIT_PhNumid AND dl4.label_place = 4  
				FROM GIT_table_that_holds_call_data_long c ON c.cf_frn_GIT_PhNumid = d.GIT_PhNumid  
				FROM GIT_table_that_holds_call_data_long_hcat ch on c.GIT_ID_for_call = ch.frn_GIT_ID_for_call
				FROM GIT_table_holding_calls_from_adwords_long a ON a.frn_GIT_ID_for_call = c.GIT_ID_for_call         
				FROM GIT_table_holding_web_sessions_action_call_long dpac ON dpac.frn_GIT_ID_for_call = c.GIT_ID_for_call
				FROM GIT_table_holding_web_sessions_long dpd ON dpd.dpdid = dpac.frn_dpdid
				FROM GIT_table_holding_web_sessions_variable_long var ON var.frn_dpdid = dpac.frn_dpdid 
			WHERE c.GIT_the_date >= #createodbcdate(this_start)# 
			   AND c.GIT_the_date < #createodbcdate(this_end)# 
				and dpd.FROM GIT_group_of_numbers_ID is not null
				and dpd.FROM GIT_group_of_numbers_ID = #siteID#
			GROUP BY CASE WHEN a.frn_GIT_ID_for_call IS NOT NULL THEN 'google'
					   WHEN var.frn_web_variableid = 2 THEN var.variable_value
						 END, dpd.FROM GIT_group_of_numbers_ID
		</cfquery>
		--->
		
		<cfquery name="pull_campaigns" datasource="#GIT_protected_system_variable#">
			SELECT
				isnull(a.campaign_name,'Unnamed Campaign') AS 'AdWords_Campaign',
				isnull(count(distinct a.Ad_Group_Name),0) as 'Adword_groups',
				COUNT(distinct c.GIT_ID_for_call) as Total_Calls,
				COUNT(distinct case when GIT_frn_id_of_humanatic_call_review_question in (#sales_opp_hco#) then c.GIT_ID_for_call else null end) AS Sales_Opps,
				COUNT(distinct case when GIT_frn_id_of_humanatic_call_review_question in (#booked_appt_hco#) then c.GIT_ID_for_call else null end) AS Booked_Appt,
				dpd.FROM GIT_group_of_numbers_ID as 'GIT_PhNumpoolid'
			FROM GIT_table_that_holds_accounts l
				FROM GIT_table_holding_phone_numbers d ON d.add_FROM GIT_account = l.FROM GIT_account and add_FROM GIT_account = #session.GIT_variable_CM_lskin#
				FROM GIT_table_holding_number_labels dld ON dld.frn_GIT_PhNumid = d.GIT_PhNumid AND dld.label_place = 0
				FROM GIT_table_holding_number_labels dl4 ON dl4.frn_GIT_PhNumid = d.GIT_PhNumid AND dl4.label_place = 4  
				FROM GIT_table_that_holds_call_data_long c ON c.cf_frn_GIT_PhNumid = d.GIT_PhNumid  
				FROM GIT_table_that_holds_call_data_long_hcat ch on c.GIT_ID_for_call = ch.frn_GIT_ID_for_call
				FROM GIT_table_holding_calls_from_adwords_long a ON a.frn_GIT_ID_for_call = c.GIT_ID_for_call         
				FROM GIT_table_holding_web_sessions_action_call_long dpac ON dpac.frn_GIT_ID_for_call = c.GIT_ID_for_call
				FROM GIT_table_holding_web_sessions_long dpd ON dpd.dpdid = dpac.frn_dpdid
				FROM GIT_table_holding_web_sessions_variable_long var ON var.frn_dpdid = dpac.frn_dpdid 
			WHERE c.GIT_the_date >= #createodbcdate(this_start)# 
			   AND c.GIT_the_date < #createodbcdate(this_end)# 
					and dpd.FROM GIT_group_of_numbers_ID is not null
					and dpd.FROM GIT_group_of_numbers_ID = #siteID#
					and a.adwords_GIT_ID_for_call is not null
				GROUP BY a.campaign_name, dpd.FROM GIT_group_of_numbers_ID	
		</cfquery>
	</cfoutput>

	<cfquery dbtype="query" name="pull_sources_total">  
		SELECT sum(Total_Calls) as Total
		FROM pull_sources 
	</cfquery> 
	

	
	<cfif isdefined('spoof_bottom')>
		<cfoutput>
			<cfset pull_campaigns = QueryNew("AdWords_Campaign,
											Adword_groups,
											Total_Calls,
											Sales_Opps,
											Booked_Appt")>
									
			<!--- populating spreadsheet data --->
			<cfset newrow = QueryAddRow(pull_campaigns,3)>
			<cfset temp = QuerySetCell(pull_campaigns, 'AdWords_Campaign', 'Test_Campaign_1',1)>
			<cfset temp = QuerySetCell(pull_campaigns, "Adword_groups",2,1)>
			<cfset temp = QuerySetCell(pull_campaigns, "Total_Calls",200,1)>
			<cfset temp = QuerySetCell(pull_campaigns, "Sales_Opps",165,1)>
			<cfset temp = QuerySetCell(pull_campaigns, "Booked_Appt",35,1)>
			
			<cfset temp = QuerySetCell(pull_campaigns, 'AdWords_Campaign', 'Test_Campaign_2',2)>
			<cfset temp = QuerySetCell(pull_campaigns, "Adword_groups",1,2)>
			<cfset temp = QuerySetCell(pull_campaigns, "Total_Calls",300,2)>
			<cfset temp = QuerySetCell(pull_campaigns, "Sales_Opps",180,2)>
			<cfset temp = QuerySetCell(pull_campaigns, "Booked_Appt",120,2)>
			
			<cfset temp = QuerySetCell(pull_campaigns, "AdWords_Campaign", "Test_Campaign_3",3)>
			<cfset temp = QuerySetCell(pull_campaigns, "Adword_groups",1,3)>
			<cfset temp = QuerySetCell(pull_campaigns, "Total_Calls",100,3)>
			<cfset temp = QuerySetCell(pull_campaigns, "Sales_Opps",60,3)>
			<cfset temp = QuerySetCell(pull_campaigns, "Booked_Appt",40,3)>
			
		</cfoutput>
	</cfif>

	<cfcatch>
		<cfdump var='#cfcatch#'>
	</cfcatch>

</cftry>

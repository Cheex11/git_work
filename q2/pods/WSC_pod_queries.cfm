<!--- The siteID var is the GIT_PhNumpoolid selected from the dropdown. --->

<cftry>
	<cfif NOT isDefined('this_start')>
		<cfif isDefined('SESSION.GIT_variable_CM_start')>
			<cfset this_start = DateFormat(SESSION.GIT_variable_CM_start,'yyyy-mm-dd')>
			<!---
			<script>
				$('.date-picker-box').text("<cfoutput>#DateFormat(this_start, "mm dd, yyyy")# - #DateFormat(this_end, "mm dd, yyyy")#</cfoutput>")
				$('.date-picker-box2').text("<cfoutput>#DateFormat(this_start, "mm dd, yyyy")# - #DateFormat(this_end, "mm dd, yyyy")#</cfoutput>")
				$('.datepicker1').text("<cfoutput>#DateFormat(this_start, "mm dd, yyyy")#</cfoutput>")
			</script>
			--->
		</cfif>
	</cfif>

	<cfif NOT isDefined('this_end')>
		<cfif isDefined('SESSION.GIT_variable_CM_end')>
			<cfset this_end = DateFormat(SESSION.GIT_variable_CM_end,'yyyy-mm-dd')>
			<!---
			<script>
				$('.date-picker-box').text("<cfoutput>#DateFormat(this_start, "mm dd, yyyy")# - #DateFormat(this_end, "mm dd, yyyy")#</cfoutput>")
				$('.date-picker-box2').text("<cfoutput>#DateFormat(this_start, "mm dd, yyyy")# - #DateFormat(this_end, "mm dd, yyyy")#</cfoutput>")
				$('.datepicker2').text("<cfoutput>#DateFormat(this_end, "mm dd, yyyy")#</cfoutput>")
			</script>
			--->
		</cfif>
	</cfif>
	
	<cfinclude template="../query_table_call.cfm">

	<cfif isdefined('session.GIT_variable_CMGIT_verticalID')>
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
			<cfdefaultcase>
				<cfset sales_opp_hco = '0' >
				<cfset booked_appt_hco = '0'>
			</cfdefaultcase>
		</cfswitch> 
	</cfif>

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
			with the_data as (
				select
					d.poolmaster as 'GIT_PhNumpoolid', 
					isnull(d.label4,'Other Various Sources') as 'utm_source', 
					count(distinct c.GIT_ID_for_call) as 'Total_Calls',
					sum(case when GIT_frn_id_of_humanatic_call_review_question in (#sales_opp_hco#) then 1 else 0 end) AS 'Sales_Opps',
					sum(case when GIT_frn_id_of_humanatic_call_review_question in (#booked_appt_hco#) then 1 else 0 end) AS 'Booked_Appt'
				FROM #theTable# c
					FROM GIT_table_that_holds_numbers d ON c.cf_frn_GIT_PhNumid = d.GIT_PhNumid and add_FROM GIT_account = 20433
					FROM GIT_table_that_holds_accounts l on d.add_FROM GIT_account = l.FROM GIT_account
					LEFT JOIN #theTable#_hcat ch on ch.frn_GIT_ID_for_call = c.GIT_ID_for_call
					FROM GIT_table_that_holds_groups_of_rotating_numbers xdp on d.poolmaster = xdp.GIT_PhNumpoolid
				WHERE 
					c.GIT_the_date >= #createodbcdate(this_start)# 
					AND c.GIT_the_date < #createodbcdate(this_end)# 
					AND poolmaster = #siteID#
					AND c.spamrating = 0
				GROUP BY d.poolmaster, d.label4 )
			SELECT
				case when utm_source = '' then 'Other Various Sources' else utm_source end as 'utm_source',
				sum(Total_calls) as 'total_calls',
				sum(Sales_Opps) as 'Sales_Opps',
				sum(Booked_Appt) as 'Booked_Appt'
			FROM the_data	
			GROUP BY case when utm_source = '' then 'Other Various Sources' else utm_source end
			order by sum(Total_calls) desc
		</cfquery>
		
		<cfif is_pro.recordcount> 
			<cfquery name="pull_campaigns" datasource="#GIT_protected_system_variable#">
				select
					isnull(a.campaign_name,'Unnamed Campaign') AS 'AdWords_Campaign',
					isnull(count(distinct a.Ad_Group_Name),0) as 'Adword_groups',
					d.poolmaster as 'GIT_PhNumpoolid', 
					count(distinct c.GIT_ID_for_call) as 'Total_Calls',
					sum(case when GIT_frn_id_of_humanatic_call_review_question in (#sales_opp_hco#) then 1 else 0 end) AS 'Sales_Opps',
					sum(case when GIT_frn_id_of_humanatic_call_review_question in (#booked_appt_hco#) then 1 else 0 end) AS 'Booked_Appt'
				FROM #theTable# c
					FROM GIT_table_that_holds_numbers d ON c.cf_frn_GIT_PhNumid = d.GIT_PhNumid and add_FROM GIT_account = 20433
					FROM GIT_table_that_holds_accounts l on d.add_FROM GIT_account = l.FROM GIT_account
					FROM GIT_table_holding_calls_from_adwords_#dpdtable.category# a ON a.frn_GIT_ID_for_call = c.GIT_ID_for_call         
					LEFT JOIN #theTable#_hcat ch on ch.frn_GIT_ID_for_call = c.GIT_ID_for_call
					FROM GIT_table_that_holds_groups_of_rotating_numbers xdp on d.poolmaster = xdp.GIT_PhNumpoolid
				WHERE 
					c.GIT_the_date >= #createodbcdate(this_start)# 
					AND c.GIT_the_date < #createodbcdate(this_end)# 
					AND poolmaster = #siteID#
					AND c.spamrating = 0
				GROUP BY isnull(a.campaign_name,'Unnamed Campaign'),d.poolmaster
				ORDER BY count(distinct c.GIT_ID_for_call) desc
			</cfquery>
			
			<cfquery name="pull_adgroups" datasource="#GIT_protected_system_variable#">
				SELECT
					ISNULL(a.Ad_Group_Name,'Unnamed Group') as 'Adword_groups',
					COUNT(distinct c.GIT_ID_for_call) as Total_Calls,
					sum(case when GIT_frn_id_of_humanatic_call_review_question in (#sales_opp_hco#) then 1 else 0 end) AS 'Sales_Opps',
					sum(case when GIT_frn_id_of_humanatic_call_review_question in (#booked_appt_hco#) then 1 else 0 end) AS 'Booked_Appt'
				FROM #theTable# c
					FROM GIT_table_that_holds_numbers d ON c.cf_frn_GIT_PhNumid = d.GIT_PhNumid and add_FROM GIT_account = 20433
					FROM GIT_table_that_holds_accounts l on d.add_FROM GIT_account = l.FROM GIT_account
					FROM GIT_table_holding_calls_from_adwords_#dpdtable.category# a ON a.frn_GIT_ID_for_call = c.GIT_ID_for_call         
					LEFT JOIN #theTable#_hcat ch on ch.frn_GIT_ID_for_call = c.GIT_ID_for_call
					FROM GIT_table_that_holds_groups_of_rotating_numbers xdp on d.poolmaster = xdp.GIT_PhNumpoolid
				WHERE 
					c.GIT_the_date >= #createodbcdate(this_start)# 
					AND c.GIT_the_date < #createodbcdate(this_end)# 
					AND poolmaster = #siteID#
					AND c.spamrating = 0
				GROUP BY a.Ad_Group_Name
				ORDER BY count(distinct c.GIT_ID_for_call) desc
			</cfquery>
		</cfif>
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

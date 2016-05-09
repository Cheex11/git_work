
<!--- Change Log
11/4/15 Removed 6 100 references Proj4425 http://core.callbox.com/go/hproject_manage.cfm?pid=4425 NE

---->
<cftry>

<cfif Not IsDefined('SESSION.GIT_variable_CMGIT_verticalID')>
	<cflocation url="//#CGI.SERVER_NAME#" addtoken="false">
	<cfabort />
</cfif>

	

<cfif SESSION.GIT_variable_CMGIT_verticalID NEQ 1
		AND SESSION.GIT_variable_CMGIT_verticalID NEQ 2
		AND SESSION.GIT_variable_CMGIT_verticalID NEQ 3
		AND SESSION.GIT_variable_CMGIT_verticalID NEQ 6
		AND SESSION.GIT_variable_CMGIT_verticalID NEQ 9
		AND SESSION.GIT_variable_CMGIT_verticalID NEQ 10
		AND SESSION.GIT_variable_CMGIT_verticalID NEQ 11
		AND SESSION.GIT_variable_CMGIT_verticalID NEQ 12
		AND SESSION.GIT_variable_CMGIT_verticalID NEQ 13
		AND SESSION.GIT_variable_CMGIT_verticalID NEQ 14
		AND SESSION.GIT_variable_CMGIT_verticalID NEQ 15
		AND SESSION.GIT_variable_CMGIT_verticalID NEQ 16
		AND SESSION.GIT_variable_CMGIT_verticalID NEQ 17
		AND SESSION.GIT_variable_CMGIT_verticalID NEQ 20
		AND SESSION.GIT_variable_CMGIT_verticalID NEQ 21
		>

	<cfif IsDefined('CGI.query_string') AND CGI.query_string NEQ ''>
		<cflocation url="../cx_OLD/cx_details_list.cfm?#CGI.query_string#" addtoken="no">
	<cfelse>
		<cflocation url="../cx_OLD/cx_details_list.cfm" addtoken="no">
	</cfif>
</cfif>


<cfinclude template="../platform_a/header.cfm" />
<style>
.container {
	max-width: 940px;
}
.page-arrow-btn {
	display: inline-block;
	vertical-align: middle;
	position: relative;
	margin: -2px 5px 0px 5px;
	padding: 6px 7px;
	background-color: #ededed;
	border: solid 1px #c9c9c9;
	-moz-border-radius: 4px;
	-webkit-border-radius: 4px;
	border-radius: 4px;
}
.page-arrow-btn:hover {
	background-color: #e2e2e2;
}
.page-arrow-btn img { display: block; }
</style>
<cfset SESSION.GIT_variable_CM_leadbox_display = 'off'>

<cfif !IsDefined('pid')>
	<cfset pid = 0/>
</cfif>
<cfif IsDefined('url.dump')>
	<cfdump var='#session#'>
</cfif>
<cfif IsDefined('session.GIT_variable_CM_uid')>
	<cfset this_uid = session.GIT_variable_CM_uid>
</cfif>
<cfif IsDefined('jdl_limited') and jdl_limited eq 1>
	<!--- sets default full GIT_PhNum list --->

	<!--- initializes this_GIT_PhNum_list --->
	<cfquery datasource="#GIT_protected_system_variable#" name="pull_GIT_PhNum_list">
		select distinct jdl.frn_GIT_PhNumid
			from joinGIT_PhNumGIT_user jdl
				join GIT_user l on l.GIT_userID = jdl.GIT_foreign_userID
				join GIT_PhNum d on d.add_FROM GIT_account = l.frn_FROM GIT_account
			where
				d.lestatus = 1
				and d.isoutbound in (0,1)
				and jdl.GIT_foreign_userID = <cfqueryParam value="#this_uid#" CFSQLType = 'CF_SQL_INTEGER'>
	</cfquery>
		<cfif session.GIT_variable_CM_cx_GIT_PhNum eq ''>
			<cfset session.GIT_variable_CM_cx_GIT_PhNum = '#ValueList(pull_GIT_PhNum_list.frn_GIT_PhNumid)#' />
		</cfif>
	<cfset session.GIT_variable_CM_jdl_limited_GIT_PhNum_list = ValueList(pull_GIT_PhNum_list.frn_GIT_PhNumid, ',')>
	<cfset jdl_limited_GIT_PhNum_list = session.GIT_variable_CM_jdl_limited_GIT_PhNum_list>
	<cfset this_GIT_PhNum_list = jdl_limited_GIT_PhNum_list>
<cfelse>
	<cfset this_GIT_PhNum_list = 'all'>
</cfif>

<cfif !IsDefined('session.GIT_variable_CMGIT_verticalID')>
	<cfset session.GIT_variable_CMGIT_verticalID  = ''>
</cfif>

<cfif !IsDefined('Session.cx_date_start') OR SESSION.cx_date_start EQ ''>
	<cfset Session.cx_date_start = "#dateFormat(dateAdd('d',-3,now()))#">
</cfif>

<cfif !IsDefined('Session.cx_date_end') OR SESSION.cx_date_end EQ ''>
	<cfset Session.cx_date_end = "#dateFormat(dateAdd('d',1,now()))#">
</cfif>

<cfif !IsDefined('Session.cx_ani')>
	<cfset Session.cx_ani = ''>
</cfif>

<cfif !IsDefined('session.GIT_variable_CM_cx_GIT_PhNum')>
	<cfset session.GIT_variable_CM_cx_GIT_PhNum = ''>
</cfif>

<cfif !IsDefined('session.GIT_variable_CM_cx_GIT_PhNum_extensions')>
	<cfset session.GIT_variable_CM_cx_GIT_PhNum_extensions = ''>
</cfif>

<!--- check for user defaults--->
<cfif !IsDefined("Session.cx_phonecode") and !IsDefined("Session.cx_hco") and isdefined("session.GIT_variable_CM_uid")>
	<cfquery datasource="#GIT_protected_system_variable#" name="pull_defaults">
		SELECT	cx_default_phonecode, cx_default_hco
		FROM	GIT_userdefault
		WHERE	GIT_foreign_userID = <cfqueryParam value="#session.GIT_variable_CM_uid#" CFSQLType = 'CF_SQL_INTEGER'>
	</cfquery>
	<cfif pull_defaults.recordCount neq 0>
		<cfset Session.cx_phonecode = pull_defaults.cx_default_phonecode>
		<cfset Session.cx_hco = pull_defaults.cx_default_hco>
	</cfif>
</cfif>
<!---end user defaults--->
<cfif !IsDefined('Session.cx_phonecode')>
	<cfset Session.cx_phonecode = ''>
</cfif>

<cfif !IsDefined('Session.cx_hco')>
	<cfset Session.cx_hco = ''>
</cfif>

<cfif IsDefined('URL.vendorLskin')>
	<cfset this_lskin_all = URL.vendorLskin>
<cfelseif IsDefined('session.GIT_variable_CM_lskin')>
	<cfset this_lskin_all = session.GIT_variable_CM_lskin />
<cfelseif isDefined("SESSION.axreport_lskin")>
	<cfset this_lskin_all = SESSION.axreport_lskin />
</cfif>

<cfset THIS_START = SESSION.cx_date_start>
<cfset THIS_END = SESSION.cx_date_end>
<cfinclude template="../platform_a/query_table_call.cfm">

<cfif (!IsDefined('Session.cx_hco') or session.cx_hco eq "") and IsDefined('session.GIT_variable_CMGIT_verticalID')  >
	<cfquery datasource="#GIT_protected_system_variable#" name="pull_default_hco">
		select GIT_frn_id_of_humanatic_call_review_question from cxGIT_verticalID_hco
		where
			default_select = 1
			<cfif session.GIT_variable_CMGIT_verticalID neq ''>
				and GIT_verticalID in (<cfqueryParam value="#session.GIT_variable_CMGIT_verticalID#" list="yes" CFSQLType = 'CF_SQL_INTEGER'>)
			</cfif>
	</cfquery>
	<cfset Session.cx_hco = ''>
	<cfloop query="pull_default_hco">
		<cfoutput>
		<cfset Session.cx_hco &= '#pull_default_hco.GIT_frn_id_of_humanatic_call_review_question#'>
		<cfif currentRow lt pull_default_hco.recordCount>
			<cfset Session.cx_hco &= ','>
		</cfif>
		</cfoutput>
	</cfloop>
</cfif>

<cfif IsDefined("debugtimeoutput")><cfoutput>start pulling GIT_ID_for_calls..#now()# <br/></cfoutput></cfif>
<!---Added for case 57925 by Matt Porter--->
<cfif IsDefined('URL.clickthrough')>
	<cfquery datasource="humanatic" name="pull_GIT_PhNum_hcat">
		select DISTINCT frn_GIT_PhNumid, frn_extension_GIT_PhNumid
		from hcat_GIT_PhNum d
			inner join hproduct_hcat h on h.frn_hcatid = d.frn_hcatid
		where d.frn_FROM GIT_account in (<cfqueryParam value="#this_lskin_all#" list="yes" CFSQLType = 'CF_SQL_INTEGER'>)
			and h.GIT_verticalID in (1,10,11,12,18)
			and d.frn_hcatid <> 3
			and d.frn_hcatid <> 4
	</cfquery>

	<cfset hcat_lines = ArrayToList(ListToArray(ValueList(pull_GIT_PhNum_hcat.frn_GIT_PhNumid)))>
	<cfset hcat_extensions = ArrayToList(ListToArray(ValueList(pull_GIT_PhNum_hcat.frn_extension_GIT_PhNumid)))>
</cfif>

<cfif isdefined('WSC_source') or isdefined('WSC_campaign')>
	<cfset archive = "" />
	<cfif dpdtable.category EQ 'ShortLong'>
		<cfset archive = 'vw'>
	</cfif>
	<cfif DateDiff("d", SESSION.cx_date_start, now() ) gt 45>
		<cfset archive = "archive.dbo." />
	</cfif>
</cfif>

<cfif isdefined('WSC_source')>
	<cfquery name='pull_wsc_calls_with_source' datasource='#application.ds#'>
		select
			GIT_ID_for_call
		FROM #theTable# c
			FROM GIT_table_that_holds_numbers d ON c.cf_frn_GIT_PhNumid = d.GIT_PhNumid and add_FROM GIT_account = #session.GIT_variable_CM_lskin#
			FROM GIT_table_that_holds_accounts l on d.add_FROM GIT_account = l.FROM GIT_account
			LEFT JOIN #theTable#_hcat ch on ch.frn_GIT_ID_for_call = c.GIT_ID_for_call
			FROM GIT_table_that_holds_groups_of_rotating_numbers xdp on d.poolmaster = xdp.GIT_PhNumpoolid
		WHERE 
				c.GIT_the_date >= #createodbcdate(SESSION.cx_date_start)# 
		   AND 	c.GIT_the_date < #createodbcdate(SESSION.cx_date_end)# 
		   AND 	poolmaster = #WSC_source#
		   AND  c.spamrating = 0
		<cfif isdefined('wsc_hco')>
			and GIT_frn_id_of_humanatic_call_review_question in (#wsc_hco#)
		</cfif>		
		<cfif isdefined("UTM_source") and UTM_source NEQ "Other Various Sources">
			and d.label4 = '#UTM_source#'
		<cfelse>
			and (d.label4 = '' or d.label4 is null)
		</cfif>
	</cfquery>
</cfif>

<cfif isdefined('WSC_campaign')>
	<cfquery name="pull_wsc_calls_with_campaign" datasource="#GIT_protected_system_variable#">
		SELECT
			GIT_ID_for_call
		FROM #theTable# c
			FROM GIT_table_that_holds_numbers d ON c.cf_frn_GIT_PhNumid = d.GIT_PhNumid and add_FROM GIT_account = <cfqueryparam value="#session.GIT_variable_CM_lskin#" CFSQLType="CF_SQL_INTEGER">
			FROM GIT_table_that_holds_accounts l on d.add_FROM GIT_account = l.FROM GIT_account
			INNER JOIN #archive#FROM GIT_table_that_holds_call_data_#dpdtable.category#_adwords a ON a.frn_GIT_ID_for_call = c.GIT_ID_for_call         
			LEFT JOIN #theTable#_hcat ch on ch.frn_GIT_ID_for_call = c.GIT_ID_for_call
			FROM GIT_table_that_holds_groups_of_rotating_numbers xdp on d.poolmaster = xdp.GIT_PhNumpoolid
		WHERE c.GIT_the_date >= #createodbcdate(SESSION.cx_date_start)# 
			AND c.GIT_the_date < #createodbcdate(SESSION.cx_date_end)# 
			AND poolmaster = #WSC_dpid#
			AND c.spamrating = 0
			AND a.campaign_name = '#WSC_campaign#'
			<cfif isdefined('wsc_hco')>
				and GIT_frn_id_of_humanatic_call_review_question in (#wsc_hco#)
			</cfif>		
			<cfif isdefined('WSC_Campaign_and_Adword')>
				and a.Ad_Group_Name = '#WSC_Campaign_and_Adword#'
			</cfif>
	</cfquery>
</cfif>

<cfif isdefined('WSC_adgroup')>
	<cfquery name="pull_wsc_calls_with_adgroup" datasource="#GIT_protected_system_variable#">
		SELECT
			GIT_ID_for_call
		FROM #theTable# c
			FROM GIT_table_that_holds_numbers d ON c.cf_frn_GIT_PhNumid = d.GIT_PhNumid and add_FROM GIT_account = <cfqueryparam value="#session.GIT_variable_CM_lskin#" CFSQLType="CF_SQL_INTEGER">
			FROM GIT_table_that_holds_accounts l on d.add_FROM GIT_account = l.FROM GIT_account
			INNER JOIN #archive#FROM GIT_table_that_holds_call_data_#dpdtable.category#_adwords a ON a.frn_GIT_ID_for_call = c.GIT_ID_for_call         
			LEFT JOIN #theTable#_hcat ch on ch.frn_GIT_ID_for_call = c.GIT_ID_for_call
			FROM GIT_table_that_holds_groups_of_rotating_numbers xdp on d.poolmaster = xdp.GIT_PhNumpoolid
		WHERE c.GIT_the_date >= #createodbcdate(SESSION.cx_date_start)# 
			AND c.GIT_the_date < #createodbcdate(SESSION.cx_date_end)# 
			AND poolmaster = #WSC_dpid#
			AND c.spamrating = 0
			<cfif isdefined('wsc_hco')>
				and GIT_frn_id_of_humanatic_call_review_question in (#wsc_hco#)
			</cfif>		
			and Ad_Group_Name = '#WSC_adgroup#'
	</cfquery>
</cfif>

<cfif NOT IsDefined("sr")>
<cfif session.GIT_variable_CMGIT_verticalID EQ 1 OR session.GIT_variable_CMGIT_verticalID EQ 10 OR session.GIT_variable_CMGIT_verticalID EQ 11 OR session.GIT_variable_CMGIT_verticalID EQ 12>
	<cfset products='1,10,11,12'>
</cfif>

<cfif (session.GIT_variable_CMGIT_verticalID EQ 9 OR session.GIT_variable_CMGIT_verticalID EQ 19)
AND listContains(session.cx_hco,'91273')>
	<cfquery datasource="GIT_variable_CM" name="pull_refined">
		select GIT_ID_for_call from
		GIT_PhNum d WITH (NOLOCK)
		INNER JOIN #theTable# xc WITH (NOLOCK) on d.GIT_PhNumid = xc.cf_frn_GIT_PhNumid
		INNER JOIN #theTable#_hcat xch WITH (NOLOCK) on xch.frn_GIT_ID_for_call = xc.GIT_ID_for_call
		WHERE d.add_FROM GIT_account = <cfqueryparam value="#session.GIT_variable_CM_lskin#" cfsqltype="cf_sql_integer">
		AND xc.GIT_the_date >= <cfqueryparam value="#this_start#" cfsqltype="cf_sql_date">
		AND xc.GIT_the_date < <cfqueryparam value="#this_end#" cfsqltype="cf_sql_date">
		AND GIT_frn_id_of_humanatic_call_review_question in (133436,133439)
	</cfquery>
</cfif>

<cfquery datasource="#GIT_protected_system_variable#" name="pull_GIT_ID_for_calls">
	<cfif isDefined('session.ex_hco') AND len(session.ex_hco) GT 0>
		WITH CTE AS (
		select CASE WHEN ISNUMERIC(theani) = 1 THEN CAST(theani AS bigINT) ELSE 0 END AS theani,max(GIT_the_datetime) as calledBack
		from #thetable# xc
		FROM GIT_table_holding_phone_numbers d on xc.cf_frn_GIT_PhNumid=d.GIT_PhNumid
		FROM GIT_table_holds_caller_ph_numbers a on a.calllog_aniid=xc.frn_calllog_aniid
		where add_FROM GIT_account=<cfqueryParam value="#session.GIT_variable_CM_lskin#" CFSQLType = 'CF_SQL_INTEGER'>
		AND GIT_the_date >=<cfqueryParam value="#SESSION.cx_date_start#" CFSQLType = 'CF_SQL_DATE'>
		AND GIT_the_date <=getdate()
		AND frn_GIT_PhNumfunctionid=2
		<cfif IsDefined('this_GIT_PhNum_list')>
			<cfif this_GIT_PhNum_list eq 'all'>
						<!--- all lines selected, no restriction in where --->
			<cfelseif this_GIT_PhNum_list eq 'none' or this_GIT_PhNum_list eq ''>
				and 0=1	<!---no lines selected, forces 0 results--->
			<cfelse>
				and d.GIT_PhNumid in (<cfqueryParam value="#this_GIT_PhNum_list#" list="yes" CFSQLType = 'CF_SQL_INTEGER'>)--here
			</cfif>
		</cfif>
		<cfif session.cx_phonecode neq '' and Session.cx_phonecode neq 'GIT_Legacy_Filter_Code' and Session.cx_phonecode neq "NULL" and Session.cx_phonecode neq "1">
			and xc.frn_phonecodeid in ( <cfqueryParam value="#session.cx_phonecode#" list="yes" CFSQLType = 'CF_SQL_INTEGER'> )
		<cfelseif Session.cx_phonecode eq "NULL" or Session.cx_phonecode eq "1">
			and (xc.frn_phonecodeid is NULL or xc.frn_phonecodeid = 0)
		</cfif>
		GROUP BY theani),
		CTE2 AS (
		select CASE WHEN ISNUMERIC(theani) = 1 THEN CAST(theani AS bigINT) ELSE 0 END as theani,min(GIT_the_datetime) as called
		from #thetable# xc
		FROM GIT_table_holding_phone_numbers d on xc.cf_frn_GIT_PhNumid=d.GIT_PhNumid
		INNER JOIN #thetable#_hcat xh on xh.frn_GIT_ID_for_call=xc.GIT_ID_for_call AND GIT_frn_id_of_humanatic_call_review_question in (<cfqueryParam value="#session.ex_hco#" list="yes" CFSQLType = 'CF_SQL_INTEGER'>)
		FROM GIT_table_holds_caller_ph_numbers a on a.calllog_aniid=xc.frn_calllog_aniid
		where add_FROM GIT_account=<cfqueryParam value="#session.GIT_variable_CM_lskin#" CFSQLType = 'CF_SQL_INTEGER'>
		AND GIT_the_date >=<cfqueryParam value="#SESSION.cx_date_start#" CFSQLType = 'CF_SQL_DATE'>
		AND GIT_the_date <=<cfqueryParam value="#SESSION.cx_date_end#" CFSQLType = 'CF_SQL_DATE'>
		AND frn_GIT_PhNumfunctionid<>2
		<cfif IsDefined('this_GIT_PhNum_list')>
			<cfif this_GIT_PhNum_list eq 'all'>
						<!--- all lines selected, no restriction in where --->
			<cfelseif this_GIT_PhNum_list eq 'none' or this_GIT_PhNum_list eq ''>
				and 0=1	<!---no lines selected, forces 0 results--->
			<cfelse>
				and d.GIT_PhNumid in (<cfqueryParam value="#this_GIT_PhNum_list#" list="yes" CFSQLType = 'CF_SQL_INTEGER'>)--here
			</cfif>
		</cfif>
		<cfif session.cx_phonecode neq '' and Session.cx_phonecode neq 'GIT_Legacy_Filter_Code' and Session.cx_phonecode neq "NULL" and Session.cx_phonecode neq "1">
			and xc.frn_phonecodeid in ( <cfqueryParam value="#session.cx_phonecode#" list="yes" CFSQLType = 'CF_SQL_INTEGER'> )
		<cfelseif Session.cx_phonecode eq "NULL" or Session.cx_phonecode eq "1">
			and (xc.frn_phonecodeid is NULL or xc.frn_phonecodeid = 0)
		</cfif>
		GROUP BY theani
		),
		CTE3 As(
		select cte.theani
		FROM CTE
		INNER JOIN CTE2 on cte.theani=cte2.theani
		WHERE called<calledBack)
	</cfif>

	select
		distinct x.GIT_ID_for_call, x.GIT_the_datetime,
		case 	when d.frn_GIT_PhNumfunctionid = 1 then 'inbound'
				when d.frn_GIT_PhNumfunctionid = 2 then 'outbound'
		end as type_reference

	from #thetable# x
	
		<cfif isDefined('session.ex_hco') AND len(session.ex_hco) GT 0>
			LEFT join calllog_ani ani ON x.frn_calllog_aniid = ani.calllog_aniid
		</cfif>
		--inner join calllog_ani ani ON x.frn_calllog_aniid = ani.calllog_aniid
		inner join xGIT_PhNum d on d.GIT_PhNumid = x.cf_frn_GIT_PhNumid and d.frn_GIT_PhNumfunctionid not in (22)
		<cfif isDefined('session.GIT_PhNumtag') AND isDefined('clickthrough')>
			inner join joinGIT_PhNumtag jd on jd.frn_GIT_PhNumid=d.GIT_PhNumid AND jd.frn_GIT_PhNumtagid=#session.GIT_PhNumtag#
		</cfif>
		<cfif isDefined('session.cx_comboList') AND session.cx_comboList NEQ ''>
			<cfloop from="1" to="#ListLen(session.cx_comboList)#" index="i">
				INNER JOIN #thetable#_hcat xch#i# on xch#i#.frn_GIT_ID_for_call = x.GIT_ID_for_call
					AND xch#i#.GIT_frn_id_of_humanatic_call_review_question IN (#Replace(ListGetAt(session.cx_comboList,i),':',',','all')#)
			</cfloop>
		<cfelseif isDefined("session.cx_hco") and Trim(session.cx_hco) neq '' AND session.cx_hco neq '99999999' and session.cx_hco NEQ 'clickthrough'>
			inner join #thetable#_hcat xh on xh.frn_GIT_ID_for_call = x.GIT_ID_for_call  and xh.GIT_frn_id_of_humanatic_call_review_question in ( <cfqueryParam value="#session.cx_hco#" list="yes" CFSQLType = 'CF_SQL_INTEGER'> )
			<cfif isDefined("session.GIT_variable_CMGIT_verticalID") AND Trim(session.GIT_variable_CMGIT_verticalID) NEQ '' AND not IsDefined('products')>
				and coalesce(xh.GIT_verticalID , #session.GIT_variable_CMGIT_verticalID#) in (<cfqueryParam value="#session.GIT_variable_CMGIT_verticalID#" list="yes" CFSQLType = 'CF_SQL_INTEGER'> )

			<cfelseif isDefined('products')>
				and coalesce(xh.GIT_verticalID , #session.GIT_variable_CMGIT_verticalID#) in (<cfqueryParam value="#products#" list="yes" CFSQLType = 'CF_SQL_INTEGER'> )
			</cfif>
		</cfif>

		<cfif isDefined('session.cx_comboList_dyn') AND session.cx_comboList_dyn NEQ ''>
			<cfloop list="#session.cx_comboList_dyn#" index="i">
				INNER JOIN #thetable#_hcat xch#i# on xch#i#.frn_GIT_ID_for_call = x.GIT_ID_for_call
					AND xch#i#.GIT_frn_id_of_humanatic_call_review_question = #i#
			</cfloop>
		</cfif>
		<cfif isDefined("session.cx_hco_dyn") and Trim(session.cx_hco_dyn) neq '' AND session.cx_hco_dyn neq '99999999' and session.cx_hco_dyn NEQ 'clickthrough'>
			inner join #thetable#_hcat xh on xh.frn_GIT_ID_for_call = x.GIT_ID_for_call  and xh.GIT_frn_id_of_humanatic_call_review_question in ( <cfqueryParam value="#session.cx_hco_dyn#" list="yes" CFSQLType = 'CF_SQL_INTEGER'> )
			<cfif session.GIT_variable_CMGIT_verticalID NEQ ''>
				and coalesce(xh.GIT_verticalID , #session.GIT_variable_CMGIT_verticalID#) in ( <cfqueryParam value="#session.GIT_variable_CMGIT_verticalID#" list="yes" CFSQLType = 'CF_SQL_INTEGER'> )
			</cfif>
		</cfif>
		<cfif isDefined("session.cx_not_hco_dyn") and Trim(session.cx_not_hco_dyn) neq '' AND session.cx_not_hco_dyn neq '99999999' and session.cx_not_hco_dyn NEQ 'clickthrough'>
			inner join #thetable#_hcat xhn on xhn.frn_GIT_ID_for_call = x.GIT_ID_for_call  and xhn.GIT_frn_id_of_humanatic_call_review_question not in ( #session.cx_not_hco_dyn# )
			<cfif session.GIT_variable_CMGIT_verticalID NEQ ''>
				and coalesce(xh.GIT_verticalID , #session.GIT_variable_CMGIT_verticalID#) in ( <cfqueryParam value="#session.GIT_variable_CMGIT_verticalID#" list="yes" CFSQLType = 'CF_SQL_INTEGER'> )
			</cfif>
		</cfif>
		<cfif isDefined("URL.webref") AND URL.webref NEQ ''>
			inner join #dpdtable.name#_action_call_#dpdtable.category# ac on ac.frn_GIT_ID_for_call = x.GIT_ID_for_call
			inner join #dpdtable.name#_#dpdtable.category# dpd on dpd.dpdid = ac.frn_dpdid
				AND dpd.tz_dpddate >= <cfqueryParam value="#CreateODBCDate(session.cx_date_start)#" CFSQLType = 'CF_SQL_DATE'>
				AND dpd.tz_dpddate < <cfqueryParam value="#CreateODBCDate(session.cx_date_end)#" CFSQLType = 'CF_SQL_DATE'>
			inner join xweb_refer w on w.web_referid = dpd.frn_web_referid
				and w.refer_site = <cfqueryParam value="#URL.webref#" CFSQLType = 'CF_SQL_VARCHAR'>
		</cfif>
		<cfif isDefined("URL.kwords") AND URL.kwords NEQ ''>
			inner join #dpdtable.name#_action_call_#dpdtable.category# ac on ac.frn_GIT_ID_for_call = x.GIT_ID_for_call
			inner join #dpdtable.name#_#dpdtable.category# dpd on dpd.dpdid = ac.frn_dpdid
				AND dpd.tz_dpddate >= <cfqueryParam value="#CreateODBCDate(session.cx_date_start)#" CFSQLType = 'CF_SQL_DATE'>
				AND dpd.tz_dpddate < <cfqueryParam value="#CreateODBCDate(session.cx_date_end)#" CFSQLType = 'CF_SQL_DATE'>
			left join #dpdtable.name#_keywords_#dpdtable.category# k on k.frn_dpdid = dpd.dpdid
		</cfif>
		<cfif IsDefined("URL.paid") AND URL.paid NEQ ''>
			inner join #dpdtable.name#_action_call_#dpdtable.category# ac on ac.frn_GIT_ID_for_call = x.GIT_ID_for_call
			inner join #dpdtable.name#_#dpdtable.category# dpd on dpd.dpdid = ac.frn_dpdid
				AND dpd.tz_dpddate >= <cfqueryParam value="#session.cx_date_start#" CFSQLType = 'CF_SQL_DATE'>
				AND dpd.tz_dpddate < <cfqueryParam value="#session.cx_date_end#" CFSQLType = 'CF_SQL_DATE'>
			INNER JOIN xweb_refer r on r.web_referid = dpd.frn_web_referid
			INNER JOIN #dpdtable.name#_variable_#dpdtable.category# xv on xv.frn_dpdid = dpd.dpdid
			INNER JOIN xweb_variable v on v.web_variableid = xv.frn_web_variableid
				and (v.variable_paid = 1 or (v.web_variableid in (2,3,4,6,7,43) and xv.variable_value IN ('cpc','ppc')) or (v.web_variableid in (64) and xv.variable_value='paid'))
				<cfif URL.paid NEQ 'all'>
					and r.refer_site = <cfqueryParam value="#URL.paid#" CFSQLType = 'CF_SQL_VARCHAR'>
				</cfif>
		</cfif>
		
		
		
		<cfif isDefined('session.chxHum') AND session.chxHum EQ 1>
			INNER JOIN #theTable#_hcat xh on xh.frn_GIT_ID_for_call = x.GIT_ID_for_call
		</cfif>
	where
		x.GIT_the_date >= <cfqueryParam value="#session.cx_date_start#" CFSQLType = 'CF_SQL_DATE'>
		and x.GIT_the_date < <cfqueryParam value="#session.cx_date_end#" CFSQLType = 'CF_SQL_DATE'>

		<cfif session.cx_phonecode neq '' and Session.cx_phonecode neq 'GIT_Legacy_Filter_Code' and Session.cx_phonecode neq "NULL" and Session.cx_phonecode neq "1">
			and x.frn_phonecodeid in ( <cfqueryParam value="#session.cx_phonecode#" list="yes" CFSQLType = 'CF_SQL_INTEGER'> )
		<cfelseif Session.cx_phonecode eq "NULL" or Session.cx_phonecode eq "1">
			and (x.frn_phonecodeid is NULL or x.frn_phonecodeid = 0)
		</cfif>
		
		<cfif isdefined('pull_wsc_calls_with_source')>
			<cfif pull_wsc_calls_with_source.recordCount>
				and x.GIT_ID_for_call in (#ValueList(pull_wsc_calls_with_source.GIT_ID_for_call)#)
			<cfelse>
				and x.GIT_ID_for_call in (0)
			</cfif>
		</cfif>
		<cfif isdefined('pull_wsc_calls_with_campaign')>
			<cfif pull_wsc_calls_with_campaign.recordCount>
				and x.GIT_ID_for_call in (#ValueList(pull_wsc_calls_with_campaign.GIT_ID_for_call)#)
			<cfelse>
				and x.GIT_ID_for_call in (0)
			</cfif>
		</cfif>
		<cfif isdefined('pull_wsc_calls_with_adgroup')>
			<cfif pull_wsc_calls_with_adgroup.recordCount>
				and x.GIT_ID_for_call in (#ValueList(pull_wsc_calls_with_adgroup.GIT_ID_for_call)#)
			<cfelse>
				and x.GIT_ID_for_call in (0)
			</cfif>
		</cfif>
		
		<cfif session.cx_ani neq ''>
			 --AND ani.theani = '#session.cx_ani#'
			 AND frn_calllog_aniid in (select calllog_aniid from calllog_ani where theani= <cfqueryParam value="#session.cx_ani#" CFSQLType = 'CF_SQL_VARCHAR'>)
		</cfif>
		and d.add_FROM GIT_account in (<cfqueryParam value="#this_lskin_all#" list="yes" CFSQLType = 'CF_SQL_INTEGER'>)
		<cfif IsDefined('session.GIT_variable_CM_GIT_PhNumPath') and listlen(session.GIT_variable_CM_GIT_PhNumPath) eq 2>
			and x.cf_frn_GIT_PhNumid = <cfqueryParam value="#ListToArray(session.GIT_variable_CM_GIT_PhNumPath)[1]#" CFSQLType = 'CF_SQL_INTEGER'>
			and x.extension_frn_GIT_PhNumid = <cfqueryParam value="#ListToArray(session.GIT_variable_CM_GIT_PhNumPath)[2]#" CFSQLType = 'CF_SQL_INTEGER'>
		</cfif>
		<cfif session.GIT_variable_CM_cx_GIT_PhNum NEQ '' or session.GIT_variable_CM_cx_GIT_PhNum_extensions neq ''>
			and  (
			<cfif session.GIT_variable_CM_cx_GIT_PhNum NEQ ''>
				x.cf_frn_GIT_PhNumid in (<cfqueryParam value="#session.GIT_variable_CM_cx_GIT_PhNum#" list="yes" CFSQLType = 'CF_SQL_INTEGER'>)
				<cfif session.GIT_variable_CM_cx_GIT_PhNum_extensions neq ''>

					or x.extension_frn_GIT_PhNumid in (<cfqueryParam value="#session.GIT_variable_CM_cx_GIT_PhNum_extensions#" list="yes" CFSQLType = 'CF_SQL_INTEGER'>)
				</cfif>
			<cfelse>
				x.extension_frn_GIT_PhNumid in (<cfqueryParam value="#session.GIT_variable_CM_cx_GIT_PhNum_extensions#" list="yes" CFSQLType = 'CF_SQL_INTEGER'>)
			</cfif>

			)

			<cfif ((IsDefined('hcat_lines') AND ListLen(hcat_lines) gt 0) or (IsDefined('hcat_extensions') AND ListLen(hcat_extensions) gt 0)) and not IsDefined('session.GIT_variable_CM_cx_GIT_PhNum_extensions') >
			--find me3
			and (
				<cfif ListLen(hcat_lines) gt 0>
					x.cf_frn_GIT_PhNumid in (<cfqueryParam value="#hcat_lines#" list="yes" CFSQLType = 'CF_SQL_INTEGER'>)
					<cfif ListLen(hcat_extensions) gt 0>
						or
					</cfif>
				</cfif>
				<cfif ListLen(hcat_extensions) gt 0>
					x.extension_frn_GIT_PhNumid in (<cfqueryParam value="#hcat_extensions#" list="yes" CFSQLType = 'CF_SQL_INTEGER'>)
					--find me5
				</cfif>
				)
			</cfif>

		</cfif>
		<cfif isDefined("URL.kwords") AND URL.kwords NEQ ''>
			<cfif URL.kwords EQ 'Not Provided'>
				and k.dpd_kwords is NULL
			<cfelse>
				and k.dpd_kwords = <cfqueryParam value="#URL.kwords#" CFSQLType = 'CF_SQL_VARCHAR'>
			</cfif>
		</cfif>

		<cfif isDefined("SESSION.cx_GIT_PhNumpool") AND SESSION.cx_GIT_PhNumpool NEQ '' AND IsDefined("URL.paid") AND URL.paid NEQ ''>
			and dpd.FROM GIT_group_of_numbers_ID = <cfqueryParam value="#SESSION.cx_GIT_PhNumpool#" CFSQLType = 'CF_SQL_INTEGER'>
		</cfif>

			and x.spamrating = 0

		<cfif IsDefined('this_GIT_PhNum_list')>
			<cfif this_GIT_PhNum_list eq 'all'>
						<!--- all lines selected, no restriction in where --->
			<cfelseif this_GIT_PhNum_list eq 'none' or this_GIT_PhNum_list eq ''>
				and 0=1	<!---no lines selected, forces 0 results--->
			<cfelse>
				and d.GIT_PhNumid in (<cfqueryParam value="#this_GIT_PhNum_list#" list="yes" CFSQLType = 'CF_SQL_INTEGER'>)--here
			</cfif>
		</cfif>
		<cfif isDefined('session.ex_hco') AND len(session.ex_hco) GT 0>
			<!---AND theani NOT in (<cfqueryParam value="#calledBack#" list="yes" CFSQLType = 'CF_SQL_BIGINT'>)--->
			AND NOT EXISTS (select 1 from cte3 where theani=ani.theani)
		</cfif>
		<cfif (session.GIT_variable_CMGIT_verticalID EQ 9 OR session.GIT_variable_CMGIT_verticalID EQ 19) AND listContains(session.cx_hco,'91273')>
			AND GIT_ID_for_call not in (<cfqueryParam value="#ValueList(pull_refined.GIT_ID_for_call)#" list="yes" CFSQLType = 'CF_SQL_BIGINT'>)
		</cfif>
		order by x.GIT_the_datetime desc
</cfquery>

<cfif isdefined('timer')>
<cfoutput>End #Now()#</cfoutput>
<cfabort>
</cfif>
<cfquery dbtype="query" name="count_lineTypes">
	SELECT
		count( type_reference) as type_count, type_reference
	FROM
		pull_GIT_ID_for_calls
	group by type_reference
</cfquery>

<cfset session.cx_GIT_ID_for_calls = ValueList(pull_GIT_ID_for_calls.GIT_ID_for_call) />
</cfif>

<cfif IsDefined("debugtimeoutput")><cfoutput>finished pulling GIT_ID_for_calls..#now()# <br/></cfoutput></cfif>


<cfif IsDefined('dump')>
	<cfdump var="#pull_GIT_ID_for_calls#">
	<cfdump var="#count_lineTypes#">
	<cfdump var="#session.GIT_variable_CM_cx_GIT_PhNum#">
	<cfdump var="#session.GIT_variable_CM_cx_GIT_PhNum_extensions#">
	<cfif IsDefined('pull_default_hco')>
		<cfdump var="#pull_default_hco#">
	<cfelse>
		pull_default_hco is undefined
	</cfif>
</cfif>


<cfif not isdefined("sr")>
	<cfset sr = 1 />
</cfif>
<cfif not isdefined("mr")>
	<cfset mr = 10 />
</cfif>

<cfif isdefined("cid")>
	<cfset cxid = url.cid />
<cfelse>
	<cfset cxid = ''>
	<!---<cfoutput query="pull_GIT_ID_for_calls" startrow="#sr#" maxrows="#mr#">
		<cfif currentrow gt (sr) and currentrow lt (sr + mr)>
			<cfset cxid &= ','>
		</cfif>
		<cfset cxid &= '#GIT_ID_for_call#'>

	</cfoutput>
--->
	<cfset max = mr />
	<cfif listlen(session.cx_GIT_ID_for_calls)-sr+1 LT mr>
		<cfset max = listlen(session.cx_GIT_ID_for_calls)-sr+1 />
	</cfif>
	<cfloop from="1" to="#max#" index="i">
		<cfoutput><cfset GIT_ID_for_call = #listGetAt(session.cx_GIT_ID_for_calls, i+sr-1)# ></cfoutput>
		<cfset cxid &= '#GIT_ID_for_call#,'>
	</cfloop>
		<cfif LEN(cxid) GT 1>
			<cfset cxid = LEFT(cxid, LEN(cxid)-1) />
		</cfif>

</cfif>


<!--- type selection --->
<cfif NOT isDefined("cid")>
	<div class="filter-btn">
		<a href="cx_details_list_filter.cfm"><img src="../images/cx_details/icon-filter.png"><p>Filter Calls</p></a> &nbsp;&nbsp;
		<cfoutput>
		<span class="filter-returned-calls">#ListLen(session.cx_GIT_ID_for_calls)# Calls Returned</span>
		</cfoutput>
	</div>

</cfif>
<!--- end of type selection --->

<cfif NOT isDefined("cid")>
<!--- pagination details --->
<cfset totalpages = round((ListLen(session.cx_GIT_ID_for_calls) / mr) + .49) />
<script language="JavaScript">
function goto(form) { var index=form.select.selectedIndex
if (form.select.options[index].value != "0") {
location=form.select.options[index].value;}}

<!------>
$(document).ready(function(){
	$(".audit-close").on("click",function(){
//		console.log("it worked!");
		var GIT_ID_for_call=$(this).parents(".call-container").attr('class');
//		console.log(GIT_ID_for_call);
		var ind=GIT_ID_for_call.lastIndexOf("call-");
//		console.log(ind);
		console.log(GIT_ID_for_call.substring(ind+5));
		GIT_ID_for_call=GIT_ID_for_call.substring(ind+5);
		$.ajax({
        type: "POST",
        url: "cx_details_list_ajax.cfm",
        data: {
        	cid: GIT_ID_for_call,
			func: "call-opts"
        },
        success: function(data) {
			var ret=data;
        	var original=$(".call-"+GIT_ID_for_call).find(".option-display");
			console.log(original);
			console.log(original.text());
			$(".call-"+GIT_ID_for_call).find(".option-display").text(ret);
			console.log(ret);
        //	$('.tact-sel').append(data).show();
       	}
    });
		var opts=$(this).parents(".call-container").find(".option-display").text();
	//	console.log(opts);
	});
});



</script>

<cfsavecontent variable="pagination">
	<div class="pagination-section">

		<!--- In case there are any URL variables from a cx clickthrough, add to URL string --->
		<cfset additions = ''>
		<cfif IsDefined("URL.kwords")>
			<cfset additions = additions&'&kwords='&URL.kwords>
		</cfif>
		<cfif IsDefined("URL.webref")>
			<cfset additions = additions&'&webref='&URL.webref>
		</cfif>
		<cfif IsDefined("URL.paid")>
			<cfset additions = additions&'&paid='&URL.paid>
		</cfif>

		<form name="form1">

			<cfif sr GT 1>

				<a class="page-arrow-btn" href="<cfoutput>#getfilefrompath(cgi.script_name)#?pid=#pid#&sr=#evaluate(sr-mr)##additions#<cfif isDefined("mobile")>&mobile=#mobile#</cfif></cfoutput>"><img src="../images/redux/performance-report-cw/prev-arrow-1.png"/></a>
			</cfif>
			<cfoutput>
				viewing page
					<select name="select" onchange="goto(this.form)">
						<cfloop from="1" to="#totalpages#" index="ppp">
							<option value="#getfilefrompath(cgi.script_name)#?pid=#pid#&sr=#evaluate((ppp*mr)-mr+1)##additions#" <cfif ppp EQ ((sr+mr-1)/mr)>selected</cfif> >#ppp#</option>
						</cfloop>
					</select>
					 of #numberFormat(totalpages)#
			</cfoutput>
			<cfif sr LT evaluate(ListLen(session.cx_GIT_ID_for_calls)-mr)>
				<a class="page-arrow-btn" href="<cfoutput>#getfilefrompath(cgi.script_name)#?pid=#pid#&sr=#evaluate(sr+mr)##additions#<cfif isDefined("mobile")>&mobile=#mobile#</cfif></cfoutput>"><img src="../images/redux/performance-report-cw/next-arrow-1.png"/></a>
			</cfif>
		</form>
	</div>
</cfsavecontent>


<cfif ListLen(session.cx_GIT_ID_for_calls) GT 0 AND totalpages GT 1>
	<cfoutput>
		#pagination#
	</cfoutput>
</cfif>
</cfif>

<!--- handle zero results --->

<cfif ListLen(session.cx_GIT_ID_for_calls) EQ 0 and not isdefined("url.cid")>
	There were no matching results for your report query. <a href="cx_details_list_filter.cfm"><u>Click here</u></a> to try again.
<cfelse>
	<cfif not isdefined("sr") OR sr EQ 1>
		<div style="clear: both;">
			<!---div style="float: right;">
				<a href="../platform_a/autoreport_signup.cfm"><img src="../images/email_report.jpg" width="131" height="14" border="0" alt="Email this report" /></a>
			</div--->
		</div>
		<div style="clear: both;"></div>
		<div style="clear: both;"></div>
	</cfif>
</cfif>
<div style="display: block; margin-top: 40px;"></div>

<!---log action--->
	<cfset logTheAction = 'Report Generated - Details' />
	<cfset logActionId = 14 />
	<cfinclude template="../platform_a/insertUserAction.cfm" />
<!---/log action--->

<cfif isDefined("debugView")>
	<cfinclude template='cx_details_show_view.cfm'>
<cfelse>
	<cfinclude template='cx_details_show.cfm'>
</cfif>

<cfif IsDefined("debugtimeoutput")><cfoutput>finished showing call details...#now()# <br/></cfoutput></cfif>


<cfif NOT isDefined("cid")>
	<script language="JavaScript">
	function goto(form) { var index=form.select.selectedIndex
	if (form.select.options[index].value != "0") {
	location=form.select.options[index].value;}}

	</script>


	<cfif ListLen(session.cx_GIT_ID_for_calls) GT 0 AND totalpages GT 1>
		<cfoutput>
			#pagination#
		</cfoutput>
	</cfif>
</cfif>

<div style="display: block; height: 50px;"></div>
<cfif isdefined("url.batman")>
	<cfif IsDefined('pull_GIT_PhNum_hcat')>
		<cfdump var = "#PULL_DNIS_HCAT#">
	</cfif>
<cfdump var= "#session#" />
<cfdump var= "#variables#" />
	<cfdump var="#pull_GIT_ID_for_calls#">
	<cfdump var="#count_lineTypes#">
	<cfdump var="#session.GIT_variable_CM_cx_GIT_PhNum#">
	<cfdump var="#session.GIT_variable_CM_cx_GIT_PhNum_extensions#">


</cfif>

<cfif isdefined("Adebug")>
<cfdump var= "#cxid#" />
</cfif>

<cfif isdefined("jmdebug")>
<cfdump var="#pull_GIT_ID_for_calls#">
<cfdump var="#dpdtable.name#">
<cfdump var="#dpdtable.category#">
</cfif>

<cfif isDefined("URL.matt") AND URL.matt NEQ ''>
	<cfoutput>Checking value of tables: </cfoutput>
	<cfdump var = "#thetable#">
	<cfdump var = "#dpdtable.name#">
	<cfdump var = "#dpdtable.category#">
</cfif>

<cfcatch>
	<cfdump var='#cfcatch#'>
</cfcatch>
</cftry>
<!---<cfdump var="#pull_GIT_ID_for_calls#"/>--->
<!---
<cfif pull_GIT_ID_for_calls.recordCount GT 0>
	<cfoutput>
		#pagination#<script>console.log('sr: ' + '#sr#');console.log('mr: ' + '#mr#');</script>
	</cfoutput>
</cfif>
Added hco filter for SH opportunities. Project 4718
Added _hcat join for clickthrough. Case 86679
--->

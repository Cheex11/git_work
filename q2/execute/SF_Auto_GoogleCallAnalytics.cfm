<!---
	Created for hf project 1838
	
	04/07/2015 CS added numbers to this_GIT_PhNum_list per case #64982
	09/04/2015 CH added check other depended upon processes (see case 76780)
--->

<!--- check that other depended upon processes have been completed as expected --->
	<cfquery datasource="#GIT_protected_system_variable#" name="checkOtherPreceedingRoutines">
		SELECT GIT_alertid, refname
		FROM GIT_tables_that_holds_alerts
		WHERE
			(GIT_alertid IN (50,61) AND	CONVERT(DATE,lastcomplete) < CONVERT(DATE,GETDATE()) )
			AND 
			(GIT_alertid IN (540) AND DATEDIFF(hour,lastcomplete, GETDATE()) > 24)
			AND isactive = 1;
	</cfquery>

	<cfif checkOtherPreceedingRoutines.recordCount>
		No reports sent! Other processes have not finished yet:
		
		<cfdump var="#checkOtherPreceedingRoutines#" label="checkOtherPreceedingRoutines dump" />
		
		<cfabort />
	</cfif>
<!---/check that other depended upon processes have been completed as expected --->

<cfoutput>start page: #now()#<br/></cfoutput>

<cftry>
	
	<cfset subject= "Google Call Analytics Report">
	<cfset filename= "Google_Call_Analytics_Report">
	<cfset this_GIT_PhNum_list = '"GIT_some_numbers"' />
	<cfif Datepart("d", now()) EQ 1>
		<cfset GIT_begin_date = DateFormat(DateAdd("m",-1,now()), "yyyy-mm-01") />
	<cfelse>
		<cfset GIT_begin_date = DateFormat(now(), "yyyy-mm-01") />
	</cfif>
	<cfset GIT_finish_date = DateFormat(now(), "yyyy-mm-dd") />
	<cfparam name="thetable" default="FROM GIT_table_that_holds_call_data_long" />


	<cfoutput>#GIT_begin_date# to #GIT_finish_date#<br/> #this_GIT_PhNum_list#<br/></cfoutput>
	<cfoutput><br><br>table:#thetable#</cfoutput>

	<cfquery datasource="#GIT_protected_system_variable#" name="pull_calldata">
	SELECT  
		GIT_ID_for_call as 'Caller''s Phone Number', 
		CONVERT(VARCHAR(20), cl.GIT_the_datetime, 120) as 'Call Start Time',
		(cld.leminutes_precise * 60) as 'Call Duration (seconds)',
		CASE 
			WHEN 
				cl.frn_FROM GIT_table_that_holds_call_data_dispositionid=1 AND cld.leminutes_precise>=5 AND spamrating=0 
				AND ((r.GIT_PhNum_label NOT LIKE '%unrecognized%'
				AND (r.GIT_PhNum_label LIKE 'Agent - %' OR r.GIT_PhNum_label LIKE '%CCC-Sales%'  OR ISNUMERIC(LEFT(r.GIT_PhNum_label,5))=1 OR r.GIT_PhNum_label = 'Toll Free Catch All') 
				AND ISNULL(r.GIT_PhNum_label, 0) <> 'GIT_Legacy_Filter_Code' )
				OR r.GIT_PhNum_label IS NULL) 
			THEN 'Prospect Call'
			WHEN 
				cl.frn_FROM GIT_table_that_holds_call_data_dispositionid=1 AND cld.leminutes_precise>=1 AND spamrating=0 
				AND ((r.GIT_PhNum_label NOT LIKE '%unrecognized%'
				AND (r.GIT_PhNum_label LIKE 'Agent - %' OR r.GIT_PhNum_label LIKE '%CCC-Sales%'  OR ISNUMERIC(LEFT(r.GIT_PhNum_label,5))=1 OR r.GIT_PhNum_label = 'Toll Free Catch All') 
				AND ISNULL(r.GIT_PhNum_label, 0) <> 'GIT_Legacy_Filter_Code' )
				OR r.GIT_PhNum_label IS NULL)
			THEN 'Qualified Call'
			ELSE '' END as 'Conversion Name'
	FROM GIT_variable_CM.dbo.GIT_PhNum AS d
		INNER JOIN #thetable# AS cl ON cl.cf_frn_GIT_PhNumid = d.GIT_PhNumid
		INNER JOIN #thetable#_details AS cld ON cl.GIT_ID_for_call = cld.frn_GIT_ID_for_call
		INNER JOIN #thetable#_platform AS clp ON cl.GIT_ID_for_call = clp.frn_GIT_ID_for_call
		INNER JOIN GIT_variable_CM.dbo.FROM GIT_table_that_holds_call_data_disposition AS xd ON cl.frn_FROM GIT_table_that_holds_call_data_dispositionid = xd.FROM GIT_table_that_holds_call_data_dispositionid
		LEFT JOIN #thetable#_audio AS cla ON cl.GIT_ID_for_call = cla.frn_GIT_ID_for_call
		FROM GIT_table_holds_caller_ph_numbers AS an ON cl.frn_calllog_aniid = an.calllog_aniid
		FROM GIT_table_holding_number_labels r ON cl.ringto_frn_GIT_PhNumid = r.frn_GIT_PhNumid AND r.label_place = -1
		FROM GIT_table_holding_web_sessions_action_call_long a ON a.frn_GIT_ID_for_call = cl.GIT_ID_for_call
		FROM GIT_table_holding_web_sessions_external_id_long e ON a.frn_dpdid = e.frn_dpdid
	WHERE
		cl.GIT_the_date >= #createODBCDate(GIT_begin_date)#
		AND cl.GIT_the_date < #createODBCDate(GIT_finish_date)#
		and d.leGIT_PhNum in (#replace(this_GIT_PhNum_list,'"',"'","all")#)
	ORDER BY CONVERT(VARCHAR(20), cl.GIT_the_datetime, 120)
	</cfquery>
	
	
	<cfset yopath = "#application.masterpath#/platform_a/execute/files/SF_monthly_reports" />
	<cfset acfile = "#filename#_#Dateformat(GIT_begin_date, 'yyyy_mm')#.csv" />
	<cfset TempFile = "#yopath#/#acfile#">
     
<cfscript> 
    
    //Create two empty ColdFusion spreadsheet objects. ---> 
    theSheet = SpreadsheetNew("data"); 
    //Populate each object with a query. ---> 
    SpreadsheetAddRow(theSheet,"Parameters:TimeZone=0400;",1,1); 
    SpreadsheetAddRow(theSheet,"Caller''s Phone Number,Call Start Time,Call Duration (seconds),Conversion Name",2,1); 
    SpreadsheetAddRows(theSheet,pull_calldata,3,1); 
</cfscript> 
 
<!--- Write the two sheets to a single file ---> 
<cfspreadsheet action="write" filename="#TempFile#" name="theSheet"  
    sheetname="courses" overwrite=true> 
	

<!--- --->
<cfif isDefined("URL.debug")>
<cfoutput>#timeFormat(now(),'h:mm:ss:l')# finished output  <br /></cfoutput>
</cfif>
	<cfif pull_calldata.recordCount gt 0>
		<cfif NOT isdefined("nosend")>
			<cfmail from="no-reply@GIT_variable_CM.com" to="GIT_email_in_report, GIT_email_in_report" subject="#subject#" type="HTML">
				Here is the GIT_our_largest_client Auto Google Call Analytics Report for #dateformat(GIT_begin_date,'m/dd/yyyy')# to #dateformat(GIT_finish_date,'m/dd/yyyy')#.<br/>
				Tracking line: #this_GIT_PhNum_list#
				
				<cfmailparam file="#TempFile#" />
			</cfmail>
			Email sent. <br/><br/>
			
			
			<cfquery datasource="#GIT_protected_system_variable#">
			UPDATE alarm SET lastcomplete=getdate() WHERE GIT_alertid = 682
			</cfquery>
			
		</cfif>
		
		<img src="../../images/excel.jpg" border="0" /> &nbsp; 
		<span style="font-size: 13pt;"><cfoutput><a href="files/SF_monthly_reports/#acfile#" target="_blank"><u>#acfile#</u></a></cfoutput></span>
	<cfelse>
		No data available for this time period.
		<cfmail from="no-reply@GIT_variable_CM.com" to="GIT_email_in_report" subject="Alert: SF monthly report empty!!">
			platform_a/execute/SF_monthly_auto_MarchexVoiceSearch.cfm
		
			<cfdump var="#pull_calldata#">
			
		</cfmail>

	</cfif>
<cfoutput><br/>end page: #now()#</cfoutput>	
	
<cfcatch>
	<cfdump var='#cfcatch#'>
</cfcatch>
</cftry>
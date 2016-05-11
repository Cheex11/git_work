<cfinclude template="header.cfm" />

	<script>console.log(<cfif isDefined("FORM.adminCheckVal")><cfoutput>"#FORM.adminCheckVal#"</cfoutput>+ </cfif>"hi");</script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.2/jquery.min.js"></script>

<cfif not isdefined("lid")>
	<cflocation url="manage_users.cfm" addtoken = "no">
</cfif>

<cfif lid IS #session.GIT_variable_CM_uid#>
	<cflocation url="manage_account.cfm" addtoken = "no">
</cfif>

<cfquery datasource="#GIT_protected_system_variable#" name="pull_this">
SELECT	*
FROM	GIT_user
WHERE	GIT_userID = #lid#
	AND frn_FROM GIT_account IN (#session.GIT_variable_CM_lskin_all#)
	AND isactive = 1
</cfquery>
	<cfif pull_this.recordCount NEQ 1>
		<cflocation url="manage_users.cfm" addtoken = "no">
	</cfif>




<cfquery datasource="#GIT_protected_system_variable#" name="pull_topu">
SELECT	userdescrip2
FROM 	lskinproperty
WHERE 	frn_FROM GIT_account = #session.GIT_variable_CM_lskin#
</cfquery>


<cfif isdefined("action")>

	<!--- Were the bottom two radio button clicked? --->
	<cfif isdefined('pcradio')>
	
		<cfquery name='clear_all_associations' datasource='GIT_variable_CM'>
			UPDATE GIT_user
			SET frn_phonecodeid = null
			WHERE GIT_column_linking_users = (select GIT_column_linking_users from GIT_user where GIT_userID = #lid#)
		</cfquery>
		
	
		<!--- This is where BE code will go for associating with an existing dialcode. --->
		<cfif pcradio EQ 'associate_phonecode'>
			<cfdump var='#lid#'>
			
			<cfquery name='this_dialcode' datasource='GIT_variable_CM'>
				SELECT distinct dialcode
				FROM phonecode 
				WHERE phonecodeid = #associate_with#
			</cfquery>
			
			<cfquery name='this_lename' datasource='GIT_variable_CM'>
				SELECT distinct lename
				FROM phonecode 
				WHERE phonecodeid = #associate_with#
			</cfquery>			
			
			<cfquery name='find_lskins_of_association' datasource='GIT_variable_CM'>
				SELECT distinct frn_FROM GIT_account
				FROM phonecode 
				WHERE dialcode = (select dialcode from phonecode where phonecodeid = #associate_with#)
				AND lename = (select lename from phonecode where phonecodeid = #associate_with#)
				and isactive = 1
			</cfquery>
			
			<cfloop array='#ListToArray(ValueList(find_lskins_of_association.frn_FROM GIT_account))#' index='lskin'>
				<cfoutput>
					<cftransaction>
						<cfquery name = 'check_for_GIT_column_linking_users_account' datasource='#application.ds#'>
							SELECT GIT_userID 
							FROM GIT_table_that_holds_users 
							WHERE frn_FROM GIT_account = #lskin#
							AND GIT_column_linking_users = #lid#
						</cfquery>
							
						<!--- Does our main user have a GIT_column_linking_users for each phonecode association? --->
						<cfif check_for_GIT_column_linking_users_account.recordCount>
							<cfset GIT_column_linking_users_to_update = #check_for_GIT_column_linking_users_account.GIT_userID#>			
						<cfelse>
							<cfquery datasource="#GIT_protected_system_variable#" name="pull_user">
								SELECT uname,pword as 'carry',accountemail,descrip1,linedata,GIT_column_linking_users,access_admin FROM GIT_table_that_holds_users l WHERE l.GIT_userID = #lid# AND l.isactive = 1
							</cfquery>		
						<!--- Make a unique username --->
							<cfset newuname = "#pull_user.uname#_9#lskin#">
						<!--- create the GIT_user account --->
							<cfquery datasource="#GIT_protected_system_variable#" name="pull_max">
								INSERT INTO GIT_user (uname, pword, frn_FROM GIT_account, accountemail, isactive, descrip1, linedata, GIT_column_linking_users, access_admin, access_all, GIT_column_linking_users_keepactive)
								VALUES ('#newuname#', '#pull_user.carry#', #lskin#, <cfif pull_user.accountemail EQ ''>NULL<cfelse>'#pull_user.accountemail#'</cfif>, 1, '#pull_user.descrip1#', '#pull_user.linedata#', #pull_user.GIT_column_linking_users#, #pull_user.access_admin#, 1, 1)
								SELECT SCOPE_IDENTITY() AS 'newid'
							</cfquery>
							<cfset GIT_column_linking_users_to_update = pull_max.newid>
						</cfif>
						
						<cfquery name='associate_user' datasource='#application.ds#'>
							UPDATE LEUSER
							SET frn_phonecodeid = (	SELECT phonecodeid
													FROM phonecode
													WHERE frn_FROM GIT_account = #lskin#
														AND dialcode = 	'#this_dialcode.dialcode#'
														AND lename = '#this_lename.lename#'
													)
							WHERE LEUSERID = #GIT_column_linking_users_to_update#
						</cfquery>
						
					</cftransaction>
				</cfoutput>
			</cfloop>
			<!--- Check current account --->
			<cfquery name ='check_current_GIT_userID' datasource='GIT_variable_CM'>
				SELECT frn_phonecodeid
				FROM GIT_table_that_holds_users
				WHERE GIT_userID = #lid#
					AND frn_phonecodeid is not null
			</cfquery>
			
			<cfif !check_current_GIT_userID.recordCount>
				<cftransaction>
					<cfquery name='associate_user' datasource='GIT_variable_CM'>
						UPDATE LEUSER
						SET frn_phonecodeid = #associate_with#
						WHERE LEUSERID = #lid#
					</cfquery>
				</cftransaction>
			</cfif>
		</cfif>
		
		<!--- This is the code for creating new dialcodes for a user --->
		<cfif pcradio EQ 'create_phonecode'>
			<!--- Validation for the dialcode and refname--->
			<cfif len(dialcode) EQ 4 AND refname NEQ ''>
				<!--- Make the list of lskins we will be making phonecodes for. --->
				<cfif isdefined('AllAccounts')>
					<cfquery datasource="#GIT_protected_system_variable#" name="pull_GIT_column_linking_users_lskins">
						select distinct FROM GIT_account 
						from GIT_user le
							FROM GIT_table_that_holds_accounts l on l.FROM GIT_account=le.frn_FROM GIT_account
						WHERE le.isactive=1
							AND l.isactive=1
							AND GIT_column_linking_users=<cfqueryParam value="#session.GIT_variable_CM_GIT_column_linking_users#" cfsqltype="cf_sql_integer">
					</cfquery>		
					<cfset lskin_list = valuelist(pull_GIT_column_linking_users_lskins.FROM GIT_account)>
				</cfif>
				
				<cfif isdefined('add_pc_FROM GIT_account')>
					<cfset lskin_list = add_pc_FROM GIT_account>
					<cfquery name = 'grab_lskin' datasource='GIT_variable_CM'>
						SELECT frn_FROM GIT_account 
						FROM GIT_table_that_holds_users
						WHERE GIT_userID = #lid#
					</cfquery>
					<cfset lskin_list = #ListAppend(lskin_list, grab_lskin.frn_FROM GIT_account)#>
				</cfif>
				
				<!--- Lskin list is defined by the lskins the user checks from the checkbox --->
				<cfif isdefined('lskin_list')>
				
					<cfquery datasource="#GIT_protected_system_variable#" name="pull_user">
						SELECT uname,pword as 'carry',accountemail,descrip1,linedata,GIT_column_linking_users,access_admin FROM GIT_table_that_holds_users l WHERE l.GIT_userID = #lid# AND l.isactive = 1
					</cfquery>		
					<!--- Loop through all the lskins and make dialcodes for each --->
					<cfloop array='#ListToArray(lskin_list)#' index='lskin'>
						<cfoutput>
							<cfif pull_user.recordcount GT 0>
								<cftransaction>
									<cfquery datasource="#GIT_protected_system_variable#" name="check_dup">
										select GIT_userID 
										from GIT_user 
										where GIT_column_linking_users = #pull_user.GIT_column_linking_users# 
											and frn_FROM GIT_account = #lskin# 
											and isactive = 1 
									</cfquery>				
									
									<!---If there are no GIT_column_linking_userss, create a new phonecode and GIT_column_linking_users user --->
									<cfif check_dup.recordcount eq 0>
										<!--- Make a unique username --->
										<cfset newuname = "#pull_user.uname#_9#lskin#">
										<!--- create the GIT_user account --->
											<cfif check_dup.recordcount eq 0>
												<cfquery datasource="#GIT_protected_system_variable#" name="pull_max">
												INSERT INTO GIT_user (uname, pword, frn_FROM GIT_account, accountemail, isactive, descrip1, linedata, GIT_column_linking_users, access_admin, access_all, GIT_column_linking_users_keepactive)
												VALUES ('#newuname#', '#pull_user.carry#', #lskin#, <cfif pull_user.accountemail EQ ''>NULL<cfelse>'#pull_user.accountemail#'</cfif>, 1, '#pull_user.descrip1#', '#pull_user.linedata#', #pull_user.GIT_column_linking_users#, #pull_user.access_admin#, 1, 1)
												SELECT SCOPE_IDENTITY() AS 'newid'
												</cfquery>
												<cfset this_GIT_column_linking_users = pull_max.newid>
											</cfif>
									
									<cfelse>
										<cfset this_GIT_column_linking_users = #check_dup.GIT_userID#>
									</cfif>
									
									<cfif isdefined('this_GIT_column_linking_users')>
										<!--- Lomnis have been made / found. Time to make phonecodes for them --->
										<cfquery name = 'add_phonecode' datasource='#application.ds#'>
											INSERT INTO phonecode (dialcode,isactive,frn_FROM GIT_account,lename,phone)
											VALUES('#dialcode#',1,#lskin#,'#refname#','#phonenumber#')
											SELECT SCOPE_IDENTITY() AS 'newphonecodeid'
										</cfquery>
									
										<!--- Associate the new Phonecode with the GIT_column_linking_users user.--->
										<cfquery name ='associate_user' datasource='#application.ds#'>
											UPDATE LEUSER
											SET frn_phonecodeid = #add_phonecode.newphonecodeid#
											WHERE GIT_userID = #this_GIT_column_linking_users#
										</cfquery>
									</cfif>
									
									<!---
										<cfquery name='associate_user' datasource='GIT_variable_CM'>
											UPDATE LEUSER
											SET frn_phonecodeid = #add_phonecode.newphonecodeid#
											WHERE LEUSERID = #lid#
										</cfquery>		
									--->	
									
								</cftransaction>
							</cfif>										
						</cfoutput>
					</cfloop>
				</cfif>
			</cfif>
		</cfif>
	</cfif>

	<cfif username NEQ pull_this.uname>
		<cfquery datasource="#GIT_protected_system_variable#" name="pull_existing_uname">
		SELECT 	GIT_userID
		FROM	GIT_user
		WHERE	uname = '#username#'
			AND isactive = 1
			AND GIT_userID <> #lid#
		</cfquery>
			<cfif pull_existing_uname.recordCount EQ 0>
				<cfquery datasource="carwars" name="check_existing_carwars">
					select cuserid, cm_GIT_userID, email
					from cuser
					where email = '#username#'
					and isactive = 1
					and cm_GIT_userID <> #lid#
				</cfquery>

				<cfif check_existing_carwars.recordCount gt 0>
					<cfset error = "username" />
				<cfelse>
					<cfset uname_new = "#username#" />
				</cfif>
			<cfelse>
				<cfset error = "username" />
			</cfif>
	</cfif>

	<cfquery datasource="#GIT_protected_system_variable#">
	UPDATE	GIT_user
	SET
		<cfif isdefined("uname_new")>
			uname = '#uname_new#',
		</cfif>
		pword = '#password#',
		accountemail = '#accountemail#',
		descrip1 = '#descrip1#',
		<cfif isdefined("descrip2")>
			descrip2 = '#descrip2#',
		</cfif>
		access_admin = <cfif isdefined("access_admin")>1<cfelse>0</cfif>,
		access_all = <cfif isdefined("access_all")>1<cfelse>0</cfif>
	WHERE	GIT_userID = #lid#
	</cfquery>

	<cfquery datasource="#GIT_protected_system_variable#" name="pull_GIT_user_typeID_column">
		SELECT GIT_column_linking_users, GIT_user_typeID_column, access_admin FROM GIT_table_that_holds_users WHERE GIT_userID = #lid#
	</cfquery>
	
	<cfif isDefined("pull_GIT_user_typeID_column.GIT_column_linking_users") AND pull_GIT_user_typeID_column.GIT_column_linking_users NEQ "" AND pull_GIT_user_typeID_column.GIT_user_typeID_column EQ 2>
		<cfset accessVar = pull_GIT_user_typeID_column.access_admin>
		<cfset GIT_column_linking_usersVar = pull_GIT_user_typeID_column.GIT_column_linking_users>
		<cfquery datasource="#GIT_protected_system_variable#">
			UPDATE GIT_user SET access_admin = #accessVar# WHERE GIT_column_linking_users = #GIT_column_linking_usersVar#
		</cfquery>
	</cfif>
	
	<cfquery datasource="carwars">
		update cuser set pword = '#password#' where cm_GIT_userID = #lid#
	</cfquery>

		<!---log action--->
			<cfset logTheAction = 'Edited a User' />
			<cfset logActionId = 9 />
			<cfset logVarInfo = 'GIT_userID:'&lid />
			<cfinclude template="insertUserAction.cfm" />
		<!---/log action--->


	<!--- access --->
	<cfif isdefined("access_all")>

		<!--- kill any jdl records --->
		<cfquery datasource="#GIT_protected_system_variable#">
		DELETE
		FROM	joinGIT_PhNumGIT_user
		WHERE	GIT_foreign_userID = #lid#
		</cfquery>

		<!--- kill any rules --->
		<cfquery datasource="#GIT_protected_system_variable#">
		DELETE
		FROM	joinGIT_PhNumGIT_user_rule
		WHERE	GIT_foreign_userID = #lid#
		</cfquery>

	</cfif>
	<!--- /access --->


	<cfif isdefined("uskin")>

		<cfquery datasource="#GIT_protected_system_variable#" name="pull_lskin">
		SELECT	FROM GIT_account, refname, GIT_userID
		FROM	lskin s
			 FROM GIT_table_that_holds_users u ON s.FROM GIT_account = u.frn_FROM GIT_account AND u.GIT_column_linking_users = #lid# AND u.isactive = 1
		WHERE	s.FROM GIT_account IN (#session.GIT_variable_CM_lskin_all#)
			AND s.FROM GIT_account <> #session.GIT_variable_CM_lskin#
		ORDER BY refname
		</cfquery>
			<cfloop query="pull_lskin">

				<cfif listFind(uskin,FROM GIT_account) GT 0>

					<!--- association needed --->
					<cfif GIT_userID IS "">
						<cfquery datasource="#GIT_protected_system_variable#" name="pull_max">
						SELECT MAX (GIT_userID) AS lmax
						FROM GIT_table_that_holds_users
						</cfquery>
							<cfset newid = pull_max.lmax + 1>

						<cfquery datasource="#GIT_protected_system_variable#">
						INSERT INTO GIT_user (GIT_userID, uname, pword, frn_FROM GIT_account, isactive, descrip1, GIT_column_linking_users, access_admin, access_all)
						VALUES (#newid#, '#pull_this.uname#_#newid#', '#FROM GIT_account#', #FROM GIT_account#, 1, '#pull_this.descrip1#', #pull_this.GIT_column_linking_users#, #pull_this.access_admin#, 1)
						</cfquery>
					</cfif>
					<!--- /association needed --->

				<cfelse>

					<!--- kill association --->
					<cfif GIT_userID IS NOT "">

						<cfquery datasource="#GIT_protected_system_variable#">
						UPDATE	GIT_user
						SET	isactive = 0
						WHERE	GIT_userID = #GIT_userID#
						</cfquery>

						<cfquery datasource="#GIT_protected_system_variable#">
						UPDATE	autoreport_a
						SET	isactive = 0, enddate = '#DateFormat(now(), "yyyy-mm-dd")#'
						WHERE	GIT_foreign_userID = #GIT_userID# AND yofrequency <= 30 AND isactive = 1
						</cfquery>

						<!---log action--->
							<cfset logTheAction = 'Deactivated a User' />
							<cfset logActionId = 17 />
							<cfset logVarInfo = 'GIT_userID:'&lid />
							<cfinclude template="insertUserAction.cfm" />
						<!---/log action--->

					</cfif>
					<!--- /kill association --->

				</cfif>

			</cfloop>

	</cfif>



	<cfif not isdefined("error")>
		<cflocation url="manage_users.cfm" addtoken = "no"/>
	</cfif>

</cfif>


<cfif isdefined("delete_conf")>
	<cfquery datasource="#GIT_protected_system_variable#">
	UPDATE	GIT_user
	SET	isactive = 0
	WHERE	GIT_userID = #lid#
		OR GIT_column_linking_users = #lid#
	</cfquery>

	<cfquery datasource="#GIT_protected_system_variable#">
	UPDATE	a
	SET	isactive = 0, enddate = '#DateFormat(now(), "yyyy-mm-dd")#'
	FROM autoreport_a a
		FROM GIT_table_that_holds_users l ON GIT_userID = GIT_foreign_userID AND yofrequency <= 30 AND a.isactive=1 AND l.isactive=0
	WHERE	GIT_userID = #lid# OR GIT_column_linking_users = #lid#
	</cfquery>

		<!---log action--->
			<cfset logTheAction = 'Deactivated a User' />
			<cfset logActionId = 17 />
			<cfset logVarInfo = 'GIT_userID:'&lid />
			<cfinclude template="insertUserAction.cfm" />
		<!---/log action--->

		<cflocation url="manage_users.cfm" addtoken = "no"/>
</cfif>


<cfif isdefined("delete")>

	Are you sure you wish to permanently remove this user?

	<br /><br />

	<cfoutput>
		<b>#pull_this.descrip1#</b>
	</cfoutput>

	<br /><br />

	<cfform action="#getfilefrompath(cgi.script_name)#" method="post">
	<input type="hidden" name="lid" value="<cfoutput>#lid#</cfoutput>" />
	<input type="hidden" name="delete_conf" value="on" />

		<input type="submit" value="Confirm" class="subbutton" />

	</cfform>

	<cfinclude template="footer.cfm" />

	<cfabort />

</cfif>


<!--- ajax script for updating drop-down options
	this is a really cool script from ajaxf1.com
--->
<script language="javascript" type="text/javascript">

<!--
// Get the HTTP Object
function getHTTPObject(){
   if (window.ActiveXObject) return new ActiveXObject("Microsoft.XMLHTTP");
   else if (window.XMLHttpRequest) return new XMLHttpRequest();
   else {
      return null;
   }
}

// access
function setOutput_access(){
    if(httpObject.readyState == 4){
	document.getElementById('select_access').innerHTML = httpObject.responseText;
    }
}
function doWork_access(){
    httpObject = getHTTPObject();
    if (httpObject != null) {
        httpObject.open("GET", "manage_users_edit_access.cfm?lid=<cfoutput>#lid#</cfoutput>&q_access=" + document.getElementById('q_access').value, true);
        httpObject.onreadystatechange = setOutput_access;
        httpObject.send(null);
    }
}

var httpObject = null;

//-->
</script>
<!--- end of ajax script for updating drop-down options --->
	<table width="110" cellpadding="0" cellspacing="0" border="0">

	<tr><td height="15">&nbsp;</td></tr>

	<tr>
	<td colspan="2">
		<b>Edit a user</b>
		&nbsp; &nbsp;
		<cfif isdefined("conf")>
			<img src="../images/checkmark.gif" width="18" height="17" border="0" />
			&nbsp;&nbsp;
			<a href="manage_users.cfm"><u>click here</u></a> if you are finished updating this user
		<cfelse>
			<a href="manage_users.cfm"><u>Back</u></a>
		</cfif>
	</td>
	</tr>

	<cfoutput query="pull_this">

	<cfform action="#getfilefrompath(cgi.script_name)#" method="post" enctype="multipart/form-data">
	<input type="hidden" name="action" value="go">
	<input type="hidden" name="lid" value="#pull_this.GIT_userID#">

	<tr><td colspan="2" height="30"><hr color="##f0f0f0"></td></tr>

	<cfif isdefined("error")>
		<tr>
		<td colspan="2">
			<span style="color: blue;">
				<b>The username you requested is not available.</b>
			</span>
		</td>
		</tr>
		<tr><td height="40">&nbsp;</td></tr>
	</cfif>

	<tr>
	<td height="27">
		Username:
	</td>
	<td>
		<cfinput type="text" name="username" value="#uname#" size="32" required="yes" message="Please enter a username" />
	</td>
	</tr>

	<tr>
	<td height="27">
		Password:
	</td>
	<td>
		<cfinput type="password" name="password" value="#pword#" size="32" required="yes" message="Please enter a password" />
	</td>
	</tr>

	<tr><td>&nbsp;</td></tr>

	<tr>
	<td height="27">
		Name:
	</td>
	<td>
		<cfinput type="text" name="descrip1" value="#descrip1#" size="32" required="yes" message="Please enter an account name" />
	</td>
	</tr>

	<tr>
	<td height="27">
		Email address:
	</td>
	<td>
		<cfinput type="text" name="accountemail" value="#accountemail#" size="32" />
	</td>
	</tr>

	<cfif pull_topu.userdescrip2 IS NOT "">
	<tr>
	<td height="27">
		#pull_topu.userdescrip2#:
	</td>
	<td>
		<cfinput type="text" name="descrip2" value="#descrip2#" size="32" />
	</td>
	</tr>
	</cfif>

	<tr><td height="35">&nbsp;</td></tr>

	<cfif pull_this.GIT_user_typeID_column EQ 1 OR pull_this.GIT_user_typeID_column EQ 2>

		<input type="hidden" name="access_all" value="on" />
		
		<cfif pull_this.GIT_user_typeID_column EQ 2>
			<tr><td colspan="2"><input type="checkbox" name="access_admin" value="1" id="adminCheck" <cfif pull_this.access_admin EQ 1>checked</cfif>>&nbspGive user admin access</td></tr>
			<tr><td height="35">&nbsp;</td></tr>
			
				
		
		
		<cfelse>
			<input type="hidden" name="access_admin" value="on" />
		</cfif>
		
		
	<cfelse>

		<cfif access_all EQ 0 OR access_all IS "">
			<cfquery datasource="#GIT_protected_system_variable#" name="pull_current">
			SELECT	count (distinct frn_GIT_PhNumid) AS ccount
			FROM	joinGIT_PhNumGIT_user
			WHERE	GIT_foreign_userID = #lid#
			</cfquery>
				<cfset current_count = pull_current.ccount />
		</cfif>
		<tr>
		<td height="30" colspan="2">
			<input type="checkbox" name="access_all" <cfif access_all EQ 1>checked</cfif> id="q_access" onclick="doWork_access();"/> &nbsp;
			access to view all reporting data
			<span style="padding-left: 35px;" id="select_access">
				<cfif isdefined("current_count")>
					<span style="color: orange; font-weight: bold; font-size: 120%;">
						[&nbsp;
					</span>
						#numberFormat(current_count,"9,999")# lines current associated
						&nbsp;-&nbsp;
						<a href="manage_users_edit_associate.cfm?lid=#lid#"><u>manage access</u></a>
					<span style="color: orange; font-weight: bold; font-size: 120%;">
						&nbsp;]
					</span>
				</cfif>
			</span>
		</td>
		</tr>

		<tr>
		<td height="30" colspan="2">
			<input type="checkbox" name="access_admin" <cfif access_admin EQ 1>checked</cfif> /> &nbsp;
			access to administrative privileges &nbsp;(manage numbers, users and settings)
		</td>
		</tr>

		<tr><td height="33">&nbsp;</td></tr>

	</cfif>

	<cfif isdefined("debugJRY")>
		<cfdump var= "#session#"/>
	</cfif>


	<cfif pull_this.GIT_user_typeID_column EQ 2>

		<cfquery datasource="#GIT_protected_system_variable#" name="pull_lskin">
		SELECT	FROM GIT_account, refname, GIT_userID
		FROM	lskin s
			 FROM GIT_table_that_holds_users u ON s.FROM GIT_account = u.frn_FROM GIT_account AND u.GIT_column_linking_users = #lid# AND u.isactive = 1
		WHERE	s.FROM GIT_account IN (#session.GIT_variable_CM_lskin_all#)
			AND s.FROM GIT_account <> #session.GIT_variable_CM_lskin#
		ORDER BY refname
		</cfquery>

		<tr>
		<td height="27" colspan="2">
			Client account associations:
		</td>
		</tr>
		
		<tr><td colspan="2"><input type="checkbox" onClick="toggle(this)" /> Select All</td></tr>
		<tr><td height="35">&nbsp;</td></tr>
		
		<script>
			function toggle(source) {
			  checkboxes = document.getElementsByName('uskin');
			  for(var i=0, n=checkboxes.length;i<n;i++) {
				checkboxes[i].checked = source.checked;
			  }
			}
		</script>

		<cfloop query="pull_lskin">
			<tr>
			<td height="27" colspan="2">
				<input type="checkbox" name="uskin" value="#FROM GIT_account#" <cfif GIT_userID IS NOT "">checked</cfif> />&nbsp; #refname#
			</td>
			</tr>
		</cfloop>
		
		

		<tr><td>&nbsp;</td></tr>

	</cfif>

	<cfif pull_this.GIT_user_typeID_column EQ 1 OR pull_this.GIT_user_typeID_column EQ 2>
		<style>
		.pc-admin-options { display: block; padding-bottom: 30px; }
		.pc-checkbox-holder { display: block; padding-top: 10px; }
		.pcradio { display: none; }
		.pc-checkbox {
			position: relative; display: inline-block; vertical-align: middle; margin-right: 4px;
			width: 16px; height: 16px; border-radius: 50%; border: solid 2px ##007def;
		}
		.pc-checkbox-label { display: inline-block; vertical-align: middle; color: ##007def; }
		.pcradio:checked + label .pc-checkbox div {
			position: absolute; top: 3px; left: 3px; height: 10px; width: 10px;
			background-color: ##007def; border-radius: 50%;
		}
		.existing-phonecode-select { display: none; padding: 10px 0px 10px 30px;  }

		.pc-new-section { display: none; margin: 8px 0px; padding: 15px; border-radius: 3px; border: solid 1px ##007def; }
		.pc-new-row { display: block; padding: 5px 0px; }
		.pc-new-label { display: inline-block; vertical-align: middle; font-size: 12px; color: ##333333; }
		.pc-new-row input { display: inline-block; vertical-align: middle; margin-left: 4px; }

		/* --- styles copied from phonecode-tmpl_cm.cfm --- */
		 .phonecode-container {
			margin-bottom: 16px;
	    	margin-top: -3px;
	    }
	    .phone-code-btn {
	        color: ##007def;
	        font-size: 14px;
	        cursor: pointer;

	    }
	    .account-list-btn {
	        display: inline-block;
	        background-color: ##f6f6f6;
	        border: solid ##dcdcdc 1px;
	        border-radius: 3px;
	        padding: 10px 20px;
	        font-size: 14px;
	        color: ##646464;
	    }
	    .select-arrow {
	        width: 15px;
	    }
	    .box-top-grid {
	        font-size: 0px;
	        text-align: center;
	        background-color: ##f6f6f6;
	        padding: 10px;
	        border-bottom: solid ##dcdcdc 1px;
	        border-top-left-radius: 3px;
	        border-top-right-radius: 3px;
	    }
	    .box-top-cell-1 {
	        display: inline-block;
	        vertical-align: middle;
	        font-size: 16px;
	        width: 50%;
	        text-align: left;
	        line-height: 1;
	        font-size: 14px;
	        color: ##818181;
	    }
	    .box-top-cell-2 {
	        display: inline-block;
	        vertical-align: middle;
	        font-size: 16px;
	        width: 50%;
	        text-align: right;
	    }
		.account-list {
	        font-size: 0px;
	        padding: 0px;
	        margin: 0px;
	        list-style: none;
	    }
	    .account-list li {
	        display: inline-block;
	        vertical-align: middle;
	        width: 50%;
	        text-align: left;
	        font-size: 14px;
			white-space: nowrap;
	  		overflow: hidden;
	 	    text-overflow: ellipsis;
	    }
	    .account-list-item {
	        padding: 5px;
			display: inline-block;
	    }
	     .account-list-item input { display: inline-block; vertical-align: middle; }

	    .box-bottom {
	        padding: 10px;
	        max-height: 245px;
	        overflow: auto;
	    }
	    .deactivated-item {
	        opacity: 0.75;
	        position: relative;
	    }
	    .deactivated-item:after {
	        content: '';
	        background: url("../images/close-x.svg") no-repeat center;
	        background-size: cover;
	        opacity: 0.5;
	        width: 13px;
	        height: 13px;
	        position: absolute;
	        left: 7px;
	        top: 7px;
	    }
	    .account-list-box label {
	    	display: inline-block; vertical-align: middle; width: 90%;
	        line-height: 1;
	        font-size: 14px;
	        color: ##818181;
	        margin-left: 2px;
	        overflow: hidden;
	        white-space: nowrap;
			text-overflow: ellipsis;
			<!--- display: inline-block; --->
	    }
	    .account-list-box input[type=checkbox] {
		<!---         -ms-transform: scale(1.5);
	        -moz-transform: scale(1.5);
	        -webkit-transform: scale(1.5);
	        -o-transform: scale(1.5);
	        padding: 10px; --->
	    }
	    .account-list-box {
			margin: 20px 0px;
	        display: block;
	        background-color: ##ffffff;
	        border: solid ##dcdcdc 1px;
	        -moz-border-radius: 3px;
	        -webkit-border-radius: 3px;
	        border-radius: 3px;
	        -webkit-transition: all 0.5s ease;
	        -moz-transition: all 0.5s ease;
	        -ms-transition: all 0.5s ease;
	        -o-transition: all 0.5s ease;
	        transition: all 0.5s ease;
	    }
	    .show-box {
	        opacity: 1;
	    }
		</style>

		
		<cfquery name='pull_phonecodes' datasource='GIT_variable_CM'>
			With one_of
			AS 
			(
			select distinct dialcode, lename 
				from phonecode p
				where p.frn_FROM GIT_account in (select FROM GIT_account from lskin where masterlskin = <cfqueryParam value="#session.GIT_variable_CM_lskin#" cfsqltype="cf_sql_integer">)
				and dialcode is not null
				and dialcode <> ''
				and dialcode LIKE '[0-9]%'
				and isactive = 1
				and len(dialcode) = 4
			)
			select (select top 1 phonecodeid from phonecode where dialcode = cte.dialcode and lename = cte.lename) as 'phonecodeid', cte.dialcode, cte.lename  
			FROM one_of cte
		</cfquery>
		
		<cfquery name='pull_current_phonecode' datasource='GIT_variable_CM'>
			SELECT frn_phonecodeid
			FROM GIT_table_that_holds_users 
			WHERE GIT_userID = #lid#
			and frn_phonecodeid is not null
		</cfquery>
		
		<tr>
			<td colspan="2">
				<div class="pc-admin-options">
					<div class="pc-checkbox-holder">
						<input id="pc-existing-radio" class="pcradio" type="radio" name="pcradio" value='associate_phonecode'>
						<label for="pc-existing-radio">
							<div class="pc-checkbox"><div></div></div>
							<div class="pc-checkbox-label">Associate this user with an existing phonecode</div>
						</label>
					</div>

					<div class="existing-phonecode-select">
						<select id='associate_with' name='associate_with'>
							<cfif pull_current_phonecode.recordCount GT 0>
								<cfoutput>
									<cfquery name ='pull_current_dialcode' datasource='GIT_variable_CM'>
										SELECT dialcode, lename from phonecode where phonecodeid = #pull_current_phonecode.frn_phonecodeid#
									</cfquery>
									<option value="configured">-- Currently #pull_current_dialcode.dialcode# (#pull_current_dialcode.lename#) --</option>
								</cfoutput>
							<cfelse>
								<option value="">-- select phonecode --</option>
							</cfif>
							
							<cfloop query="pull_phonecodes">
								<option value="#phonecodeid#">#dialcode# (#lename#)</option>
							</cfloop>
						</select>
					</div>
					<script>
						$( document ).ready(function() {
							selected = $( "##associate_with" ).val();
							console.log(selected);
							if (selected == 'configured') {
								$('.existing-phonecode-select').css("display", "block");
								$('##pc-existing-radio').attr('checked',true);
							}
						});
					</script>
					<div class="pc-checkbox-holder">
						<input id="pc-new-radio" class="pcradio" type="radio" name="pcradio" value='create_phonecode'/>
						<label for="pc-new-radio">
							<div class="pc-checkbox"><div></div></div>
							<div class="pc-checkbox-label">Create a new phonecode</div>
						</label>
					</div>
					
					<cfquery name='find_next_available_phonecode' datasource='#application.ds#'>
						SELECT MIN(t.dialcode) AS NextAvailable
						FROM phonecode t
						WHERE NOT EXISTS
							(	SELECT n.dialcode 
								FROM phonecode n 
								WHERE n.dialcode = t.dialcode 
								and n.dialcode is not null
								and n.dialcode <> ''
								and n.dialcode LIKE '[0-9]%'
								and n.isactive = 1
								and n.frn_FROM GIT_account in (select FROM GIT_account from lskin where masterlskin = <cfqueryParam value="#session.GIT_variable_CM_lskin#" cfsqltype="cf_sql_integer">)
								and len(n.dialcode) = 4)
						and t.dialcode is not null
						and t.dialcode <> ''
						and t.dialcode LIKE '[0-9]%'
						and t.isactive = 1
						and len(t.dialcode) = 4	
					</cfquery>
					
					<div class="pc-new-section">
						<div class="pc-new-row">
							<div class="pc-new-label">Reference Name:</div>
							<input class='pc_name_input' type="text" name="refname">
						</div>
						<div class="pc-new-row">
							<div class="pc-new-label">Direct Phone Number:</div>
							<input class='phone_input' oninput="maxLengthCheck(this)" type="number" max = "GIT_Legacy_Filter_Code9" name="phonenumber"> 
						</div>
						<div class="pc-new-row">
							<div class="pc-new-label">Dial Code:</div>
							<input class='dialcode_input' oninput="maxLengthCheck(this)" type = "number" max = "9999" name="dialcode"> 
							<span class='dialcode_validation'>&nbsp;&nbsp;&nbsp;&nbsp; (#find_next_available_phonecode.NextAvailable# is the next available dialcode.)</span>
						</div>
						<div class="pc-new-row">
							<div class="pc-new-label">Choose which accounts this staff member/phone code should be added to:</div>
						</div>


						<cfquery datasource="#GIT_protected_system_variable#" name="pull_GIT_column_linking_users">
							select distinct refname,FROM GIT_account from
							GIT_user le
							FROM GIT_table_that_holds_accounts l on l.FROM GIT_account=le.frn_FROM GIT_account
							WHERE le.isactive=1
							AND l.isactive=1
							AND GIT_column_linking_users=<cfqueryParam value="#session.GIT_variable_CM_GIT_column_linking_users#" cfsqltype="cf_sql_integer">
							AND FROM GIT_account <><cfqueryParam value="#session.GIT_variable_CM_lskin#" cfsqltype="cf_sql_integer">
							Order by refname
						</cfquery>
						
						<div class="account-list-box">
							<div class="box-top-grid">
								<div class="box-top-cell-1">
									<input type="checkbox" class="top-dog" name='AllAccounts'>
									<label>Select All Accounts</label>
								</div>
								
								
								
								<div class="box-top-cell-2">
								</div>
							</div>
							<div class="box-bottom">
								<ul class="account-list">
									 <cfloop query="pull_GIT_column_linking_users">
									 
									 <cfquery name='check_association' datasource='#application.ds#'>
										select GIT_userID
										from GIT_user
										where GIT_column_linking_users = #lid#
										and frn_FROM GIT_account = #FROM GIT_account# 
										and frn_phonecodeid is not null
									 </cfquery>
									 
									 <li>
										<div class="account-list-item">
											<input id="#FROM GIT_account#" class="lskin-id" name="add_pc_FROM GIT_account" value="#FROM GIT_account#" type="checkbox">
											<label for="#FROM GIT_account#" title="#refname#">#refname#</label>
										</div>
									</li>
									</cfloop>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</td>
		</tr>
	</cfif>
	
		<script>
			$( document ).ready(function() {
				$('.top-dog').click(function(event) {  
					if(this.checked) { 
						$('.lskin-id').each(function() { 
							this.checked = true;             
						});
					}else{
						$('.lskin-id').each(function() { 
							this.checked = false;            
						});         
					}
				});		
			});									
		</script>

	<tr>
	<td class='submit_cell' colspan="2">
		<input type="submit" value="Update account" class="subbutton" />
	</td>
	</tr>

	<tr>
	<td class='error_cell' colspan="2">
		
	</td>
	</tr>

	<tr><td height="27">&nbsp;</td></tr>

	<tr>
	<td colspan="2" align="right">
		<a href="#getfilefrompath(cgi.script_name)#?lid=#lid#&delete=on"><u>Remove this user</u></a>
	</td>
	</tr>

	</cfform>
	
		<script>
			$(document).ready(function(){
				$('.pcradio').change(function(){
					phonecodeRadios();
				});
				
				$('.dialcode_input').keyup(function(){
					validate();
				});	
				
				$('.phone_input').keyup(function(){
					validate();
				});	
				
				$('.pc_name_input').keyup(function(){
					validate();
				});	
			});

			function phonecodeRadios(){
				var radioId = $(".pcradio:checked").attr("id");
				if(radioId == "pc-existing-radio"){
					$('.existing-phonecode-select').slideDown(200);//.removeAttr('disabled');
					$('.pc-new-section').slideUp(200);
					$('.error_cell').hide();
					$('.submit_cell').show();
				}
				else {
					$('.existing-phonecode-select').slideUp(200);//.attr('disabled','disabled');
					$('.pc-new-section').slideDown(200);
					$('.submit_cell').hide();
					$('.error_cell').show();
					validate();
				}
			}
			
			function maxLengthCheck(object) {
				if (object.value.length > object.max.length)
				  object.value = object.value.slice(0, object.max.length)
			}
			
			function validate() {
				var show_button = true;
				$('.error_cell').empty();
				$('.submit_cell').hide();
				
				
				if ($('.dialcode_input').val().toString().length !== 4) {
					$('.error_cell').append("<span style='color:red'>Please enter a dialcode containing 4 numbers.</span><br>");
					show_button = false;
				} 
				
				if ($('.dialcode_input').val().length == 4) {
					$.ajax({
						url: "manage_users_edit_dialcode_validation.cfm",
						data: {
							dialcode_input: $('.dialcode_input').val()
						},
						success: function(result){
							$('.dialcode_validation').empty();
							$('.dialcode_validation').append(result);
							console.log(result);
							if (result == 'UNAVAILABLE') {
								$('.submit_cell').hide();
								$('.error_cell').append("<span style='color:red'>Please enter a dialcode that is not already being used.</span><br>");
							}	
						}
					});		
				}				
				
				if ($('.phone_input').val().toString().length !== 10) {
					$('.error_cell').append("<span style='color:red'>Please enter a phone number containing 10 numbers.</span><br>");
					show_button = false;
				} 
				
				if ($('.pc_name_input').val().toString().length < 1) {
					$('.error_cell').append("<span style='color:red'>Please enter a reference name.</span>");
					show_button = false;
				} 
				
				if (show_button == true) {
					$('.submit_cell').show();
				}
			}
			
		</script>	
	
	</cfoutput>


	<tr>
	<td><img src="../images/spacer.gif" width="130" height="5"></td>
	<td><img src="../images/spacer.gif" width="490" height="45"></td>
	</tr>

	</table>



<cfinclude template="footer.cfm" />

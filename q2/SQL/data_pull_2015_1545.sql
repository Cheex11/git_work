--compile a daily count by hour for the number of calls we have sent to the CCC, HGS, or to an agent since the start of January 2015 to present day. The final deliverable should be a file per month containing the following columns: 
--1. Date
--2. Time of day (9am CST to 5pm CST --- one row per hour and the last column should be 4pm containing the calls from 4-5)
--3. Total Calls sent to CCC (any calls we sent to a 1009 number) 4. Total Calls sent to HGS (866-909-3569 and 888-726-4395)

select 
	c.GIT_the_date,
	case when datepart(hh,c.GIT_the_datetime) >= 9 then datepart(hh,c.GIT_the_datetime) else null end as 'hour',
	count(distinct case when cp.GIT_column_that_shows_number_dialedout LIKE '1009%' then GIT_ID_for_call else null end) as 'CCC',
	count(distinct case when dc.frn_GIT_PhNumid is not null then GIT_ID_for_call else null end) as 'hgs',
	count(distinct case when ((r.GIT_PhNum_label NOT LIKE '%unrecognized%'
			AND (r.GIT_PhNum_label LIKE 'Agent - %' OR r.GIT_PhNum_label LIKE '%CCC-Sales%'  OR ISNUMERIC(LEFT(r.GIT_PhNum_label,5))=1 OR r.GIT_PhNum_label = 'Toll Free Catch All') 
			AND ISNULL(r.GIT_PhNum_label, 0) <> 'GIT_Legacy_Filter_Code' )
			OR r.GIT_PhNum_label IS NULL) THEN CALLID ELSE NULL END) as 'new customer'
from archive.dbo.FROM GIT_table_that_holds_call_data_2015 c
	inner join archive.dbo.FROM GIT_table_that_holds_call_data_2015_platform cp on cp.frn_GIT_ID_for_call = c.GIT_ID_for_call
	inner join GIT_PhNum d on c.cf_frn_GIT_PhNumid = d.GIT_PhNumid
	LEFT JOIN phonecode pc ON pc.phonecodeid = c.frn_phonecodeid AND (pc.lename <> 'Multi-line Quote' or pc.lename is null)
	FROM GIT_table_that_holds_numbers dHGS on c.ringto_frn_GIT_PhNumid = dHGS.GIT_PhNumid 
	FROM GIT_table_that_holds_numbersconfig dc ON dc.frn_GIT_PhNumid = dHGS.GIT_PhNumid and dc.in_call_digit_collection = 1
	FROM GIT_table_holding_number_labels r ON c.ringto_frn_GIT_PhNumid = r.frn_GIT_PhNumid AND r.label_place = -1
	FROM GIT_table_that_holds_numbers NC on r.frn_GIT_PhNumid = NC.GIT_PhNumid and NC.label3 <> 'Hughes Button'
where datepart(hh,GIT_the_datetime) >= 9 and datepart(hh,GIT_the_datetime) < 18
	and d.add_FROM GIT_account = GIT_protect_account_ID
	--and DATEPART(dw, c.GIT_the_date) not in (1,7)
group by c.GIT_the_date,datepart(hh,c.GIT_the_datetime)
order by c.GIT_the_date,datepart(hh,c.GIT_the_datetime) 
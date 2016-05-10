--compile a daily count by hour for the number of calls we have sent to the CCC, HGS, or to an agent since the start of January 2015 to present day. The final deliverable should be a file per month containing the following columns: 
--1. Date
--2. Time of day (9am CST to 5pm CST --- one row per hour and the last column should be 4pm containing the calls from 4-5)
--3. Total Calls sent to CCC (any calls we sent to a 1009 number) 4. Total Calls sent to HGS (866-909-3569 and 888-726-4395)

select 
	c.tz_date,
	case when datepart(hh,c.tz_datetime) >= 9 then datepart(hh,c.tz_datetime) else null end as 'hour',
	count(distinct case when cp.dc_dialstring LIKE '1009%' then callid else null end) as 'CCC',
	count(distinct case when dc.frn_dnisid is not null then callid else null end) as 'hgs',
	count(distinct case when ((r.dnis_label NOT LIKE '%unrecognized%'
			AND (r.dnis_label LIKE 'Agent - %' OR r.dnis_label LIKE '%CCC-Sales%'  OR ISNUMERIC(LEFT(r.dnis_label,5))=1 OR r.dnis_label = 'Toll Free Catch All') 
			AND ISNULL(r.dnis_label, 0) <> '999999999' )
			OR r.dnis_label IS NULL) THEN CALLID ELSE NULL END) as 'new customer'
from archive.dbo.xcall_2015 c
	inner join archive.dbo.xcall_2015_platform cp on cp.frn_callid = c.callid
	inner join dnis d on c.cf_frn_dnisid = d.dnisid
	LEFT JOIN phonecode pc ON pc.phonecodeid = c.frn_phonecodeid AND (pc.lename <> 'Multi-line Quote' or pc.lename is null)
	LEFT JOIN dnis dHGS on c.ringto_frn_dnisid = dHGS.dnisid 
	LEFT JOIN dnisconfig dc ON dc.frn_dnisid = dHGS.dnisid and dc.in_call_digit_collection = 1
	LEFT JOIN xdnis_label r ON c.ringto_frn_dnisid = r.frn_dnisid AND r.label_place = -1
	LEFT JOIN dnis NC on r.frn_dnisid = NC.dnisid and NC.label3 <> 'Hughes Button'
where datepart(hh,tz_datetime) >= 9 and datepart(hh,tz_datetime) < 18
	and d.add_lskinid = 1545
	--and DATEPART(dw, c.tz_date) not in (1,7)
group by c.tz_date,datepart(hh,c.tz_datetime)
order by c.tz_date,datepart(hh,c.tz_datetime) 
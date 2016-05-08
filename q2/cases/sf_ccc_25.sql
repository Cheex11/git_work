--Our #1 client is looking into the 600 simultaneous calls that they had on 3/25/16. They are curious about the volumes and where the calls transferred.
--They are wanting an hourly breakdown of call counts - how many were new customers, claims, and service.

-- 39894 total calls to our #1 client on the 25th
select count(distinct GIT_ID_for_call)
from FROM GIT_table_that_holds_call_data_long xl
inner join FROM GIT_table_that_holds_call_data_long_platform on GIT_ID_for_call = frn_GIT_ID_for_call
inner join GIT_PhNum d on d.GIT_PhNumid = xl.cf_frn_GIT_PhNumid
where GIT_the_date = '20160325'
and add_FROM GIT_account = GIT_protect_account_ID

-- 39,894 total calls to our #1 client on the 25th
select count(distinct GIT_ID_for_call)
from FROM GIT_table_that_holds_call_data_long xl
inner join FROM GIT_table_that_holds_call_data_long_platform on GIT_ID_for_call = frn_GIT_ID_for_call
inner join GIT_PhNum d on d.GIT_PhNumid = xl.cf_frn_GIT_PhNumid
where GIT_the_date = '20160325'
and add_FROM GIT_account = GIT_protect_account_ID

-- 24,369 total calls to our #1 client CCC 1009 on the 25th
select 
	count(distinct GIT_ID_for_call)
from FROM GIT_table_that_holds_call_data_long xl
	inner join FROM GIT_table_that_holds_call_data_long_platform cp on GIT_ID_for_call = frn_GIT_ID_for_call
	inner join GIT_PhNum d on d.GIT_PhNumid = xl.cf_frn_GIT_PhNumid
where GIT_the_date = '20160325'
	and add_FROM GIT_account = GIT_protect_account_ID
	AND cp.GIT_column_that_shows_number_dialedout LIKE '1009%'
	AND d.label3 IS NOT NULL

--Calls broken out by 'GIT_column_that_shows_number_dialedout'
select
	distinct cp.GIT_column_that_shows_number_dialedout, count(distinct GIT_ID_for_call) as 'total'
from FROM GIT_table_that_holds_call_data_long xl
	inner join FROM GIT_table_that_holds_call_data_long_platform cp on GIT_ID_for_call = frn_GIT_ID_for_call
	inner join GIT_PhNum d on d.GIT_PhNumid = xl.cf_frn_GIT_PhNumid
where GIT_the_date = '20160325'
	and add_FROM GIT_account = GIT_protect_account_ID
	AND cp.GIT_column_that_shows_number_dialedout LIKE '1009%'
	AND d.label3 IS NOT NULL
group by cp.GIT_column_that_shows_number_dialedout
order by count(distinct GIT_ID_for_call) desc

--Totals by Dialstring
select
	distinct cp.GIT_column_that_shows_number_dialedout, count(distinct GIT_ID_for_call) as 'total'
from FROM GIT_table_that_holds_call_data_long xl
	inner join FROM GIT_table_that_holds_call_data_long_platform cp on GIT_ID_for_call = frn_GIT_ID_for_call
	inner join GIT_PhNum d on d.GIT_PhNumid = xl.cf_frn_GIT_PhNumid
where GIT_the_date = '20160325'
	and add_FROM GIT_account = GIT_protect_account_ID
	AND cp.GIT_column_that_shows_number_dialedout LIKE '1009%'
	AND d.label3 IS NOT NULL
group by cp.GIT_column_that_shows_number_dialedout
order by count(distinct GIT_ID_for_call) desc

--Calls by dialstring with hourly totals:
select
	distinct cp.GIT_column_that_shows_number_dialedout, count(distinct GIT_ID_for_call) as 'total',
	Sum(CASE 
		    WHEN Datepart(hh, c.GIT_the_datetime) = 0 THEN 1 
		    ELSE 0 
		END) AS TWELVE_AM, 
	Sum(CASE 
		    WHEN Datepart(hh, c.GIT_the_datetime) = 1 THEN 1 
		    ELSE 0 
		END) AS ONE_AM, 
	Sum(CASE 
		    WHEN Datepart(hh, c.GIT_the_datetime) = 2 THEN 1 
		    ELSE 0 
		END) AS TWO_AM, 
	Sum(CASE 
		    WHEN Datepart(hh, c.GIT_the_datetime) = 3 THEN 1 
		    ELSE 0 
		END) AS THREE_AM, 
	Sum(CASE 
		    WHEN Datepart(hh, c.GIT_the_datetime) = 4 THEN 1 
		    ELSE 0 
		END) AS FOUR_AM, 
	Sum(CASE 
		    WHEN Datepart(hh, c.GIT_the_datetime) = 5 THEN 1 
		    ELSE 0 
		END) AS FIVE_AM, 
	Sum(CASE 
		    WHEN Datepart(hh, c.GIT_the_datetime) = 6 THEN 1 
		    ELSE 0 
		END) AS SIX_AM, 
	Sum(CASE 
		    WHEN Datepart(hh, c.GIT_the_datetime) = 7 THEN 1 
		    ELSE 0 
		END) AS SEVEN_AM, 
	Sum(CASE 
		    WHEN Datepart(hh, c.GIT_the_datetime) = 8 THEN 1 
		    ELSE 0 
		END) AS EIGHT_AM, 
	Sum(CASE 
		    WHEN Datepart(hh, c.GIT_the_datetime) = 9 THEN 1 
		    ELSE 0 
		END) AS NINE_AM, 
	Sum(CASE 
		    WHEN Datepart(hh, c.GIT_the_datetime) = 10 THEN 1 
		    ELSE 0 
		END) AS TEN_AM, 
	Sum(CASE 
		    WHEN Datepart(hh, c.GIT_the_datetime) = 11 THEN 1 
		    ELSE 0 
		END) AS ELEVEN_AM, 
	Sum(CASE 
		    WHEN Datepart(hh, c.GIT_the_datetime) = 12 THEN 1 
		    ELSE 0 
		END) AS TWELVE_PM, 
	Sum(CASE 
		    WHEN Datepart(hh, c.GIT_the_datetime) = 13 THEN 1 
		    ELSE 0 
		END) AS ONE_PM, 
	Sum(CASE 
		    WHEN Datepart(hh, c.GIT_the_datetime) = 14 THEN 1 
		    ELSE 0 
		END) AS TWO_PM, 
	Sum(CASE 
		    WHEN Datepart(hh, c.GIT_the_datetime) = 15 THEN 1 
		    ELSE 0 
		END) AS THREE_PM, 
	Sum(CASE 
		    WHEN Datepart(hh, c.GIT_the_datetime) = 16 THEN 1 
		    ELSE 0 
		END) AS FOUR_PM, 
	Sum(CASE 
		    WHEN Datepart(hh, c.GIT_the_datetime) = 17 THEN 1 
		    ELSE 0 
		END) AS FIVE_PM, 
	Sum(CASE 
		    WHEN Datepart(hh, c.GIT_the_datetime) = 18 THEN 1 
		    ELSE 0 
		END) AS SIX_PM, 
	Sum(CASE 
		    WHEN Datepart(hh, c.GIT_the_datetime) = 19 THEN 1 
		    ELSE 0 
		END) AS SEVEN_PM, 
	Sum(CASE 
		    WHEN Datepart(hh, c.GIT_the_datetime) = 20 THEN 1 
		    ELSE 0 
		END) AS EIGHT_PM, 
	Sum(CASE 
		    WHEN Datepart(hh, c.GIT_the_datetime) = 21 THEN 1 
		    ELSE 0 
		END) AS NINE_PM, 
	Sum(CASE 
		    WHEN Datepart(hh, c.GIT_the_datetime) = 22 THEN 1 
		    ELSE 0 
		END) AS TEN_PM, 
	Sum(CASE 
		    WHEN Datepart(hh, c.GIT_the_datetime) = 23 THEN 1 
		    ELSE 0 
		END) AS ELEVEN_PM
from FROM GIT_table_that_holds_call_data_long c
	inner join FROM GIT_table_that_holds_call_data_long_platform cp on GIT_ID_for_call = frn_GIT_ID_for_call
	inner join GIT_PhNum d on d.GIT_PhNumid = c.cf_frn_GIT_PhNumid
where GIT_the_date = '20160325'
	and add_FROM GIT_account = GIT_protect_account_ID
	AND cp.GIT_column_that_shows_number_dialedout LIKE '1009%'
	AND d.label3 IS NOT NULL
group by cp.GIT_column_that_shows_number_dialedout
order by count(distinct GIT_ID_for_call) desc
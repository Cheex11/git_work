<!DOCTYPE html>

<html>
<head>

	<meta name="description" content="Call measurement solutions powered by Century Interactive">
	<meta name="keywords" content="call measurement, call tracking, cms, GIT_variable_CM, pay-per-call, pay per call, marketing, marketing roi, marketing return on investment, advertising roi, advertising return on investment">
	<meta http-equiv="X-UA-Compatible" content="IE=9">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<!--- Client side cache prevention --->
	<meta http-equiv="Expires" content="0">

	<!--- For when we are ready for a responsive mobile version --->
	 <meta name='viewport' content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0'/>

		<title></title>
		<!--- Favicon --->
		<link rel="icon" type="image/png" href="../../images/cw/favicon.png">
		<link rel="shortcut icon" href="../../images/cw/favicon.ico" type="image/x-icon">
		<link rel="icon" href="../../images/cw/favicon.ico" type="image/x-icon">


	<!-- Fonts -->
	<link href='//fonts.googleapis.com/css?family=Roboto:100,300,700,400' rel='stylesheet' type='text/css'>

	<script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
	<script type="text/javascript" src="../../platform_allies/js/disable-dragging.js"></script>
	<script type="text/javascript" src="../../platform_allies/js/jQueryRotateCompressed.js"></script>

</head>
<body>
<style>
	/* ----------------- */
	/* --- CSS RESET --- */
	/* ----------------- */
	html, body, div, span, applet, object, iframe,
	h1, h2, h3, h4, h5, h6, p, blockquote, pre,
	a, abbr, acronym, address, big, cite, code,
	del, dfn, em, img, ins, kbd, q, s, samp,
	small, strike, strong, sub, sup, tt, var,
	b, u, i, center,
	dl, dt, dd, ol, ul, li,
	fieldset, form, label, legend,
	table, caption, tbody, tfoot, thead, tr, th, td,
	article, aside, canvas, details, embed,
	figure, figcaption, footer, header, hgroup,
	menu, nav, output, ruby, section, summary,
	time, mark, audio, video {
		margin: 0;
		padding: 0;
		border: 0;
		font-size: 100%;
		font: inherit;
		vertical-align: baseline;
		outline: none;
	}
	/* HTML5 display-role reset for older browsers */
	article, aside, details, figcaption, figure,
	footer, header, hgroup, menu, nav, section {
		display: block;
	}
	body {
		line-height: 1;
	}
	ol, ul {
		list-style: none;
	}
	blockquote, q {
		quotes: none;
	}
	blockquote:before, blockquote:after,
	q:before, q:after {
		content: '';
		content: none;
	}
	table {
		border-collapse: separate;
		border-spacing: 0;
	}

	a {
		text-decoration: none;
	}

	/* ---------------- */
	/* --- MAIN CSS --- */
	/* ---------------- */
	body { background-color: #ededed; font-family: 'Roboto', sans-serif;}
	ul, li { list-style-type: none; }
	p { margin: 0px; }


	.header-section {
		display: block;
		position: relative;
		margin: 20px auto 0px auto;
		left: 0%; right: 0%;
		padding: 10px 0px;
		max-width: 940px;
	}
	.header-section h1 {
		font-size: 36px; font-weight: 200; color: #a0a0a0;
		margin: 0px; padding: 0px;
	}
	.list-holder {
		display: block;
		position: relative;
		margin: 0px auto 30px auto;
		left: 0%; right: 0%;
		padding: 20px;
		max-width: 900px;
		background-color: #ffffff;
		margin-top:50px;
	}
	.staff-list {
		display: block;
		position: relative;
		margin: 0px;
		padding: 0px !important;
	}
	.staff-list-labels-row {
		font-size: 12px;
		line-height: 16px;
		-webkit-touch-callout: none;
		-webkit-user-select: none;
		-khtml-user-select: none;
		-moz-user-select: none;
		-ms-user-select: none;
		user-select: none;
		padding-bottom: 8px;
	}
	.list-block {
		font-size: inherit;
		line-height: inherit;
		color: inherit;
		display: inline-block;
		vertical-align: middle;
		text-align: center;
		padding: 0px;
	}
	.column-1 {
		text-align: left !important; width: 28%;
	}
	.column-2, .column-3, .column-4 {
		text-align: right !important; width: 24%;
	}

	.list-label {
		display: inline-block;
		vertical-align: middle;
		text-align: left;
		padding-left: 6px;
	}
	.list-label img {
		display: inline-block;
		vertical-align: middle;
		background-color: #a7a7a7;
	}
	.list-label p {
		display: inline-block;
		vertical-align: middle;
		padding-left: 3px;
		color: #a7a7a7;
	}
	.staff-list-labels-row div:hover {
		cursor: pointer;
	}
	.staff-list-labels-row div:hover a img {
		background-color: #007def;
	}
	.staff-list-labels-row div:hover a p {
		color: #007def;
	}
	.staff-list-row {
		display: block;
		position: relative;
		margin: 0px;
		padding: 0px;
		font-size: 16px;
		color: #a7a7a7;
		/*outline: solid 1px #f0f0f0;*/
	}
	.staff-list-row:nth-child(even){
		background-color: #f0f0f0;
	}
	.agent-img { display: block; padding-right: 8px; overflow: hidden; }
	.agent-img img, .agent-img p {
		display: inline-block;
		vertical-align: middle;
	}
	.lename {
		color: #535353;
		font-size: 14px;
		line-height: 30px;
		text-transform: capitalize;
		white-space:nowrap;
		text-overflow: ellipsis;
		overflow: hidden;
	}
	.agent-photo {
		display: inline-block;
		vertical-align: middle;
		position: relative;
		margin: 0px;
		margin-right: 10px;
		padding: 0px;
		width: 16px;
		height: 16px;
		-moz-border-radius: 50%;
		-webkit-border-radius: 50%;
		border-radius: 50%;
		overflow: hidden;
	}
	.agent-photo img {
		display: block;
		width: 100%;
	}
	.data-cell {
		text-align: center;
		color: #535353;
	}
	.data-cell span {
		display: block;
		padding-right: 8px;
		font-size: 12px;
		font-weight: 400;
		line-height: 30px;
		text-decoration: none;
	}
	.data-cell a {
		display: block;
		padding-right: 8px;
		color: #007def;
		font-size: 12px;
		font-weight: 400;
		line-height: 30px;
		text-decoration: none;
	}
	.data-cell a:hover {
		text-decoration: underline;
	}
	.column-1 .lename, .column-2 a, .column-3 a, .column-4 a  {
		border-right: solid #cacaca 1px;
		border-top: solid #cacaca 1px;
	}
	.column-1 .lename { border-left: solid #cacaca 1px; padding-left: 8px; }
	{ padding-right: 8px; }
	.staff-list-labels-row a, .staff-list-labels-row span { border: solid 0px #ffffff !important; }
	.staff-list-row:last-child { border-bottom: solid #cacaca 1px; }

	.car-wars-sales-note {
		font-size: 12px; color: #666; margin-bottom: 15px; text-align: right;
	}

	.mobile-back-button {
		display: none;
	}

	@media screen and (max-width: 400px), screen and (max-device-width: 400px) {
	.staff-list-row .column-1, .staff-list-labels-row .column-1 {
		display: block;
		text-align: center !important;
		width: 100%;
	}
	.staff-list-labbels-row .column-1 {
		margin-bottom: 10px;
	}
	.staff-list-row .column-2,.staff-list-row .column-3,.staff-list-row .column-4,.staff-list-row .column-5,
	.staff-list-labels-row .column-2,.staff-list-labels-row .column-3,.staff-list-labels-row .column-4,.staff-list-labels-row .column-5 {
	width: 25%;
	}
	.bottom-menu { padding-top: 10px; }
	.staff-list-row {
		border-bottom: 1px solid #ccc;
		margin: 10px 0px;
	}
	.staff-list-row .column-2 {
		width: 24.5%;
		border-left: 1px solid #ccc;
	}
	.mobile-back-button {
		display: block;
		padding: 10px;
		margin: 5px 0px 0px 5px;
		border-radius: 3px;
	}
}
	</style>
	
	<cfinclude template='wsc_tracking_report_queries.cfm'>
	
	<div class="list-holder">
		<ul class="staff-list">
			<li class="staff-list-labels-row">
				<div class="list-block column-1" style="background-color: rgba(0,0,0,0);">
					<a class="list-label" href="" onclick="return false;">
						<p class="staff-label-1">Source</p><img src="../../images/redux/performance-report-cw/wct-down-arrow.png"/>
					</a>
				</div><div class="list-block column-2" style="background-color: rgba(0,0,0,0);">
					<a class="list-label" href="" onclick="return false;">
						<p class="staff-label-2">Calls</p><img src="../../images/redux/performance-report-cw/wct-down-arrow.png"/>
					</a>
				</div><div class="list-block column-3" style="background-color: rgba(0,0,0,0);">
					<a class="list-label" href="" onclick="return false;">
						<p class="staff-label-3">Sales Opportunities</p><img src="../../images/redux/performance-report-cw/wct-down-arrow.png"/>
					</a>
				</div><div class="list-block column-4" style="background-color: rgba(0,0,0,0);">
					<a class="list-label" href="" onclick="return false;">
						<p class="staff-label-4">Booked Appointments</p><img src="../../images/redux/performance-report-cw/wct-down-arrow.png"/>
					</a>
				</div>
			</li>
			<cfoutput query='pull_sources'>
					<!-- Connected Calls -->
						<cfset outURLConnected="../cx/clickthrough.cfm?">
						<cfset outURLConnected=outURLConnected&'this_start='&#URLEncodedFormat(this_start)#>
						<cfset outURLConnected=outURLConnected&'&this_end='&#URLEncodedFormat(this_end)#>
						<cfset outURLConnected=outURLConnected&'&WSC_source='&#URLEncodedFormat(siteID)#>
						<cfset outURLConnected=outURLConnected&'&UTM_Source='&#URLEncodedFormat(utm_source)#>
					<!-- Sales Opps -->
						<cfset outURLSales="../cx/clickthrough.cfm?">
						<cfset outURLSales=outURLSales&'this_start='&#URLEncodedFormat(this_start)#>
						<cfset outURLSales=outURLSales&'&this_end='&#URLEncodedFormat(this_end)#>
						<cfset outURLSales=outURLSales&'&WSC_source='&#URLEncodedFormat(siteID)#>
						<cfset outURLSales=outURLSales&'&UTM_Source='&#URLEncodedFormat(utm_source)#>
						<cfset outURLSales=outURLSales&'&WSC_hco='&#URLEncodedFormat(sales_opp_hco)#>

					<!-- Appt Requests -->
						<cfset outURLBooked="../cx/clickthrough.cfm?">
						<cfset outURLBooked=outURLBooked&'this_start='&#URLEncodedFormat(this_start)#>
						<cfset outURLBooked=outURLBooked&'&this_end='&#URLEncodedFormat(this_end)#>
						<cfset outURLBooked=outURLBooked&'&WSC_source='&#URLEncodedFormat(siteID)#>
						<cfset outURLBooked=outURLBooked&'&UTM_Source='&#URLEncodedFormat(utm_source)#>
						<cfset outURLBooked=outURLBooked&'&WSC_hco='&#URLEncodedFormat(booked_appt_hco)#>
						
				<li class="staff-list-row">
					<div class="list-block column-1">
						<p class="lename">#utm_source#</p>
					</div><div class="list-block column-2 data-cell">
						<a href="../thinking.cfm?redirect=#URLEncodedFormat(outURLConnected)#">#Total_Calls#</a>
					</div><div class="list-block column-3 data-cell">
						<a href="../thinking.cfm?redirect=#URLEncodedFormat(outURLSales)#">#Sales_Opps#</a>
					</div><div class="list-block column-4 data-cell">
						<a href="../thinking.cfm?redirect=#URLEncodedFormat(outURLBooked)#">#Booked_Appt#</a>
					</div>
				</li>
			</cfoutput>
		</ul>
	</div>

	<script>
	/* ------------------------------ */
/* --- STAFF SORTING / PAGING --- */
/* ------------------------------ */
$(document).ready(function(){

	var toggle = [0,0,0,0,0];
	var pageItems = $('.staff-list-row').length;
	var totalItems = $('.staff-list-row').length;
	var pageMin = 1;
	var pageMax = pageItems+1;
	var pageMaxLabel = pageMax - 1;
	$('.list-prev-btn').css("visibility","hidden");
	$('.staff-list-labels-row').children('div').click(function(){
		// --- column 1 ---
		if($(this).hasClass("column-1")){
			var column1 = [];
			$('.staff-list-row').each(function(){
				var staffValue = $(this).children('.column-1').text().trim().toLowerCase();
				column1.push(staffValue);
			});
			if(toggle[0] == 0){
				$(this).find(".list-label").children('img').rotate(0);
				column1.sort();
				toggle[0] = 1;
			}
			else if(toggle[0] == 1 ){
				$(this).find(".list-label").children('img').rotate(180);
				column1.sort();
				column1.reverse();
				toggle[0] = 0;
			}
			// --- rearrange list items
			$('.staff-list-row').css("display","none");
			for (var i = 0; i < column1.length; i++) {
				var name = column1[i];
				$('.staff-list-row').each(function(){
					var lename = $(this).find('.lename').text().trim().toLowerCase();
					if(lename == name){
						$(this).detach().appendTo('.staff-list').css("display","block");
					}
				});
			}
			$('.staff-list-row').each(function(i){
				if(i >= pageItems){
					$(this).css("display","none");
				}
				i++;
			});
			// --- reset paging
			pageMin = 1;
			pageMax = pageItems+1;
			pageMaxLabel = pageMax - 1;
			$('.staff-list-page').text("").text(pageMin + " - " + pageMaxLabel + " of " + totalItems);
			$('.list-next-btn').css("visibility","visible");
			$('.list-prev-btn').css("visibility","hidden");
			// --- color tabs
			$(this).children('a').children('img').addClass('active-tab-img');
			$(this).siblings('.list-block').children('a').children('img').removeClass('active-tab-img');
			$(this).children('a').children('p').addClass('active-tab-p');
			$(this).siblings('.list-block').children('a').children('p').removeClass('active-tab-p');
		}
		// --- column 2 ---
		if($(this).hasClass("column-2")){
			var column2 = [];
			$('.staff-list-row').each(function(){
				var staffValue = parseInt(($(this).children('.column-2').text().trim()),10);
				column2.push(staffValue);
			});
			if(toggle[1] == 0){
				$(this).find(".list-label").children('img').rotate(180);
				column2.sort(function(a, b){return a-b});
				toggle[1] = 1;
			}
			else if(toggle[1] == 1 ){
				$(this).find(".list-label").children('img').rotate(0);
				column2.sort(function(a, b){return b-a});
				toggle[1] = 0;
			}
			// --- rearrange list items
			$('.staff-list-row').css("display","none");
			for (var i = 0; i < column2.length; i++) {
				var sortedNumber = column2[i];
				$('.staff-list-row').each(function(){
					var thisNumber = parseInt(($(this).children('.column-2').text().trim()),10);
					if(thisNumber == sortedNumber) {
						$(this).detach().appendTo('.staff-list').css("display","block");
					}
				});
			}
			$('.staff-list-row').each(function(i){
				if(i >= pageItems){
					$(this).css("display","none");
				}
				i++;
			});
			// --- reset paging
			pageMin = 1;
			pageMax = pageItems+1;
			pageMaxLabel = pageMax - 1;
			$('.staff-list-page').text("").text(pageMin + " - " + pageMaxLabel + " of " + totalItems);
			$('.list-next-btn').css("visibility","visible");
			$('.list-prev-btn').css("visibility","hidden");
			// --- color tabs
			$(this).children('a').children('img').addClass('active-tab-img');
			$(this).siblings('.list-block').children('a').children('img').removeClass('active-tab-img');
			$(this).children('a').children('p').addClass('active-tab-p');
			$(this).siblings('.list-block').children('a').children('p').removeClass('active-tab-p');
		}
		// --- column 3 ---
		if($(this).hasClass("column-3")){
			var column3 = [];
			$('.staff-list-row').each(function(){
				var staffValue = $(this).children('.column-3').text().trim();
				staffValue = staffValue.split(" ");
				staffValue = parseInt((staffValue[0]),10);
				column3.push(staffValue);
			});
			if(toggle[2] == 0){
				$(this).find(".list-label").children('img').rotate(180);
				column3.sort(function(a, b){return a-b});
				toggle[2] = 1;
			}
			else if(toggle[2] == 1 ){
				$(this).find(".list-label").children('img').rotate(0);
				column3.sort(function(a, b){return b-a});
				toggle[2] = 0;
			}
			// --- rearrange list items
			$('.staff-list-row').css("display","none");
			for (var i = 0; i < column3.length; i++) {
				var sortedNumber = column3[i];
				$('.staff-list-row').each(function(){
					var thisNumber = $(this).children('.column-3').text().trim();
					thisNumber = thisNumber.split(" ");
					thisNumber = parseInt((thisNumber[0]),10);
					if(thisNumber == sortedNumber) {
						$(this).detach().appendTo('.staff-list').css("display","block");
					}
				});
			}
			$('.staff-list-row').each(function(i){
				if(i >= pageItems){
					$(this).css("display","none");
				}
				i++;
			});
			// --- reset paging
			pageMin = 1;
			pageMax = pageItems+1;
			pageMaxLabel = pageMax - 1;
			$('.staff-list-page').text("").text(pageMin + " - " + pageMaxLabel + " of " + totalItems);
			$('.list-next-btn').css("visibility","visible");
			$('.list-prev-btn').css("visibility","hidden");
			// --- color tabs
			$(this).children('a').children('img').addClass('active-tab-img');
			$(this).siblings('.list-block').children('a').children('img').removeClass('active-tab-img');
			$(this).children('a').children('p').addClass('active-tab-p');
			$(this).siblings('.list-block').children('a').children('p').removeClass('active-tab-p');
		}
		// --- column 4 ---
		if($(this).hasClass("column-4")){
			var column4 = [];
			$('.staff-list-row').each(function(){
				var staffValue = parseInt(($(this).children('.column-4').text().trim()),10);
				column4.push(staffValue);
			});
			if(toggle[3] == 0){
				$(this).find(".list-label").children('img').rotate(180);
				column4.sort(function(a, b){return a-b});
				toggle[3] = 1;
			}
			else if(toggle[3] == 1 ){
				$(this).find(".list-label").children('img').rotate(0);
				column4.sort(function(a, b){return b-a});
				toggle[3] = 0;
			}
			// --- rearrange list items
			$('.staff-list-row').css("display","none");
			for (var i = 0; i < column4.length; i++) {
				var sortedNumber = column4[i];
				$('.staff-list-row').each(function(){
					var thisNumber = parseInt(($(this).children('.column-4').text().trim()),10);
					if(thisNumber == sortedNumber) {
						$(this).detach().appendTo('.staff-list').css("display","block");
					}
				});
			}
			$('.staff-list-row').each(function(i){
				if(i >= pageItems){
					$(this).css("display","none");
				}
				i++;
			});
			// --- reset paging
			pageMin = 1;
			pageMax = pageItems+1;
			pageMaxLabel = pageMax - 1;
			$('.staff-list-page').text("").text(pageMin + " - " + pageMaxLabel + " of " + totalItems);
			$('.list-next-btn').css("visibility","visible");
			$('.list-prev-btn').css("visibility","hidden");
			// --- color tabs
			$(this).children('a').children('img').addClass('active-tab-img');
			$(this).siblings('.list-block').children('a').children('img').removeClass('active-tab-img');
			$(this).children('a').children('p').addClass('active-tab-p');
			$(this).siblings('.list-block').children('a').children('p').removeClass('active-tab-p');
		}
		// --- column 5 ---
		if($(this).hasClass("column-5")){
			var column5 = [];
			$('.staff-list-row').each(function(){
				var staffValue = parseInt(($(this).children('.column-5').children('a').text().trim()),10);
				column5.push(staffValue);
			});
			if(toggle[4] == 0){
				$(this).find(".list-label").children('img').rotate(180);
				column5.sort(function(a, b){return a-b});
				toggle[4] = 1;
			}
			else if(toggle[4] == 1 ){
				$(this).find(".list-label").children('img').rotate(0);
				column5.sort(function(a, b){return b-a});
				toggle[4] = 0;
			}
			// --- rearrange list items
			$('.staff-list-row').css("display","none");
			for (var i = 0; i < column5.length; i++) {
				var sortedNumber = column5[i];
				$('.staff-list-row').each(function(){
					var thisNumber = parseInt(($(this).children('.column-5').children('a').text().trim()),10);
					if(thisNumber == sortedNumber) {
						$(this).detach().appendTo('.staff-list').css("display","block");
					}
				});
			}
			$('.staff-list-row').each(function(i){
				if(i >= pageItems){
					$(this).css("display","none");
				}
				i++;
			});
			// --- reset paging
			pageMin = 1;
			pageMax = pageItems+1;
			pageMaxLabel = pageMax - 1;
			$('.staff-list-page').text("").text(pageMin + " - " + pageMaxLabel + " of " + totalItems);
			$('.list-next-btn').css("visibility","visible");
			$('.list-prev-btn').css("visibility","hidden");
			// --- color tabs
			$(this).children('a').children('img').addClass('active-tab-img');
			$(this).siblings('.list-block').children('a').children('img').removeClass('active-tab-img');
			$(this).children('a').children('p').addClass('active-tab-p');
			$(this).siblings('.list-block').children('a').children('p').removeClass('active-tab-p');
		}
	});

	// --- PAGING ---
	$('.staff-list-row').css("display","none");
	$('.staff-list-row').each(function(i){
		var pageNumber = (i/pageItems)+1;
		pageNumber = Math.floor(pageNumber);
		if(pageNumber <= 1){
			$(this).css("display","block");
		}
		i++;
	});
	if(totalItems < pageMax){
		$('.list-next-btn').css("visibility","hidden");
		$('.list-prev-btn').css("visibility","hidden");
		pageMaxLabel = totalItems
	}
	$('.staff-list-page').text("").text(pageMin + " - " + pageMaxLabel + " of " + totalItems);

	// --- next page
	$('.list-next-btn').click(function(){
		pageMin = pageMin + pageItems;
		pageMax = pageMax + pageItems;
		pageMaxLabel = pageMax - 1;
		$('.staff-list-row').css("display","none");
		$('.staff-list-row').each(function(){
			var index = $(this).index();
			if(index >= pageMin && index < pageMax){
				$(this).css("display","block");
			}
		});
		$('.list-prev-btn').css("visibility","visible");
		if(pageMaxLabel <= totalItems){
			$('.staff-list-page').text("").text(pageMin + " - " + pageMaxLabel + " of " + totalItems);
			$('.list-prev-btn').css("visibility","visible");
			if(pageMaxLabel == totalItems){
				$('.list-next-btn').css("visibility","hidden");
			}
		}
		else {
			$('.staff-list-page').text("").text(pageMin + " - " + totalItems + " of " + totalItems);
			$('.list-next-btn').css("visibility","hidden");
		}
	});

	// --- prev page
	$('.list-prev-btn').click(function(){
		pageMin = pageMin - pageItems;
		pageMax = pageMax - pageItems;
		pageMaxLabel = pageMax - 1;
		$('.staff-list-row').css("display","none");
		$('.staff-list-row').each(function(){
			var index = $(this).index();
			if(index >= pageMin && index < pageMax){
				$(this).css("display","block");
			}
		});
		if(pageMin >= 1){
			$('.staff-list-page').text("").text(pageMin + " - " + pageMaxLabel + " of " + totalItems);
			$('.list-next-btn').css("visibility","visible");
			if(pageMin == 1) {
				$('.list-prev-btn').css("visibility","hidden");
			}
		}
		else {
			$('.staff-list-page').text("").text(pageMin + " - " + pageMaxLabel + " of " + totalItems);
			$('.list-prev-btn').css("visibility","hidden");
		}
	});

});
	</script>
		</body>
</html>
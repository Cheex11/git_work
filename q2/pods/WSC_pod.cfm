<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">
<style>
/* ********************* */
/* ****   GLOBAL    **** */
/* ********************* */
.container {
	width: 1100px;
}
.close-pop-up {
	color:#4b4b4b;
	font-size:18px;
	position:absolute;
	top:2px;
	right:6px;
	cursor:pointer;
	padding:10px;
}
.close-pop-up:hover {
	color:red;
}
label {
-webkit-touch-callout: none;
-webkit-user-select: none;
-khtml-user-select: none;
-moz-user-select: none;
-ms-user-select: none;
user-select: none;
}
select {
	display: inline-block;
    vertical-align: middle;
    position: relative;
    padding: 5px;
    padding-right: 35px;
    min-width: 180px;
    background-color: #fafafa;
    border: solid #d6d6d6 1px;
    -moz-border-radius: 3px;
    -webkit-border-radius: 3px;
    border-radius: 3px;
    outline: none;
    cursor: pointer;
    -moz-box-shadow: inset 0px 1px 2px rgba(0,0,0,0.1);
    -webkit-box-shadow: inset 0px 1px 2px rgba(0,0,0,0.1);
    box-shadow: inset 0px 1px 2px rgba(0,0,0,0.1);
    -webkit-appearance: none;
    -moz-appearance: none;
    appearance: none;
	margin-right: 10px;
}
.dropdown-arrow {
	margin-left: -35px; margin-right: 10px; position: relative;
}
.finished-number-selection-btn {
	background-color:#007def;
	color:White;
	border-radius:3px;
	-webkit-border-radius:3px;
	-moz-border-radius:3px;
	cursor:pointer;
	padding:9px 24px;
	text-align:center;
	margin:0 auto;
	display:inline-block;
	margin-top:7px;
}
.finished-number-selection-btn:hover {
	opacity:.8;
}
.calls-never-connected {
	margin:0 auto;
	display:inline-block;
	padding:0;
	font-style:italic;
	font-size:14px;
	color:#838383;
	margin:0px 20px;
	height: 22px;
}
.section-header-top-holder {
	border-bottom: 1px solid #dedede;
}
.section-1 {
	display: block;
	position: relative;
	float: none;
	margin-top: 10px;
	margin-bottom: 40px;
	text-align: left;
}
.section-2, .section-3 {
	display: block;
	position: relative;
	float: none;
	margin-top: 10px;
	margin-bottom: 40px;
}
.section-header {
	display: block;
	position: relative;
	margin-bottom: 16px;
	color: #b4b4b4;
	font-size: 35px;
	line-height: 35px;
	font-weight: 200;
	border-bottom: solid 1px #ececec;
}
.section-header-top {
	display: inline-block;
	width:100%;
	position: relative;
	color: #b4b4b4;
	font-size: 35px;
	line-height: 35px;
	font-weight: 200;
	padding-bottom: 6px;
	text-align: left;
}
.module-holder-large {
	display: inline-block;
	position: relative;
	width: 100%;
}
.module-holder-large .module {
	margin-bottom: 20px !important;
}
.module-holder-small {
	display: inline-block;
	vertical-align: top;
	position: relative;
	width: 400px;
}
.module {
	display: block;
	position: relative;
	padding: 0px;
	background-color: #ffffff;
	text-align: center;
	border-radius: 3px;
	overflow: hidden;
	z-index:1;
}
.left-module {
	margin-left: 0px !important;
	width:49%;
	display:inline-block;
}
.right-module {
	margin-right: 0px !important;
	width:49%;
	display:inline-block;
}
.module-header {
	display: block;
	position: relative;
	padding: 16px 0px;
	color: #4b4b4b;
	font-size: 22px;
	line-height: 14px;
	border-bottom:1px solid #d0d0d0;
	font-weight: 400;
}
.benchmark-holder {
	overflow: hidden;
}
.loading-gif {
	display: block;
	padding: 15px 5px;
	margin-bottom: 20px;
}
.loading-gif p {
	font-size: 12px;
	line-height: 16px;
	color: #b4b4b4;
}

/* ********************** */
/* ****  MODULE ONE  **** */
/* ********************** */
.totals-arrow {
	display: block;
	padding: 0px 7px;
}
.totals-data {
	display: block;
	position: relative;
	margin: 0px 20px;
	padding: 20px 0px;
	border-bottom: solid 1px #ededed;
}
.totals-data li {
	display: inline-block;
	vertical-align: middle;
}
.totals-numbers {
	display: block;
	text-align: center;
}
.totals-numbers p:first-child {
	font-size: 24px;
	line-height: 24px;
	font-weight: 600;
	font-style: italic;
}
.totals-numbers p:last-child {
	padding-top: 3px;
	font-size: 12px;
	line-height: 12px;
	font-weight: 600;
	font-style: italic;
	color: #575757;
}
.totals-booked {
	font-size: 12px;
	line-height: 12px;
	font-weight: 600;
	font-style: italic;
	color: #575757;
}
.totals-booked p {
	text-align: left;
	padding: 4px 0px;
}
.totals-charts {
	display: block;
	position: relative;
	margin: 0px;
	padding: 0px;
}
.totals-charts li {
	display: inline-block;
	vertical-align: top;
	text-align: center;
	width: 33%;
}
.totals-chart-header {
	display: block;
	padding: 10px;
	font-size: 14px;
	line-height: 20px;
	font-weight: 600;
	color: #575757;
	text-transform: uppercase;
}
.small-chart-holder {
	display: block;
	position: relative;
	margin: 0px;
}
.totals-chart-inner-label {
	display: block;
	position: absolute;
	margin: auto;
	margin-top: -15px;
	top: 50%;
	left: 0%;
	right: 0%;
	font-size: 18px;
	line-height: 18px;
	font-weight: 700;
	color: #575757;
	-webkit-transition: opacity .2s ease-in-out;
  	-moz-transition: opacity .2s ease-in-out;
  	-o-transition: opacity .2s ease-in-out;
  	transition: opacity .2s ease-in-out;
	z-index: 1;
}
.small-chart-holder canvas:hover ~ .totals-chart-inner-label {
	opacity: 0;
}
.totals-chart-label {
	position: relative;
	font-size: 12px;
	line-height: 12px;
	font-weight: 600;
	color: #575757;
	margin-bottom: 20px;
	z-index: 1;
}
.totals-prev-chart {
	display: block;
	position: absolute;
	top: 45%;
	left: 62px;
	margin: 0px;
	margin-top: -11px;
	padding: 0px;
	background-color: #626262;
	z-index: 99;
}
.totals-prev-chart:hover {
	background-color: #007def;
}
.totals-next-chart {
	display: block;
	position: absolute;
	top: 45%;
	right: 62px;
	margin: 0px;
	margin-top: -11px;
	padding: 0px;
	background-color: #626262;
	z-index: 99;
}
.totals-next-chart:hover {
	background-color: #007def;
}
.not-connected-next-chart {
	display: block;
	position: absolute;
	right: 50px;
	margin: 0px;
	padding: 0px;
	background-color: #626262;
	z-index: 99;
}
.not-connected-next-chart:hover {
	background-color: #007def;
}
.not-connected-prev-chart {
	display: block;
	position: absolute;
	left: 50px;
	margin: 0px;
	padding: 0px;
	background-color: #626262;
	z-index: 99;
}
.not-connected-prev-chart:hover {
	background-color: #007def;
}
.connection-time-next-chart {
	display: block;
	position: absolute;
	right: 5px;
	margin: 0px;
	padding: 0px;
	background-color: #626262;
	z-index: 99;
}
.connection-time-next-chart:hover {
	background-color: #007def;
}
.connection-time-prev-chart {
	display: block;
	position: absolute;
	left: 5px;
	margin: 0px;
	padding: 0px;
	background-color: #626262;
	z-index: 99;
}
.connection-time-prev-chart:hover {
	background-color: #007def;
}

.benchmark-next {height: 22px;}
.benchmark-prev {height: 22px;}

/* ********************** */
/* ***  MODULE THREE  *** */
/* ********************** */
.connection-time-box {
	display: block;
	position: relative;
}
.connection-time-top {
	display: block;
	position: relative;
	padding: 20px 20px;
}
.connection-time-top li {
	display: inline-block;
	vertical-align: middle;
	position: relative;
	width: 50%;
}
.connection-time-label {
	font-size: 12px;
	line-height: 16px;
	font-weight: 600;
	color: #575757;
}
.connection-time {
	display: inline-block;
	width: 200px;
}
.ct-time {
	display: inline-block;
	vertical-align: middle;
	font-size: 30px;
	line-height: 30px;
	font-weight: 700;
	font-style: italic;
	color: #007def;
}
.ct-seconds {
	display: inline-block;
	vertical-align: middle;
	padding-left: 6px;
	font-size: 14px;
	line-height: 14px;
	font-weight: 300;
	font-style: italic;
	color: #575757;
}
.ct-prev-chart {
	display: block;
	position: absolute;
	top: 50%;
	left: 12px;
	margin: 0px;
	margin-top: -11px;
	padding: 0px;
	background-color: #626262;
	z-index: 99;
}
.ct-prev-chart:hover {
	background-color: #007def;
}
.ct-next-chart {
	display: block;
	position: absolute;
	top: 50%;
	right: 12px;
	margin: 0px;
	margin-top: -11px;
	padding: 0px;
	background-color: #626262;
	z-index: 99;
}
.calls-not-connected-next {
	display: block;
	position: absolute;
	top: 28%;
	right: 122px;
	margin: 0px;
	margin-top: -11px;
	padding: 0px;
	background-color: #626262;
	z-index: 99;
}
.connection-time-bottom {
	display: block;
	position: relative;
	padding: 10px 10px;
}
.connection-time-bottom li {
	display: inline-block;
	vertical-align: middle;
	position: relative;
	width: 33%;
}

/* *********************** */
/* ****  MODULE FOUR  **** */
/* *********************** */
.never-connected-section, .avg-connected-section {
	padding: 20px 0;
}
.avg-connected-section {
}
.never-connected-section h4, .avg-connected-section h4 {
	display: inline-block;
	font-size: 18px;
	line-height: 18px;
	font-weight: 300;
}
.never-connected-data {
	display: block;
	position: relative;
	margin-top: 10px;
	text-align: center;
}
.never-connected-chart-holder {
	display: inline-block;
	vertical-align: middle;
	padding: 0px 24px 0px 0px;
}
.avg-connected-chart-holder {
	display: inline-block;
	vertical-align: middle;
	padding: 0px 10px;
	width:48%;
}
.never-connected-key {
	display: inline-block;
	vertical-align: middle;
	text-align: left;
	width: 50%;
}
.never-connected-key ul li {
	padding: 6px 0px;
}
.key-color-bar {
	display: inline-block;
	vertical-align: middle;
	margin-top: 1px;
	height: 18px;
	width: 18px;
	background-color: #999999;
	border-radius:3px;

}
.key-text {
	display: inline-block;
	vertical-align: middle;
	margin-left:6px;
	width: -moz-calc(100% - 26px);
	width: -webkit-calc(100% - 26px);
	width: -o-calc(100% - 26px);
	width: calc(100% - 26px);
	max-width: 380px;
}
.key-text p {
	display: block;
	padding-left: 6px;
	font-size: 16px;
	line-height: 14px;
}
.key-text p span {
	font-weight: 700;
}
/* ********************* */
/* ***  MODULE FIVE  *** */
/* ********************* */
.staff-list, .staff2-list, .staff3-list {
	display: block;
	position: relative;
	padding: 20px 0;
}
.staff-list-labels-row, .staff2-list-labels-row, .staff3-list-labels-row {
	padding-bottom: 2px;
	font-size: 12px;
	line-height: 16px;
	color: #a7a7a7;
	-webkit-touch-callout: none;
	-webkit-user-select: none;
	-khtml-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
}
.list-block {
	font-size: inherit;
	line-height: inherit;
	color: inherit;
	display: inline-block;
	vertical-align: middle;
	text-align: right;
	padding: 12px 0px;
}
.column-1 {
	width: 28%;
	text-align: left !important;
}
.staff2-list-row .column-1 {
	width: 23%;
}
.staff2-list-labels-row .column-1 {
	width: 23%;
}
.adsource-container .column-1 {
	width:23% !important;
}
.column-1 p {
	padding-left:8px;
}
.column-2, .column-3 {
	width: 24%;
}
.column-4 {
	width:23%;
	padding-right:1%;
}
.staff-list-row .column-4 a {
	padding-right:8px;
}
.staff-list-labels-row .column-4, .staff2-list-labels-row .column-4, .staff3-list-labels-row .column-4 {
	width:22%;
	padding-right:2%;
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
	background-color: #414141;
	margin-left:6px;
}
.list-label p {
	display: inline-block;
	vertical-align: middle;
	padding-left: 3px;
	font-size:14px;
	color: #414141;
}
.staff-list-labels-row div:hover, .staff2-list-labels-row div:hover, .staff3-list-labels-row div:hover {
	cursor: pointer;
}
.staff-list-labels-row div:hover a img, .staff2-list-labels-row div:hover a img, .staff3-list-labels-row div:hover a img {
	background-color: #007def;
}
.staff-list-labels-row div:hover a p, .staff2-list-labels-row div:hover a p, .staff3-list-labels-row div:hover a p {
	color: #007def;
}
.staff-list-row, .staff2-list-row, .staff3-list-row {
	display: block;
	position: relative;
	margin: 0px;
	font-size: 16px;
	line-height: 16px;
	color: #747474;
	border:1px solid #d0d0d0;
	border-bottom:none;
}
.staff-list-row:last-child, .staff2-list-row:last-child, .staff3-list-row:last-child {
	border-bottom:1px solid #d0d0d0;
}
.data-cell {
	text-align: right;
	color: #535353;
	line-height: 34px;
}
.data-cell a {
	color: #007def;
	font-weight: 400;
}
.data-cell a:hover {
	text-decoration: underline;
}
.list-pagination {
	display: block;
	position: relative;
	padding: 0px 10px 20px 5px;
	float: right;
}
.list-prev-btn, .list2-prev-btn, .list3-prev-btn {
	display: inline-block;
	vertical-align: middle;
	position: relative;
	margin: 0px;
	padding: 0px;
	height: 22px;
	margin-right: 10px;
	background-color: #626262;
	-webkit-touch-callout: none;
	-webkit-user-select: none;
	-khtml-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
	z-index: 99;
}
.list-prev-btn:hover, .list2-prev-btn:hover, .list3-prev-btn:hover {
	background-color: #007def;
}
.list-next-btn, .list2-next-btn, .list3-next-btn {
	display: inline-block;
	vertical-align: middle;
	position: relative;
	margin: 0px;
	padding: 0px;
	height: 22px;
	margin-left: 10px;
	background-color: #626262;
	-webkit-touch-callout: none;
	-webkit-user-select: none;
	-khtml-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
	z-index: 99;
}
.list-next-btn:hover, .list2-next-btn:hover, .list3-next-btn:hover {
	background-color: #007def;
}
.staff-list-page, .staff2-list-page, .staff3-list-page {
	display: inline-block;
	vertical-align: middle;
	position: relative;
	color: #414141;
}
.active-tab-p {
	color: #007def !important;
}
.active-tab-img {
	background-color: #007def !important;
}
.full-list-btn {
	display: inline-block; position: absolute; left: 10px; bottom: 20px;
}
.full-list-btn-mobile {
	display: none;
}
.full-list-btn a img {
	display: inline-block; vertical-align: middle;
	background-color: #414141; margin: 0px; padding: 0px;
}
.full-list-btn a span {
	display: inline-block; vertical-align: middle;
	color: #414141; margin: 0px; padding: 0px; padding-left: 4px;
}
.full-list-btn a:hover img { background-color: #007def; }
.full-list-btn a:hover span { color: #007def; }
.sequence {
	display:inline-block;
	vertical-align:middle;
	position:relative;
	width:50px;
}
@keyframes seq-preloader {
  50% {
    opacity: 1;
  }

  100% {
    opacity: 0;
  }
}
@-webkit-keyframes seq-preloader {
  50% {
    opacity: 1;
  }

  100% {
    opacity: 0;
  }
}
@-moz-keyframes seq-preloader {
  50% {
    opacity: 1;
  }

  100% {
    opacity: 0;
  }
}
.seq-preloader {
  background: darkgrey;
  visibility: visible;
  opacity: 1;
  position: absolute;
  z-index: 9999;
  height: 100%;
  width: 100%;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
}

.seq-preloader.seq-preloaded {
  opacity: 0;
  visibility: hidden;
  transition: visibility 0s .5s, opacity .5s;
}

.seq-preload-indicator {
  overflow: visible;
  position: relative;
}

.seq-preload-circle {
  display: inline-block;
  height: 12px;
  width: 12px;
  fill: white;
  opacity: 0;
  animation: seq-preloader 1.25s infinite;
}

.seq-preload-circle-2 {
  animation-delay: .15s;
}

.seq-preload-circle-3 {
  animation-delay: .3s;
}

.seq-preload-indicator-fallback {
  width: 42px;
  overflow: visible;
}

.seq-preload-indicator-fallback .seq-preload-circle {
  width: 8px;
  height:8px;
  background-color: white;
  border-radius: 100%;
  opacity: 1;
  display: inline-block;
  vertical-align: middle;
}

.seq-preload-indicator-fallback .seq-preload-circle-2 {
  margin-left: 3px;
  margin-right: 3px;
  width: 12px;
  height: 12px;
}

.seq-preload-indicator-fallback .seq-preload-circle-3 {
  width: 16px;
  height: 16px;
}
<!--- volume addition --->
.niceness { color: #4b4b4b; font-size: 20px; text-align: center; padding: 20px; line-height: 1.3; }
.blue-text {
    color: #007def;
}
.orange-text {
    color: #ef6500;
}
.totals-data {
	display: block;
	position: relative;
	margin: 0px 80px 15px 80px;
	padding: 20px 0px;
	border-bottom: solid 1px #ededed;
}
.download {
	display:inline-block;
	vertical-align:bottom;
	text-align:right;
	width:50%;
	padding-bottom: 6px;
}
.download a {

}
.top-section {
	width:50%;
	display:inline-block;
	vertical-align:bottom;
}
/* --- Medium Device --- */
@media screen and (max-width: 1130px), screen and (max-device-width: 1130px) {
	.container {
		width:98%;
	}
	.inner-container {
		padding-top: 20px;
		padding: 30px;
	}
	.module-holder-large {
		width: 100%;
	}
	.module-holder-small {
		width: 100%;
	}
	.left-module {
		width:100%;
	}
	.right-module {
		width:100%;
	}
	.small-module-wrapper {
		width: 50%;
	}
	.nodata-calls-not-connected, .nodata-avg-connection {
		width:100%;
	}

	/*--- override datepicker styles ---*/
	.date-section {
		text-align: center;
	}
	.date-range {
		clear: both;
		margin: auto;
		left: 0%;
		right: 0%;
		float: none;
		text-align: center;
	}
	.date-range-btns {
		display: inline-block;
	}
	.date-range-btns li:nth-child(4) a {
		margin-right: 0px;
	}
	.date-picker {
		float: none;
		clear: both;
		text-align: center;
		margin: 0px auto 15px auto;
		left: 0%;
		right: 0%;
		height: 30px;
	}
	.date-picker-form-holder {
		display: inline-block;
		position: absolute;
		margin: auto;
		left: 0%;
		right: 0%;
		max-width: 88%;
		top: 40px;
	}
	.date-header {
		float: none;
		clear: both;
		display: inline-block;
		margin: 15px 0px;
		z-index: 0;
	}
}
/* --- Small Device --- */
@media screen and (max-width: 840px), screen and (max-device-width: 840px) {
	.inner-container {
		padding: 20px;
	}
	.module-holder-large {
		width: 100%;
	}
	.module-holder-small {
		width: 100%;
	}
	.small-module-wrapper {
		width: 100%;
	}
	.section-header-top {font-size:24px;}
	.lename, .lename2 {
	    white-space: nowrap;
	    text-overflow: ellipsis;
	    overflow: hidden;
        padding-top: 4px;
    	padding-bottom: 4px;
	}
}

/* --- Very Small Device --- */
@media screen and (max-width: 670px), screen and (max-device-width: 670px) {
	.container {
		width: 95%;
	}
	.inner-container {
		padding: 20px 8px;
	}
	.module-holder-large {
		width: 100%;
	}
	.module-holder-small {
		width: 100%;
	}
	.small-module-wrapper {
		width: 100%;
	}
	.never-connected-chart-holder {display:block;width:98%;margin:0 auto;margin-bottom:12px;}
	.never-connected-key {display:block;width:98%;margin:0 auto;margin-left:60px;}
	.download, .top-section {display:block;width:98%;margin:0 auto;text-align:left;}

}
.adsource-container .column-4 {
	padding-right:1% !important;
}
.adsource-row {
	border-top:1px solid #c7c4c4;
	background-color:#f9f9f9;
}
.adsource-container .column-2 a {

}
.adsource-container .column-3 a {
	margin-right:4px;
}
.adsource-container .column-1 p {
	padding-left:12px;
}
.adsource-container .list-block {
	padding:0;
}
.column-5 {
	width: 5%;
    text-align: center;
}
.column-5 i {
	color:#c7c4c4;
	transition:all ease-in-out .3s;
}
.adsource-row {
	display:none;
}
.staff2-list-row {
	transition:all ease-in-out .3s;
}
.staff2-list-row:hover {
	background-color:#f3f9fe;
}
.staff-list-row:nth-child(7) {
	border-bottom: 1px solid #d0d0d0;
}
.campaign-ad-button-holder {
	display:block;
	text-align:left;
	margin-top:24px;
}
.campaign-ad-btn {
	display:inline-block;
	vertical-align:middle;
	color:#919191;
	border-radius:3px;
	margin-right:32px;
	cursor:pointer;
}
.campaign-ad-btn span {
	display:block;
}
.campaign-ad-btn:hover {
	color:#747474;
}
.adgroup-module {
	display:none;
}
.fa {
	display:block;
	padding:12px 0;
	cursor:pointer;
}
.column-5 {
	padding:0;
}
.btn-square {
	border:1px solid #b4b4b4;
	border-radius:3px;
	width:20px;
	height:20px;
	display:inline-block;
	vertical-align:middle;
	margin-right:12px;
}
.campaign-ad-btn span {
	display:inline-block;
	vertical-align:middle;
}
.active .btn-square {
	border:1px solid #007def;
	background-color:#007def;
}
.active span {
	color:#007def;
}
</style>

<cfinclude template='wsc_tracking_report_queries.cfm'>

<div class="mobile_datewrapper">
<div class="website-select-section top-dropdown">

		<cfoutput>
		<select class="website-select-dropdown" name="siteID">
			<option value="_PLACEHOLDER">Select Website</option>
			<cfif pull_websites.recordCount EQ 1>
				<option value="#pull_websites.GIT_PhNumpoolid#" selected>
					#pull_websites.GIT_name_of_phone_pool#
				</option>
			<cfelse>
				<cfloop query="pull_websites">
					<option value="#GIT_PhNumpoolid#" <cfif isDefined('siteID') and siteID EQ #GIT_PhNumpoolid#>selected</cfif>>
						#GIT_name_of_phone_pool#
					</option>
				</cfloop>
			</cfif>
		</select>
		<img class="dropdown-arrow" src="../images/redux/website_tracking/dropdown-icon.png"/>

		<a class="website-select-btn" href="" onclick="return false;">GO</a>
		</cfoutput>
</div>


<ul class="section-1">
	<div class="section-header-top-holder">
		<h2 class="section-header-top top-section">Top Referring Sources</h2><div class="download">
			<cfoutput><a href="report_viewer.cfm?pid=260">Download spreadsheet with UTM data</a></cfoutput>
	</div>
	</div>
	<div class="module left-module">
		<div class="never-connected-section">
			<div class="never-connected-data">
				<div class="never-connected-chart-holder">
					<canvas id="chart1" width="160" height="160"></canvas>
					<script>
						<cfoutput>
							#ToScript(ValueList(pull_sources.Total_Calls), "Source_Percentage")#
							#ToScript(pull_sources_total.total,"total_calls")#
						</cfoutput>
						
						var Source_Percentage = Source_Percentage.split(",");
						

						<cfif isdefined('spoof_data')>
							<!---var Source_Percentage = [eval(total_calls/5),
														eval(total_calls/8),
														eval(total_calls/20),
														eval(total_calls/4),
														eval(total_calls/8)]--->
							var total_calls = 35
							var Source_Percentage = [10,8,7,6,4]
						</cfif>

						var color_array = ["#f7464a","#2486e2","#0acc2f","#ef6500","#ededed"];
						var data = []

						for (i = 0; i < Source_Percentage.length; i++) {
							console.log(i + " : " + Source_Percentage[i] + " : " + eval((Source_Percentage[i]/total_calls) * 100));
							data.push(
										{
											value: parseInt(eval((Source_Percentage[i]/total_calls) * 100),10),
											color: color_array[i]
										}
									)
							}

						var options = {
							segmentShowStroke : true,
							segmentStrokeColor : "#ffffff",
							segmentStrokeWidth : 2,
							percentageInnerCutout : 50,
							animateScale : false,
							tooltipFontSize: 14,
							tooltipCornerRadius: 3,
							tooltipXPadding: 6,
							tooltipYPadding: 6,
							tooltipCaretSize: 3,
							tooltipTemplate: "<%if (label){%><%=label%>: <%}%><%= value %>%",
						}
						var chart= document.getElementById("chart1").getContext("2d");
						new Chart(chart).Doughnut(data, options);
					</script>
				</div>
				<div class="never-connected-key">
					<ul>
						<cfset color_array = ["##f7464a","##2486e2","##0acc2f","##ef6500","##ededed","##2486e2","##0acc2f","##ef6500","##ededed"]>
						<cfoutput query="pull_sources">
							<li>
								<div class="key-color-bar" style="background-color: #color_array[CurrentRow]#">
								</div><div class="key-text"><p><span>#NumberFormat((Total_Calls/(pull_sources_total.total)*100),"00.00")#%</span> - #UTM_Source#</div>
							</li>
						</cfoutput>
					</ul>
				</div>
			</div>
		</div>
	</div>
</ul>

<ul class="section-2">
	<div class="section-header-top-holder">
		<h2 class="section-header-top">Calls By Referring Source</h2>
	</div>
	<li class="module-holder-large">
		<div class="module">
			<ul class="staff-list">
				<li class="staff-list-labels-row">
					<div class="list-block column-1" style="background-color: rgba(0,0,0,0);">
						<a class="list-label" href="" onclick="return false;">
							<p class="staff-label-1">Source</p><img src="../images/redux/performance-report-cw/wct-down-arrow.png"/>
						</a>
					</div><div class="list-block column-2" style="background-color: rgba(0,0,0,0);">
						<a class="list-label" href="" onclick="return false;">
							<p class="staff-label-2">Calls</p><img src="../images/redux/performance-report-cw/wct-down-arrow.png"/>
						</a>
					</div><div class="list-block column-3" style="background-color: rgba(0,0,0,0);">
						<a class="list-label" href="" onclick="return false;">
							<p class="staff-label-3">Sales Opportunities</p><img src="../images/redux/performance-report-cw/wct-down-arrow.png"/>
						</a>
					</div><div class="list-block column-4" style="background-color: rgba(0,0,0,0);">
						<a class="list-label" href="" onclick="return false;">
							<p class="staff-label-4">Booked Appointments</p><img src="../images/redux/performance-report-cw/wct-down-arrow.png"/>
						</a>
					</div>
				</li>
				<cfoutput query='pull_sources'>
						
						
						<!-- Connected Calls -->
							<cfset outURLConnected="../cx/clickthrough.cfm?">
							<cfset outURLConnected=outURLConnected&'this_start='&#this_start#>
							<cfset outURLConnected=outURLConnected&'&this_end='&#this_end#>
							<cfif isdefined('siteID')>
								<cfset outURLConnected=outURLConnected&'&GIT_PhNumpool='&#GIT_PhNumpoolid#>
							</cfif>
						<!-- Sales Opps -->
							<cfset outURLSales='60'>
							<cfset outURLSales="../cx/clickthrough.cfm?">
							<cfset outURLSales=outURLSales&'this_start='&#URLEncodedFormat(this_start)#>
							<cfset outURLSales=outURLSales&'&this_end='&#URLEncodedFormat(this_end)#>
							<cfset outURLSales=outURLSales&'&hco='&#URLEncodedFormat(sales_opp_hco)#>

						<!-- Appt Requests -->
							<cfset outURLBooked="../cx/clickthrough.cfm?">
							<cfset outURLBooked=outURLBooked&'this_start='&#URLEncodedFormat(this_start)#>
							<cfset outURLBooked=outURLBooked&'&this_end='&#URLEncodedFormat(this_end)#>
							<cfset outURLBooked=outURLBooked&'&hco='&#URLEncodedFormat(booked_appt_hco)#>
					<li class="staff-list-row">
						<div class="list-block column-1">
							<p class="lename">#utm_source#</p>
						</div><div class="list-block column-2 data-cell">
							<a href="../platform_a/thinking.cfm?redirect=#outURLConnected#">#Total_Calls#</a>
						</div><div class="list-block column-3 data-cell">
							<a href="../platform_a/thinking.cfm?redirect=#URLEncodedFormat(outURLSales)#">#Sales_Opps#</a>
						</div><div class="list-block column-4 data-cell">
							<a href="../platform_a/thinking.cfm?redirect=#URLEncodedFormat(outURLBooked)#">#Booked_Appt#</a>
						</div>
					</li>
				</cfoutput>
			</ul>
			<cfoutput>
			<div class="bottom-menu">
				<div class="full-list-btn">
					<a class="full-list-btn-desktop" target="_blank" href="../platform_a/pods/wsc_training_report_ref_source.cfm?this_start=#this_start#&this_end=#this_end#"><img src="../images/redux/icon_full_list.png"><span>Full List</span></a>
					<a class="full-list-btn-mobile" href=""><img src="../images/redux/icon_full_list.png"><span>Full List</span></a>
					</div>
			</cfoutput>
				<div class="list-pagination">
					<a class="list-prev-btn" href="" onclick="return false;"><img src="../images/redux/performance-report-cw/prev-arrow-2.png"/>
					</a><div class="staff-list-page">
						1 - 8 of 53
					</div><a class="list-next-btn" href="" onclick="return false;"><img src="../images/redux/performance-report-cw/next-arrow-2.png"/></a>
				</div>
			</div>
		</div>
	</li>
</ul>

<cfif isdefined('is_pro') and is_pro.recordCount>

	<div class="section-header-top-holder">
		<h2 class="section-header-top">Campaign / Ad Group Breakdown</h2>
	</div>
	<li class="module-holder-large">

		<div class="campaign-ad-button-holder">
			<div class="campaign-ad-btn campaign-btn active">
				<div class = "btn-square">

				</div><span>Campaigns</span>
			</div>
			<div class="campaign-ad-btn ad-btn">
				<div class = "btn-square">

				</div><span>Ad Groups</span>
			</div>
		</div>

		<!-- Module for campaigns-->
		<div class="module campaign-module">
			<ul class="staff2-list">
				<li class="staff2-list-labels-row">
					<div class="list-block column-5" style="background-color: rgba(0,0,0,0);">

					</div><div class="list-block column-1" style="background-color: rgba(0,0,0,0);">
						<a class="list-label" href="" onclick="return false;">
							<p class="staff2-label-1">Campaign</p><img src="../images/redux/performance-report-cw/wct-down-arrow.png"/>
						</a>
					</div><div class="list-block column-2" style="background-color: rgba(0,0,0,0);">
						<a class="list-label" href="" onclick="return false;">
							<p class="staff2-label-2">Calls</p><img src="../images/redux/performance-report-cw/wct-down-arrow.png"/>
						</a>
					</div><div class="list-block column-3" style="background-color: rgba(0,0,0,0);">
						<a class="list-label" href="" onclick="return false;">
							<p class="staff2-label-3">Sales Opportunities</p><img src="../images/redux/performance-report-cw/wct-down-arrow.png"/>
						</a>
					</div><div class="list-block column-4" style="background-color: rgba(0,0,0,0);">
						<a class="list-label" href="" onclick="return false;">
							<p class="staff2-label-4">Booked Appointments</p><img src="../images/redux/performance-report-cw/wct-down-arrow.png"/>
						</a>
					</div>
				</li>

				<cfoutput query='pull_campaigns'>
					<li class="staff2-list-row">
						<div class="list-block column-5 data-cell">
							<i class="fa fa-chevron-right"></i>
						</div><div class="list-block column-1">
							<p class="lename">#AdWords_Campaign#</p>
						</div><div class="list-block column-2 data-cell">
							<a href="">#Total_Calls#</a>
						</div><div class="list-block column-3 data-cell">
							<a href="">#Sales_Opps#</a>
						</div><div class="list-block column-4 data-cell">
							<a href="">#Booked_Appt#</a>
						</div>
						<cfif Adword_groups NEQ '' AND Adword_groups GT 1>
							<cfquery name='pull_groups' datasource='#application.ds#'>
								SELECT
									ISNULL(a.Ad_Group_Name,'Unnamed Group') as 'Adword_groups',
									COUNT(distinct c.GIT_ID_for_call) as Total_Calls,
									COUNT(distinct case when GIT_frn_id_of_humanatic_call_review_question in (#sales_opp_hco#) then c.GIT_ID_for_call else null end) AS Sales_Opps,
									COUNT(distinct case when GIT_frn_id_of_humanatic_call_review_question in (#booked_appt_hco#) then c.GIT_ID_for_call else null end) AS Booked_Appt
								FROM GIT_table_that_holds_accounts l
									FROM GIT_table_holding_phone_numbers d ON d.add_FROM GIT_account = l.FROM GIT_account and add_FROM GIT_account = #session.GIT_variable_CM_lskin#
									FROM GIT_table_holding_number_labels dld ON dld.frn_GIT_PhNumid = d.GIT_PhNumid AND dld.label_place = 0
									FROM GIT_table_holding_number_labels dl4 ON dl4.frn_GIT_PhNumid = d.GIT_PhNumid AND dl4.label_place = 4
									FROM GIT_table_that_holds_call_data_long c ON c.cf_frn_GIT_PhNumid = d.GIT_PhNumid
									FROM GIT_table_that_holds_call_data_long_hcat ch on c.GIT_ID_for_call = ch.frn_GIT_ID_for_call
									FROM GIT_table_holding_calls_from_adwords a ON a.frn_GIT_ID_for_call = c.GIT_ID_for_call
									FROM GIT_table_holding_web_sessions_action_call_long dpac ON dpac.frn_GIT_ID_for_call = c.GIT_ID_for_call
									FROM GIT_table_holding_web_sessions_long dpd ON dpd.dpdid = dpac.frn_dpdid
									FROM GIT_table_holding_web_sessions_variable_long var ON var.frn_dpdid = dpac.frn_dpdid AND var.frn_web_variableid IN (2,3,4,6,7)
								WHERE c.GIT_the_date >= #createodbcdate(this_start) #
								   AND c.GIT_the_date < #createodbcdate(this_end) #
								   AND a.campaign_name = '#AdWords_Campaign#'
								   <cfif isdefined('siteID')>
										and dpd.FROM GIT_group_of_numbers_ID = #siteID#
								   </cfif>
								GROUP BY a.Ad_Group_Name
							</cfquery>

							<cfif isdefined('spoof_bottom')>
								<cfset pull_groups = QueryNew("Adword_groups,
																	Total_Calls,
																	Sales_Opps,
																	Booked_Appt")>

								<!--- populating spreadsheet data --->
								<cfset newrow = QueryAddRow(pull_groups,3)>
								<cfset temp = QuerySetCell(pull_groups, "Adword_groups","Group One",1)>
								<cfset temp = QuerySetCell(pull_groups, "Total_Calls",100,1)>
								<cfset temp = QuerySetCell(pull_groups, "Sales_Opps",100,1)>
								<cfset temp = QuerySetCell(pull_groups, "Booked_Appt",30,1)>

								<cfset temp = QuerySetCell(pull_groups, "Adword_groups","Group Two",2)>
								<cfset temp = QuerySetCell(pull_groups, "Total_Calls",80,2)>
								<cfset temp = QuerySetCell(pull_groups, "Sales_Opps",60,2)>
								<cfset temp = QuerySetCell(pull_groups, "Booked_Appt",3,2)>

								<cfset temp = QuerySetCell(pull_groups, "Adword_groups","Group Three",3)>
								<cfset temp = QuerySetCell(pull_groups, "Total_Calls",20,3)>
								<cfset temp = QuerySetCell(pull_groups, "Sales_Opps",5,3)>
								<cfset temp = QuerySetCell(pull_groups, "Booked_Appt",2,3)>
							</cfif>


							<cfloop query='pull_groups'>
								<div class="adsource-row">
									<div class="adsource-container">
										<div class="list-block column-5 data-cell">
										</div><div class="list-block column-1">
											<p class="lename2">#Adword_groups#</p>
										</div><div class="list-block column-2 data-cell">
											<a href="">#Total_Calls#</a>
										</div><div class="list-block column-3 data-cell">
											<a href="">#Sales_Opps#</a>
										</div><div class="list-block column-4 data-cell">
											<a href="">#Booked_Appt#</a>
										</div>
									</div>
								</div>
							</cfloop>
						</cfif>
					</li>
				</cfoutput>
			</ul>
			<div class="bottom-menu">
				<div class="full-list-btn">
					<cfoutput>
					<a class="full-list-btn-desktop" target="_blank" href="../platform_a/pods/wsc_training_report_campaign.cfm?this_start=#this_start#&this_end=#this_end#"><img src="../images/redux/icon_full_list.png"><span>Full List</span></a>
					<a class="full-list-btn-mobile" href=""><img src="../images/redux/icon_full_list.png"><span>Full List</span></a>
					</cfoutput>
				</div>
				<div class="list-pagination">
					<a class="list2-prev-btn" href="" onclick="return false;"><img src="../images/redux/performance-report-cw/prev-arrow-2.png"/>
					</a><div class="staff2-list-page">
						1 - 8 of 53
					</div><a class="list2-next-btn" href="" onclick="return false;"><img src="../images/redux/performance-report-cw/next-arrow-2.png"/></a>
				</div>
			</div>
		</div>

		<!-- Module for ad groups-->
		<div class="module adgroup-module">
			<ul class="staff3-list">
				<li class="staff3-list-labels-row">
					<div class="list-block column-1" style="background-color: rgba(0,0,0,0);">
						<a class="list-label" href="" onclick="return false;">
							<p class="staff3-label-1">Ad Group</p><img src="../images/redux/performance-report-cw/wct-down-arrow.png"/>
						</a>
					</div><div class="list-block column-2" style="background-color: rgba(0,0,0,0);">
						<a class="list-label" href="" onclick="return false;">
							<p class="staff3-label-2">Calls</p><img src="../images/redux/performance-report-cw/wct-down-arrow.png"/>
						</a>
					</div><div class="list-block column-3" style="background-color: rgba(0,0,0,0);">
						<a class="list-label" href="" onclick="return false;">
							<p class="staff3-label-3">Sales Opportunities</p><img src="../images/redux/performance-report-cw/wct-down-arrow.png"/>
						</a>
					</div><div class="list-block column-4" style="background-color: rgba(0,0,0,0);">
						<a class="list-label" href="" onclick="return false;">
							<p class="staff3-label-4">Booked Appointments</p><img src="../images/redux/performance-report-cw/wct-down-arrow.png"/>
						</a>
					</div>
				</li>
				<li class="staff3-list-row">
					<div class="list-block column-1">
						<p class="lename">Ad Source 1</p>
					</div><div class="list-block column-2 data-cell">
						<a href="">26</a>
					</div><div class="list-block column-3 data-cell">
						<a href="">16</a>
					</div><div class="list-block column-4 data-cell">
						<a href="">10</a>
					</div>
				</li><li class="staff3-list-row">
					<div class="list-block column-1">
						<p class="lename">Ad Source 2</p>
					</div><div class="list-block column-2 data-cell">
						<a href="">25</a>
					</div><div class="list-block column-3 data-cell">
						<a href="">11</a>
					</div><div class="list-block column-4 data-cell">
						<a href="">14</a>
					</div>
				</li><li class="staff3-list-row">
					<div class="list-block column-1">
						<p class="lename">Ad Source 3</p>
					</div><div class="list-block column-2 data-cell">
						<a href="">22</a>
					</div><div class="list-block column-3 data-cell">
						<a href="">12</a>
					</div><div class="list-block column-4 data-cell">
						<a href="">10</a>
					</div>
				</li><li class="staff3-list-row">
					<div class="list-block column-1">
						<p class="lename">Ad Source 4</p>
					</div><div class="list-block column-2 data-cell">
						<a href="">18</a>
					</div><div class="list-block column-3 data-cell">
						<a href="">12</a>
					</div><div class="list-block column-4 data-cell">
						<a href="">6</a>
					</div>
				</li><li class="staff3-list-row">
					<div class="list-block column-1">
						<p class="lename">Ad Source 5</p>
					</div><div class="list-block column-2 data-cell">
						<a href="">18</a>
					</div><div class="list-block column-3 data-cell">
						<a href="">12</a>
					</div><div class="list-block column-4 data-cell">
						<a href="">6</a>
					</div>
				</li><li class="staff3-list-row">
					<div class="list-block column-1">
						<p class="lename">Ad Source 6</p>
					</div><div class="list-block column-2 data-cell">
						<a href="">18</a>
					</div><div class="list-block column-3 data-cell">
						<a href="">12</a>
					</div><div class="list-block column-4 data-cell">
						<a href="">6</a>
					</div>
				</li>
			</ul>
			<div class="bottom-menu">
				<div class="full-list-btn">
					<a class="full-list-btn-desktop" target="_blank" href="../platform_a/pods/wsc_training_report_ad_group.cfm"><img src="../images/redux/icon_full_list.png"><span>Full List</span></a>
					<a class="full-list-btn-mobile" href=""><img src="../images/redux/icon_full_list.png"><span>Full List</span></a>

					</div>
				<div class="list-pagination">
					<a class="list3-prev-btn" href="" onclick="return false;"><img src="../images/redux/performance-report-cw/prev-arrow-2.png"/>
					</a><div class="staff3-list-page">
						1 - 8 of 53
					</div><a class="list3-next-btn" href="" onclick="return false;"><img src="../images/redux/performance-report-cw/next-arrow-2.png"/></a>
				</div>
			</div>
		</div>
	</li>
</ul>
</cfif>
<script>
/* ----------------------------------------------- */
/* --- a few adjustments for the mobile layout --- */
/* ----------------------------------------------- */
$(document).ready(function(){


	// --- remove chevrons where there is no adgroups to expand and show
	removeChevrons();
	// --- click function to handle the expansion of the rows
	$('.staff2-list-row').click(function() {
		var adsourceRow = $(this).children('.adsource-row').css("display");
		if (adsourceRow == 'none') {
			$(this).children('.column-5').children('.fa-chevron-right').css("transform", "rotate(90deg)");
			$(this).children('.adsource-row').slideDown();
		}
		else if (adsourceRow == 'block') {
			$(this).children('.column-5').children('.fa-chevron-right').css("transform", "rotate(0deg)");
			$(this).children('.adsource-row').slideUp();
		}
	});
	// --- click campaign/ad button to show/hide the correct list
	$('.campaign-ad-btn').click(function() {
		if ($(this).hasClass('campaign-btn')) {
			if ($(this).hasClass('active')) {
				// do nothing
			} else {
				$('.ad-btn').removeClass('active');
				$(this).addClass('active');
				$('.adgroup-module').css("display","none");
				$('.campaign-module').css("display","block");
			}
		} else if ($(this).hasClass('ad-btn')) {
			if ($(this).hasClass('active')) {
				// do nothing
			} else {
				$('.campaign-btn').removeClass('active');
				$(this).addClass('active');
				$('.campaign-module').css("display","none");
				$('.adgroup-module').css("display","block");
			}
		}
	});
	// --- label modifications for mobile
	var screenWidth = $(window).width();
	if(screenWidth < 600){
		$('.data-cell').each(function(){
			var number = $(this).text().trim();
			if(number.indexOf('(') > 0){
				number = number.split(" ");
				$(this).text(number[0]);
			}
		});
		$('.staff-label-3').html("Sales<br/>Opps.");
		$('.staff-label-4').html("Booked<br/>Appts.");
		$('.staff2-label-3').html("Sales<br/>Opps.");
		$('.staff2-label-4').html("Booked<br/>Appts.");
		$('.staff3-label-3').html("Sales<br/>Opps.");
		$('.staff3-label-4').html("Booked<br/>Appts.");
	}
	else {
		$('.staff-label-3').html("Sales Opportunities");
		$('.staff-label-4').html("Booked Appointments");
		$('.staff2-label-3').html("Sales Opportunities");
		$('.staff2-label-4').html("Booked Appointments");
		$('.staff3-label-3').html("Sales Opportunities");
		$('.staff3-label-4').html("Booked Appointments");
	}
	// -- resize browser
	$( window ).resize(function() {
	  	var screenWidth = $(window).width();
		if(screenWidth < 600){
			$('.data-cell').each(function(){
				var number = $(this).text().trim();
				if(number.indexOf('(') > 0){
					number = number.split(" ");
					$(this).text(number[0]);
				}
			});
			$('.staff-label-3').html("Sales<br/>Opps.");
			$('.staff-label-4').html("Booked<br/>Appts.");
			$('.staff2-label-3').html("Sales<br/>Opps.");
			$('.staff2-label-4').html("Booked<br/>Appts.");
			$('.staff3-label-3').html("Sales<br/>Opps.");
			$('.staff3-label-4').html("Booked<br/>Appts.");
		}
		else {
			$('.staff-label-3').html("Sales<br/>Opportunities");
			$('.staff-label-4').html("Booked<br/>Appointments");
			$('.staff2-label-3').html("Sales Opportunities");
			$('.staff2-label-4').html("Booked Appointments");
			$('.staff3-label-3').html("Sales Opportunities");
			$('.staff3-label-4').html("Booked Appointments");
		}
	});
});

function removeChevrons() {
	$('.staff2-list-row .column-5').each(function() {
		var adgroupsExist = $(this).siblings('.adsource-row').length;
		if(adgroupsExist == 0) {
			$(this).children('.fa-chevron-right').css("visibility","visible");
			$(this).children('.fa-chevron-right').css("visibility","hidden");
		}
	});
}
</script>

<script>
/* ------------------------------ */
/* --- STAFF3 SORTING / PAGING --- */
/* ------------------------------ */
$(document).ready(function(){

	var toggle3 = [0,0,0,0,0];
	var pageItems3 = 6;
	var totalItems3 = $('.staff3-list-row').length;
	var pageMin3 = 1;
	var pageMax3 = pageItems3+1;
	var pageMaxLabel3 = pageMax3 - 1;
	$('.list3-prev-btn').css("visibility","hidden");
	$('.staff3-list-labels-row').children('div').click(function(){
		// --- column 1 ---
		if($(this).hasClass("column-1")){
			var column1 = [];
			$('.staff3-list-row').each(function(){
				var staffValue = $(this).children('.column-1').text().trim().toLowerCase();
				column1.push(staffValue);
			});
			if(toggle3[0] == 0){
				$(this).find(".list-label").children('img').rotate(0);
				column1.sort();
				toggle3[0] = 1;
			}
			else if(toggle3[0] == 1 ){
				$(this).find(".list-label").children('img').rotate(180);
				column1.sort();
				column1.reverse();
				toggle3[0] = 0;
			}
			// --- rearrange list items
			$('.staff3-list-row').css("display","none");
			for (var i = 0; i < column1.length; i++) {
				var name = column1[i];
				$('.staff3-list-row').each(function(){
					var lename = $(this).find('.lename').text().trim().toLowerCase();
					if(lename == name){
						$(this).detach().appendTo('.staff3-list').css("display","block");
					}
				});
			}
			$('.staff3-list-row').each(function(i){
				if(i >= pageItems3){
					$(this).css("display","none");
				}
				i++;
			});
			// --- reset paging
			pageMin3 = 1;
			pageMax3 = pageItems3+1;
			pageMaxLabel3 = pageMax3 - 1;
			$('.staff3-list-page').text("").text(pageMin3 + " - " + pageMaxLabel3 + " of " + totalItems3);
			$('.list3-next-btn').css("visibility","visible");
			$('.list3-prev-btn').css("visibility","hidden");
			if(totalItems3 < pageMax3){
				$('.list3-next-btn').css("visibility","hidden");
				$('.list3-prev-btn').css("visibility","hidden");
				pageMaxLabel3 = totalItems3
				$('.staff3-list-page').text("").text(pageMin3 + " - " + pageMaxLabel3 + " of " + totalItems3);
			}
			// --- color tabs
			$(this).children('a').children('img').addClass('active-tab-img');
			$(this).siblings('.list-block').children('a').children('img').removeClass('active-tab-img');
			$(this).children('a').children('p').addClass('active-tab-p');
			$(this).siblings('.list-block').children('a').children('p').removeClass('active-tab-p');
		}
		// --- column 2 ---
		if($(this).hasClass("column-2")){
			var column2 = [];
			$('.staff3-list-row').each(function(){
				var staffValue = parseInt(($(this).children('.column-2').text().trim()),10);
				column2.push(staffValue);
			});
			if(toggle3[1] == 0){
				$(this).find(".list-label").children('img').rotate(180);
				column2.sort(function(a, b){return a-b});
				toggle3[1] = 1;
			}
			else if(toggle3[1] == 1 ){
				$(this).find(".list-label").children('img').rotate(0);
				column2.sort(function(a, b){return b-a});
				toggle3[1] = 0;
			}
			// --- rearrange list items
			$('.staff3-list-row').css("display","none");
			for (var i = 0; i < column2.length; i++) {
				var sortedNumber = column2[i];
				$('.staff3-list-row').each(function(){
					var thisNumber = parseInt(($(this).children('.column-2').text().trim()),10);
					if(thisNumber == sortedNumber) {
						$(this).detach().appendTo('.staff3-list').css("display","block");
					}
				});
			}
			$('.staff3-list-row').each(function(i){
				if(i >= pageItems3){
					$(this).css("display","none");
				}
				i++;
			});
			// --- reset paging
			pageMin3 = 1;
			pageMax3 = pageItems3+1;
			pageMaxLabel3 = pageMax3 - 1;
			$('.staff3-list-page').text("").text(pageMin3 + " - " + pageMaxLabel3 + " of " + totalItems3);
			$('.list3-next-btn').css("visibility","visible");
			$('.list3-prev-btn').css("visibility","hidden");
			if(totalItems3 < pageMax3){
				$('.list3-next-btn').css("visibility","hidden");
				$('.list3-prev-btn').css("visibility","hidden");
				pageMaxLabel3 = totalItems3
				$('.staff3-list-page').text("").text(pageMin3 + " - " + pageMaxLabel3 + " of " + totalItems3);
			}
			// --- color tabs
			$(this).children('a').children('img').addClass('active-tab-img');
			$(this).siblings('.list-block').children('a').children('img').removeClass('active-tab-img');
			$(this).children('a').children('p').addClass('active-tab-p');
			$(this).siblings('.list-block').children('a').children('p').removeClass('active-tab-p');
		}
		// --- column 3 ---
		if($(this).hasClass("column-3")){
			var column3 = [];
			$('.staff3-list-row').each(function(){
				var staffValue = $(this).children('.column-3').text().trim();
				staffValue = staffValue.split(" ");
				staffValue = parseInt((staffValue[0]),10);
				column3.push(staffValue);
			});
			if(toggle3[2] == 0){
				$(this).find(".list-label").children('img').rotate(180);
				column3.sort(function(a, b){return a-b});
				toggle3[2] = 1;
			}
			else if(toggle3[2] == 1 ){
				$(this).find(".list-label").children('img').rotate(0);
				column3.sort(function(a, b){return b-a});
				toggle3[2] = 0;
			}
			// --- rearrange list items
			$('.staff3-list-row').css("display","none");
			for (var i = 0; i < column3.length; i++) {
				var sortedNumber = column3[i];
				$('.staff3-list-row').each(function(){
					var thisNumber = $(this).children('.column-3').text().trim();
					thisNumber = thisNumber.split(" ");
					thisNumber = parseInt((thisNumber[0]),10);
					if(thisNumber == sortedNumber) {
						$(this).detach().appendTo('.staff3-list').css("display","block");
					}
				});
			}
			$('.staff3-list-row').each(function(i){
				if(i >= pageItems3){
					$(this).css("display","none");
				}
				i++;
			});
			// --- reset paging
			pageMin3 = 1;
			pageMax3 = pageItems3+1;
			pageMaxLabel3 = pageMax3 - 1;
			$('.staff3-list-page').text("").text(pageMin3 + " - " + pageMaxLabel3 + " of " + totalItems3);
			$('.list3-next-btn').css("visibility","visible");
			$('.list3-prev-btn').css("visibility","hidden");
			if(totalItems3 < pageMax3){
				$('.list3-next-btn').css("visibility","hidden");
				$('.list3-prev-btn').css("visibility","hidden");
				pageMaxLabel3 = totalItems3
				$('.staff3-list-page').text("").text(pageMin3 + " - " + pageMaxLabel3 + " of " + totalItems3);
			}
			// --- color tabs
			$(this).children('a').children('img').addClass('active-tab-img');
			$(this).siblings('.list-block').children('a').children('img').removeClass('active-tab-img');
			$(this).children('a').children('p').addClass('active-tab-p');
			$(this).siblings('.list-block').children('a').children('p').removeClass('active-tab-p');
		}
		// --- column 4 ---
		if($(this).hasClass("column-4")){
			var column4 = [];
			$('.staff3-list-row').each(function(){
				var staffValue = parseInt(($(this).children('.column-4').text().trim()),10);
				column4.push(staffValue);
			});
			if(toggle3[3] == 0){
				$(this).find(".list-label").children('img').rotate(180);
				column4.sort(function(a, b){return a-b});
				toggle3[3] = 1;
			}
			else if(toggle3[3] == 1 ){
				$(this).find(".list-label").children('img').rotate(0);
				column4.sort(function(a, b){return b-a});
				toggle3[3] = 0;
			}
			// --- rearrange list items
			$('.staff3-list-row').css("display","none");
			for (var i = 0; i < column4.length; i++) {
				var sortedNumber = column4[i];
				$('.staff3-list-row').each(function(){
					var thisNumber = parseInt(($(this).children('.column-4').text().trim()),10);
					if(thisNumber == sortedNumber) {
						$(this).detach().appendTo('.staff3-list').css("display","block");
					}
				});
			}
			$('.staff3-list-row').each(function(i){
				if(i >= pageItems3){
					$(this).css("display","none");
				}
				i++;
			});
			// --- reset paging
			pageMin3 = 1;
			pageMax3 = pageItems3+1;
			pageMaxLabel3 = pageMax3 - 1;
			$('.staff3-list-page').text("").text(pageMin3 + " - " + pageMaxLabel3 + " of " + totalItems3);
			$('.list3-next-btn').css("visibility","visible");
			$('.list3-prev-btn').css("visibility","hidden");
			if(totalItems3 < pageMax3){
				$('.list3-next-btn').css("visibility","hidden");
				$('.list3-prev-btn').css("visibility","hidden");
				pageMaxLabel3 = totalItems3
				$('.staff3-list-page').text("").text(pageMin3 + " - " + pageMaxLabel3 + " of " + totalItems3);
			}
			// --- color tabs
			$(this).children('a').children('img').addClass('active-tab-img');
			$(this).siblings('.list-block').children('a').children('img').removeClass('active-tab-img');
			$(this).children('a').children('p').addClass('active-tab-p');
			$(this).siblings('.list-block').children('a').children('p').removeClass('active-tab-p');
		}
	});

	// --- PAGING ---
	$('.staff3-list-row').css("display","none");
	$('.staff3-list-row').each(function(i){
		var pageNumber3 = (i/pageItems3)+1;
		pageNumber3 = Math.floor(pageNumber3);
		if(pageNumber3 <= 1){
			$(this).css("display","block");
		}
		i++;
	});
	if(totalItems3 < pageMax3){
		$('.list3-next-btn').css("visibility","hidden");
		$('.list3-prev-btn').css("visibility","hidden");
		pageMaxLabel3 = totalItems3
	}
	$('.staff3-list-page').text("").text(pageMin3 + " - " + pageMaxLabel3 + " of " + totalItems3);

	// --- next page
	$('.list3-next-btn').click(function(){
		pageMin3 = pageMin3 + pageItems3;
		pageMax3 = pageMax3 + pageItems3;
		pageMaxLabel3 = pageMax3 - 1;
		$('.staff3-list-row').css("display","none");
		$('.staff3-list-row').each(function(){
			var index = $(this).index();
			if(index >= pageMin3 && index < pageMax3){
				$(this).css("display","block");
			}
		});
		$('.list3-prev-btn').css("visibility","visible");
		if(pageMaxLabel3 <= totalItems3){
			$('.staff3-list-page').text("").text(pageMin3 + " - " + pageMaxLabel3 + " of " + totalItems3);
			$('.list3-prev-btn').css("visibility","visible");
			if(pageMaxLabel3 == totalItems3){
				$('.list3-next-btn').css("visibility","hidden");
			}
		}
		else {
			$('.staff3-list-page').text("").text(pageMin3 + " - " + totalItems3 + " of " + totalItems3);
			$('.list3-next-btn').css("visibility","hidden");
		}
	});

	// --- prev page
	$('.list3-prev-btn').click(function(){
		pageMin3 = pageMin3 - pageItems3;
		pageMax3 = pageMax3 - pageItems3;
		pageMaxLabel3 = pageMax3 - 1;
		$('.staff3-list-row').css("display","none");
		$('.staff3-list-row').each(function(){
			var index = $(this).index();
			if(index >= pageMin3 && index < pageMax3){
				$(this).css("display","block");
			}
		});
		if(pageMin3 >= 1){
			$('.staff3-list-page').text("").text(pageMin3 + " - " + pageMaxLabel3 + " of " + totalItems3);
			$('.list3-next-btn').css("visibility","visible");
			if(pageMin3 == 1) {
				$('.list3-prev-btn').css("visibility","hidden");
			}
		}
		else {
			$('.staff3-list-page').text("").text(pageMin3 + " - " + pageMaxLabel3 + " of " + totalItems3);
			$('.list3-prev-btn').css("visibility","hidden");
		}
	});

});


/* ------------------------------ */
/* --- STAFF2 SORTING / PAGING --- */
/* ------------------------------ */
$(document).ready(function(){

	var toggle2 = [0,0,0,0,0];
	var pageItems2 = 6;
	var totalItems2 = $('.staff2-list-row').length;
	var pageMin2 = 1;
	var pageMax2 = pageItems2+1;
	var pageMaxLabel2 = pageMax2 - 1;
	$('.list2-prev-btn').css("visibility","hidden");
	$('.staff2-list-labels-row').children('div').click(function(){
		// --- column 1 ---
		if($(this).hasClass("column-1")){
			var column1 = [];
			$('.staff2-list-row').each(function(){
				var staffValue = $(this).children('.column-1').text().trim().toLowerCase();
				column1.push(staffValue);
			});
			if(toggle2[0] == 0){
				$(this).find(".list-label").children('img').rotate(0);
				column1.sort();
				toggle2[0] = 1;
			}
			else if(toggle2[0] == 1 ){
				$(this).find(".list-label").children('img').rotate(180);
				column1.sort();
				column1.reverse();
				toggle2[0] = 0;
			}
			// --- rearrange list items
			$('.staff2-list-row').css("display","none");
			for (var i = 0; i < column1.length; i++) {
				var name = column1[i];
				$('.staff2-list-row').each(function(){
					var lename = $(this).find('.lename').text().trim().toLowerCase();
					if(lename == name){
						$(this).detach().appendTo('.staff2-list').css("display","block");
					}
				});
			}
			$('.staff2-list-row').each(function(i){
				if(i >= pageItems2){
					$(this).css("display","none");
				}
				i++;
			});
			// --- reset paging
			pageMin2 = 1;
			pageMax2 = pageItems2+1;
			pageMaxLabel2 = pageMax2 - 1;
			$('.staff2-list-page').text("").text(pageMin2 + " - " + pageMaxLabel2 + " of " + totalItems2);
			$('.list2-next-btn').css("visibility","visible");
			$('.list2-prev-btn').css("visibility","hidden");
			if(totalItems2 < pageMax2){
				$('.list2-next-btn').css("visibility","hidden");
				$('.list2-prev-btn').css("visibility","hidden");
				pageMaxLabel2 = totalItems2
				$('.staff2-list-page').text("").text(pageMin2 + " - " + pageMaxLabel2 + " of " + totalItems2);
			}
			// --- color tabs
			$(this).children('a').children('img').addClass('active-tab-img');
			$(this).siblings('.list-block').children('a').children('img').removeClass('active-tab-img');
			$(this).children('a').children('p').addClass('active-tab-p');
			$(this).siblings('.list-block').children('a').children('p').removeClass('active-tab-p');
		}
		// --- column 2 ---
		if($(this).hasClass("column-2")){
			var column2 = [];
			$('.staff2-list-row').each(function(){
				var staffValue = parseInt(($(this).children('.column-2').text().trim()),10);
				column2.push(staffValue);
			});
			if(toggle2[1] == 0){
				$(this).find(".list-label").children('img').rotate(180);
				column2.sort(function(a, b){return a-b});
				toggle2[1] = 1;
			}
			else if(toggle2[1] == 1 ){
				$(this).find(".list-label").children('img').rotate(0);
				column2.sort(function(a, b){return b-a});
				toggle2[1] = 0;
			}
			// --- rearrange list items
			$('.staff2-list-row').css("display","none");
			for (var i = 0; i < column2.length; i++) {
				var sortedNumber = column2[i];
				$('.staff2-list-row').each(function(){
					var thisNumber = parseInt(($(this).children('.column-2').text().trim()),10);
					if(thisNumber == sortedNumber) {
						$(this).detach().appendTo('.staff2-list').css("display","block");
					}
				});
			}
			$('.staff2-list-row').each(function(i){
				if(i >= pageItems2){
					$(this).css("display","none");
				}
				i++;
			});
			// --- reset paging
			pageMin2 = 1;
			pageMax2 = pageItems2+1;
			pageMaxLabel2 = pageMax2 - 1;
			$('.staff2-list-page').text("").text(pageMin2 + " - " + pageMaxLabel2 + " of " + totalItems2);
			$('.list2-next-btn').css("visibility","visible");
			$('.list2-prev-btn').css("visibility","hidden");
			if(totalItems2 < pageMax2){
				$('.list2-next-btn').css("visibility","hidden");
				$('.list2-prev-btn').css("visibility","hidden");
				pageMaxLabel2 = totalItems2
				$('.staff2-list-page').text("").text(pageMin2 + " - " + pageMaxLabel2 + " of " + totalItems2);
			}
			// --- color tabs
			$(this).children('a').children('img').addClass('active-tab-img');
			$(this).siblings('.list-block').children('a').children('img').removeClass('active-tab-img');
			$(this).children('a').children('p').addClass('active-tab-p');
			$(this).siblings('.list-block').children('a').children('p').removeClass('active-tab-p');
		}
		// --- column 3 ---
		if($(this).hasClass("column-3")){
			var column3 = [];
			$('.staff2-list-row').each(function(){
				var staffValue = $(this).children('.column-3').text().trim();
				staffValue = staffValue.split(" ");
				staffValue = parseInt((staffValue[0]),10);
				column3.push(staffValue);
			});
			if(toggle2[2] == 0){
				$(this).find(".list-label").children('img').rotate(180);
				column3.sort(function(a, b){return a-b});
				toggle2[2] = 1;
			}
			else if(toggle2[2] == 1 ){
				$(this).find(".list-label").children('img').rotate(0);
				column3.sort(function(a, b){return b-a});
				toggle2[2] = 0;
			}
			// --- rearrange list items
			$('.staff2-list-row').css("display","none");
			for (var i = 0; i < column3.length; i++) {
				var sortedNumber = column3[i];
				$('.staff2-list-row').each(function(){
					var thisNumber = $(this).children('.column-3').text().trim();
					thisNumber = thisNumber.split(" ");
					thisNumber = parseInt((thisNumber[0]),10);
					if(thisNumber == sortedNumber) {
						$(this).detach().appendTo('.staff2-list').css("display","block");
					}
				});
			}
			$('.staff2-list-row').each(function(i){
				if(i >= pageItems2){
					$(this).css("display","none");
				}
				i++;
			});
			// --- reset paging
			pageMin2 = 1;
			pageMax2 = pageItems2+1;
			pageMaxLabel2 = pageMax2 - 1;
			$('.staff2-list-page').text("").text(pageMin2 + " - " + pageMaxLabel2 + " of " + totalItems2);
			$('.list2-next-btn').css("visibility","visible");
			$('.list2-prev-btn').css("visibility","hidden");
			if(totalItems2 < pageMax2){
				$('.list2-next-btn').css("visibility","hidden");
				$('.list2-prev-btn').css("visibility","hidden");
				pageMaxLabel2 = totalItems2
				$('.staff2-list-page').text("").text(pageMin2 + " - " + pageMaxLabel2 + " of " + totalItems2);
			}
			// --- color tabs
			$(this).children('a').children('img').addClass('active-tab-img');
			$(this).siblings('.list-block').children('a').children('img').removeClass('active-tab-img');
			$(this).children('a').children('p').addClass('active-tab-p');
			$(this).siblings('.list-block').children('a').children('p').removeClass('active-tab-p');
		}
		// --- column 4 ---
		if($(this).hasClass("column-4")){
			var column4 = [];
			$('.staff2-list-row').each(function(){
				var staffValue = parseInt(($(this).children('.column-4').text().trim()),10);
				column4.push(staffValue);
			});
			if(toggle2[3] == 0){
				$(this).find(".list-label").children('img').rotate(180);
				column4.sort(function(a, b){return a-b});
				toggle2[3] = 1;
			}
			else if(toggle2[3] == 1 ){
				$(this).find(".list-label").children('img').rotate(0);
				column4.sort(function(a, b){return b-a});
				toggle2[3] = 0;
			}
			// --- rearrange list items
			$('.staff2-list-row').css("display","none");
			for (var i = 0; i < column4.length; i++) {
				var sortedNumber = column4[i];
				$('.staff2-list-row').each(function(){
					var thisNumber = parseInt(($(this).children('.column-4').text().trim()),10);
					if(thisNumber == sortedNumber) {
						$(this).detach().appendTo('.staff2-list').css("display","block");
					}
				});
			}
			$('.staff2-list-row').each(function(i){
				if(i >= pageItems2){
					$(this).css("display","none");
				}
				i++;
			});
			// --- reset paging
			pageMin2 = 1;
			pageMax2 = pageItems2+1;
			pageMaxLabel2 = pageMax2 - 1;
			$('.staff2-list-page').text("").text(pageMin2 + " - " + pageMaxLabel2 + " of " + totalItems2);
			$('.list2-next-btn').css("visibility","visible");
			$('.list2-prev-btn').css("visibility","hidden");
			if(totalItems2 < pageMax2){
				$('.list2-next-btn').css("visibility","hidden");
				$('.list2-prev-btn').css("visibility","hidden");
				pageMaxLabel2 = totalItems2
				$('.staff2-list-page').text("").text(pageMin2 + " - " + pageMaxLabel2 + " of " + totalItems2);
			}
			// --- color tabs
			$(this).children('a').children('img').addClass('active-tab-img');
			$(this).siblings('.list-block').children('a').children('img').removeClass('active-tab-img');
			$(this).children('a').children('p').addClass('active-tab-p');
			$(this).siblings('.list-block').children('a').children('p').removeClass('active-tab-p');
		}
	});

	// --- PAGING ---
	$('.staff2-list-row').css("display","none");
	$('.staff2-list-row').each(function(i){
		var pageNumber2 = (i/pageItems2)+1;
		pageNumber2 = Math.floor(pageNumber2);
		if(pageNumber2 <= 1){
			$(this).css("display","block");
		}
		i++;
	});
	if(totalItems2 < pageMax2){
		$('.list2-next-btn').css("visibility","hidden");
		$('.list2-prev-btn').css("visibility","hidden");
		pageMaxLabel2 = totalItems2
	}
	$('.staff2-list-page').text("").text(pageMin2 + " - " + pageMaxLabel2 + " of " + totalItems2);

	// --- next page
	$('.list2-next-btn').click(function(){
		pageMin2 = pageMin2 + pageItems2;
		pageMax2 = pageMax2 + pageItems2;
		pageMaxLabel2 = pageMax2 - 1;
		$('.staff2-list-row').css("display","none");
		$('.staff2-list-row').each(function(){
			var index = $(this).index();
			if(index >= pageMin2 && index < pageMax2){
				$(this).css("display","block");
			}
		});
		$('.list2-prev-btn').css("visibility","visible");
		if(pageMaxLabel2 <= totalItems2){
			$('.staff2-list-page').text("").text(pageMin2 + " - " + pageMaxLabel2 + " of " + totalItems2);
			$('.list2-prev-btn').css("visibility","visible");
			if(pageMaxLabel2 == totalItems2){
				$('.list2-next-btn').css("visibility","hidden");
			}
		}
		else {
			$('.staff2-list-page').text("").text(pageMin2 + " - " + totalItems2 + " of " + totalItems2);
			$('.list2-next-btn').css("visibility","hidden");
		}
	});

	// --- prev page
	$('.list2-prev-btn').click(function(){
		pageMin2 = pageMin2 - pageItems2;
		pageMax2 = pageMax2 - pageItems2;
		pageMaxLabel2 = pageMax2 - 1;
		$('.staff2-list-row').css("display","none");
		$('.staff2-list-row').each(function(){
			var index = $(this).index();
			if(index >= pageMin2 && index < pageMax2){
				$(this).css("display","block");
			}
		});
		if(pageMin2 >= 1){
			$('.staff2-list-page').text("").text(pageMin2 + " - " + pageMaxLabel2 + " of " + totalItems2);
			$('.list2-next-btn').css("visibility","visible");
			if(pageMin2 == 1) {
				$('.list2-prev-btn').css("visibility","hidden");
			}
		}
		else {
			$('.staff2-list-page').text("").text(pageMin2 + " - " + pageMaxLabel2 + " of " + totalItems2);
			$('.list2-prev-btn').css("visibility","hidden");
		}
	});

});

/* ------------------------------ */
/* --- STAFF SORTING / PAGING --- */
/* ------------------------------ */
$(document).ready(function(){

	var toggle = [0,0,0,0,0];
	var pageItems = 6;
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

<script>
$('.website-select-btn').click(function(){
	var siteID = $('select[name=siteID]').val();
	if(siteID != '_PLACEHOLDER'){
		window.location.href="../platform_allies/report_viewer.cfm?pid=269&siteID="+siteID;
	}
	else{
		window.location.href="../platform_allies/report_viewer.cfm?pid=269";
	}
});
</script>
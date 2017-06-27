<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>SB Admin - Bootstrap Admin Template</title>

<!-- Bootstrap Core CSS -->
<link href="../../css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="../../css/sb-admin.css" rel="stylesheet">

<!-- Morris Charts CSS -->
<link href="../../css/plugins/morris.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="../../font-awesome/css/font-awesome.min.css" rel="stylesheet"
	type="text/css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

<!-- jQuery -->
<script src="../../js/jquery.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="../../js/bootstrap.min.js"></script>

<!-- template JavaScript -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>

<script id="template" type="text/x-handlebars-template">
	{{#each .}}
		<tr>
			<td>{{prettifyDate rec_dt}}</td>
			<td>{{company}}</td>
			<td>{{makeIcon variation}} {{prettifyVar variation}}</td>
			<td><a href='/stock/read?code={{code}}'>detail</a></td>
		</tr>
	{{/each}}

</script>

<script type="text/javascript">
$(function(){
	
	/* var start = $("#start").html();
	var end   = document.getElementById("end").value;
	
	var test = $("#test").val(); */
	
	/* var start = $("input").find('inpur[name=start]').val();
	var end   = $("input").find('inpur[name=end]').val(); */
	
	/* Handlebars 날짜 포맷 start */
	Handlebars.registerHelper("prettifyDate", function(timeValue){
		var dateObj = new Date(timeValue);
		var year = dateObj.getFullYear();
		var month = dateObj.getMonth() + 1;
		var date = dateObj.getDate();
		return year + "/" + month + "/" + date;
	});
	/* Handlebars 날짜 포맷 end */
	
	/* Handlebars variable 아이콘 표기 start */
	Handlebars.registerHelper("makeIcon", function(numValue){
		
		var num = Math.floor(numValue * 100);
		
		if(num > 0){
			return new Handlebars.SafeString("<i class='fa fa-chevron-circle-up' style='color: #d9534f;'></i>");
		}else if(num < 0){
			return new Handlebars.SafeString("<i class='fa fa-chevron-circle-down' style='color: #337ab7;'></i>");
		}else{
			return new Handlebars.SafeString("<i class='fa fa-minus-circle' style='color: #cccccc;'></i>");
		}
		
	});
	/* Handlebars variable 아이콘 표기  end */
	
	/* Handlebars 날짜 포맷 start */
	Handlebars.registerHelper("prettifyVar", function(numValue){
		
		var add = Math.floor(numValue * 100) + "%";
		return add;
		
	});
	/* Handlebars 날짜 포맷 end */
	
	var printData = function(history, target, templateObject){
		
		var template = Handlebars.compile(templateObject.html());
		
		var html = "<table class='table table-bordered table-hover text-center'>"
				 + "<thead>"
				 + 	"<tr>"
				 + 		"<th class='text-center'>Date</th>"
				 + 		"<th class='text-center'>company</th>"
				 + 		"<th class='text-center'>variation</th>"
				 + 		"<th class='text-center'>read</th>"
				 + 	"</tr>"
				 + "</thead>"
				 + "<tbody>"
				 + 		template(history)
				 + "</tbody>"
				 + "</table>";
		
		target.empty();
		target.html(html);
	}
	
	$("#searchBtn").on("click", function(event){
		
		var formData = $("#searchform").serialize();
		
		console.info("formData = " + formData);
		
		event.preventDefault();
		
		$.ajax({
			  url : '/stock/historyTable'
			, data : formData
			, dataType : 'json'
			, success : function(history){
				printData( history
						 , $("#hisTable")
						 , $('#template')
						 );
			}
		});
		
	});
	
});
</script>

</head>
<body>

	<div id="wrapper">

		<%@include file="../include/custom-header.jsp"%>


		<div id="page-wrapper">

			<div class="container-fluid">

				<!--Page Heading -->
				<div class="row">
					<div class="col-lg-10">
						<h1 class="page-header">
							History <small></small>
						</h1>
						<ol class="breadcrumb">
							<li class="active"><i class="fa fa-dashboard"></i> Dashboard
							</li>
						</ol>
					</div>
				</div>
				<!-- /.row -->
				
				<!-- search row -->
				<div class="row">
					<div class="col-lg-10">
						<div class="panel panel-default">
							<div class="panel-body text-center">
								<form id="searchform">
									<input type="date" name="start" id="start">
									&nbsp;~&nbsp;
									<input type="date" name="end"   id="end">
									&nbsp;&nbsp;
									<button id="searchBtn" class="btn btn-default">Search</button>
								</form>
							</div>
						</div>
					</div>
				</div>
				<!-- search row end -->
				
				<!-- history detail row -->
				<div class="row">
					<div class="col-lg-10">
						<div class="panel panel-default">
							<div class="panel-heading">
								<h3 class="panel-title">
									<i class="fa fa-clock-o fa-fw" ></i> &nbsp;History
								</h3>
							</div>
							<div class="panel-body text-center" id="hisTable">
								<h4>검색해주세요</h4>
							</div>
						</div>
					</div>
				</div>
				<!-- history detail row end -->

			</div>
			<!-- /.container-fluid -->
		</div>
		<!-- page-wrapper -->
	</div>
	<!-- wrapper -->

	<%@include file="../include/footer.jsp"%>
	
</body>

</html>
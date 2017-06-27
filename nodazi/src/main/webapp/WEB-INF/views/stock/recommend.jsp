<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c"	uri="http://java.sun.com/jsp/jstl/core" %>
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

<!-- Custom Fonts -->
<link href="../../font-awesome/css/font-awesome.min.css" rel="stylesheet"
	type="text/css">

<!-- jQuery -->
<script src="../../js/jquery.js"></script>

<!-- date.js -->
<script src="../../js/date.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="../../js/bootstrap.min.js"></script>

<!-- Google Chart JavaScript -->
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

<script type="text/javascript">
$(function(){
	
	google.charts.load('current', {
		'packages' : [ 'corechart' ]
	});
	
	google.charts.setOnLoadCallback(drawChart);
	
	function drawChart() {
		
		for(var num=0; num<5; num++){
			
			var codeId = "code" + num;
			var code = document.getElementById("code" + num).value;
			
			var chartData = $.ajax({
				  url : '/stock/chartAjax'
				, dataType : 'json'
				, data : {	
					code : code
				  , term : 5
				}
				, async : false
			}).responseText;
			
			/* console.info(chartData) */
			
			var data = new google.visualization.DataTable(chartData, true);
			
			var options = {
				  width : 600
				, height : 350
				, legend : 'none'
				, candlestick: {
					  fallingColor: { strokeWidth: 0, fill: '#337ab7' }
					, risingColor: { strokeWidth: 0, fill: '#d9534f' }
				   }
				, tooltip: {
					  isHtml: true
				  }
				, series: {
					  0 :{color: 'black', visibleInLegend: false}
					}
			};
	
			var chart = new google.visualization.CandlestickChart(document
					.getElementById("chartDiv"+num));
	
			chart.draw(data, options);
			
		}
		
	}

});
</script>

</head>
<body>

	<c:forEach items="${recStockList }" var="recStock" varStatus="status">
		<input type="hidden" id="code${status.index }" value="${recStock.code }">
	</c:forEach>
	
	<div id="wrapper">

		<%@include file="../include/custom-header.jsp"%>

		<div id="page-wrapper">

			<div class="container-fluid">

				<!--Page Heading -->
				<div class="row">
					<div class="col-lg-12">
						<h1 class="page-header">
							추천종목 <small>recommend</small>
						</h1>
						<ol class="breadcrumb">
							<li class="active"><i class="fa fa-dashboard"></i> Dashboard
							</li>
						</ol>
					</div>
				</div>
				<!-- /.row -->
				
				<c:forEach items="${recStockList }" var="recStock" varStatus="status">
						<div class="col-lg-6">
							<div class="panel panel-default">
								<div class="panel-heading">
									<h3 class="panel-title">
										<i class="fa fa-bar-chart-o fa-fw" ></i> &nbsp;${recStock.company }
									</h3>
								</div>
								
								<div class="panel-body">
									<div id="chartDiv${status.index }"></div>
									<div class="text-right">
										<a href="/stock/read?code=${recStock.code }">View Detail <i class="fa fa-arrow-circle-right"></i></a>
									</div>
								</div>
							</div>
						</div>
				</c:forEach>
			</div>
			<!-- /.row -->
		</div>
		<!-- /.container-fluid -->
	</div>
	<!-- /#wrapper -->
	
	<%@include file="../include/footer.jsp"%>

</body>

</html>
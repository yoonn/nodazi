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
<link href="../../font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

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

<!-- Google Chart JavaScript -->
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

<!-- template JavaScript -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>

<script id="template" type="text/x-handlebars-template">
	{{#each .}}
		<tr class="priceTr">
			<td>{{prettifyDate price_date}}</td>
			<td>{{price_open}}</td>
			<td>{{price_close}}</td>
			<td>{{price_high}}</td>
			<td>{{price_low}}</td>
			<td>{{volume}}</td>
		</tr>
	{{/each}}

</script>

<script type="text/javascript">
$(function(){

	var code = document.getElementById("code").value;
	var term = 5;
	
	google.charts.load('current', {
		'packages' : [ 'corechart' ]
	});
	
	google.charts.setOnLoadCallback(drawChart);
	
	$(".chartChange").on("click", function(){

		term = this.value;
		
		google.charts.setOnLoadCallback(drawChart);
	
	});
	
	function drawChart() {

		var chartData = $.ajax({
			  url : '/stock/chartAjax'
			, dataType : 'json'
			, data : {	
				code : code
			  , term : term
			}
			, async : false
		}).responseText;
		
		var data = new google.visualization.DataTable(chartData, true);
		
		var options = {
			  width : 700
			, height : 300
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

		var chart = new google.visualization.CandlestickChart(document.getElementById("chartDiv"));

		chart.draw(data, options);
			
	}
	
	/* Handlebars 날짜 포맷 start */
	Handlebars.registerHelper("prettifyDate", function(timeValue){
		var dateObj = new Date(timeValue);
		var year = dateObj.getFullYear();
		var month = dateObj.getMonth() + 1;
		var date = dateObj.getDate();
		return year + "/" + month + "/" + date;
	});
	/* Handlebars 날짜 포맷 end */
	
	/* Handlbars를 이용한 댓글 출력 함수 선언 start */
	var printData = function(priceArr, target, templateObject){
		
		var template = Handlebars.compile(templateObject.html());
		
		var html = "<table class='table table-bordered table-hover text-center'>"
				 + "<thead>"
				 + "<tr>"
				 + 		"<th class='text-center'>날짜</th>"
				 + 		"<th class='text-center'>시가</th>"
				 + 		"<th class='text-center'>종가</th>"
				 + 		"<th class='text-center'>고가</th>"
				 + 		"<th class='text-center'>저가</th>"
				 + 		"<th class='text-center'>거래량</th>"
				 + "</tr>"
				 + "</thead>"
				 + "<tbody id='priceTbody'>"
				 + template(priceArr)
				 + "</tbody>"
				 + "</table>";
		$("#priceTable").empty();
		target.html(html);
	}
	/* Handlbars를 이용한 댓글 출력 함수 선언  end */
	
	/* 페이징 출력 함수 start*/
	var printPaging = function(pageMaker, target){
		
		var str = "";
		
		if(pageMaker.prev){
			str += "<li><a href='"
				 + (pageMaker.startPage-1)
				 + "'> << </a></li>";
		}
		
		for(var i=pageMaker.startPage, len = pageMaker.endPage; i<=len; i++){
			var strClass = pageMaker.cri.page == i?'class=active':'';
			str += "<li "
				 + strClass
				 + "><a href='"
				 + i
				 + "'>"
				 + i
				 + "</a></li>";
		}
		
		if(pageMaker.next){
			str += "<li><a href='"
				 + (pageMaker.endPage + 1)
				 + "'> >> </a></li>";
		}
		
		target.html(str);
	}
	/* 페이징 출력 함수 end*/
	
	/* 페이지 처리 start*/
	function getPage(pageInfo){
		$.getJSON(pageInfo, function(data){
			printData( data.price
					 , $("#priceTable")
					 , $('#template')
					 );
			printPaging( data.pageMaker
					   , $(".pagination")
					   );
		});
	}
	/* 페이지 처리 end*/

	/* 페이지 링크 처리 start*/
	$(".pagination").on("click", "li a", function(event){
		
		event.preventDefault();
		
		pricePage = $(this).attr("href");
		
		getPage("/stock/" + code + "/" + pricePage);
	});
	/* 페이지 링크 처리 end*/
	
	console.info("/stock/" + code + "/1");
	getPage("/stock/" + code + "/1");
	
	$("#favor").on("click", function(){
		
		var status;
		var star = $(this);
		
		if(star.hasClass("btn-warning")){
			status = 1;
		}else{
			status = 0;
		}
		
		$.ajax({
			  url : '/stock/favorStock'
			, type : 'get'
			, dataType : 'text'
			, data : {
				  status : status
				, code   : code
			}
			, success : function(result){
				if(result == '1'){
					star.removeClass("btn-default");
					star.addClass("btn-warning");
				}else if(result == '0'){
					star.removeClass("btn-warning");
					star.addClass("btn-default");
				}else{
					alert("등록에 실패하였습니다. 나중에 다시 시도해주세요");
				}
			}
			, fail : function(){
				alert("등록에 실패하였습니다. 나중에 다시 시도해주세요");
			}
		});
		
	});
	
	$("#goPay").on("click", function(){
		self.location = "/user/payment_policy";
	});
	
});
	
</script>

</head>
<body>

	

	<input type="hidden" id="code" value="${code.code }"/>

	<div id="wrapper">

		<%@include file="../include/custom-header.jsp"%>


		<div id="page-wrapper">

			<div class="container-fluid">

				<!--Page Heading -->
				<div class="row">
					<div class="col-lg-12">
						<h1 class="page-header">
							상세보기
							<small>${code.company}</small>
							<c:if test="${checkFavor == '1'}">
								<button type="button" class="btn btn-warning btn-circle" id="favor">
									<i class="fa fa-star"></i>
								</button>
							</c:if>
							<c:if test="${checkFavor == '0'}">
								<button type="button" class="btn btn-default btn-circle" id="favor">
									<i class="fa fa-star"></i>
								</button>
							</c:if>
						</h1>
						<ol class="breadcrumb">
							<li class="active"><i class="fa fa-dashboard"></i> Dashboard
							</li>
						</ol>
					</div>
				</div>
				<!-- /.row -->
				
				<!-- chart and history -->
				<div class="row">
					<!-- chart -->
					<div class="col-lg-8">
						<div class="panel panel-default">
							<div class="panel-heading">
								<h3 class="panel-title">
									<i class="fa fa-bar-chart-o fa-fw" ></i> &nbsp;${code.company }
								</h3>
							</div>
							<div class="panel-body text-center">
								<div id="chartDiv"></div>
								<div class="btn-group">
								  <button type="button" class="btn btn-default chartChange" value="5">1 week</button>
								  <button type="button" class="btn btn-default chartChange" value="10">2 week</button>
								  <button type="button" class="btn btn-default chartChange" value="15">3 week</button>
								  <button type="button" class="btn btn-default chartChange" value="20">1 month</button>
								  <button type="button" class="btn btn-default chartChange" value="40">2 month</button>
								  <button type="button" class="btn btn-default chartChange" value="60">3 month</button>
								</div>
							</div>
						</div>
					</div>
					<!-- col-leg-8 end -->
					
					<!-- history -->
					<div class="col-lg-4">
						<div class="panel panel-default">
							<div class="panel-heading">
								<h3 class="panel-title">
									<i class="fa fa-history"></i> &nbsp;History
								</h3>
							</div>
							<div class="panel-body">
								<c:if test="${!empty endDt }">
									<div class="list-group">
										<c:forEach items="${history }" var="history">
											<span class="list-group-item">
												<i class="fa fa-fw fa-calendar"></i>
												<fmt:formatDate value="${history.rec_dt }" pattern="yyyy. MM. dd"/>
												&nbsp;&nbsp;
												<fmt:formatNumber value="${history.latest_price }" type="currency"/>
												<span class="pull-right">
													<c:if test="${history.variation > 0}">
														<i class='fa fa-chevron-circle-up' style='color: #d9534f;'></i>
														<fmt:formatNumber value="${history.variation}" type="percent"/>
													</c:if>
													<c:if test="${history.variation < 0}">
														<i class='fa fa-chevron-circle-down' style='color: #337ab7;'></i>
														<fmt:formatNumber value="${history.variation}" type="percent"/>
													</c:if>
													<c:if test="${history.variation == 0}">
														<i class='fa fa-minus-circle' style='color: #cccccc;'></i>
														<fmt:formatNumber value="${history.variation}" type="percent"/>
													</c:if>
												</span>
											</span>
										</c:forEach>
									</div>
								</c:if>
								<c:if test="${empty endDt }">
									<div class="text-center">
										결제 후 이용 가능합니다.
										<input type="button" value="결제" class="btn btn-default" id="goPay"/>
									</div>
								</c:if>
							</div>
						</div>
					</div>
					<!-- col-lg-4 end -->
				</div>
				<!-- row end -->
				
				<!-- price table -->
				<div class="row">
					<div class="col-lg-12">
						<div class="panel panel-default">
							<div class="panel-heading">
								<h3 class="panel-title">
									<i class="fa fa-money fa-fw" ></i> &nbsp;Price
								</h3>
							</div>
							<div class="panel-body">
								<div class="table-responsive" id="priceTable">
								
								</div>
								<div class = "text-center">
									<ul id="pagination" class="pagination pagination-sm no-margin">
										
									</ul>
								</div>
							</div>
						</div>
					</div>
					<!-- col-lg-12 end -->
				</div>
				<!-- row end -->

			</div>
			<!-- /.container-fluid -->
		</div>
		<!-- page-wrapper -->
	</div>
	<!-- wrapper -->

	<%@include file="../include/footer.jsp"%>
	
</body>

</html>
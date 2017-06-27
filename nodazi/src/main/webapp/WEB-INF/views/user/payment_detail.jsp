<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.Date" %>
<%@ taglib prefix="c"	uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>주가 예측 프로젝트 - 노다지</title>

<!-- Bootstrap Core CSS -->
<link href="../css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="../css/sb-admin.css" rel="stylesheet">

<!-- Morris Charts CSS -->
<link href="../css/plugins/morris.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="../font-awesome/css/font-awesome.min.css" rel="stylesheet"
	type="text/css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>

<style type="text/css">

.box-header{
	margin-bottom: 20px;
}

</style>

</head>

<body>
	<div id="wrapper">

		<%@include file="../include/custom-header.jsp"%>

		<div id="page-wrapper">

			<div class="container-fluid">

				<!--Page Heading -->
				<div class="row">
					<div class="col-lg-12">
						<h1 class="page-header">
							결제 내역
						</h1>
						<ol class="breadcrumb">
							<li class="active"><i class="fa fa-dashboard"></i> Payment Management
							</li>
						</ol>
					</div>
				</div>
				<!-- /.row -->

				<div class="col-lg-12">
						
						<div class="box">

							<div class="box-body">
								<table class="table table-hover text-center">
									<tr>
										<th class="text-center">no</th>
										<th class="text-center">id</th>
										<th class="text-center">입금액</th>
										<th class="text-center">입금은행</th>
										<th class="text-center">입금주</th>
										<th class="text-center">신청일</th>
										<th class="text-center">승인일</th>
										<th class="text-center">만기일</th>
										<th class="text-center">상태</th>
									</tr>
									
									<!--상태 비교를 위해 현재 날짜를 가져옴 -->
									<%
									Date now = new Date();
									%>
									<c:set var="now" value="<%=now%>"/>
									
									<!-- 결제 리스트를 출력 -->
									<c:forEach items="${list}" var="paymentDto">
										<tr>

											<td>
												${paymentDto.p_seq}
											</td>
											<td>${paymentDto.u_id}</td>
											<td>${paymentDto.p_price}</td>
											<td>${paymentDto.p_dep_bank}</td>
											<td>${paymentDto.p_dep_nm}</td>
											<td><fmt:formatDate pattern="yyyy-MM-dd" value="${paymentDto.p_regdt}"/></td>
											<td><fmt:formatDate pattern="yyyy-MM-dd" value="${paymentDto.p_depdt}"/></td>
											<td><fmt:formatDate pattern="yyyy-MM-dd" value="${paymentDto.p_enddt}"/></td>
											<td id="paymentstate">
												<c:if test="${paymentDto.p_enddt==Null}">입금전</c:if>
												<c:if test="${paymentDto.p_enddt!=Null}">
													<c:if test="${paymentDto.p_enddt>=now}">입금완료</c:if>
													<c:if test="${paymentDto.p_enddt<now}">만기</c:if>
												</c:if>
											</td>
										</tr>
									</c:forEach>
								</table>
								
								
							</div>
							<!-- /.box-body -->
			
			
							</div>
							<!-- /.box-footer-->
						</div>
					
				</div>


				<!-- /.row -->

			</div>
			<!-- /.container-fluid -->
		</div>
		<!-- /#wrapper -->
	</div>
				<%@include file="../include/footer.jsp"%>
	<!-- jQuery -->
	<script src="../js/jquery.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="../js/bootstrap.min.js"></script>

	<!-- Morris Charts JavaScript -->
	<script src="../js/plugins/morris/raphael.min.js"></script>
	<script src="../js/plugins/morris/morris.min.js"></script>
	<script src="../js/plugins/morris/morris-data.js"></script>
	
</body>

<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script>

$(document).ready(function(){
			
	$("#searchBtn").on("click",
		function(event) {
			alert("paymentList"
					+ '${pageMaker.makeQuery(1)}'
					+ "&searchType="
					+ $("select option:selected").val()
					+ "&keyword=" + $('#keywordInput').val());
			self.location = "paymentList"
				+ '${pageMaker.makeQuery(1)}'
				+ "&searchType="
				+ $("select option:selected").val()
				+ "&keyword=" + $('#keywordInput').val();
		}
	);
	
	
	
	
	
	$("#approval").on("click",
		function(event){
			
		
		}
	)
		
			
			
});	


</script>



</html>
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

<script type="text/javascript">
$(function(){
	
	$("#searchBtn").on("click", function(event){
		self.location = "list"
						+ "${pageMaker.makeQuery(1)}"
						+ "&searchType="
						+ $("select option:selected").val()
						+ "&keyword="
						+ encodeURIComponent($('#keywordInput').val());
						
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
							종목상세 <small>Statistics Overview</small>
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
								<select name="searchType">
									<option value="n" <c:out value="${cri.searchType == null? 'selected ':' ' }"/>>
										---
									</option>
									<option value="code" <c:out value="${cri.searchType eq 't' ? 'selected ':' ' }"/>>
										code
									</option>
									<option value="com" <c:out value="${cri.searchType eq 'c' ? 'selected ':' ' }"/>>
										종목명
									</option>
								</select>
								&nbsp;&nbsp;
								<input type="text" name="keyword" id="keywordInput" >
								&nbsp;&nbsp;
								<button id="searchBtn" class="btn btn-default">Search</button>
							</div>
						</div>
					</div>
				</div>
				<!-- search row end -->

				<div class="row">
					<div class="col-lg-10">
						<div class="table-responsive">
							<table class="table table-hover text-center">
								<thead>
									<tr>
										<th class="text-center">no</th>
										<th class="text-center">코드</th>
										<th class="text-center">종목명</th>
										<!-- <th class="text-center">전날 종가</th> -->
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${list }" var="codesDto">
										<tr>
											<td>${codesDto.id }</td>
											<td>${codesDto.code }</td>
											<td>
												<a href='/stock/read${pageMaker.makeSearch(pageMaker.cri.page) }&code=${codesDto.code }'>
													${codesDto.company }
												</a>
											</td>
											<!-- <td>        종가를 넣을 수 있나</td> -->
										</tr>
									</c:forEach>
								</tbody>
							</table>

							<div class = "text-center">
								<ul class="pagination">
									<c:if test="${pageMaker.prev }">
										<li><a href="list${pageMaker.makeSearch(pageMaker.startPage - 1)}">&laquo;</a></li>
									</c:if>
									
									<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
										<li <c:out value="${pageMaker.cri.page == idx? 'class=active' : '' }"/>>
											<a href="list${pageMaker.makeSearch(idx) }">${idx }</a>
										</li>
									</c:forEach>
									
									<c:if test="${pageMaker.next && pageMaker.endPage > 0 }">
										<li><a href="list${pageMaker.makeSearch(pageMaker.endPage +1) }">&raquo;</a></li>
									</c:if>
								</ul>
							</div>

						</div>
						<!-- table dev end -->
					</div>
					<!-- col end -->
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
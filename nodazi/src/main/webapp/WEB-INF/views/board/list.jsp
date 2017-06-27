<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<link href="../css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="../css/sb-admin.css" rel="stylesheet">

<!-- Morris Charts CSS -->
<link href="../css/plugins/morris.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="../font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

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
							게시판<small>Board</small>
						</h1>
						<ol class="breadcrumb">
							<li class="active"><i class="fa fa-dashboard"></i>Dashboard</li>
						</ol>
					</div>
				</div>
				<!-- /.row -->

				<div class="row">
					<div class="col-lg-10 text-right">
						<select name="searchType" class="form-control" style="width: 100px; float: left;">
							<option value="n" <c:out value="${cri.searchType == null?'selected':''}"/>>---</option>
							<option value="t" <c:out value="${cri.searchType eq 't'?'selected':''}"/>>Title</option>
							<option value="c" <c:out value="${cri.searchType eq 'c'?'selected':''}"/>>Content</option>
							<option value="w" <c:out value="${cri.searchType eq 'w'?'selected':''}"/>>Writer</option>
							<option value="tc" <c:out value="${cri.searchType eq 'tc'?'selected':''}"/>>Title or Content</option>
							<option value="cw" <c:out value="${cri.searchType eq 'cw'?'selected':''}"/>>Content or Writer</option>
							<option value="tcw" <c:out value="${cri.searchType eq 'tcw'?'selected':''}"/>>Title or Content or Writer</option>
						</select>
						<div class="form-group input-group" style="width: 300px; float: left;">
							<input type="text" name='keyword' id="keywordInput" class="form-control" value='${cri.keyword }' size='100'>
							<span class="input-group-btn">
								<button id='searchBtn' class="btn btn-default" type="button">
									<i class="fa fa-search"></i>
								</button>
							</span>
						</div>
						&nbsp;
						<button id='newBtn' class="btn btn-default">New Board</button>
					</div>
					<!-- col end -->
				</div>
				<!-- /.row -->

				<div class="row">
					<div class="col-lg-10">
						<div class="table-responsive">
							<table class="table table-hover">
								<thead>
									<tr>
										<th>no</th>
										<th>제목</th>
										<th>작성자</th>
										<th>날짜</th>
										<th>조회수</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${list }" var="boardDto">
										<tr>
											<td>${boardDto.b_no }</td>
											<td>
												<a href='/board/read${pageMaker.makeSearch(pageMaker.cri.page) }&b_no=${boardDto.b_no }'>
													${boardDto.b_title }
													<strong>[${boardDto.r_cnt}]</strong>
												</a>
											</td>
											<td>${boardDto.u_id}</td>
											<td><fmt:formatDate pattern="yyyy-MM-dd" value="${boardDto.b_regdt}" /></td>
											<td><span>${boardDto.b_viewcnt }</span></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>

							<div class="text-center">
								<ul class="pagination">
									<c:if test="${pageMaker.prev }">
										<li>
											<a href="list${pageMaker.makeSearch(pageMaker.startPage - 1)}">&laquo;</a>
										</li>
									</c:if>

									<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
										<li <c:out value="${pageMaker.cri.page == idx? 'class=active' : '' }"/>>
											<a href="list${pageMaker.makeSearch(idx) }">${idx }</a>
										</li>
									</c:forEach>

									<c:if test="${pageMaker.next && pageMaker.endPage > 0 }">
										<li>
											<a href="list${pageMaker.makeSearch(pageMaker.endPage +1) }">&raquo;</a>
										</li>
									</c:if>
								</ul>
							</div>
						</div>
						<!-- table dev end -->
					</div>
					<!-- col end -->
				</div>
				<!-- /.row -->
			</div>
			<!-- /.container-fluid -->
		</div>
		<!-- /#page-wrapper -->
	</div>
	<!-- /#wrapper -->
	
	<%@include file="../include/footer.jsp"%>

</body>

<!-- jQuery -->
<script src="../../js/jquery.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="../js/bootstrap.min.js"></script>

<script>
	$(document).ready(function() {
		$("#searchBtn").on("click",
			function(event) {
				self.location = "list"
							  + '${pageMaker.makeQuery(1)}'
							  + "&searchType="
							  + $("select option:selected").val()
							  + "&keyword="
							  + $('#keywordInput').val();
			});
		
		$('#newBtn').on("click", function() {
			self.location = "/board/register";
		});
	});
</script>
</html>
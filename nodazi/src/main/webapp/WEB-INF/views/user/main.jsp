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
    <link href="/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="/css/sb-admin.css" rel="stylesheet">
    <!-- Custom Fonts -->
    <link href="/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
	<style type="text/css">
	#fucking_image{
		width:100%;
		height:10%;
	}
	</style>
</head>

<body>

    <div id="wrapper">

       <%@include file="../include/custom-header.jsp"%>


        <div id="page-wrapper">

            <div class="container-fluid col-lg-12" style=" margin: -25px; margin-top: -9px;">

				<div id="myCarousel" class="carousel slide" data-ride="carousel"> 
	
					<!--페이지-->
					<ol class="carousel-indicators">
						<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
						<li data-target="#myCarousel" data-slide-to="1"></li>
					</ol>
					<!--페이지-->
				
					<div class="carousel-inner"style="margin-bottom: 50px;">
						<!--슬라이드1 start -->
						<div class="item active" id="fucking_image"> 
							<img src="http://www.realwomanglobal.org/img/REAL%20CONNECTIONS%20NETWORK%20Slider.jpg" alt="First slide" width="100%">
							<div class="container">
				
							</div>
						</div>
						<!--슬라이드1 end-->
				
						<!--슬라이드2 start -->
						<div class="item"> 
							<img src="http://www.abraaj.com/wp-content/uploads/2016/05/Op-ed-by-Tom-Speechley-Managing-Private-Equity-Currency-Risk-in-Global-Growth-Markets.jpg" style="width:100%" data-src="" alt="Second slide">
							<div class="container">
				
							</div>
						</div>
						<!--슬라이드2 end -->
				
						<a class="left carousel-control" href="#myCarousel" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a> 
						<a class="right carousel-control" href="#myCarousel" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a> 
					</div>
				</div>
			</div>
			<!-- /.row -->
                
                
			  <div class="container">
                <div class="row">

                <!-- /.row -->
                    <div class="col-lg-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title"><i class="fa fa-pencil-square-o "></i> 게시판</h3>
                            </div>
                            <div class="panel-body">
                                <div class="list-group">
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
                                <div class="text-right">
                                    <a href="/board/list">목록으로 <i class="fa fa-arrow-circle-right"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                    </div>
                   
                </div>
               </div>
                <!-- /.row -->

            </div>
            <!-- /.container-fluid -->
        </div>
        <!-- /#page-wrapper -->

    </div>
		<%@include file="../include/footer.jsp"%>
    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="/js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="/js/bootstrap.min.js"></script>
	
</body>
</html>
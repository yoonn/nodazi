<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
   <!-- Bootstrap Core CSS -->
    <link href="../../css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="../../css/sb-admin.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="../../font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	<style type="text/css">

@font-face{
	font-family: blackChancery;
	src: url(../fonts/BLKCHCRY.ttf);
	font-weight: bold;
}

#companyName{
	font-family: blackChancery;
	font-size: 30px;
	text-align: center;
}
	</style>
</head>

<body>
<!-- Navigation -->
        <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" id="companyName" href="/user/main">Know Da G</a>
            </div>
            <!-- Top Menu Items -->
          
          <c:if test="${empty login }">
			 <div class="navbar-right">
          		<div class=" navbar-form btn-group "style="margin-right: 0px; padding-right: -15px">

	          	<button type="button" id="join_policy" class="btn btn-default">회원가입</button>


    	      	<button type="button" id="login_form" class="btn btn-default">로그인</button>

          		</div>
			 </div>


   		  </c:if>
         
          <c:if test="${!empty login }">
             <ul class="nav navbar-right top-nav">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> ${login.u_nm }<b class="caret"></b></a>
                    <ul class="dropdown-menu" role="menu">
                        <li>
                            <a href="/user/info"><i class="fa fa-fw fa-user"></i> 개인정보조회</a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-fw fa-gear"></i> 개인정보수정</a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="/user/logout"><i class="fa fa-fw fa-power-off"></i> 로그아웃</a>
                        </li>
                    </ul>
                </li>
            </ul>
          </c:if>

            <!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
            <div class="collapse navbar-collapse navbar-ex1-collapse" id="target">
                <ul class="nav navbar-nav side-nav">
                    <li>
                        <a href="/stock/recommend"><i class="fa fa-fw fa-bar-chart-o"></i> 추천종목</a>
                    </li>
                    <li>
                        <a href="/stock/favor"><i class="fa fa-fw fa-star"></i> 관심종목</a>
                    </li>
                    <li>
                        <a href="/stock/list"><i class="fa fa-fw fa-bar-chart-o"></i> 종목상세</a>
                    </li>
                    <!-- <li>
                        <a href="blank4.jsp"><i class="fa fa-fw fa-table"></i> 부가정보</a>
                    </li> -->
                    <li>
                        <a href="/stock/history"><i class="fa fa-fw fa-desktop"></i> 히스토리</a>
                    </li>
                    <li>
                        <a href="/board/list"><i class="fa fa-fw fa-edit"></i> 게시판</a>
                    </li>
                      <c:if test="${login.u_mgr == 0}"> 
                    <li>
                    
                        <a href="javascript:;" data-toggle="collapse" data-target="#demo1"><i class="fa fa-shopping-cart"></i> 결제 <i class="fa fa-fw fa-caret-down"></i></a>
                        <ul id="demo1" class="collapse">
                            <li>
                                <a href="/user/payment_policy">결제</a>
                            </li>
                            <li>
                                <a href="/user/payment_detail">결제내역</a>
                            </li>
                        </ul>
                    </li>
                    </c:if>
                  <c:if test="${ login.u_mgr == 1}">
                  </c:if>
                 <c:if test="${login.u_mgr == 1}">
                    <li>
                        <a href="javascript:;" data-toggle="collapse" data-target="#demo2"><i class="glyphicon glyphicon-king"></i> 관리 <i class="fa fa-fw fa-caret-down"></i></a>
                        <ul id="demo2" class="collapse">
                            <li>
                                <a href="/manager/userList">회원관리</a>
                            </li>
                            <li>
                                <a href="/manager/paymentList">결제관리</a>
                            </li>
                        </ul>
                    </li>
                 </c:if>
                 <c:if test="${ login.u_mgr == 0}">
                  </c:if>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </nav>
            <!-- jQuery -->
    <script src="../../js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="../../js/bootstrap.min.js"></script>
    
        <script>
        $(".dropdown-toggle").dropdown();
       $("a[data-toggle='collapse']").click(function(){
        	var that = this;
        	$(that).next().toggleClass("in");
        	return false;
        });
       
       $("button[data-toggle='collapse']").click(function(){
    	  	$("#target").toggleClass("in");
    	  	return false;
       });
        
		$(function(){
			$("#main_tag").click(function(){
				$("#main_tag").attr("method","get");
			});
			
		});
        
        $("#join_policy").on("click",function(){
        	self.location = "/user/join_policy"
        })
        
        $("#login_form").on("click",function(){
        	self.location = "/user/login"
        })
        
        	 $(function(){
	  var sBtn = $("ul > li");    //  ul > li 이를 sBtn으로 칭한다. (클릭이벤트는 li에 적용 된다.)
	  sBtn.find("a").click(function(){   // sBtn에 속해 있는  a 찾아 클릭 하면.
	   sBtn.removeClass("active");     // sBtn 속에 (active) 클래스를 삭제 한다.
	   $(this).parent().addClass("active"); // 클릭한 a에 (active)클래스를 넣는다.
	  })
	 })
        </script>
</body>
</html>
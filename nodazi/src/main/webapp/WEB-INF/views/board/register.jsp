<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<link href="../font-awesome/css/font-awesome.min.css" rel="stylesheet"
	type="text/css">

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
							글쓰기<small>REGISTER BOARD</small>
						</h1>
						<ol class="breadcrumb">
							<li class="active"><i class="fa fa-dashboard"></i>Dashboard</li>
						</ol>
					</div>
				</div>
				<!-- /.row -->

				<form id='registerForm' role="form" method="post">
					<!-- Main content -->
					<section class="content">
						<div class="row">
							<div class="col-lg-12">
								<div class="form-group">
									<label>제목</label>
									<input class="form-control" name='b_title' id="b_title">
								</div>
								<div class="form-group">
									<label>내용</label>
									<textarea class="form-control" id="b_content" rows="5" name="b_content"></textarea>
								</div>
								<div class="form-group">
									<label for="exampleInputEmail1">작성자</label> 
									<input type="text" name="u_id" class="form-control" value="${login.u_id }" readonly>
								</div>
							</div>
							<ul class="mailbox-attachments clearfix uploadedList"></ul>
							<button type="submit" class="btn btn-primary">저장</button>
							<button type="button" class="btn btn-warning">취소</button>
						</div>
					</section>
				</form>
			</div>
			<!-- /.container-fluid -->
		</div>
		<!-- /#page-wrapper -->
	</div>
	<!-- /#wrapper -->

	<%@include file="../include/footer.jsp"%>
	
	<!-- jQuery -->
	<script src="../../js/jquery.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="../../js/bootstrap.min.js"></script>

</body>

<script type="text/javascript" src="../js/upload.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script id="template" type="text/x-handlebars-template">
<li>
  <span class="mailbox-attachment-icon has-img">
	<img src="{{imgsrc}}" alt="Attachment">
  </span>
  <div class="mailbox-attachment-info">
	<a href="{{getLink}}" class="mailbox-attachment-name">{{fileName}}</a>
	<a href="{{fullName}}" class="btn btn-default btn-xs pull-right delbtn"><i class="fa fa-fw fa-remove"></i></a>
  </div>
</li>                
</script>    

<script>
$(".btn-warning").on("click", function(){
	  self.location = "/board/list";
});

var template = Handlebars.compile($("#template").html());

$(".fileDrop").on("dragenter dragover", function(event){
	event.preventDefault();
});

$("#registerForm").submit(function(event){
	event.preventDefault();
	
	var that = $(this);
	
	var str ="";
	$(".uploadedList .delbtn").each(function(index){
		 str += "<input type='hidden' name='files[" + index + "]' value='" + $(this).attr("href") + "'> ";
	});
	
	that.append(str);

	that.get(0).submit();
});

$(".btn-primary").on("click", function(){
	var b_title = $("#b_title").val();
	var b_content = $("#b_content").val();
	
	if(b_title == ""){
		alert("제목을 입력해주세요");
		return false;
	}
	
	if(b_content == ""){
		alert("내용을 입력해주세요");
		return false;
	}
});

</script>

</html>
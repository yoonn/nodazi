<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<script type="text/javascript" src="../../js/upload.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>SB Admin - Bootstrap Admin Template</title>

<!-- Bootstrap Core CSS -->
<link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css">

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
	<div class='popup back' style="display: none;"></div>
	<div id="popup_front" class='popup front' style="display: none;">
		<img id="popup_img">
	</div>

	<div id="wrapper">

		<%@include file="../include/custom-header.jsp"%>

		<div id="page-wrapper">

			<div class="container-fluid">

				<!--Page Heading -->
				<div class="row">
					<div class="col-lg-12">
						<h1 class="page-header">
							게시판
						</h1>
						<ol class="breadcrumb">
							<li class="active"><i class="fa fa-dashboard"></i>Board</li>
						</ol>
					</div>
				</div>
				<!-- /.row -->

				<form role="form" action="modify" method="post">
					<input type='hidden' name='b_no' id="b_no" value="${boardDto.b_no}">
					<input type='hidden' name='page' value="${cri.page}">
					<input type='hidden' name='perPageNum' value="${cri.perPageNum}">
					<input type='hidden' name='searchType' value="${cri.searchType}">
					<input type='hidden' name='keyword' value="${cri.keyword}">
				</form>
				
				<div class="row">
					<div class="col-lg-10">
						<div class="form-group">
							<span><strong class="btitle">${boardDto.b_title}</strong></span>
						</div>
						<div class="form-group">
							<span><strong>${boardDto.u_id }</strong></span>
							<span>|</span>
							<span>조회 ${boardDto.b_viewcnt }</span>
							<span>|</span>
							<span>
								<fmt:formatDate pattern="yyyy/MM/dd" value="${boardDto.b_regdt }"/>
							</span>
						</div>
						
						<div><hr></div>
						
						<div class="form-group">
							<textarea class="form-control" name="b_content" rows="5" readonly="readonly">${boardDto.b_content}</textarea>
						</div>
					</div>

					<div class="col-lg-10">
						<ul class="mailbox-attachments clearfix uploadedList"></ul>
						<c:if test="${login.u_id == boardDto.u_id}">
						<button type="submit" id="modifyBtn" class="btn btn-info">수정</button>
						<button type="submit" id="removeBtn" class="btn btn-warning">삭제</button>
						</c:if>
						<button type="submit" id="goListBtn" class="btn btn-success">목록</button>
					</div>
				</div>
				<!-- /.row -->
				<div>
					<hr>
				</div>
				<div class="row">
					<div class="col-lg-10">
						<c:if test="${not empty login}">
							<div class="col-lg-10">
								<input class="form-control" type="text" id="newReplyText">
							</div>
							<input type="hidden" id="replywriter" value="${login.u_id}">
						</c:if>
						<c:if test="${empty login}">
							<div class="col-lg-10">
								<input class="form-control" type="text" id="newReplyText" readonly="readonly" value="댓글 적성을 위해 로그인을 해주세요.">
							</div>
						</c:if>
						<div class="box-footer">
							<button type="submit" class="btn btn-default" id="replyAddBtn">댓글 등록</button>
						</div>
						<br>
						<!-- The time line -->
						<div class="col-lg-12">
							<ul class="chat">
								<!-- timeline time label -->
								<li class="left clearfix" id="repliesDiv">
									<div class="chat-body clearfix">
										<div class="header">
											<strong class="primary-font">댓글</strong>
											<small class="text-muted">
												[${boardDto.r_cnt}]
											</small>
										</div>
									</div>
								</li>
							</ul>
							<div class='text-center'>
								<ul id="pagination" class="pagination pagination-sm no-margin "></ul>
							</div>
						</div>
					</div>
					<!-- /.col -->
				</div>
				<!-- /.row -->
				
			</div>
			<!--/.container-fluid -->
		</div>
		<!-- /.page-wrapper -->
	</div>
	<!-- /#wrapper -->

	<%@include file="../include/footer.jsp"%>

</body>

<!-- jQuery -->
<script src="../../js/jquery.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="../js/bootstrap.min.js"></script>

<script id="templateAttach" type="text/x-handlebars-template">
<li data-src='{{fullName}}'>
  <span class="mailbox-attachment-icon has-img"><img src="{{imgsrc}}" alt="Attachment"></span>
  <div class="mailbox-attachment-info">
	<a href="{{getLink}}" class="mailbox-attachment-name">{{fileName}}</a>
	</span>
  </div>
</li>
</script>  


<script id="template" type="text/x-handlebars-template">
{{#each .}}
	<li class="left clearfix replyLi">
		<div class="chat-body clearfix" >
			<div class="header">
				<strong class="primary-font">{{u_id}}</strong>
				<small class="pull-right text-muted">
					<i class="glyphicon glyphicon-time"/>
						{{prettifyDate r_regdt}}
				</small>
			</div>
			<p>
				<span>{{r_content}}</span>
				<input type="hidden" id="selectedRno" value={{r_no}} />
				<small class="pull-right text-muted">
					{{chkIDToDeleteReply u_id}}
				</small>
			</p>
		</div>
	</li>
{{/each}}    
</script> 

<script>
	
	$(document).on("click", "#replyModBtn", function() {
		
		if($(this).nextAll().size() > 4){
			return;
		}
		
		var r_no = $(this).parent().prev().val();
		var r_content = $(this).parent().prev().prev().text();
		var c_span = $(this).parent().prev().prev();
		var small = $(this).parent();
		
		console.info("rno : " + r_no + ", r_content : " + r_content);
		
		var div = $("<div>");
		
		var div11 = $("<div>");
		div11.addClass("col-lg-11");
		
		var input = $("<input>");
		input.attr("type","text");
		input.attr("id","replyContent");
		input.addClass("form-control");
		input.val(r_content);
		
		var button = $("<button>");
		button.attr("type","button");
		button.addClass("btn btn-info");
		button.attr("id","replyMod2nd");
		button.text("수정");
		
		div11.append(input);
		div.append(div11).append(button);
		c_span.after(div);
		c_span.remove();
		small.remove();
		
		$("#replyMod2nd").on("click",function(){
			
			r_content = $("#replyContent").val();
		
			$.ajax({
				type : 'put',
				url : '/replies/' + r_no + '/' + b_no,
				headers : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "PUT"
				},
				data : JSON.stringify({
					r_content : r_content
				}),
				dataType : 'text',
				success : function(result) {
					console.log("result: " + result);
					if (result == 'SUCCESS') {
						alert("수정 되었습니다.");
						getPage("/replies/" + b_no + "/" + replyPage);
					}
				}
			});
			
		});
		
	
	});
	
	
	$(document).on("click","#replyDelBtn", function() {
		
		var r_no = $(this).parent().prev().val();
		
		console.info("r_no = " + r_no);
		
		$.ajax({
			type : 'delete',
			url : '/replies/' + r_no + '/' + b_no,
			headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "DELETE"
			},
			dataType : 'text',
			success : function(result) {
				console.log("result: " + result);
				if (result == 'SUCCESS') {
					alert("삭제 되었습니다.");
					getPage("/replies/" + b_no + "/" + replyPage);
				}
			}
		});
	});

	Handlebars.registerHelper("eqReplyer", function(replyer, block) {
		var accum = '';
		if (replyer == '${login.u_id}') {
			accum += block.fn();
		}
		return accum;
	});

	Handlebars.registerHelper("prettifyDate", function(timeValue) {
		var dateObj = new Date(timeValue);
		var year 	= dateObj.getFullYear();
		var month 	= dateObj.getMonth() + 1;
		var date 	= dateObj.getDate();
		return year + "/" + month + "/" + date;
	});
	
	Handlebars.registerHelper("chkIDToDeleteReply",function(u_id){
		var replyer 	 = $("#replywriter").val();
		if(replyer == u_id){
			return new Handlebars.SafeString(
					"<a href='#' id='replyModBtn'><span>수정</span></a>"+
					"<span>&nbsp;|&nbsp;</span>"+
					"<a href='#' id='replyDelBtn'><span>삭제</span></a>");
		}
	})
	
	var printData = function(replyArr, target, templateObject) {

		var template = Handlebars.compile(templateObject.html());

		var html = template(replyArr);
		$(".replyLi").remove();
		target.after(html);

	}

	var b_no = ${boardDto.b_no};

	var replyPage = 1;

	function getPage(pageInfo) {

		$.getJSON(pageInfo, function(data) {
			printData(data.list, $("#repliesDiv"), $('#template'));
			printPaging(data.pageMaker, $(".pagination"));

			$("#modifyModal").modal('hide');
			$("#replycntSmall").html("[ " + data.pageMaker.totalCount + " ]");
			
		});
	}

	var printPaging = function(pageMaker, target) {

		var str = "";

		if (pageMaker.prev) {
			str += "<li><a href='"
				+ (pageMaker.startPage - 1)
				+ "'> << </a></li>";
		}

		for (var i = pageMaker.startPage, len = pageMaker.endPage; i <= len; i++) {
			var strClass = pageMaker.cri.page == i ? 'class=active' : '';
			str += "<li " + strClass + "><a href='" + i + "'>" + i + "</a></li>";
		}

		if (pageMaker.next) {
			str += "<li><a href='"
				+ (pageMaker.endPage + 1)
				+ "'> >> </a></li>";
		}

		target.html(str);
	};

	$("#repliesDiv").on("click", function() {

		if ($(".chat li").size() > 1) {
			return;
		}
		$(".replyLi").remove();
		getPage("/replies/" + b_no + "/1");

	});

	$(".pagination").on("click", "li a", function(event) {

		event.preventDefault();

		replyPage = $(this).attr("href");

		getPage("/replies/" + b_no + "/" + replyPage);

	});

	$("#replyAddBtn").on("click", function() {
		var replytextObj = $("#newReplyText");
		var replyer 	 = $("#replywriter").val();
		var replytext 	 = replytextObj.val();
		
		console.info("replytext : " + replytext);
		
		if(replytext == null || replytext ==""){
			alert("내용을 입력해 주세요");
			return;
		}
		
		$.ajax({
			type : 'post',
			url : '/replies/',
			headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "POST"
			},
			dataType : 'text',
			data : JSON.stringify({
				b_no : b_no,
				u_id : replyer ,
				r_content : replytext
			}),
			success : function(result) {
				console.log("result: " + result);
				if (result == 'SUCCESS') {
					alert("등록 되었습니다.");
					replyPage = 1;
					getPage("/replies/" + b_no + "/" + replyPage);
					replytextObj.val("");
				}
			}
		});
	});

	$(".timeline").on("click", ".replyLi", function(event) {

		var reply = $(this);

		$("#replytext").val(reply.find('.timeline-body').text());
		$("#modify-rno").val(reply.attr("data-rno"));

	});
	
	
</script>


<script>
$(document).ready(function(){
	
	var formObj = $("form[role='form']");
	
	console.log(formObj);
	
	$("#modifyBtn").on("click", function(){
		formObj.attr("action", "/board/modify");
		formObj.attr("method", "get");		
		formObj.submit();
	});
	
	$("#removeBtn").on("click", function(){
		var r_cnt =  $("#replycntSmall").html();
		
		if(r_cnt > 0 ){
			alert("댓글이 달린 게시물을 삭제할 수 없습니다.");
			return;
		}
		
		var arr = [];
		$(".uploadedList li").each(function(index){
			 arr.push($(this).attr("data-src"));
		});
		
		console.log(arr);
	 	if(arr.length > 0){
			$.post("/deleteAllFiles",{files:arr}, function(){
				
				formObj.attr("action", "/board/remove");
				formObj.submit();
				
			});
		}else{
			formObj.attr("action", "/board/remove");
			formObj.submit();
		}
		
	});	
	
	$("#goListBtn ").on("click", function(){
		formObj.attr("method", "get");
		formObj.attr("action", "/board/list");
		formObj.submit();
	});
	
	var b_no = ${boardDto.b_no};
	var template = Handlebars.compile($("#templateAttach").html());
	
	$.getJSON("/board/getAttach/" + b_no, function(list){
		$(list).each(function(){
			
			var fileInfo = getFileInfo(this);
			
			var html = template(fileInfo);
			
			 $(".uploadedList").append(html);
		});
	});

	$(".uploadedList").on("click", ".mailbox-attachment-info a", function(event){
		
		var fileLink = $(this).attr("href");
		
		if(checkImageType(fileLink)){
			
			event.preventDefault();
					
			var imgTag = $("#popup_img");
			imgTag.attr("src", fileLink);
			
			console.log(imgTag.attr("src"));
					
			$(".popup").show('slow');
			imgTag.addClass("show");		
		}	
	});
	
	$("#popup_img").on("click", function(){
		
		$(".popup").hide('slow');
		
	});
});


function goLogin(){
	self.location ="/user/login";
}

</script>

<style type="text/css">
    
    .popup{
    	position: absolute;
    }
    
    .back{
    	background-color: gray; 
    	opacity:0.5; 
    	width: 100%; 
    	height: 300%; 
    	overflow:hidden;  
    	z-index:1101;
    }
    
    .front { 
		z-index:1110; 
		opacity:1; 
		boarder:1px; 
		margin: auto; 
	}
	
	.show{
		position:relative;
		max-width: 1200px; 
		max-height: 800px; 
		overflow: auto;       
	} 
     
	.box-title{
		font-size: 20px;
		font-weight: bold;
		margin: 5px;
	}
  	
  	#replyModBtn{
  		margin-left: 40px;
  	}
  	
  	.modal-title{
  		font-weight: bold;
  		font-size: 20px;
  	}
  	
  	li {
  		list-style: none;
  	}
  	
  	.btitle{
  		font-size: 20px;
  	}
  	
</style>

<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"	uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"	uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
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
    <link href="../../font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- jQuery -->
    <script src="../../js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="../../js/bootstrap.min.js"></script>
    
    <!-- javascript -->
    <script src="../../js/User.js"></script>
    
    <script type="text/javascript"></script>
    
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

</head>

<script type="text/javascript">
$(function(){
	
	$("#tab a").click(function(e) {
		e.preventDefault();
		$(this).tab("show");
	});

});
</script>

<body>

    <div id="wrapper">

       <%@include file="../include/custom-header.jsp"%>


        <div id="page-wrapper">

            <div class="container-fluid">

 			<!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            	사용자 정보 <small>User Information</small>
                        </h1>
                </div>
                <!-- /.row -->
      	<div class="center-block clearfx">
			<div class="container">
			  <div class="row">
			   <!--  <div class="col-sm-6 col-sm-offset-2"> -->	
			
			      <!-- Nav tabs -->
			      <ul class="nav nav-tabs" role="tablist" id="tab">
			        <li role="presentation" class="active"><a href="" id="link-1" aria-controls="section-1" role="tab" data-target="#section-1" data-toggle="tab">사용자 정보</a></li>
			        <li role="presentation" class=""><a href="" id="link-2" aria-controls="section-2" role="tab" data-target="#section-2" data-toggle="tab">정보 수정</a></li>
			        <li role="presentation" class=""><a href="" id="link-3" aria-controls="section-3" role="tab" data-target="#section-3" data-toggle="tab">회원 탈퇴</a></li>
			      </ul>
				
			      <!-- Tab panes -->
			      <div class="tab-content">
			        <div role="tabpanel" class="tab-pane fade active in" id="section-1">
						<div class="container">
						 <form class="well form-horizontal"  id="contact_form">
						<fieldset>
						
						<!-- Form Name -->
						<legend><center><h2><b>사용자 정보</b></h2></center></legend><br>
						
						<div class="form-group">
						  <label class="col-md-4 control-label" >Name</label> 
						    <div class="col-md-4 inputGroupContainer">
						    <div class="input-group">
						  <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
						   <input type="text" class="form-control" value="${udto.u_nm }" readonly="readonly">
						    </div>
						  </div>
						</div>
						  
						<!-- Text input-->
						
						<div class="form-group">
						  <label class="col-md-4 control-label">ID</label>  
						  <div class="col-md-4 inputGroupContainer">
						  <div class="input-group">
						  <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
						  <input type="text" class="form-control"  value="${udto.u_id }" readonly="readonly">
						    </div>
						  </div>
						</div>

						<!-- Text input-->
						       <div class="form-group">
						  <label class="col-md-4 control-label">E-Mail</label>  
						    <div class="col-md-4 inputGroupContainer">
						    <div class="input-group">
						        <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
						  <input type="text" class="form-control" id="f_u_email" value="${udto.u_email }" readonly="readonly">
						    </div>
						  </div>
						</div>
						
						
						<!-- Text input-->
						       
						<div class="form-group">
						  <label class="col-md-4 control-label">Contact No.</label>  
						    <div class="col-md-4 inputGroupContainer">
						    <div class="input-group">
						        <span class="input-group-addon"><i class="glyphicon glyphicon-earphone"></i></span>
						  <input type="text" class="form-control"  id="f_u_mobile" value="${udto.u_mobile }" readonly="readonly">
						    </div>
						  </div>
						</div>
						
						
						</fieldset>
						</form>
						</div>
					</div>
			      
			      <!-- section 2 -->
			       <div role="tabpanel" class="tab-pane fade" id="section-2">
						<div class="container">
						 <form class="well form-horizontal"  id="contact_form">
						<fieldset>
						
						<!-- Form Name -->
						<legend><center><h2><b>정보 수정</b></h2></center></legend><br>
						
						<div class="form-group">
						  <label class="col-md-4 control-label" >Name</label> 
						    <div class="col-md-4 inputGroupContainer">
						    <div class="input-group">
						  <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
						   <input type="text" class="form-control" id="u_nm" name="u_nm" value="${udto.u_nm }" readonly="readonly">
						    </div>
						  </div>
						</div>
						  
						<!-- Text input-->
						
						<div class="form-group">
						  <label class="col-md-4 control-label">ID</label>  
						  <div class="col-md-4 inputGroupContainer">
						  <div class="input-group">
						  <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
						   <input type="text" class="form-control"  value="${udto.u_id }" readonly="readonly">
						    </div>
						  </div>
						</div>
						
						<!-- Text input-->
						
						<div class="form-group">
						  <label class="col-md-4 control-label" >Password</label> 
						    <div class="col-md-4 inputGroupContainer">
						    <div class="input-group">
						  <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
						  <input type="text" class="form-control" id="u_pw" name="u_pw" value="${udto.u_pw }" >
						    </div>
						  </div>
						</div>
						
						<!-- Text input-->
						
						<div class="form-group">
						  <label class="col-md-4 control-label" >Confirm Password</label> 
						    <div class="col-md-4 inputGroupContainer">
						    <div class="input-group">
						  <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
						  <input name="confirm_password" placeholder="Confirm Password" class="form-control"  type="password" name="passcheck" id="passcheck">
						    </div>
						  </div>
						</div>
						
						<!-- Text input-->
						       <div class="form-group">
						  <label class="col-md-4 control-label">E-Mail</label>  
						    <div class="col-md-4 inputGroupContainer">
						    <div class="input-group">
						        <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
						   <input type="text" class="form-control" id="u_email" name="u_email" value="${udto.u_email }" >
						    </div>
						  </div>
						</div>
						
						
						<!-- Text input-->
						       
						<div class="form-group">
						  <label class="col-md-4 control-label">Contact No.</label>  
						    <div class="col-md-4 inputGroupContainer">
						    <div class="input-group">
						        <span class="input-group-addon"><i class="glyphicon glyphicon-earphone"></i></span>
						  <input type="text" id="u_mobile" name="u_mobile" placeholder="Mobile" class="form-control"  value="${udto.u_mobile }" >
						    </div>
						  </div>
						</div>
						
						<!-- Button -->
						<div class="form-group">
						  <label class="col-md-4 control-label"></label>
						  <div class="col-md-4"><br>
						     &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<button type="button" id="update_btn" name="update_btn" class="btn btn-warning" >&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspUpdate <span class="glyphicon glyphicon-send"></span>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</button>
						  </div>
						</div>
						
						</fieldset>
						</form>
						</div>
			        </div>
			        
			        <!-- section 3 -->
			        <div role="tabpanel" class="tab-pane fade" id="section-3">
			        	<div class="container">
						 <form class="well form-horizontal"  id="contact_form" action="/user/withdraw" method="post">
						<fieldset>
						
						<!-- Form Name -->
						<legend><center><h2><b>회원 탈퇴</b></h2></center></legend><br>
						
						<div class="form-group" style="text-align: center;">
											        <div class="col-lg-3"></div>
											        <div class="col-lg-6" style="margin-bottom: 10px;">
											        <textarea class="form-control" rows="10" readonly="readonly" style="resize:none; ">당 사이트의 이용은 무통장거래로 이루어집니다.
결제신청 후 예금주:관리자 계좌번호:xxx-xxx-xxxxxxx(xx은행)로 입금하여 주시면 이용 승인 후 그 즉시서비스 이용이 가능해 집니다. 
만약,결제 신청후 1주일이 지나도록 입금이 되지않으면 신청기록은 사라지니 유의하여 주십시오.


*주:관리자의 사정에 따라 확인이 늦어질 수 있습니다.
				        </textarea>
				        </div>
				        <div class="col-lg-3"></div>
				        <div class="col-lg-12">
			        	<input type="hidden" id="u_id" name="u_id" value="${udto.u_id }">
			        	<input type="submit" id="withdraw_btn" class="btn btn-warning" value="탈퇴">
						
				        </div>
						</div>
						</fieldset>
			        	</form>
						</div>
			        </div>
			        <!-- section end -->
			      </div>
			    </div>
			  </div>
			</div>		
		</div>
                <!-- /.row -->

            </div>
            </div>
            </div>
		<%@include file="../include/footer.jsp"%>
<script>
$(function(){
	
	$("#update_btn").on("click",function(){
		var u_id = $("#u_id").val();
		var u_pw = $("#u_pw").val();
		var u_email = $("#u_email").val();
		var u_mobile = $("#u_mobile").val();
		var passcheck = $("#passcheck").val();
	
		if(idCheck()){
			$.ajax({
				type:'put',
				url: '/user/'+u_id,
				headers:{
						"Content-Type":"application/json",
						"X-HTTP-Method-Override":"PUT"},
				data:JSON.stringify({u_pw:u_pw,u_email:u_email,u_mobile:u_mobile}),
				dataType:'text',
				success:function(result){
					console.log("result:" +result);
					if(result == 'success'){
						alert("성공");
						getInfo();
					}
				}
				
			});
		}
	});
	
	function getInfo(){
		alert("info");
		$("#f_u_email").val($("#u_email").val());
		$("#f_u_mobile").val($("#u_mobile").val());
			
	}
});

</script>
</body>
</html>
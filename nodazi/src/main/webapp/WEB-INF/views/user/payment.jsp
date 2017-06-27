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
    <link href="/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="/css/sb-admin.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    
       <!-- jQuery -->
    <script src="/js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="/js/bootstrap.min.js"></script>

</head>


<body>

   <div id="wrapper">

       <%@include file="../include/custom-header.jsp"%>


        <div id="page-wrapper">

            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            	결제 <small>Payment</small>
                        </h1>
     				</div>
     			</div>
     	<div class="row row-centered">
			<div class="col-lg-3"></div>
				<div class="col-lg-6">
     				<form class="well form-horizontal"  method="post" action="/user/payment">
						<fieldset>
						<!-- Form Name -->
						 <div class="col-lg-12" style="margin-bottom: 20px;">
				        <textarea class="form-control" rows="10" readonly="readonly" style="resize:none; ">당 사이트의 이용은 무통장거래로 이루어집니다.
결제신청 후 예금주:관리자 계좌번호:xxx-xxx-xxxxxxx(xx은행)로 입금하여 주시면 이용 승인 후 그 즉시서비스 이용이 가능해 집니다. 
만약,결제 신청후 1주일이 지나도록 입금이 되지않으면 신청기록은 사라지니 유의하여 주십시오.


*주:관리자의 사정에 따라 확인이 늦어질 수 있습니다.
				        </textarea>
				    </div><br>
						
						<!-- Text input-->
						
						<div class="form-group">
						  <label class="col-md-4 control-label">입금자명</label>  
						  <div class="col-md-4 inputGroupContainer">
							  <div class="input-group">
							  <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
							  <input type="text" class="form-control" id="p_dep_nm" name="p_dep_nm" required="" value= ${login.u_nm }>
							  </div>
						  </div>
						</div>
						
						
						<div class="form-group">
						  <label class="col-md-4 control-label" >계좌번호</label> 
						    <div class="col-md-4 inputGroupContainer">
						    <div class="input-group">
						  <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
						  <input name="p_account" type="text" class="form-control" id="email2">
						    </div>
						  </div>
						</div>
						
						<div class="form-group">
						  <label class="col-md-4 control-label" >결제 기간</label> 
						    <div class="col-md-4 inputGroupContainer">
						    <div class="input-group">
						  <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
								<select name="p_price" class="form-control" id="price_select">
		  						  <option value="" selected>-----</option>
		    					  <option value="10000">30일</option>
		    					  <option value="30000">90일</option>
		    					  <option value="60000">180일</option>
		    					  <option value="120000">360일</option>
								</select>
							</div>
						  </div>
						</div>
						
						<div class="form-group">
						  <label class="col-md-4 control-label" >입금은행</label> 
						    <div class="col-md-4 inputGroupContainer">
						    <div class="input-group">
						  <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
								<select name="p_dep_bank" class="form-control" id="bank_select">
		  						  <option value="" selected>-----</option>
		    					  <option value="하나">하나</option>
		    					  <option value="우리">우리</option>
		    					  <option value="농협">농협</option>
		    					  <option value="신한">신한</option>
								</select>
							</div>
						  </div>
						</div>
						<!-- Button -->
						<div class="form-group">
						  <label class="col-md-4 control-label"></label>
						  <div class="col-md-4" style="text-align: center"><br>
						    <button type="submit" class="btn btn-warning" id="submit"><span class="glyphicon glyphicon-send">&nbsp</span>전송</button>
						  </div>
						</div>
						<input type="hidden" name="u_id" value=${login.u_id }>
						</fieldset>
					</form>
				</div>
            </div>
		</div>
	</div>
	<%@include file="../include/footer.jsp"%>
</div>
</body>
</html>
<%-- <body>

    <div id="wrapper">

       <%@include file="../include/custom-header.jsp"%>


        <div id="page-wrapper">

            <div class="container-fluid">

 			<!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            	결제 <small>Payment</small>
                        </h1>
                </div>
                <!-- /.row -->
               <div class="row">
			   		<div class="col-lg-3"></div>
				    <div class="col-lg-6">
				        <textarea class="form-control" rows="10" readonly="readonly" style="resize:none; ">약관이 어쩌고저쩌고 어쩌고저쩌고 어쩌고저쩌고 어쩌고저쩌고 어쩌고저쩌고 어쩌고저쩌고 어쩌고저쩌고 어쩌고저쩌고 어쩌고저쩌고 어쩌고저쩌고 어쩌고저쩌고 어쩌고저쩌고 어쩌고저쩌고 어쩌고저쩌고 어쩌고저쩌고 어쩌고저쩌고 어쩌고저쩌고 어쩌고저쩌고 어쩌고저쩌고 어쩌고저쩌고 어쩌고저쩌고 어쩌고저쩌고 어쩌고저쩌고 어쩌고저쩌고 어쩌고저쩌고 어쩌고저쩌고 어쩌고저쩌고 어쩌고저쩌고 어쩌고저쩌고 어쩌고저쩌고 어쩌고저쩌고 어쩌고저쩌고 어쩌고저쩌고 어쩌고저쩌고 어쩌고저쩌고 어쩌고저쩌고 어쩌고저쩌고 어쩌고저쩌고 어쩌고저쩌고 어쩌고저쩌고 어쩌고저쩌고 어쩌고저쩌고 어쩌고저쩌고 어쩌고저쩌고 어쩌고저쩌고 어쩌고저쩌고 어쩌고저쩌고 어쩌고저쩌고 어쩌고저쩌고</textarea>
				    </div>
				    <div class="col-lg-3"></div>
			   </div>
				<form class="form-horizontal" method="post">
	    			<div class="form-group">
	    				<div class="row">
	    					<div class="col-lg-6"></div>
	    					<label for="p_dep_nm" class="col-lg-2 control-label">Name :</label>
	     					<div class="col-lg-2">
	     					<input type="text" class="form-control" id="p_dep_nm" name="p_dep_nm" placeholder="Name" value= ${login.u_nm }>
	     					</div>
	    				</div>
	    			</div>
	    			
	    			<div class="form-group">
	  					<div class="row">
	  						<div class="col-lg-6"></div>
	  						<label for="p_account" class="col-lg-2 control-label">E-mail :</label>
	  						<div class= "col-lg-2">
	  							<input name="p_account" type="text" class="form-control" id="email2">
								<select name="p_dep_bank" class="form-control" id="bank_select">
		  						  <option value="" selected>-----</option>
		    					  <option value="하나">하나</option>
		    					  <option value="우리">우리</option>
		    					  <option value="농협">농협</option>
		    					  <option value="신한">신한</option>
								</select>
		  					</div>
	    				</div>
	    			</div>
    			<div class="col-sm-offset-9 col-sm-1">
    				<div class="center-block">
      					<button type="submit" class="btn btn-default" id="submit">admit</button>
    				</div>
    			</div>
    			<input type="hidden" name="u_id" value=${login.u_id }>
			</form>
     	 </div>
                
                

                <!-- /.row -->

            </div>
            </div>
            </div>
		<%@include file="../include/footer.jsp"%>
            <!-- /.container-fluid -->
    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="/js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="/js/bootstrap.min.js"></script>
    
            <!-- javaScript -->

</body> --%>

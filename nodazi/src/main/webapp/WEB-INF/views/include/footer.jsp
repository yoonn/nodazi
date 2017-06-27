<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Sticky Footer With Flexbox</title>

    <link href="../../css/footer-styles.css" rel="stylesheet" type="text/css">
    <link href="../../font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

</head>

<body>

	<footer style="background-color:#222222; ">
		
		<div class="footer-limiter" style="border-style: none;">

			<div class="footer-right">

				<a href="#"><i class="fa fa-facebook"></i></a>
				<a href="#"><i class="fa fa-twitter"></i></a>
				<a href="#"><i class="fa fa-linkedin"></i></a>
				<a href="#"><i class="fa fa-github"></i></a>

			</div>

			<div class="footer-left">

				<p class="footer-links">&copy;Copyright 2017 by KnowDaG All Pictures cannot be copied without permission</p>

				<p>Company Name © 2016</p>
			</div>

		</div>

	</footer>

    <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
	<script>
		var dummyContent = $('.dummy-content').children(),
			i;


		$('#add-content').click(function(e){
			e.preventDefault();

			if($(dummyContent[0]).is(":visible")){
				for(i=0;i<dummyContent.length;i++){
					$(dummyContent[i]).fadeOut(600);
				}
			}
			else{
				for(i=0;i<dummyContent.length;i++){
					$(dummyContent[i]).delay(600*i).fadeIn(600);
				}
			}

		});
	</script>
	<!-- Demo ads. Please ignore and remove. -->
    <script src="http://cdn.tutorialzine.com/misc/enhance/v2.js" async></script>
</body>

</html>
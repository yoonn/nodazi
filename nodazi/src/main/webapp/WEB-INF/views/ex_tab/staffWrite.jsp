<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"	uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"	uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>staffRegForm</title>
<link rel="stylesheet" type="text/css" href="../css/staff/staff.css"/>
<link rel="stylesheet" type="text/css" href="../css/common/js.css"/>
<script type="text/javascript" src="../js/jquery-3.1.1.js"></script>
<script type="text/javascript" src="../js/common/hover.js"></script>
<script type="text/javascript" src="../js/staff/staff.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<script type="text/javascript">
/* $(function) start */
	$(function(){
		
		$(".tab_content").hide(); //Hide all content
		$("#tab_list li:first").addClass("active"); //Activate first tab
		$(".tab_content:first").show(); //Show first tab content

		//On Click Event
		$("ul li").click(function() {

			$("ul li").removeClass("active"); //Remove any "active" class
			$(this).addClass("active"); //Add "active" class to selected tab
			$(".tab_content").hide(); //Hide all tab content

			var activeTab = $(this).find("a").attr("href"); //Find the href attribute value to identify the active tab + content
			$(activeTab).show(); //Fade in the active ID content
			return false;
		});
		
		
	});
	
</script>


</head>
<body>

	<c:set var="now" value="<%= new Date() %>"/>
	<div id="wrap">
	<%-- 
		<%@ include file="../common/header.jsp" %>
		<%@ include file="../common/menu.jsp" %> --%>
		
		<div id="content">
			<span id="title">사원정보 등록</span>
			<div id="tab_list">
				<ul>
					<li><a href="#emp">개인정보</a></li>
					<li><a href="#acad">학력정보</a></li>
					<li><a href="#career">경력정보</a></li>
					<li><a href="#proj">프로젝트</a></li>
					<li><a href="#lic">자격증</a></li>
				</ul>
			</div>
			<div id="tab_container">
				<div id="emp" class="tab_content">
					<span class="small_title">
							개인정보
					</span>
					<form name="empFrm" id="empFrm">
						<input type="hidden" value="${login.emp_id }" name="res_emp">
						<input type="hidden" value="1" id="idCheck">
						<div id="img_d">
							<div>
								<img id="img_profile" src="../images/staff/noimage.png">
							</div>
							<div id="img_btn">
								<input type="file" name="img_file">
							</div>
						</div>
						<table>
							<tr id="top">
								<td class="info">
									이름
								</td>
								<td class="input">
									<input type="text" id="emp_nm" name="emp_nm" size="20" class="fill_input"/>
									<span id="name_span" class="required_span"></span>
								</td>
							</tr>
							<tr>
								<td class="info">
									주민번호
								</td>
								<td class="input">
									<input type="text" id="res_front_num" name="res_front_num" maxlength="6" size="5" class="fill_input"/>
									-
									<input type="text" id="res_back_num" name="res_back_num" maxlength="7" size="5" class="fill_input"/>
									<span id="res_span" class="required_span"></span>
								</td>
							</tr>
							<tr>
								<td class="info">
									ID
								</td>
								<td class="input">
									<input type="text" id="emp_id" name="emp_id" class="fill_input">
									<input type="button" id="id_check" name="id_check" value="중복체크">
									<span class="required_span"></span>
								</td>
							</tr>
							<tr>
								<td class="info">
									부서
								</td>
								<td class="input">
									<select id="dept_no" name="dept_no" class="fill_input">
										<option value="">&nbsp;부서선택&nbsp;</option>
										<option value="0">경영</option>
										<option value="1">전산</option>
										<option value="2">회계</option>
									</select>
									<span id="dept_span" class="required_span"></span>
								</td>
							</tr>
							<tr>
								<td class="info">
									직급
								</td>
								<td class="input">
									<select id="rank_no" name="rank_no" class="fill_input">
										<option value="">&nbsp;직급선택&nbsp;</option>
										<option value="0">사장</option>
										<option value="1">부장</option>
										<option value="2">사원</option>
									</select>
									<span id="rank_span" class="required_span"></span>
								</td>
							</tr>
							<tr>
								<td class="info">
									입사일
								</td>
								<td class="input">
									<input type="date" id="enter_dt" name="enter_dt" class="fill_input"/>
									<span id="join_span" class="required_span"></span>
								</td>
							</tr>
							<!-- <tr>
								<td class="info">
									퇴사일
								</td>
								<td class="input">
									<input type="date" id="retire_dt" name="retire_dt" class="fill_input"/>
								</td>
							</tr> -->
							<tr>
								<td class="info">
									핸드폰
								</td>
								<td class="input">
									<input type="text" id="emp_mobile" name="emp_mobile" class="fill_input"/>
									<span id="mobile_span" class="required_span"></span>
								</td>
							</tr>
							<tr>
								<td class="info">
									내선
								</td>
								<td class="input">
									<input type="text" id="emp_office" name="emp_office" class="fill_input"/>
									<span id="office_span" class="required_span"></span>
								</td>
							</tr>
							<tr>
								<td class="info">
									우편번호
								</td>
								<td class="input">
									<input type="text" disabled="disabled" id="postCode" name="postCode" size="10" class="fill_input"/>
									<input type="button" value="검색" id="post">
								</td>
							</tr>
							<tr>
								<td class="info">
									주소
								</td>
								<td class="input">
									<input type="text" disabled="disabled" id="emp_addr" name="emp_addr" size="50" class="fill_input"/>
								</td>
							</tr>
							<tr>
								<td class="info">
									상세주소
								</td>
								<td class="input">
									<input type="text" id="emp_detail_addr" name="emp_detail_addr" size="50" class="fill_input"/>
								</td>
							</tr>
							<tr>
								<td class="info">
									급여
								</td>
								<td class="input">
									<input type="text" id="emp_sal" name="emp_sal" size="10" class="fill_input"/>원
									<span id="sal_span" class="required_span"></span>
								</td>
							</tr>
							<tr>
								<td class="info">
									등록일
								</td>
								<td class="input">
									<input type="date" name="res_dt" value='<fmt:formatDate value="${now }" pattern="yyyy-MM-dd"/>' class="fill_input"/>
								</td>
							</tr>
							<tr>
								<td class="info">
									권한
								</td>
								<td class="input">
									<input type="radio" name="notice_mgr" id="notice_mgr" value="1" checked="checked">사원
									<input type="radio" name="notice_mgr" id="notice_mgr" value="0">관리자
								</td>
							</tr>
							<tr>
								<td colspan="3" id="input_btn">
									<input type="button" value="저장" id="empSubmit"/>
									&nbsp;&nbsp;
									<input type="button" value="초기화" class="reset"/>
								</td>
							</tr>
						</table>
					</form>
				</div>
		
				<div id="acad" class="tab_content">
					<span class="small_title">
						학력사항
					</span>
					<form name="acadFrm" id="acadFrm">
						<input type="hidden" name="emp_no" id="acad_emp_no" value="">
						<table>
							<tr class="sub_title">
								<td colspan="2" class="right">
									<input type="button" value="추가" id="acad_add" class="add">
									<input type="button" value="초기화" class="reset"/>
									<input type="button" value="삭제"  class="delete"/>
								</td>
							</tr>
							<tr>
								<td class="info">
									분류
								</td>
								<td class="input">
									<input type="radio" name="acad_level_no" value="0" checked="checked">고등학교
									&nbsp;&nbsp;
									<input type="radio" name="acad_level_no" value="1">대학(2,3년제)
									&nbsp;&nbsp;
									<input type="radio" name="acad_level_no" value="2">대학교
									&nbsp;&nbsp;
									<input type="radio" name="acad_level_no" value="3">대학원
								</td>
							</tr>
							<tr>
								<td class="info">
									학교명
								</td>
								<td class="input">
									<input type="text" name="acad_nm" id="acad_nm" size="60" class="fill_input">
								</td>
							</tr>
							<tr>
								<td class="info">
									재학기간
								</td>
								<td class="input">
									<input type="date" name="enter_dt" id="enter_dt" class="fill_input">
									&nbsp;~&nbsp;
									<input type="date" name="graduation_dt" id="graduaction_dt" class="fill_input">
									&nbsp;&nbsp;
									<select class="fill_input" name="acad_state_no"	>
										<!-- <option selected="selected" value="">상태</option> -->
										<option value="0">졸업</option>
										<option value="1">휴학</option>
										<option value="2">재학</option>
										<option value="3">퇴학</option>
									</select>
								</td>
							</tr>
							<tr>
								<td class="info">
									전공
								</td>
								<td class="input">
									<input type="text" name="major_nm" id="major_nm" size="60" class="fill_input">
								</td>
							</tr>
							<tr>
								<td class="info">
									학점
								</td>
								<td class="input">
									<input type="text" name="grade" id="grade" class="fill_input">
									/
									<select class="fill_input" name="perfect_grade">
										<!-- <option selected="selected" value="">학점</option> -->
										<option value="4.5">4.5</option>
										<option value="4.3">4.3</option>
										<option value="4.0">4.0</option>
										<option value="100">100</option>
									</select>
								</td>
							</tr>
							<tr>
								<td class="info">
									졸업 증명서
								</td>
								<td class="input">
									<input type="text" disabled="disabled" class="fill_input" size=50>
									<input type="button" value="파일선택" onclick="return chooseFile()">
								</td>
							</tr>
						</table>
					</form>
					
				</div>
		
				<div id="career" class="tab_content">
					<span class="small_title">
						경력사항
					</span>
					
					<form name="carFrm" id="carFrm">
						<input type="hidden" name="emp_no" id="car_emp_no" value="">
						<table>
							<tr class="sub_title">
								<td colspan="5" class="right">
									<input type="button" value="추가" id="car_add"  class="add">
									<input type="button" value="초기화" class="reset"/>
									<input type="button" value="삭제"  class="delete"/>
								</td>
							</tr>
							<tr>
								<td class="info">
									회사명
								</td>
								<td colspan="3" class="input">
									<input type="text" size="60" name="corp_nm" class="fill_input">
								</td>
							</tr>
							<tr>
								<td class="info">
									근무기간
								</td>
								<td colspan="3" class="input">
									<input type="date" class="fill_input" name="enter_dt">
									&nbsp;~&nbsp;
									<input type="date" class="fill_input" name="retire_dt">
								</td>
							</tr>
							<tr>
								<td class="info">
									부서명
								</td>
								<td class="input">
									<input type="text" class="fill_input" name="dept_nm">
								</td>
								<td class="info">
									직책
								</td>
								<td class="input">
									<input type="text" class="fill_input" name="rank_nm">
								</td>
							</tr><tr>
								<td class="info">
									급여
								</td>
								<td class="input">
									<input type="text" class="fill_input" name="emp_sal">
								</td>
								<td class="info">
									직무
								</td>
								<td class="input">
									<input type="text" class="fill_input" name="emp_role">
								</td>
							</tr>
							<tr>
								<td class="info">
									경력증명서
								</td>
								<td colspan="3" class="input">
									<input type="text" disabled="disabled" class="fill_input" size=50 name="certificate_img_path">
									<input type="button" value="파일선택" onclick="return chooseFile()">
								</td>
							</tr>
						</table>
					</form>
					
				</div>
							
			</div>
			
		</div>
			
	
	</div>

</body>
</html>

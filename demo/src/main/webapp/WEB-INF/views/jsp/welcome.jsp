<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.Date"%>
<!DOCTYPE html>
<html>
<head>
<title>선엽이 시스템</title>
<link rel="stylesheet" href="/css/bootstrap.min.css">
<script type="text/javascript" src="/js/bootstrap.min.js"></script>
<script type="text/javascript">
	///현제시각 출력
	function updateTime() {

		//오브젝트
		let today = new Date();
		let year = today.getFullYear();//연도
		let month = ("0" + (today.getMonth() + 1)).slice(-2); //월 .slice(-2) 오른쪽에서 2글자를 불러옴
		let day = ("0" + (today.getDate())).slice(-2); //일

		let hours = ("0" + (today.getHours())).slice(-2);//시
		let minutes = ("0" + (today.getMinutes())).slice(-2);//분
		let seconds = ("0" + (today.getSeconds())).slice(-2);//초

		let todayStr = year + "-" + month + "-" + day + " ";
		todayStr += hours + ":" + minutes + ":" + seconds;

		//<span id="spnCt"></span>
		const spnCt = document.getElementById("spnCt");
		spnCt.innerHTML = todayStr;
	}

	//달러 function
	document.addEventListener("DOMContentLoaded", function() {
		//1초 단위로 함수 호출
		setInterval(updateTime, 1000)
	})
</script>
</head>
<body>
	<!-- // menu.jsp 인클루드 시작 /// 디렉티브 ./ : 현재폴더의-->
	<%@ include file="./menu.jsp"%>
	<!-- // menu.jsp 인클루드 끝 -->
	<%!// 선언문
		// 전역변수
		String greeting = "Welcome to Web Shopping Mall";
		String tagline = "Welcome to Web Market";
		
		
	%>



	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3"><%=greeting%></h1>
		</div>
	</div>
	<div class="container">
		<div class="text-center">
			<h3 class="display-3"><%=tagline%></h3>
			<span id="spnCt"></span>
			<%
			// 스크립틀릿
			//지역변수 선언
			String am_pm = "AM";
			
			//jsp 내장객체
			pageContext.setAttribute("name", "개똥이");
			request.setAttribute("age", 21);
			
			session.setAttribute("password", "java");
			application.setAttribute("department", "develop");
			
			//page import="java.util.Date"
			Date day = new Date();
			int hour = day.getHours();
			int minute = day.getMinutes();
			int second = day.getSeconds();

			if (hour / 12 == 0) {
				am_pm = "AM";
			} else {
				am_pm = "PM";
				hour = hour - 12;
			}

			String CT = hour + ":" + minute + ":" + second + " " + am_pm;
			out.print("<p>현재 접속시각 : " + CT + "</p>");

			//request.getRequestDispatcher("/jsp/products").include(request, response);
			%>
		</div>
	</div>
	<%//동일 jsp안에서는 공유가능
	String name = (String)pageContext.getAttribute("name");
    
    out.print("<p>name : "+name+"</p>");
    
	%>
	<!-- // footer.jsp 인클루드 시작 /// 디렉티브 ./ : 현재폴더의-->
	<%@ include file="./footer.jsp"%>
	<!-- // footer.jsp 인클루드 끝 -->
</body>
</html>
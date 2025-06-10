<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>선엽이 시스템</title>
</head>
<body>
	<%!//선언문 ( 전역변수, 전역메소드)
	int count = 3;

	//전역 메소드
	String makeItLower(String data) {
		//대문자-> 소문자
		return data.toLowerCase();
	}

	//전역메소드
	int sum(int a, int b) {
		return a + b;
	}//end for%>

	<%
	// 스크립틀릿(비지니스 로직)
	for (int i = 1; i <= count; i++) {
		out.print("<p>개똥이" + i + "</p>");
	}

	out.print("<p>10 + 15 = " + sum(10, 15) + "</p>");
	%>

	<!-- 표현문(변수 화문 출력) -->
	<%=makeItLower("Hello World")%>

	<p>
		10 + 12 =
		<%=sum(10, 12)%></p>
</body>
</html>
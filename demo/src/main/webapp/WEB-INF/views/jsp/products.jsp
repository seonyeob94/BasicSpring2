<%@ page language="java" contentType="text/html; charset=UTF-8"%>


<!-- menu.jsp 인클루드 시작 -->
<%@ include file="./menu.jsp"%>
<!-- menu.jsp 인클루드 끝 -->

<div class="jumbotron">
	<div class="container">
		<h1 class="display-3">상품 목록</h1>
	</div>
</div>
<!-- 내용 -->
<div class="container">
	<p>${productVOList}</p>
	<div class="row" align="center">
		<div class="col-md-4">
			<h3>개똥이 노트북</h3>
			<p>개똥이 최신 노트북 출시!</p>
			<p>1,200,000원</p>
		</div>
	</div>
	<hr />
</div>



<!-- // footer.jsp 인클루드 시작 /// 디렉티브 ./ : 현재폴더의-->
<%@ include file="./footer.jsp"%>
<!-- // footer.jsp 인클루드 끝 -->
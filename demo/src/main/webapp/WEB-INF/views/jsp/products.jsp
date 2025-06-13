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
	<%//스크립틀릿
		String name = (String)pageContext.getAttribute("name");
	    int age = Integer.parseInt(request.getAttribute("age")==null?"0"
	             :request.getAttribute("age").toString());
	    String password = (String)session.getAttribute("password");
	    String department = (String)application.getAttribute("department");
	    //out : JSP내장객체(화면에 값 출력)
	    //out.print("<p>name : "+name+"</p>");
	    //out.print("<p>age : "+age+"</p>");
	    //out.print("<p>password : "+password+"</p>");
	    //out.print("<p>department : "+department+"</p>");
	%>
	<!-- java 변수인 password 변수의 값은 JSTL password 변수에 할당 -->
	<c:set var="password" value="<%=password%>" scope="page" />
	<c:set var="password" value="<%=password%>" scope="request" />
	<c:set var="password" value="<%=password%>" scope="session" />
	<c:set var="password" value="<%=password%>" scope="application" />
	<!-- items
	배열 : String[][], int[]
	collection : List , Set
	Map : hashMap hashTable sortedMap
	 -->
	<div class="row" align="center">
		<c:forEach var="productVO" items="${productVOList}" varStatus="stat">
			<div class="col-md-4">
				<h3>${productVO.pname}</h3>
				<p>${productVO.description}</p>
				<!-- 샵 쉼표 샵샵샵 -->
				<p><fmt:formatNumber value="${productVO.unitPrice}"
						pattern="#,###"/>원</p>
				<p>
					<!-- 
					요청URI : /jsp/product?productId=P1234
					요청파라미터 : productId=P1234
					요청방식 : get
					 -->
					<a href="/jsp/product?productId=${productVO.productId}"
						class="btn btn-secondary" role="button">상세정보 &raquo;</a>
				</p>						
			</div>
		</c:forEach>
	</div>
	<div class="form-group row">
		<div class="col-sm-offset-2 col-sm-10">
			<input type="button" class="btn btn-primary" value="상품등록"
			onclick="javascript:location.href='/jsp/addProduct'">
		</div>
	</div>
	<hr />
</div>



<!-- // footer.jsp 인클루드 시작 /// 디렉티브 ./ : 현재폴더의-->
<%@ include file="./footer.jsp"%>
<!-- // footer.jsp 인클루드 끝 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!-- /// menu.jsp 인클루드 시작 /// -->
<%@ include file="./menu.jsp" %>
<!-- /// menu.jsp 인클루드 끝 /// -->

<div class="jumbotron">
   <div class="container">
      <h1 class="display-3">${title}</h1>
   </div>
</div>

<!-- /// body 시작 /// -->
<!-- model.addAttribute("productVO", productVO); 

ProductVO(filename=p1239, quantity=0, productId=P1243, 
pname=아이폰입니다3, unitPrice=1000000, description=아이폰입니다35, 
manufacturer=애플, category=소설, unitsInStock=15, condition=New)
-->
<p>${productVO}</p>
<div class="container">
	<!-- 1건의 상품, 1행 -->
	<div class="row">
		<!-- 5: 12 = x : 100 -->
		<div class="col-md-5">
			
			<img src="/upload/${productVO.filename}" 
			alt="${productVO.pname}" title="${productVO.pname}"
			style=" width=100%; cursor:pointer;"
			/>
		</div>
		<!-- 6: 12 = x : 100 -->
		<div class="col-md-6">
			<h3>${productVO.pname}</h3>
			<p>${productVO.description}</p>
			<p>
				<b>상품코드 : </b>
				<span class="badge badge-danger">
					${productVO.productId}
				</span>
			</p>
			<P><b>제조사 : </b>${productVO.manufacturer}</P>
			<P><b>분류 : </b>${productVO.category}</P>
			<P><b>재고 수 : </b>${productVO.unitsInStock}</P>
			<!-- 천 단위 구분기호 -->
			<h4><fmt:formatNumber value="${productVO.unitPrice}"
						pattern="#,###"/></h4>
			<p>
				<a href="#" class="btn btn-info">상품 주문</a>
				<a href="/jsp/cart" class="btn btn-warning">장바구니</a>
				<a href="/jsp/products" class="btn btn-secondary">상품 목록</a>
			</p>
		</div>
	</div>
</div>

<!-- /// body 끝 /// -->

<!-- /// footer.jsp 인클루드 시작 /// -->
<%@ include file="./footer.jsp" %>
<!-- /// footer.jsp 인클루드 끝 /// -->
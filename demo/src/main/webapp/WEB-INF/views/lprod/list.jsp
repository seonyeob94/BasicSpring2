<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<title>선엽이 시스템</title>
<link rel="stylesheet" href="/adminlte/dist/css/adminlte.min.css">
<script type="text/javascript" src="/adminlte/dist/js/adminlte.min.js"></script>
</head>
<body>
	<h1>상품분류 목록</h1>
	<p>${lprodVOList}</p>
	<p>${fn:length(lprodVOList)}</p>  
	<p>
	<!-- action속성 및 값이 생략 시, 현재 URI(/list)를 재요청. 
         method는 GET(form 태그의 기본 HTTP 메소드는 GET임) 
      param : keyword=모험
      요청URI : /lprod/list?keyword=캐주얼&gubun=lprodNm or /lprod/list or /lprod/list?keyword=&gubun=
      요청파라미터 : keyword=모험
      요청방식 : get
      
      /list?gubun=lprodNm&keyword=빙과
      -->
		<form>
			<select name="gubun">
				<option value="" selected>선택하세요</option> 
				<option value="lprodGu" 
					<c:if test="${param.gubun=='lprodGu'}">selected</c:if>
					>상품분류구분</option> 
				<option value="lprodNm" 
					<c:if test="${param.gubun=='lprodNm'}">selected</c:if>
				>상품분류명</option> 
			</select>
			<input type="text" name="keyword" value="${param.keyword}"
				placeholder="검색어를 입력해주세요"/>
			<!-- submit / button / reset -->
			<button type="submit" id="btsSearch">검색</button>
		</form>
	</p>
	<!-- 시멘틱 -->
   <section class="content">
      <div class="container-fluid">
         <div class="row">
            <!-- /// 상품분류 목록 시작 /// -->
            <div class="col-md-12">
            	<div class="card">
	              <div class="card-header">
	                <h3 class="card-title">상품 분류 목록</h3>
	              </div>
	              <!-- /.card-header -->
	              <div class="card-body">
	              <!-- mav.addObject("lprodVOList", lprodVOList); -->
	                <table class="table table-bordered">
	                  <thead>
	                    <tr>
                            <th style="width:10%;">번호</th>
                            <th style="width:20%;">상품분류 아이디</th>
                            <th style="width:35%;">상품분류 구분</th>
                            <th style="width:35%;">상품분류 명</th>
                          </tr>
	                  </thead>
	                  <tbody>
	                  <!-- 
                           lprodVOList : List<LprodVO> 
                           
                           forEach태그? 배열(String[], int[][]), Collection(List, Set) 또는
                                    Map(HashTable, HashMap, SortedMap)
                           var : 변수
	                     items : 아이템(배열, Collection, Map)
	                     varStatus : 루프 정보를 담은 객체 활용
	                        - index : 루프 실행 시 현재 인덱스(0부터 시작)
	                        - count : 실행 회수(1부터 시작. 보통 행번호 출력)
                            -->
                         <c:forEach var="LprodVO" items="${lprodVOList}" varStatus="stat">
	                    <tr>
	                      <td>${stat.count}</td>
	                      <td>${LprodVO.lprodId}</td>
	                      <td><a href="/lprod/detail?lprodId=${LprodVO.lprodId}">${LprodVO.lprodGu}</a></td>
	                      <td>${LprodVO.lprodNm}</td>
	                    </tr>
	                    </c:forEach>
	                  </tbody>
	                </table>
	              </div>
	              <!-- /.card-body -->
	              <div class="card-footer clearfix">
	                <ul class="pagination pagination-sm m-0 float-right">
	                  <li class="page-item"><a class="page-link" href="#">«</a></li>
	                  <li class="page-item"><a class="page-link" href="#">1</a></li>
	                  <li class="page-item"><a class="page-link" href="#">2</a></li>
	                  <li class="page-item"><a class="page-link" href="#">3</a></li>
	                  <li class="page-item"><a class="page-link" href="#">»</a></li>
	                </ul>
	              </div>
	            </div>
            </div>
            <!-- /// 상품분류 목록 끝 /// -->
         </div>
      </div>
   </section>
	
	<table border="1">
		<thead>
			<tr>
				<th>번호</th>
				<th>상품분류번호</th>
				<th>상품분류구분</th>
				<th>상품분류명</th>
			</tr>
		</thead>
		<!-- 
      forEach 태그? 배열(String[], int[][]), Collection(List, Set) 또는 
      Map(HashTable, HashMap, SortedMap)에 저장되어 있는 값들을 
      순차적으로 처리할 때 사용함. 자바의 for, do~while을 대신해서 사용함
      var : 변수
      items : 아이템(배열, Collection, Map)
      varStatus : 루프 정보를 담은 객체 활용
         - index : 루프 실행 시 현재 인덱스(0부터 시작)
         - count : 실행 회수(1부터 시작. 보통 행번호 출력)
       -->
       <!-- data : mav.addObject("lprodVOList", lprodVOList); -->
       <!-- row : lprodVO 1행 -->
		<tbody id="lprodTbody">
			<c:if test="${fn:length(lprodVOList)<1}">
				<tr>
					<td colspan="4">데이터가 없습니다</td>
				</tr>
			</c:if>
			<c:if test="${fn:length(lprodVOList)>0}">
				<!-- 
				[LprodVO [lprodId=4, lprodGu=p101, lprodNm=컴퓨터제품]
			 	-->
				<c:forEach var="lprodVO" items="${lprodVOList}" varStatus="stat">
					<tr>
						<td>${stat.count}</td>
						<td>${lprodVO.lprodId}</td>
						<!-- 제목 클릭시 상세 페이지로 이동 -->
						<td><a href="/lprod/detail?lprodId=${lprodVO.lprodId}">${lprodVO.lprodGu}</a></td>
						<td>${lprodVO.lprodNm}</td>
					</tr>
				</c:forEach>
			</c:if>
		</tbody>
	</table>
	<p>
		<a href="/lprod/create">상품분류 등록</a>
	</p>
</body>
</html>
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
	<h1>회원 목록</h1>
	<%-- <p>${usersVOList}</p>
	<p>${fn:length(usersVOList)}</p>   --%>
	<p>
	<!-- action속성 및 값이 생략 시, 현재 URI(/list)를 재요청. 
         method는 GET(form 태그의 기본 HTTP 메소드는 GET임) 
      param : keyword=모험
      요청URI : /users/list?keyword=캐주얼&gubun=usersNm or /users/list or /users/list?keyword=&gubun=
      요청파라미터 : keyword=모험
      요청방식 : get
      
      /list?gubun=usersNm&keyword=빙과
      -->
		<%-- <form>
			<select name="gubun">
				<option value="" selected>선택하세요</option> 
				<option value="usersGu" 
					<c:if test="${param.gubun=='usersGu'}">selected</c:if>
					>회원구분</option> 
				<option value="usersNm" 
					<c:if test="${param.gubun=='usersNm'}">selected</c:if>
				>회원명</option> 
			</select>
			<input type="text" name="keyword" value="${param.keyword}"
				placeholder="검색어를 입력해주세요"/>
			<!-- submit / button / reset -->
			<button type="submit" id="btsSearch">검색</button>
		</form> --%>
	</p>
	<!-- 시멘틱 -->
   <section class="content">
      <div class="container-fluid">
         <div class="row">
            <!-- /// 회원 목록 시작 /// -->
            <div class="col-md-12">
            	<div class="card">
	              <div class="card-header">
	                <h3 class="card-title">회원 목록</h3>
	              </div>
	              <!-- /.card-header -->
	              <div class="card-body">
	              <!-- mav.addObject("usersVOList", usersVOList); -->
	                <table class="table table-bordered">
	                  <thead>
	                    <tr>
                            <th style="width:10%;">COUNT </th>
                            <th style="width:20%;">USERNAME </th>
                            <th style="width:35%;">NAME </th>
                            <th style="width:35%;">ENABLED </th>
                          </tr>
	                  </thead>
	                  <tbody>
	                  <!-- 
                           usersVOList : List<UsersVO> 
                           
                           forEach태그? 배열(String[], int[][]), Collection(List, Set) 또는
                                    Map(HashTable, HashMap, SortedMap)
                           var : 변수
	                     items : 아이템(배열, Collection, Map)
	                     varStatus : 루프 정보를 담은 객체 활용
	                        - index : 루프 실행 시 현재 인덱스(0부터 시작)
	                        - count : 실행 회수(1부터 시작. 보통 행번호 출력)
	                        
	                        mav.addObject("articlePage", articlePage);
	                        
	                        articlePage.content=> List<UsersVO> 
                            -->
                         <c:forEach var="UsersVO" items="${articlePage.content}" varStatus="stat">
	                    <tr>
	                      <td>${stat.count}</td>
	                      <td>${UsersVO.username}</td>
	                      <td><a href="/users/detail?username=${UsersVO.username}">${UsersVO.name}</a></td>
	                      <td>${UsersVO.enabled}</a></td>
	                    </tr>
	                    </c:forEach>
	                  </tbody>
	                </table>
	              </div>
	              <!-- /.card-body -->
	              ${articlePage.pagingArea}
	             <%--  <div class="card-footer clearfix">
	                <ul class="pagination pagination-sm m-0 float-right"> <!-- 시작블록번호 - 블록크기=> 이전블록으로 이동 -->
	                 
	                  <!-- 시작 블록 번호가 6보다 작을 때 가리자. 6이상일 땐 보이게 됨 -->
	                  		
	                  <li class="page-item"><a class="page-link" href="/users/list?currentPage=1&keyword=${param.keyword}&gubun=${param.gubun}"
	                  		 <c:if test="${articlePage.startPage < 6}">style="display:none;"</c:if>> « </a></li>
	                  
	                  
	                  <li class="page-item"><a class="page-link" href="/users/list?currentPage=${articlePage.startPage-1}&keyword=${param.keyword}&gubun=${param.gubun}"
	                  		 <c:if test="${articlePage.startPage < 6}">style="display:none;"</c:if>> 이전 </a></li>
	                  <c:forEach var="pNo" begin="${articlePage.startPage}" 
	                  		end="${articlePage.endPage}">
	                    <li class="page-item"><a class="page-link" href="/users/list?currentPage=${pNo}&keyword=${param.keyword}&gubun=${param.gubun}">${pNo}</a></li>
                	  </c:forEach>	<!-- 종료 블록 번호가 전체 페이지 수 보다 크거나 같다면 none -->                              <!-- 시작블록번호 + 블록크기 => 다음 블록으로 이동 -->
                	  
	                  <li class="page-item"><a class="page-link" href="/users/list?currentPage=${articlePage.endPage+1}&keyword=${param.keyword}&gubun=${param.gubun}"
	                  <c:if test="${articlePage.endPage>=articlePage.totalPages}">style="display:none"</c:if>>다음</a></li>
	                  
	                  
	                  <li class="page-item"><a class="page-link" href="/users/list?currentPage=${articlePage.totalPages}&keyword=${param.keyword}&gubun=${param.gubun}"
	                  <c:if test="${articlePage.endPage>=articlePage.totalPages}">style="display:none"</c:if>>»</a></li>
	                </ul>
	              </div> --%>
	            </div>
            </div>
            <!-- /// 회원 목록 끝 /// -->
         </div>
      </div>
   </section>
	
	<%-- 
	<table border="1">
		<thead>
			<tr>
				<th>번호</th>
				<th>회원번호</th>
				<th>회원구분</th>
				<th>회원명</th>
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
       <!-- data : mav.addObject("usersVOList", usersVOList); -->
       <!-- row : usersVO 1행 -->
		<tbody id="usersTbody">
			<c:if test="${fn:length(usersVOList)<1}">
				<tr>
					<td colspan="4">데이터가 없습니다</td>
				</tr>
			</c:if>
			<c:if test="${fn:length(usersVOList)>0}">
				<!-- 
				[UsersVO [usersId=4, usersGu=p101, usersNm=컴퓨터제품]
			 	-->
				<c:forEach var="usersVO" items="${usersVOList}" varStatus="stat">
					<tr>
						<td>${stat.count}</td>
						<td>${usersVO.usersId}</td>
						<!-- 제목 클릭시 상세 페이지로 이동 -->
						<td><a href="/users/detail?usersId=${usersVO.usersId}">${usersVO.usersGu}</a></td>
						<td>${usersVO.usersNm}</td>
					</tr>
				</c:forEach>
			</c:if>
		</tbody>
	</table> 
	--%>
	<p>
		<a href="/users/create">회원 등록</a>
	</p>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!-- /// menu.jsp 인클루드 시작 /// -->
<%@ include file="./menu.jsp"%>
<!-- /// menu.jsp 인클루드 끝 /// -->
<script type="text/javascript">
// $(function(){
document.addEventListener("DOMContentLoaded",()=>{

    //model.addAttribute("name", name);
    let name = "${name}"
    
    console.log("name : ", name);
})
</script>
<div class="jumbotron">
	<div class="container">
		<h1 class="display-3">객체연습</h1>
	</div>
</div>

<!-- /// body 시작 /// -->
<div class="container">
	<!-- request객체 : JSP 내장 객체, 동일 요청 내에서 데이터 공유
	요청URI : /jsp/process
    요청파라미터 : request{name=개똥이}
    요청방식 : post
    model.addAttribute("name", name);
    -->
    <p>${name}</p>
	<form action="/jsp/process" method="post" class="form-horizontal">
		<div class="form-group row">
			<label class="col-sm-2">이름</label>
			<div class="col-md-3">
				<input type="text" name="name" class="form-control"
				placeholder="이름을 작성해주세요" required />
			</div>
		</div>
		<div class="form-group row">
			<input type="submit" value="전송" class="btn btn-primary"/>
		</div>
	</form>
	<p>IP주소 : <%=request.getRemoteAddr()%></p>
	<p>요청 파라미터 길이 : <%=request.getContentLength()%></p>
	<p>문자 인코딩 : <%=request.getCharacterEncoding()%></p>
	<p>콘텐츠 유형(MIME) : <%=request.getContentType()%></p>
	<p>요청 프로토콜 : <%=request.getProtocol()%></p>
	<p>요청메소드 : <%=request.getMethod()%></p>
	<p>요청URI 경로 : <%=request.getRequestURI()%></p>
	<p>contextPath : <%=request.getContextPath()%></p>
	<p>서버 이름 : <%=request.getServerName()%></p>
	<p>서버 포트 번호 : <%=request.getServerPort()%></p>
	<p>쿼리스트링(요청파라미터) : <%=request.getQueryString()%></p>
	
	<% //스크립틀릿
	   //response.sendRedirect("/product/list");
	%>
	<p><%=response.getHeader("Cache-control")%></p>
	<p><%=response.getHeader("contentType") %></p>
	<p><%=response.getHeader("date") %></p>
	
</div>
<!-- /// body 끝 /// -->

<!-- /// footer.jsp 인클루드 시작 /// -->
<%@ include file="./footer.jsp"%>
<!-- /// footer.jsp 인클루드 끝 /// -->
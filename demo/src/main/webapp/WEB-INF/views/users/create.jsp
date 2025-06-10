<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<h2>회원 등록</h2>
	<!-- 
   요청URI : /createPost
   요청파라미터(HTTP파라미터) : {title=개똥이의 모험, category=소설, price=12000}
   요청방식 : post
   
   get방식 : 주소표시줄에 요청파라미터가 노출됨
   post방식 : 주소표시줄에 요청파라미터가 노출되지 않음. 주소창에 변화 없이
            데이터만 서버로 전달 됨
   -->
   <form action="/users/createPost" method="post">
      <!-- 폼데이터 -->
      <p>USERNAME : <input type="text" name="username" required 
      		placeholder="USERNAME " /></p>
      <p>NAME : <input type="text" name="name" required 
      		placeholder="NAME " /></p>
      <p>PASSWORD : <input type="text" name="password" required 
      		placeholder="PASSWORD " /></p>
		<input type="hidden" name="enabled" value="1" />
      <p>
         <!-- <form>~</form> 태그 안에 내용이 서버로 전송됨
               서버로 전달되는 항목들은 form 태그 안에 존재해야 함.
               name 속성은 key로, value 속성을 value로 판단함
             -->
         <input type="submit" value="저장" />
         <input type="button" value="목록" onclick="javascript:location.href='/users/list'" />
      </p>
   </form>
</body>
</html>
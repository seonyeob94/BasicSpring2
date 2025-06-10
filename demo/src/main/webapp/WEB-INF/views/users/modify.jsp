<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<h2>회원 수정</h2>
	<!-- 
   JSTL(JSP Standard Tag Library) : 개발자들이 자주 사용하는 패턴을 모아놓은 집합
   => UsersController에서 보내준 데이터를 뷰(jsp)에 표현하도록 도와줌
   
   method
   1) GET : 데이터를 변경하지 않을 때. 목록/상세보기
   2) POST : 데이터를 변경할 때. 입력/수정/삭제
   
   업데이트 쎄대여
   UPDATE BOOK
   SET    TITLE='개똥이의 모험', CATEGORY='소설', PRICE=12000, CONTENT='재미있다냥'
   WHERE  BOOK_ID = 1
   
   등푸른생선 주세여
   DELETE FROM BOOK
   WHERE  BOOK_ID = 1
   
   WHERE
   1) 단일행 : =, <, >, <=, >=, !=, <>
   2) 다중행 : IN(교집합), ANY(OR), ALL(AND), EXISTS(교집합)
    -->
	<!-- 
   요청URI : /createPost
   요청파라미터(HTTP파라미터) : {title=개똥이의 모험, category=소설, price=12000}
   요청방식 : post
   
   get방식 : 주소표시줄에 요청파라미터가 노출됨
   post방식 : 주소표시줄에 요청파라미터가 노출되지 않음. 주소창에 변화 없이
            데이터만 서버로 전달 됨
   mav.addObject("usersVo", usersVo);
   EL : Expression Language(표현언어)
   -->
   <p>${usersVO}</p>
   <!-- 
   요청URI : /modifyPost
   요청파라미터 : request{usersId=3,title=총알탄 개똥이3,category=소설3,price=12003}
   요청방식 : post
    -->
   <form action="/users/modifyPost" method="post">
   	  <input type="text" name="username" value="${usersVO.username}" readonly/>
      <!-- 폼데이터 -->
      <p>NAME: <input type="text" name="name" required placeholder="NAME" 
      			value="${usersVO.name}" /></p>
      <p>PASSWORD : <input type="text" name="password" required placeholder="PASSWORD" 
      			value="${usersVO.password}" /></p>
     
      <p>
         <!-- <form>~</form> 태그 안에 내용이 서버로 전송됨
               서버로 전달되는 항목들은 form 태그 안에 존재해야 함.
               name 속성은 key로, value 속성을 value로 판단함
             -->
         <button type="submit">확인</button>
         <!-- 
         /modify?usersId=3
         param: usersId=3
         param.usersId => 3
          -->
         <a href="/users/detail?username=${param.username}">취소</a>
      </p>
   </form>
</body>
</html>
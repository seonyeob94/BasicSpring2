<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<!-- 정적폴더 static은 url /로 접근 -->
<script type="text/javascript" src="/js/jquery.min.js"></script>
</head>
<body>
	<h2>회원 상세</h2>
	<!-- 
   JSTL(JSP Standard Tag Library) : 개발자들이 자주 사용하는 패턴을 모아놓은 집합
   => BookController에서 보내준 데이터를 뷰(jsp)에 표현하도록 도와줌
   
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
   mav.addObject("usersVO", usersVo);
   EL : Expression Language(표현언어)
   -->
   <p>${usersVO}</p>
   <form id="frm" action="/users/createPost" method="post">
      <!-- 폼데이터 -->
      <p>USERNAME : <input type="text" name="USERNAME" required placeholder="USERNAME" 
      			value="${usersVO.username}" readonly/></p>
      <p>NAME : <input type="text" name="NAME" required placeholder="NAME" 
      			value="${usersVO.name}" readonly/></p>
      <p>ENABLED : <input type="text" name="ENABLED" required placeholder="ENABLED" 
      			value="${usersVO.enabled}" readonly/></p>
      <p>
         <!-- <form>~</form> 태그 안에 내용이 서버로 전송됨
               서버로 전달되는 항목들은 form 태그 안에 존재해야 함.
               name 속성은 key로, value 속성을 value로 판단함
               
               /detail?usersId=2
               param : usersId=2
               param.usersId : 2
               1) 출처 : URL
             -->
         <a href="/users/modify?username=${param.username}">수정</a>
         <a href="#" id="aDelete">삭제</a>
         <a href="/users/list">목록</a>
        
      </p>
   </form>
   <script type="text/javascript">
   		$(function(){
			$("#aDelete").on("click",function(){
   			
   			//1. action속성의 값을 /deletePost로 변경
   			//속성=애트리뷰트=필드=컬럼=열
   			//<form id="frm" action="/createPost" method="post">
   			$("#frm").attr("action","/users/deletePost");
            //2. confirm으로 삭제 한번 더 확인
            let result = confirm("삭제하시겠습니까?");
            console.log("result : ", result);
            
            //3. <form 을 submit 
            //   => 폼 데이터 중의 <input type="text" name="usersId"..가 필수
            //DELETE FROM BOOK
            //WHERE BOOK_ID = 2;
            if(result > 0){//[확인] 클릭 => 1(true)
            	console.log("삭제 실행!!");
            	/*
            	요청URI : /deletePost
               	요청파라미터 : request{usersId=2}
               	요청방식 : post
            	*/
            	$("#frm").submit();
            }else{//[취소] 클릭 => 0(false)
            	console.log("삭제가 취소되었습니다.");

            }
			})
   		});
   </script>
</body>
</html>
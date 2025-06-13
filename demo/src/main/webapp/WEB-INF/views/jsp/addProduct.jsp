<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!-- /// menu.jsp 인클루드 시작 /// -->
<%@ include file="./menu.jsp"%>
<!-- /// menu.jsp 인클루드 끝 /// -->

<!-- CKEditor -->
<script type="text/javascript" src="/ckeditor5/ckeditor.js"></script>
<script type="text/javascript" >
function CheckAddProduct(){
	console.log("개똥이")
	
	//<form id="newProduct" name="newProduct" 
	document.newProduct.submit();
// 	$("#newproduct").submit();
// 	$("form[name='newProduct']").submit();
// 	document.querySelector("#newProduct").submit();
// 	document.getElementById("newProduct").submit();
}

//e : change 이벤트 객체
function handleImagFileSelect(e){
	//e.target : <input type="file" name="uploadFile" id="uploadFile" class="form-control" />
	let files = e.target.files;

	//이미지 오브젝트 배열(NodeList를 배열로 변환)
	let fileArr = Array.from(files);
	
	console.log("files : ", files);
	
	   //이미지 미리보기 영역 초기화
	   document.getElementById("divImages").innerHTML = "";
	   
	//f : 각각의 이미지 파일
	fileArr.forEach(function(f){
		//이미지가 아니면
		if(!f.type.match("image.*")){
			//함수 자체를 종료
			return;
		}

		//이미지를 읽어보자
		let reader = new FileReader();

		//reader 오브젝트가 이미지를 모두 읽었다면 콜백함수를 실행
		//event : reader가 이미지를 읽을 때 그 이벤트
		reader.onload = function(event){
			//event.target : FileReader 객체
			//event.target.result : 읽어온 파일의 데이터 URL
			let str = `
				<img src="\${event.target.result}" style="width:100%" />
			`;
			/* let str = `
				<img src="\${event.target.result}" style="width:100%" />
			`; 
			여기서 백틱 안에 있을때 역슬러시가 필요
			*/
			//<div id="divImages"></div>
			document.getElementById("divImages").innerHTML += str;

		}

		// 다음 이미지 파일(f)을 위해 리더를 초기화 
		// (실제로 reader는 재사용하지 않고, 새로운 파일을 읽기 전에 새로운 FileReader 객체를 
		// 생성하는 것이 일반적)
		// 위 코드에서는 forEach 루프 내에서 reader 객체가 각 파일마다 새로 생성되므로 
		// 특별한 초기화는 필요 없음
		reader.readAsDataURL(f);
	})
}
// <input type="file" name="uploadFile" id="uploadFile" class="form-control" />
document.addEventListener("DOMContentLoaded",()=>{
	document.querySelector("input[name='uploadFile']").addEventListener("change",
			handleImagFileSelect);
	
});
</script>


<div class="jumbotron">
	<div class="container">
		<h1 class="display-3">${title}</h1>
	</div>
</div>

<!-- /// body 시작 /// -->
<div class="container">
	<!--  
	요청URI : /jsp/processAddProduct
			 <input type="file" name="uploadFile" id="uploadFile"
	요청파라미터 : request{productId=1236, pname=개똥이폰,///,uploadFile=파일객체)
	요청방식 : post
	 -->
	     <!-- 파일업로드
	   1) method는 꼭 post!
	   2) enctype="multipart/form-data"
	   3) <input type="file" name="uploadFile".. name속성이 꼭 있어야 함!
	   security1) <sec땡땡csrfInput />
	   security2) action 속성의 uri 뒤에 token 추가
	    -->
	<form id="newProduct" name="newProduct" action="/jsp/processAddProduct"
		class="form-horizontal" method="post" enctype="multipart/form-data">
		<div class="form-group row">
			<label class="col-sm-2">상품 코드</label>
			<div class="col-sm-3">
				<!-- required : 필수 입력 엘리먼트
				상품코드 : P1234
				 -->
				<input type="text" id="productId" name="productId" class="form-control" 
					placeholder="상품 코드" value="${productId}" readonly
					required maxlength="5"/>
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2">상품명</label>
			<div class="col-sm-3">
				<input type="text" id="pname" name="pname" class="form-control" 
				placeholder="상품명" required/>
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2">가격</label>
			<div class="col-sm-3">
				<input type="number" id="unitPrice" name="unitPrice"
					class="form-control" 
					placeholder="가격" required/>
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2">상세 정보</label>
			<div class="col-sm-3">
			<!--  cols : 30글자(열) rows : 5글자(행) -->
				<textarea cols="30" rows="5" 
				id="description" name="description" class="form-control" ></textarea>
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2">제조사</label>
			<div class="col-sm-3">
				<input type="text" name="manufacturer" class="form-control" 
				placeholder="제조사" required/>
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2">분류</label>
			<div class="col-sm-3">
				<input type="text" name="category" class="form-control" />
				<!-- selected : 미리 선택되어짐 / disabled : 비활성화(데이터가 전달이 안됨) -->
				<select id="category" name="category" class="form-control">
					<option value="" selected disabled>선택해주세요</option>
					<option value="Smartphone">스마트폰</option>
					<option value="Notebook">노트북</option>
					<option value="Teblet">테블릿</option>
				</select>
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2">재고 수</label>
			<div class="col-sm-3">
				<input type="number" id="unitsInStock" name="unitsInStock" 
					class="form-control" placeholder="재고 수"/>
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2">상태</label>
			<div class="col-sm-5">
			<!-- label을 클릭 시 radio버튼이 클릭이 됨 -->
				<input type="radio" name="condition" id="condition1" value="New" />
					<label for="condition1">신규 제품 </label>
				<input type="radio" name="condition" id="condition2" value="Old" />
					<label for="condition2">중고 제품</label> 
				<input type="radio" name="condition" id="condition3" value="Refurbished" />
					<label for="condition3">재생 제품</label>
			</div>
		</div>
		<div class="form-group row">
		   <label class="col-sm-2">상품 이미지</label>
		   <div class="col-sm-5">
		      <input type="file" name="uploadFile" id="uploadFile"
		         class="form-control" />
		   </div>
		</div>
		<div class="form-group row">
	        <!-- 이미지 미리보기 영역 -->
	    	<div id="divImages"></div>
	    </div>
		<div class="form-group row">
            <div class="col-sm-offset-2 col-sm-10">
            	<!-- CheckAddProduct() : 핸들러 함수 -->
               <input type="button" class="btn btn-primary" value="등록"
               onclick="CheckAddProduct()" />
               <button type="button" class="btn btn-info"  
               onclick="javascript:location.href='/jsp/products'">목록보기</button>
            </div>
         </div>
	</form>
</div>
<!-- /// body 끝 /// -->
<script type="text/javascript">
//DOM : Document Object Model
document.addEventListener("DOMContentLoaded",()=>{
   /* Ckeditor 5
   <textarea id="description" name="description"..
   
   editor : CKEditor 객체를 말함
   */
   ClassicEditor.create(document.querySelector("#description"),{ckfinder:{uploadUrl:"/image/upload"}})
             .then(editor=>{window.editor=editor})
             .catch(err=>{console.error(err.stack);})
   ;
});
</script>
<!-- /// footer.jsp 인클루드 시작 /// -->
<%@ include file="./footer.jsp"%>
<!-- /// footer.jsp 인클루드 끝 /// -->
package kr.or.ddit.controller;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.or.ddit.DemoApplication;
import kr.or.ddit.service.BookService;
import kr.or.ddit.service.impl.BookServiceImpl;
import kr.or.ddit.vo.ProductVO;
import lombok.extern.slf4j.Slf4j;

@RequestMapping("/jsp")
@Slf4j
@Controller
public class JspController {

    private final DemoApplication demoApplication;

    private final BookServiceImpl bookServiceImpl;

	// DI /IoC
	@Autowired
	BookService bookService;

    JspController(BookServiceImpl bookServiceImpl, DemoApplication demoApplication) {
        this.bookServiceImpl = bookServiceImpl;
        this.demoApplication = demoApplication;
    }

	@GetMapping("/scripting")
	public String scripting() {

		return "jsp/scripting";
	}

	// 웹 쇼핑물 시작 페이지
	@GetMapping("/welcome")
	public String welcome() {

		return "jsp/welcome";
	}

	// 요청 URI : /jsp/products
	// 상품목록(데이터 변경없음 -> Get)
	@GetMapping("/products")
	public String products(Model model) {

		List<ProductVO> productVOList = this.bookService.products();
		log.info("products->productVOList : " + productVOList);

		model.addAttribute("productVOList", productVOList);
		
		// forwarding : jsp 응답
		return "jsp/products";
	}
	
	/*
    요청URI : /jsp/request
    요청파라미터 : 
    요청방식 : get
    */
	@GetMapping("/request")
	public String jspRequest() {
		// forwording
		return "jsp/request";
	}
	
	/* request객체 : JSP 내장 객체, 동일 요청 내에서 데이터 공유
	요청URI : /jsp/process
    요청파라미터 : request{name=개똥이}
    요청방식 : post
    */
	@PostMapping("/process")
	public String jspProcess(HttpServletRequest request
			, HttpServletResponse response
			, @RequestParam(value = "name") String name2
			, @RequestParam Map<String, Object> map 
			,Model model) {
		String name = request.getParameter("name"); // 개똥이
		//"jspProcess->name : 개똥이
		log.info("jspProcess->name :" + name);
		//"jspProcess->name2 : 개똥이
		log.info("jspProcess->name2 :" + name2);
		//"jspProcess->map : {name=개똥이}
		log.info("jspProcess->map :" + map);
		
		//특정요청 헤더정보 확인
		String hostValue = request.getHeader("host");
		String alValue = request.getHeader("accept-language");		
		log.info("jspProcess->hostValue :" + hostValue);
		log.info("jspProcess->alValue :" + alValue);
				
		//모든요청 헤더정보 확인
		int i=1;
		Enumeration en = request.getHeaderNames();
		while (en.hasMoreElements()) {
			String headerName = (String) en.nextElement();
			String headerValue = request.getHeader(headerName);
			
			log.info(i+". headerName : " + headerName +", headerValue : "+headerValue);
			i++;
		}
		
		model.addAttribute("name", name);
		
		if(name.equals("메뚜기")) {
			response.setHeader("Cache-control", "use_cache");
			response.setHeader("contentType", "text/html;charset=utf-8");
			response.setDateHeader("date", 1L);
			return "redirect:/jsp/products";
		}else {
			// forwording
			return "jsp/request";
		}
	}
	
	/*
	요청URI : /jsp/product?productId=P1234
	요청파라미터 : productId=P1234
	요청방식 : get
	*/
	@GetMapping("/product")
	public String product(ProductVO productVO , Model model) {
		//productVO{productId= 'P1234', pname=null,description=null}
		log.info("product->productVO(전) : " + productVO);
		
		//상품 상세
	    //SELECT * FROM PRODUCT WHERE PRODUCT_ID = 'P1234';
		productVO = this.bookService.product(productVO);
		//productVO{productId= 'P1234', pname=개똥이폰,description=좋은폰}
		log.info("product->productVO(후) : " + productVO);
		
		model.addAttribute("title","상품 상세 정보");
		model.addAttribute("productVO",productVO);
		
		// forwording
		return "jsp/product";
	}
	
	// /요청 url : /jsp/addProduct
	@GetMapping("/addProduct")
	public String addProduct(Model model) {
		
		//상품코드 미리 생성(P1234)
		String productId = this.bookService.getProductId();
		log.info("addProduct->productId : " + productId);
		
		
		model.addAttribute("title", "상품 등록");
		model.addAttribute("productId", productId);
		
		/// forwording
		return "jsp/addProduct";
	}
	/*  
	요청URI : /jsp/processAddProduct
			 <input type="file" name="uploadFile" id="uploadFile"
	요청파라미터 : request{productId=1236, pname=개똥이폰,///,uploadFile=파일객체)
	요청방식 : post
	*/
	@PostMapping("/processAddProduct")
	public String processAddProduct(ProductVO productVO,
			MultipartFile uploadFile) {
		log.info("processAddProduct->productVO : " + productVO);
		log.info("processAddProduct->uploadFile : " + uploadFile);
		
	    //MultipartFile : 스프링에서 제공해주는 타입
		/*
		   --잘 씀
		   String getOriginalFileName() : 업로드 되는 파일의 이름(실제 파일명)
		   boolean isEmpty() : 파일이 없다면 true
		   long getSize() : 업로드되는 파일의 크기
		   transferTo(File file) : 파일을 저장
		   String getContentType() : 파일의 MIME(Multipurpost ) 타입
		   
		   --잘 안씀..
		   String getName() : <input type="file" name="uploadFile" 에서 uploadFile을 가져옴
		   byte[] getBytes() : byte[]로 파일 데이터 반환
		   inputStream getInputStream() : 파일데이터와 연결된 InputStream을 반환
		   */
		
		//파일에 저장되는 윈도 경로
		String uploadFolder = "C:\\upload";
		
		//매개변수 : MultipartFile uploadFile
		String 	filename = uploadFile.getOriginalFilename();//실제 파일명
		Long 	size = uploadFile.getSize();//파일크기
		String 	contentType = uploadFile.getContentType();//MINE 타입
		
		log.info("실제 파일명 : " + filename);
		log.info("파일크기 : " + size);
		log.info("MINE 타입 : " + contentType);
		
		//파일 업로드 설계
		//						C:\\upload	\\	P1244.jpg
		File saveFile = new File(uploadFolder, filename);
		
		try {
			//파일 복사
			//스프링 파일객체.transferTo(설계)
			uploadFile.transferTo(saveFile);
			
			productVO.setFilename(filename);
			
			//PRODUCT 테이블에 인서트
			int result = this.bookService.processAddProduct(productVO);
			log.info("processAddProduct=> result :" +result);
		} catch (IllegalStateException | IOException e) {
			// TODO Auto-generated catch block
			log.error(e.getMessage());
		}
		
		
		//상세로 이동(새로운 URI를 재요청함) - redirect
		//				/jsp/product?productId=P1234
		return "redirect:/jsp/product?productId="+productVO.getProductId();
		
	}
	
}

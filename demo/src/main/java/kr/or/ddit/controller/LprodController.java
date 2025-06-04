package kr.or.ddit.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.or.ddit.service.LprodService;
import kr.or.ddit.vo.LprodVO;
import lombok.extern.slf4j.Slf4j;

/*
Controller 어노테이션
스프링 프레임워크에게 "이 클래스는 웹 브라우저의 요청(request)를
받아들이는 컨트롤러야" 라고 알려주는 것임.
(regacy :스프링은 servlet-context.xml의 context:component-scan의 설정에 의해)-레거시
이 클래스를 자바빈 객체로 등록(메모리에 바인딩).

log.info : 썰
써ㄹ풀4람
*/
@RequestMapping("/lprod")
@Slf4j
@Controller
public class LprodController {
	// 서비스를 호출하기 위해 의존성 주입(Dependency Injection-DI)
	// IoC(Inversion of Control) -
	// 제어의 역전.
	// (개발자가 객체생성하지 않고 스프링이 객체를 미리 생성해놓은 것을 개발자가 요청)
	@Autowired
	LprodService lprodService;
	private Object lprodMapper;

	// 책 입력 화면
	/*
	 * 요청URI : /create 요청파라미터 : 없음 요청방식 : get
	 */
	// RequesetMapping 어노테이션 : 웹 브라우저의 요청에 실행되는 자바 메소드 지정
	/*
	 * method 속성은 http 요청 메소드를 의미함. 일반적인 웹 페이지 개발에서 GEt 메소드는 데이터를 변경하지 않는 경우에, POST
	 * 메소드는 데이터가 변경될 경우 사용 책 생성 화면은 웹 브라우저에 화면을 보여줄 뿐 데이터의 변경이 일어나지 않으므로 GET 메소드를
	 * 사용함
	 */
	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public ModelAndView create() {
		/*
		 * ModelAndView 1) Model : Controller가 반환할 데이터(String, int, List, Map, VO..)를 담당
		 * 2) View : 화면을 담당(뷰(View : JSP)의 경로)
		 */
		ModelAndView mav = new ModelAndView();

		// prefix(접두어) : /WEB-INF/views/
		// suffix(접미어) : .jsp
		// /WEB-INF/views/ + lprod/create + .jsp
		// forwarding
		mav.setViewName("lprod/create");

		return mav;

	}

	/*
	 * 요청URI : /createPost 요청파라미터(HTTP파라미터) : {title=개똥이의 모험, category=소설,
	 * price=12000} 요청방식 : post
	 * 
	 * 스프링에서 파라미터의 명과 매개변수 명이 같으면 파라미터 값이 매개변수 값으로 할당됨 모든 파라미터는 문자. 그래서 price의 값이
	 * "12000"도 숫자형 문자임
	 */
	@RequestMapping(value = "/createPost", method = RequestMethod.POST)
	public ModelAndView createPost(LprodVO lprodVO) {
		// lprodVO{"lprodId":3,"lprodGu":"P503","lprodNm":"빙과류"}
		
		log.info("createPost->lprodVO : " + lprodVO);

		// insert/update/delete 시 return 타입은 int
		// LPROD 테이블에 상품분류를 등록
		int result = this.lprodService.createPost(lprodVO);
		log.info("result : " + result);
		log.info("createPost->lprodVO : " + lprodVO);

		// ModelAndView mav = new ModelAndView();
		// redirect : URI를 재요청

		// return new ModelAndView("redirect:/create");
		return new ModelAndView("redirect:/lprod/detail?lprodId=" + lprodVO.getLprodId());

	}

	// 도서 상세 폼
	// 요청된 URI 주소 : http://localhost/detail?lprodId=3
	// 요청파라미터, HTTP 파리미터, 쿼리 스트링(Query String) : lprodId=3
	// 요청방식 : get
	// 매개변수 : LprodVO lprodVO => {"lprodId":"3","lprodGu":"","lprodNm":""}
	
	/*
	 * public ModelAndView detail(int lprodId, LprodVO lprodVO) {
	 */
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public ModelAndView detail(@RequestParam(value = "lprodId") int lprodId,
			@ModelAttribute(value = "lprodVO") LprodVO lprodVO,
			ModelAndView mav) {
		//deail-> lprodId : 3
		log.info("detail->lprodId : " + lprodId);
		log.info("detail->lprodVO : " + lprodVO);
		
		//도서상세
		lprodVO = this.lprodService.detail(lprodVO);
		log.info("detail->lprodVO(상세) : " + lprodVO);
		
		//model : 데이터를 jsp로 넘겨줌
	    //session.setAttribute(속성명, 데이터)
		mav.addObject("lprodVO", lprodVO);
	    
	    //view : jsp의 경로
	    // /WEB-INF/views/ + ... + .jsp
		mav.setViewName("lprod/detail");
		return mav;
	}
	
	/* 도서 수정 폼
    요청URI : /modify?lprodId=3
    요청파라미터 : lprodId=3
    요청방식 : get
    
    요청파라미터의 타입은 lprodId="3" 숫자형문자타입 -> 스프링 -> int 타입으로 자동 형변환
    */
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public ModelAndView modify(int lprodId, LprodVO lprodVO,
			@RequestParam Map<String, Object> map,
			ModelAndView mav) {
		log.info("modify->lprodId : {}", lprodId);
		log.info("modify->lprodVO : " + lprodVO);
		log.info("modify->map : " + map);
		
		//도서상세
		lprodVO = this.lprodService.detail(lprodVO);
		log.info("detail->lprodVO(상세) : " + lprodVO);
		
		//데이터
		mav.addObject("lprodVO", lprodVO);
		
		//뷰(jsp) 경로
		mav.setViewName("lprod/modify");
		
		return mav;
	}
	
	/*  도서 수정 실행
	   요청URI : /modifyPost
	   요청파라미터 : request{lprodId=3,title=총알탄 개똥이3,category=소설3,price=12003}
	   요청방식 : post
	    */
	
	@RequestMapping(value = "/modifyPost", method = RequestMethod.POST)
	public ModelAndView modifyPost(LprodVO lprodVO) {
		//LprodVO [
		log.info("modifyPost->lprodVO : " + lprodVO);
		
		//lprodVO객체의 lprodId프로퍼티의 값을 백업해놓기
	      int lprodId = lprodVO.getLprodId();
	     
		
		//도서 등록 + 도서 수정실행
		int result = this.lprodService.createPost(lprodVO);
		log.info("modifyPost->result : " + result);
		
		//매퍼XML의 Merge Into문 실행 후 변경된 lprodVO의 lprodId값을 
		// 백업된 값으로 보정
		lprodVO.setLprodId(lprodId);
		
		//상세로 이동
		//새로운 URI를 재요청 : redirect
		return new ModelAndView("redirect:/lprod/detail?lprodId=" + lprodId);

	}	
	
	/*도서삭제
    요청URI : /deletePost
    요청파라미터 : request{lprodId=2}
    요청방식 : post
    */
	@RequestMapping(value = "/deletePost", method = RequestMethod.POST)
	public ModelAndView deletePost(int lprodId,
			LprodVO lprodVO, @RequestParam Map<String, Object> map,
			ModelAndView mav) {
		log.info("deletePost - > lprodId : " + lprodId );
		log.info("deletePost - > lprodVO : " + lprodVO );
		log.info("deletePost - > map : " + map );
		
		//1. 책 삭제
		int result = this.lprodService.deletePost(lprodVO);
		log.info("deletePost - > result : " + result );
		
		
		if(result > 0) {//삭제 성공(1행 이상)
		
			//redirect -> 목록 URI 재요청
			mav.setViewName("redirect:/lprod/list");
		
		}else {//삭제 실패(0)
			
			//상세페이지로 되돌아옴
			mav.setViewName("redirect:/lprod/detail?lprodId="+lprodVO.getLprodId());

		}
		return mav;
	}
	
	
	/*	도서 목록 
	 action속성 및 값이 생략 시, 현재 URI(/list)를 재요청. 
         method는 GET(form 태그의 기본 HTTP 메소드는 GET임) 
      param : keyword=모험
      요청URI : /lprod/list?keyword=캐주얼&gubun=lprodNm or /lprod/list or /lprod/list?keyword=&gubun=
      요청파라미터 : keyword=모험
      요청방식 : get
      
	*/
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView list(ModelAndView mav,
			@RequestParam(value = "keyword",required = false, defaultValue = "" ) String keyword,
			@RequestParam(value = "gubun",required = false, defaultValue = "" ) String gubun) {
		
		// /list->keyword : 모험
		// /list->keyword :
		log.info("list->keyword : " + keyword);
		log.info("list->gubun : " + gubun);
		
		//맴(나) : 하 하 쏘맵
		//Map	: HashTable, HasMap, SortedMap
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("keyword", keyword);
		map.put("gubun", gubun);
		
		List<LprodVO> lprodVOList = this.lprodService.list(map);
		log.info("list->lprodVOList : " + lprodVOList);
		
		//Model(데이터)
		mav.addObject("lprodVOList", lprodVOList);
		//forwarding : jsp
		mav.setViewName("lprod/list");
		
		return mav;
	}
	
}

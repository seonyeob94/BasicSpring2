package kr.or.ddit.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.BookVO;
import kr.or.ddit.vo.ProductVO;

public interface BookService {

	// insert/update/delete 시 return 타입은 int
	// BOOK 테이블에 도서를 등록
	public int createPost(BookVO bookVO);
	
	//도서 상세
	public BookVO detail(BookVO bookVO);
	
	//도서 삭제
	public int deletePost(BookVO bookVO);
	
	//도서목록
	public List<BookVO> list(Map<String, Object> map);
	
	
	//상품목록
	public List<ProductVO> products();

}

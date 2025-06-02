package kr.or.ddit.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.LprodVO;

public interface LprodService {

	// insert/update/delete 시 return 타입은 int
	// LPROD 테이블에 도서를 등록
	public int createPost(LprodVO lprodVO);
	
	//상품 상세
	public LprodVO detail(LprodVO lprodVO);
	
	//상품 삭제
	public int deletePost(LprodVO lprodVO);
	
	//상품목록
	public List<LprodVO> list(Map<String, Object> map);

}

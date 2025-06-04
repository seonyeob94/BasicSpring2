package kr.or.ddit.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.LprodVO;

@Mapper
public interface LprodMapper {
	//lprod 테이블에 도서를 등록
	public int createPost(LprodVO lprodVO);
	
	//도서 상세
	//LprodVO [lprodId=3, title=null, category=null, price=0, insertDate=null]
	public LprodVO detail(LprodVO lprodVO);
	
	//도서 삭제
	//LprodVO [lprodId=3, title=총알탄 개똥이3, category=소설, 
	//      price=2000, insertDate=null]
	public int deletePost(LprodVO lprodVO);
	
	//도서 목록
	public List<LprodVO> list(Map<String, Object> map);

}

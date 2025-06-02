package kr.or.ddit.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.BookVO;

@Mapper
public interface BookMapper {
	//book 테이블에 도서를 등록
	public int createPost(BookVO bookVO);
	
	//도서 상세
	//BookVO [bookId=3, title=null, category=null, price=0, insertDate=null]
	public BookVO detail(BookVO bookVO);
	
	//도서 삭제
	//BookVO [bookId=3, title=총알탄 개똥이3, category=소설, 
	//      price=2000, insertDate=null]
	public int deletePost(BookVO bookVO);
	
	//도서 목록
	public List<BookVO> list(Map<String, Object> map);

}

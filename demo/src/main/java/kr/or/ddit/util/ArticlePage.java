package kr.or.ddit.util;

import java.util.List;

//페이징 관련 정보 + 게시글 정보
public class ArticlePage<T> {
	//전체글 수
	private int total;
		   
	// 현재 페이지 번호
	private int currentPage;
	   
	// 전체 페이지수 
	private int totalPages;
	   
	// 블록의 시작 번호
	private int startPage;
	   
	//블록의 종료 번호
	private int endPage;
	   
	//검색어
	private String keyword = "";
	   
	//요청URL
	private String url = "";
	   
	//select 결과 데이터   
	private List<T> content;
	   
	//페이징 처리
	private String pagingArea = "";
	
	//생성자(Constructor) : 페이징 객체 생성
	public ArticlePage(int total, int currentPage, int size
			,String keyword, List<T> content) {
		//size : 한화면에 보여질 목록의 행 수
		this.total = total;
		this.currentPage = currentPage;
		this.keyword = keyword;
		this.content = content;
	}
	
	
	
}

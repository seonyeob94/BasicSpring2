package kr.or.ddit.vo;

import lombok.Data;
//자바빈 클래스(프로퍼티, 기본생성자 , getter/setter 메소드)
@Data
public class LprodVO {
	private int rnum; //행번호RNUM
	private int lprodId; //상품분류 아이디
	private String lprodGu; //상품분류 구분
	private String lprodNm; //상품분류 명
}

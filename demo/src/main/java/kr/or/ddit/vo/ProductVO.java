package kr.or.ddit.vo;

import lombok.Data;

//자바빈 클래스
@Data
public class ProductVO {
	private String productId;
	private String pname;
	private int unitPrice;
	private String description;
	private String manufacturer;
	private String category;
	private int unitsInStock;
	private String condition;
	private String filename;
	private int quantity;
}

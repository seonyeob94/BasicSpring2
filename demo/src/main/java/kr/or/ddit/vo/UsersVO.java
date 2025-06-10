package kr.or.ddit.vo;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class UsersVO {
	private String username;
	private String name;
	private String password;
	private String enabled;

	// 관리자 권한 여러개일 수 있음
	// USERS : AUTHORITIES = 1 : N
	private List<AuthoritiesVO> authoritiesVOList;
	
	//private String authority;
}

package kr.or.ddit.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.LprodVO;
import kr.or.ddit.vo.UsersVO;

@Mapper
public interface UsersMapper {
	
	
	
	//회원 목록
	public List<UsersVO> list(Map<String, Object> map);
	
	//회원 상세
	public UsersVO detail(UsersVO usersVO);

	//회원 등록
	public int createPost(UsersVO usersVO);

	
	public int getTotal(Map<String, Object> map);

	
	

}

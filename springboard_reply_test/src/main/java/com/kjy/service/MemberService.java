package com.kjy.service;

import java.util.List;

import com.kjy.domain.BoardVO;
import com.kjy.domain.MemberVO;

public interface MemberService {
	
	public void register(MemberVO member);
	
	public String LoginCheck(MemberVO member);

	public String getModel(String id);

	public boolean authInsert(MemberVO member);

	public boolean remove(MemberVO member);

	public List<MemberVO> getMember(String id);

	public boolean modify(MemberVO member);

	public int idChk(MemberVO vo);

	public String getUser(String id);


//	
//	public boolean modify(BoardVO board);
//	// 기존의 글을 수정할 때
//	// update 메서드와 mapping
//	
//	public boolean remove(Long bno);
//	// 내가 지정한 글 번호를 이용해서 해당글을 삭제할 때.
//	// delete 메서드와 mapping
//	
//	public List<BoardVO> getList();
//	// 전체 데이터를 조회할 때.
//	// getList와 mapping
}

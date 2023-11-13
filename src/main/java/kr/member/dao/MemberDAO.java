package kr.member.dao;

import kr.member.vo.MemberVO;

public class MemberDAO {
	/*
	 * 싱글턴 패턴은 생성자를 private으로 지정해서 외부에서 호출할 수 없도록 처리하고
	 * static 메서드를 호출해서 객체가 한 번만 생성되고 생성된 객체를 공유할 수 있도록 처리하는 방식을 의미
	 */
	private static MemberDAO instance = new MemberDAO();
	
	public static MemberDAO getInstance() {
		return instance;
	}
	
	private MemberDAO() {} //외부에서 호출 불가, 같은 클래스에서만 가능
	//회원가입
	public void insertMember(MemberVO member)throws Exception{
		
	}
	//회원상세정보
	//아이디 중복 체크, 로그인 체크
	//회원정보수정
	//회원탈퇴(회원정보삭제)
}

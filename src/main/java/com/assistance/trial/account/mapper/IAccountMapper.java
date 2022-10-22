package com.assistance.trial.account.mapper;

import org.apache.ibatis.annotations.Param;

import com.assistance.trial.command.AccountVO;

public interface IAccountMapper {

	//아이디 중복 체크 기능
	int checkId(String account);

	//이메일 인증번호 생성 및 전송 기능
	String sendEmailCode(String email);

	//회원 가입 기능
	void register(AccountVO vo);

	//회원 정보 조회 기능
	AccountVO selectOne(String account);


	//로그인
	AccountVO login(@Param("account")String account,@Param("password")String password);

	//회원 탈퇴 기능
	void delete(String account);

	// 이메일로 아이디 찾기
	int checkIdByEmail(String email);

	// 이메일로 아이디 찾아서 반환
	AccountVO selectIdByEmail(String email);

	// 회원 비밀번호 초기화
	boolean updatePasssword(AccountVO vo);

	//0825 최필규 추가
	//비밀번호 확인
	int pwCheck(AccountVO vo);

	//0831
	int selectaccid(String email);
}
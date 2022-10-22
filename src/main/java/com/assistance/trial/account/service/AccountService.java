package com.assistance.trial.account.service;


import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.assistance.trial.account.mapper.IAccountMapper;
import com.assistance.trial.command.AccountVO;

@Service
public class AccountService implements IAccountService {

	@Autowired
	private IAccountMapper mapper;
	
	@Override
	public int checkId(String account) {
		return mapper.checkId(account);
	}
	
	@Override
	public String sendEmailCode(String email) {
		
		// 실제로 이메일을 보내는 기능은 해야 할게 많아서 클래스로 따로 빼야 함
		// 따라서 일단 코드만 생성하는 쪽으로 (콘솔창을 보고 입력) 임시 생성
		
		Random r = new Random();
		String chkCode = Integer.toString((r.nextInt(888888) + 111111));
		return chkCode;
	}

	@Override
	public void register(AccountVO vo) {
		mapper.register(vo);
	}

	@Override
	public AccountVO selectOne(String account) {
		return mapper.selectOne(account);
	}

	@Override
	public void delete(String account) {
		mapper.delete(account);
	}
	
	@Override
	public int checkIdByEmail(String email) {
		return mapper.checkIdByEmail(email);
	}
	
	@Override
	public AccountVO selectIdByEmail(String email) {
		return mapper.selectIdByEmail(email);
	}
	
	@Override
	public boolean updatePasssword(AccountVO vo) {
		
		System.out.println("updatePassword Service id 존재유무 : " + vo.getAccount());
		System.out.println("받아온 비번 : " + vo.getPassword());
		
		AccountVO account = selectOne(vo.getAccount());
		String pastPw = account.getPassword();
		System.out.println("이전 비번 : " + pastPw);
		
		mapper.updatePasssword(vo);
		
		String presentPw = selectOne(vo.getAccount()).getPassword();
		
		System.out.println("바뀐 비번 : " + presentPw);
		
		if (vo.getPassword().equals(presentPw))
			return true;
		else
			return false;
	}
	//0825 최필규 추가
	//비밀번호 확인
	@Override
	public int pwCheck(AccountVO vo) {
		return mapper.pwCheck(vo);
	}

	@Override
	public int selectaccid(String email) {
		return mapper.selectaccid(email);
	}

	@Override
	public AccountVO login(String account, String password) {
		return mapper.login(account, password);
	}
}

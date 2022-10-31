package com.assistance.trial.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.assistance.trial.account.service.IAccountService;
import com.assistance.trial.command.AccountVO;
import com.assistance.trial.command.AssistantRegistVO;
import com.assistance.trial.eval.service.IEvalService;
import com.assistance.trial.mypage.service.IMyPageService;

@Controller
@RequestMapping("/mypage")
public class MyPageController {

	@Autowired
	private IMyPageService service;

	@Autowired
	private IAccountService accountService;

	@Autowired
	private IEvalService evalService;

	// mypage_assistant_history 조력자 신청 현황 조회 처리
	@GetMapping("/mypage_assistant_history")
	public String test(Model model, HttpSession session) {

		// 세션 처리
		AccountVO login = (AccountVO) session.getAttribute("login");

		// loginAcc에 acc_id 값 넣기.
		int loginAcc = accountService.selectOne(login.getAccount()).getAccId();
		System.out.println("loginAcc : " + loginAcc);

		AccountVO vo = service.getList(loginAcc);

		model.addAttribute("mypageList", vo);

		System.out.println("controlloer vo " + vo);

		return "mypage/mypage_assistant_history";
	}

	// mypage_assistant_detail 조력자 신청 현황 상세보기 처리
	@GetMapping("/getApplyDetail/{assistant_id}")
	public String getApplyDetail(@PathVariable int assistant_id, Model model, HttpSession session) {

		model.addAttribute("mypageDetail", service.getApplyDetail(assistant_id));

		model.addAttribute("eval", evalService.selectOne(assistant_id));

		return "mypage/mypage_assistant_detail";
	}

	// 메인페이지 비밀번호 확인페이지 이동
	@GetMapping("/mypagePasswordAuth")
	public String mypagePasswordAuth(Model model, HttpSession session) {

		// 로그인 정보를 가저오기 위한 세션
		AccountVO login = (AccountVO) session.getAttribute("login");

		// userId에 세션의 account값 저장
		String userId = login.getAccount();

		model.addAttribute("loginId", userId);

		// 아이디값 마이페이지 비밀번호 확인 페이지에 넘겨주기
		return "mypage/mypage_password_auth";
	}

	// 메인페이지 비밀번호 체크
	@ResponseBody
	@PostMapping("/pwCheck")
	public String pwCheck(@RequestBody AccountVO vo, HttpSession session) {

		int result = accountService.pwCheck(vo);

		if (result == 1) {
			return "ok";
		} else {
			return "duplicated";
		}
	}

	// 비밀번호 일치시 마이페이지 이동처리
	@PostMapping("/pwSuccess")
	public String pwSuccess(HttpSession session) {

		return "redirect:/mypage/mypage_assistant_history";

	}

	// 회원 정보 얻어오기
	@GetMapping("/mypage_update_info/{assistant_id}")
	public String getInfo(Model model, HttpSession session, @PathVariable int assistant_id) {

		System.out.println(assistant_id);

		// 세션 처리
		AccountVO login = (AccountVO) session.getAttribute("login");

		// loginAcc에 acc_id 값 넣기.
		int loginAcc = accountService.selectOne(login.getAccount()).getAccId();

		AccountVO vo = service.getHelperInfo(loginAcc);

		model.addAttribute("helper", vo);

		AssistantRegistVO astVo = service.getAstInfo(assistant_id);

		model.addAttribute("astVo", astVo);
		return "mypage/mypage_update_info";
	}

	// 회원 정보 수정
	@PostMapping("/mypage_update_fin")
	public String updateInfo(AssistantRegistVO vo, RedirectAttributes ra, HttpSession session) {
		System.out.println("메서드 호출");
		System.out.println("업데이트 정보 : " + vo);
		service.updateInfo(vo);
		return "redirect:/mypage/mypage_assistant_history";
	}

}

package com.assistance.trial.controller;

import java.util.Map;

import javax.servlet.ServletContainerInitializer;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.assistance.trial.account.service.IAccountService;
import com.assistance.trial.admin.service.IAdminService;
import com.assistance.trial.assistant.service.IAssistantRegistService;
import com.assistance.trial.command.AccountVO;
import com.assistance.trial.command.AssistantRegistVO;
import com.assistance.trial.command.EvalVO;
import com.assistance.trial.command.FormVO;
import com.assistance.trial.eval.service.IEvalService;
import com.assistance.trial.form.service.IFormService;
import com.assistance.trial.util.MailSendService;

@Controller
@RequestMapping("/account")
public class AccountController {

	@Autowired
	private IAccountService service;

	@Autowired
	private MailSendService mailService;

	@Autowired
	private IAdminService adminService;

	@Autowired
	private IAssistantRegistService assistantService;

	@Autowired
	private IEvalService evalService;

	@Autowired
	private IFormService formService;

	@RequestMapping("/user_join")
	public String user_join() {
		System.out.println("user_join 요청이 들어옴!");
		return "account/user_join";
	}

	@GetMapping("/find_my_id_result")
	public String findMyIdResult() {
		return "account/find_my_id_result";
	}

	@PostMapping("/find_my_id_result")
	public String findMyIdResultPost(HttpServletRequest req, Model model) {

		String email = req.getParameter("userEmail");
		System.out.println("form으로 넘겨받은 이메일 주소 : " + email);

		model.addAttribute("id", service.selectIdByEmail(email).getAccount());

		return "account/find_my_id_result";
	}

	@GetMapping("/find_my_id")
	public String findMyId() {
		return "account/find_my_id";
	}

	@GetMapping("/find_my_password")
	public String findMyPassword() {
		return "account/find_my_password";
	}

	@PostMapping("/reset_my_password")
	public String resetMyPasswordPost(HttpServletRequest req, Model model) {
		String id = req.getParameter("account");
		System.out.println("form으로 넘겨받은 아이디 : " + id);

		// 입력된 아이디를 기반으로 한 유저 정보를 프론트로 넘김
		model.addAttribute("account", service.selectOne(id));

		return "account/reset_my_password";
	}

	@PostMapping("/reset_pw")
	public String resetPassword(HttpServletRequest req, Model model) {

		String id = req.getParameter("account");
		String pw = req.getParameter("password");

		AccountVO vo = service.selectOne(id);

		vo.setPassword(pw);

		// 서비스단에서 update
		if (service.updatePasssword(vo)) {
			model.addAttribute("msg", "pwChangeSuccess");
		} else {
			model.addAttribute("msg", "pwChangeFailed");
		}

		return "/home";
	}

	@GetMapping("/login")
	public String login() {
		return "account/login";
	}

	@PostMapping("/userlogin")
	public String loginCheck(String username, String password, Model model) {

		model.addAttribute("user", service.login(username, password));

		return "home";
	}

	/*
	 * @ResponseBody
	 * 
	 * @PostMapping("/login") public String loginCheck(@RequestBody Map<String,
	 * String> param, HttpSession session, HttpServletResponse response) {
	 * System.out.println("/find/login POST 요청 들어옴"); System.out.println("param : "
	 * + param);
	 * 
	 * ///0901 ㅅ세ㅕㄴ 유지시간 늘리기 session.setMaxInactiveInterval(3600);
	 * /////////////////////////
	 * 
	 * 
	 * 
	 * // 프론트에서 받아온 멤버의 ID를 매개변수로 넘겨 DB에서 일치하는 ID가 존재하는지 검색 AccountVO accVo =
	 * service.selectOne(param.get("account")); // 아이디 존재하고 비밀번호도 일치할 때 if (accVo !=
	 * null) { if (param.get("password").equals(accVo.getPassword())) { // 로그인 성공할
	 * 경우 세션 정보 생성 session.setAttribute("login", accVo);
	 * 
	 * return "loginSuccess"; } else { System.out.println("프론트측 입력값 : " +
	 * param.get("password")); System.out.println("db측 비번 : " +
	 * accVo.getPassword()); return "pwFail"; } } return "idFail"; }
	 */

	@GetMapping("/logout")
	public ModelAndView logout(HttpSession session) {
		session.invalidate();

		return new ModelAndView("redirect:/");
	}

	@GetMapping("/reset_my_password")
	public String resetMyPassword() {
		return "account/reset_my_password";
	}

	// 회원 가입 완료시 넘어가는 화면
	@GetMapping("/helper_approval")
	public String helperApproval() {
		return "account/helper_approval";
	}

	// 회원가입화면 안에서의 세부 기능들 구현 :ajax를 위함
	@PostMapping("/signup")
	@ResponseBody
	public String register(@RequestBody AccountVO vo) {
		System.out.println("/account/: POST");
		service.register(vo);
		return "joinSuccess";
	}

	@PostMapping("/checkId")
	@ResponseBody
	public String checkId(@RequestBody String account) {
		System.out.println("/user/checkId: POST");
		System.out.println("param: " + account);

		int chkNum = service.checkId(account);

		// 가끔 중복 아이디가 생기는지라 임시 방편으로 이렇게 설정.
		if (chkNum >= 1) {
			System.out.println("아이디 중복");
			return "duplicated";
		} else {
			System.out.println("아이디 사용 가능");
			return "available";
		}
	}

	@PostMapping("/checkEmail")
	@ResponseBody
	public String checkEmail(@RequestBody String email) {
		System.out.println("/user/checkEmail: POST");
		System.out.println("param: " + email);

		// 프론트단에 넘기기전에 String으로 보내야함. 서비스쪽에서 숫자 바꿀것
		String recievedCode = mailService.joinEmail(email);

		System.out.println("생성된 이메일 인증번호 : " + recievedCode);

		// 프론트단으로 숫자 넘겨주기
		return recievedCode;
	}

	@PostMapping("/checkIdByEmail")
	@ResponseBody
	public String checkIdByEmail(@RequestBody String email) {
		System.out.println("/account/checkIdByEmail: POST");
		int result = service.checkIdByEmail(email);

		if (result == 1)
			return "found";
		else
			return "notFound";
	}

	@PostMapping("/selectIdByEmail")
	@ResponseBody
	public void selectIdByEmail(@RequestBody String email, Model model) {
		System.out.println("/account/selectIdByEmail: POST");

		System.out.println(service.selectIdByEmail(email).toString());

		// 찾아낸 id를 Attribute로 보냄
		model.addAttribute("account", service.selectIdByEmail(email));
	}

	@PostMapping("/resetPwByIdAndEmail")
	@ResponseBody
	public String resetPwByIdAndEmail(@RequestBody AccountVO vo) {

		System.out.println("프론트에서 넘어온 값 체크 : " + vo);

		AccountVO selectedAccount = service.selectIdByEmail(vo.getEmail());

		// id와 이메일 둘다 유효한지 검증해야 함
		if (selectedAccount.getAccount().equals(vo.getAccount()) && selectedAccount.getEmail().equals(vo.getEmail())) {
			return "found";
		} else {
			return "notFound";
		}
	}

	// 회원가입화면 안에서의 세부 기능들 구현 끝
}

package com.assistance.trial.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.assistance.trial.command.AccountVO;
import com.assistance.trial.command.AgencyVO;
import com.assistance.trial.command.OneBoardVO;
import com.assistance.trial.oneboard.service.IOneBoardService;
import com.assistance.trial.util.PageCreator;
import com.assistance.trial.util.PageVO;

@Controller
@RequestMapping("/oneboard")
public class OneBoardController {

	@Autowired
	private IOneBoardService service;

	// 목록 화면
	@GetMapping("/list")
	public void list(PageVO vo, Model model, HttpSession session) {
		System.out.println(vo);

		PageCreator pc = new PageCreator();
		pc.setPaging(vo);
		pc.setArticleTotalCount(service.getTotal(vo));
		System.out.println(pc);

		model.addAttribute("oneList", service.getList(vo));
		model.addAttribute("pc", pc);

	}

	// 글쓰기 화면 처리
	@GetMapping("/write")
	public void write(HttpSession session) {
	}

	// 글 등록 처리
	@PostMapping("/registForm")
	public String registForm(OneBoardVO vo, RedirectAttributes ra, HttpSession session) {
		service.regist(vo);
		ra.addFlashAttribute("msg", "정상 등록 처리되었습니다.");

		return "redirect:/oneboard/list";
	}

	// 글 상세보기 처리
	@GetMapping("/view/{one_id}")
	public String getContent(@PathVariable int one_id, @ModelAttribute("p") PageVO vo, Model model,
			HttpSession session) {
		model.addAttribute("one", service.getContent(one_id));

		return "oneboard/view";
	}

	// 글 수정 페이지 이동 처리
	@GetMapping("/write_corr")
	public void write_corr(int one_id, Model model, HttpSession session) {
		model.addAttribute("one", service.getContent(one_id));
	}

	// 글 수정 처리
	@PostMapping("/oneUpdate")
	public String oneUpdate(OneBoardVO vo, RedirectAttributes ra, HttpSession session) {
		service.update(vo);
		ra.addFlashAttribute("msg", "updateSuccess");

		return "redirect:/oneboard/view/" + vo.getOne_id();
	}

	// 글 삭제 처리
	@PostMapping("/oneDelete")
	public String oneDelete(int one_id, RedirectAttributes ra, HttpSession session) {
		service.delete(one_id);
		ra.addFlashAttribute("msg", "게시글이 삭제되었습니다.");

		return "redirect:/oneboard/list";
	}

}

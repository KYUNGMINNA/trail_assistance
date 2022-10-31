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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.assistance.trial.command.NoticeBoardVO;
import com.assistance.trial.noticeboard.service.INoticeBoardService;
import com.assistance.trial.util.PageCreator;
import com.assistance.trial.util.PageVO;

@Controller
@RequestMapping("/noticeboard")
public class NoticeBoardController {

	@Autowired
	private INoticeBoardService service;

	// 목록 화면
	@GetMapping("/list")
	public void list(PageVO vo, Model model, HttpSession session) {

		System.out.println(vo);

		PageCreator pc = new PageCreator();
		pc.setPaging(vo);
		pc.setArticleTotalCount(service.getTotal(vo));

		System.out.println(pc);

		model.addAttribute("noticeList", service.getList(vo));
		model.addAttribute("pc", pc);

	}

	// 글쓰기 화면 처리
	@GetMapping("/write")
	public void write(HttpSession session) {
	}

	// 글 등록 처리
	@PostMapping("/registForm")
	public String registForm(NoticeBoardVO vo, RedirectAttributes ra, HttpSession session) {
		vo.setNotice_writer("관리자");
		service.regist(vo);
		ra.addFlashAttribute("msg", "정상 등록 처리되었습니다.");
		return "redirect:/noticeboard/list";
	}

	// 글 상세보기 처리
	@GetMapping("/view/{notice_id}")
	public String getContent(@PathVariable int notice_id, @ModelAttribute("p") PageVO vo, Model model,
			HttpSession session) {

		model.addAttribute("notice", service.getContent(notice_id));

		return "noticeboard/view";

	}

	// 글 수정 페이지 이동 처리
	@GetMapping("/write_corr")
	public void write_corr(int notice_id, Model model, HttpSession session) {
		model.addAttribute("notice", service.getContent(notice_id));
	}

	// 글 수정 처리
	@PostMapping("/noticeUpdate")
	public String noticeUpdate(NoticeBoardVO vo, RedirectAttributes ra, HttpSession session) {

		System.out.println("notice update vo  is " + vo);
		System.out.println("vo  get notice _id is " + vo.getNotice_id());
		service.update(vo);
		ra.addFlashAttribute("msg", "updateSuccess");
		return "redirect:/noticeboard/view/" + vo.getNotice_id();
	}

	// 글 삭제 처리
	@PostMapping("/noticeDelete")
	public String noticeDelete(int notice_id, RedirectAttributes ra, HttpSession session) {

		service.delete(notice_id);

		ra.addFlashAttribute("msg", "게시글이 삭제되었습니다.");

		return "redirect:/noticeboard/list";
	}
}

package com.assistance.trial.controller;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.assistance.trial.command.ArticleBoardVO;
import com.assistance.trial.articleboard.service.IArticleBoardService;
import com.assistance.trial.util.PageCreator;
import com.assistance.trial.util.PageVO;

@Controller
@RequestMapping("/articleboard")
public class ArticleBoardController {

	@Autowired
	private IArticleBoardService service;

	// 목록 화면
	@GetMapping("/list")
	public void list(PageVO vo, Model model, HttpSession session) {

		PageCreator pc = new PageCreator();
		pc.setPaging(vo);
		pc.setArticleTotalCount(service.getTotal(vo));

		model.addAttribute("articleList", service.getList(vo));
		model.addAttribute("pc", pc);

	}

	// 글쓰기 화면 처리
	@GetMapping("/write")
	public void write(HttpSession session) {
	}

	// 글 등록 처리
	@PostMapping("/registForm")
	public String registForm(ArticleBoardVO vo, @RequestParam("start_date") String startDate,
			@RequestParam("expired_date") String expiredDate, RedirectAttributes ra, HttpSession session) {

		System.out.println("변환 전 시작 날짜: " + startDate);
		System.out.println("변환 전 만료 날짜: " + expiredDate);

		String dateTimeStartDate = startDate.replace("T", " ");
		String dateTimeExpiredDate = expiredDate.replace("T", " ");

		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
		LocalDateTime startDateTime = LocalDateTime.parse(dateTimeStartDate, formatter);
		LocalDateTime expiredDateTime = LocalDateTime.parse(dateTimeExpiredDate, formatter);

		vo.setArticle_start_date(Timestamp.valueOf(startDateTime));
		vo.setArticle_expired_date(Timestamp.valueOf(expiredDateTime));

		System.out.println("변환 후 시작 날짜: " + vo.getArticle_start_date());
		System.out.println("변환 후 만료 날짜: " + vo.getArticle_expired_date());

		service.regist(vo);

		ra.addFlashAttribute("msg", "정상 등록 처리되었습니다.");
		return "redirect:/articleboard/list";
	}

	// 글 상세보기 처리
	@GetMapping("/view/{article_id}")
	public String getContent(@PathVariable int article_id, @ModelAttribute("p") PageVO vo, Model model,
			HttpSession session) {

		model.addAttribute("article", service.getContent(article_id));

		return "articleboard/view";

	}

	// 글 수정 페이지 이동 처리
	@GetMapping("/write_corr")
	public void write_corr(int article_id, Model model, HttpSession session) {
		model.addAttribute("article", service.getContent(article_id));
	}

	// 글 수정 처리
	@PostMapping("/articleUpdate")
	public String articleUpdate(ArticleBoardVO vo, RedirectAttributes ra,

			@RequestParam("start_date") String startDate, @RequestParam("expired_date") String expiredDate,
			HttpSession session) {
		System.out.println("변환 전 시작 날짜: " + startDate);
		System.out.println("변환 전 만료 날짜: " + expiredDate);

		String dateTimeStartDate = startDate.replace("T", " ");
		String dateTimeExpiredDate = expiredDate.replace("T", " ");

		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
		LocalDateTime startDateTime = LocalDateTime.parse(dateTimeStartDate, formatter);
		LocalDateTime expiredDateTime = LocalDateTime.parse(dateTimeExpiredDate, formatter);

		vo.setArticle_start_date(Timestamp.valueOf(startDateTime));
		vo.setArticle_expired_date(Timestamp.valueOf(expiredDateTime));

		System.out.println("변환 후 시작 날짜: " + vo.getArticle_start_date());
		System.out.println("변환 후 만료 날짜: " + vo.getArticle_expired_date());

		service.update(vo);
		ra.addFlashAttribute("msg", "updateSuccess");
		return "redirect:/articleboard/view/" + vo.getArticle_id();
	}

	// 글 삭제 처리
	@PostMapping("/articleDelete")
	public String articleDelete(int article_id, RedirectAttributes ra, HttpSession session) {

		service.delete(article_id);

		ra.addFlashAttribute("msg", "게시글이 삭제되었습니다.");

		return "redirect:/articleboard/list";
	}

}

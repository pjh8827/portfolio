package com.ssafy.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.ssafy.dto.Notice;

import com.ssafy.service.NoticerService;

@Controller
public class NoticeController {

	@Autowired
	NoticerService service;

	@GetMapping("notice.do")
	public String getNoticeListView() {

		// List<Notice> noticelist = service.searchAll();
		// System.out.println(noticelist);
		// model.addAttribute("noticelist", noticelist);
		return "/notice/list";
	}

	@GetMapping("/notice/detail.do")
	public String getRestNotice(Notice notice, Model model, HttpSession session, HttpServletRequest req) {
		try {
			String s = req.getParameter("no");
			if (s != null) {
				int n = Integer.parseInt(s);
				service.addViewCnt(n);
				Notice selected = service.search(n);
				System.out.println(selected);
				model.addAttribute("NoticeNo", s);
			}
			System.out.println(s);
			return "/notice/detail";
		} catch (RuntimeException e) {
			model.addAttribute("message", "문제 내용 - 게시판 오류 발생 ");
			return "Error";
		}
	}

	@GetMapping("notice/regist.do")
	public String getNoticeRegistForm(Model model) {

		model.addAttribute("edit_mode", "regist");
		return "/notice/edit";

		// System.out.println(service.searchAll());

	}

	@GetMapping("notice/modify.do")
	public String getNoticeModifyForm(HttpServletRequest req, Model model) {
		String no = req.getParameter("no");
		System.out.println(no);

		if (no == null) {
			return "redirect:/notice.do";
		}

		model.addAttribute("edit_mode", "modify");
		model.addAttribute("edit_no", no);

		return "/notice/edit";

		// System.out.println(service.searchAll());

	}

	@PostMapping("/notice/add.do")
	public String addNoticeAricle(Notice newpost) {

		System.out.println(newpost);
		service.add(newpost);

		return "/notice/list";

	}

	/// notice/delete.do?no=
	@PostMapping("notice/delete.do")
	public String deleteNoticeAricle(HttpServletRequest req, Model model) {
		String no = req.getParameter("no");
		System.out.println("test" + no);

		if (no == null) {
			return "redirect:/notice.do";
		}

		service.remove(Integer.parseInt(no));

		return "/notice/list";

	}

}

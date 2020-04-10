package com.ssafy.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.ssafy.dto.QnA;

import com.ssafy.service.QnaService;

@Controller
public class QnaController {

    @Autowired
    QnaService service;

    @GetMapping("qna.do")
    public String getNoticeListView() {

        // List<Notice> noticelist = service.searchAll();
        // System.out.println(noticelist);
        // model.addAttribute("noticelist", noticelist);
        return "/qna/list";
    }

    @GetMapping("/qna/detail.do")
    public String getRestNotice(QnA qna, Model model, HttpSession session, HttpServletRequest req) {
        try {
            String s = req.getParameter("no");
            if (s != null) {
                int n = Integer.parseInt(s);
                service.addViewCnt(n);
                QnA selected = service.search(n);
                System.out.println(selected);
                model.addAttribute("QnaNo", s);
            }
            System.out.println(s);
            return "/qna/detail";
        } catch (RuntimeException e) {
            model.addAttribute("message", "문제 내용 - Q&A 오류 발생 ");
            return "Error";
        }
    }

    @GetMapping("qna/regist.do")
    public String getNoticeRegistForm(Model model) {

        model.addAttribute("edit_mode", "regist");
        return "/qna/edit";

        // System.out.println(service.searchAll());

    }

    @GetMapping("qna/modify.do")
    public String getNoticeModifyForm(HttpServletRequest req, Model model) {
        String no = req.getParameter("no");
        System.out.println(no);

        if (no == null) {
            return "redirect:/qna.do";
        }

        model.addAttribute("edit_mode", "modify");
        model.addAttribute("edit_no", no);

        return "/qna/edit";

        // System.out.println(service.searchAll());

    }

    @PostMapping("/qna/add.do")
    public String addNoticeAricle(QnA newpost) {

        System.out.println(newpost);
        service.add(newpost);

        return "/qna/list";

    }

    /// notice/delete.do?no=
    @PostMapping("qna/delete.do")
    public String deleteNoticeAricle(HttpServletRequest req, Model model) {
        String no = req.getParameter("no");
        System.out.println("test" + no);

        if (no == null) {
            return "redirect:/qna.do";
        }

        service.remove(Integer.parseInt(no));

        return "/qna/list";

    }

}

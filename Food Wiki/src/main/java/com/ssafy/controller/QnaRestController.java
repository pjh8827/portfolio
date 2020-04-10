package com.ssafy.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.dto.Pagination;
import com.ssafy.dto.QnA;
import com.ssafy.service.QnaService;

import io.swagger.annotations.ApiOperation;

@RestController
@RequestMapping("/rest")
@CrossOrigin(origins = "*")
public class QnaRestController {
    private static final Logger logger = LoggerFactory.getLogger(QnaRestController.class);

    @Autowired
    QnaService service;

    private ResponseEntity<Map<String, Object>> response(Object data, boolean status, HttpStatus hstatus) {
        Map<String, Object> resultMap = new HashMap<String, Object>();
        resultMap.put("status", status);
        resultMap.put("data", data);
        return new ResponseEntity<>(resultMap, hstatus);
    }

    @GetMapping("/Qna")
    @ApiOperation("전체 Q&A 정보를 반환한다.")
    public ResponseEntity<Map<String, Object>> getAllMember() {
        try {
            List<QnA> list = service.searchAll();
            return response(list, true, HttpStatus.OK);
        } catch (Exception e) {
            logger.error("목록조회실패", e);
            return response(e.getMessage(), false, HttpStatus.CONFLICT);
        }
    }

    @GetMapping("/Qna/{no}")
    @ApiOperation("No에 해당하는 하나의 Q&A 정보를 반환한다.")
    public ResponseEntity<Map<String, Object>> getMember(@PathVariable int no) {
        try {
            QnA qna = service.search(no);
            return response(qna, true, HttpStatus.OK);
        } catch (Exception e) {
            logger.error("회원조회실패", e);
            return response(e.getMessage(), false, HttpStatus.CONFLICT);
        }
    }

    @RequestMapping(method = RequestMethod.GET, value = "/Qna/Page")
    @ApiOperation("Q&A 페이지를 반환한다.")
    public ResponseEntity<Map<String, Object>> getFoodPage(@RequestParam Map<String, String> params) {
        try {

            Integer page = Integer.parseInt(params.get("page"));
            Integer range = Integer.parseInt(params.get("range"));

            Integer foodlistCnt = service.getTotalQnAListCnt();

            Pagination p = new Pagination();

            p.pageInfo(page, range, foodlistCnt);

            List<QnA> foodres = service.getQnApage(p);
            HashMap<String, Object> res = new HashMap<>();
            res.put("items", foodres);
            res.put("pagination", p);

            return response(res, true, HttpStatus.OK);
        } catch (Exception e) {
            logger.error("Q&A조회실패", e);
            return response(e.getMessage(), false, HttpStatus.CONFLICT);
        }
    }

    @PostMapping("/Qna")
    @ApiOperation("전달받은 Q&A 정보를 등록한다.")
    public ResponseEntity<Map<String, Object>> insertMember(@RequestBody QnA qna) {
        try {
            boolean result = service.add(qna);
            return response(result, true, HttpStatus.CREATED);
        } catch (RuntimeException e) {
            logger.error("Q&A 등록 실패", e);
            return response(e.getMessage(), false, HttpStatus.CONFLICT);
        }
    }

    @PutMapping("/Qna")
    @ApiOperation("전달받은 Q&A 정보를 업데이트한다.")
    public ResponseEntity<Map<String, Object>> updateMember(@RequestBody QnA qna) {
        try {
            boolean result = service.update(qna);
            return response(result, true, HttpStatus.OK);
        } catch (Exception e) {
            logger.error("Q&A 정보 수정 실패", e);
            return response(e.getMessage(), false, HttpStatus.CONFLICT);
        }
    }

    @DeleteMapping("/Qna/{no}")
    @ApiOperation("전달받은 Q&A 정보를 삭제한다.")
    public ResponseEntity<Map<String, Object>> deleteMember(@PathVariable int no, HttpSession session) {
        try {
            boolean result = service.remove(no);
            if (result == true) {
                session.invalidate();
            }
            return response(result, true, HttpStatus.OK);
        } catch (Exception e) {
            logger.error("Q&A 삭제 실패", e);
            return response(e.getMessage(), false, HttpStatus.CONFLICT);
        }
    }

    @GetMapping("qna/search")
    public ResponseEntity<Map<String, Object>> getQnaListView(@RequestParam String condition,
            @RequestParam String key) {
        try {
            System.out.printf("c %s  k %s \n", condition, key);
            List<QnA> Qnalist = service.searchByCondition(condition, key);
            System.out.println(Qnalist);
            return response(Qnalist, true, HttpStatus.OK);
        } catch (Exception e) {
            logger.error("Q&A 검색  실패", e);
            return response(e.getMessage(), false, HttpStatus.CONFLICT);
            // TODO: handle exception
        }
    }
}

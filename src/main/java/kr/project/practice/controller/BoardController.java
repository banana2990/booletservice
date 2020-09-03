package kr.project.practice.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.project.practice.dto.BoardDTO;
import kr.project.practice.service.BoardService;
@Controller
public class BoardController {
	@Autowired BoardService service;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@RequestMapping(value= "/main", method= RequestMethod.GET)
	public ModelAndView main(HttpSession session, Model model) {		
		logger.info("게시판 리스트 호출");
		String id = (String) session.getAttribute("loginId");
		return service.list(id);
	}
	
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public ModelAndView detail(@RequestParam String idx) {
		logger.info("게시글 상세보기 : " + idx);		
		return service.detail(idx);
	}
	
	@RequestMapping(value= "/writeForm", method= RequestMethod.GET)
	public String writeForm() {
		return "writeForm";
	}
	
	// dto로 파라메터를 받기위한 조건
		// ModelAttribute를 사용할 것 && View에서 보내는 name과 DTO내의 필드명이 일치할 것
		@RequestMapping(value = "/write", method = RequestMethod.POST)
		public ModelAndView write(@ModelAttribute BoardDTO dto) {
			logger.info(dto.getSubject() +"/"+dto.getContent()+"/"+dto.getId());
			return service.write(dto);
		}
		
		@RequestMapping(value= "/updateForm", method= RequestMethod.GET)
		public ModelAndView updateForm(@RequestParam String idx) {
			logger.info("수정할 글번호:" + idx);		
			return service.updateForm(idx);
			
		}
		
		@RequestMapping(value = "/update", method = RequestMethod.POST)
		public ModelAndView update(@ModelAttribute BoardDTO dto) {
			logger.info("수정폼에서 가져오기:"+dto.getIdx()+"/"+dto.getId()+"/"+dto.getSubject()+"/"+dto.getContent());
			return service.update(dto);
		}
		
		@RequestMapping(value= "/delete", method= RequestMethod.GET)
		public ModelAndView delete(@RequestParam String idx) {
			logger.info("삭제할 글번호:" + idx);		
			return service.delete(idx);
		}
	
	
}

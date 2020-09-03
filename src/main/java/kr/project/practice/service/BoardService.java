package kr.project.practice.service;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.servlet.ModelAndView;

import kr.project.practice.dao.BoardDAO;
import kr.project.practice.dto.BoardDTO;

@Service
public class BoardService {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired BoardDAO dao;
	
	// 게시판 리스트 호출
		public ModelAndView list(String id) {
			ArrayList<BoardDTO> list = dao.list();
			logger.info("size: "+ list.size()); //logger는 기본적으로 문자열이 들어가야함
			ModelAndView mav = new ModelAndView();
			mav.addObject("list",list);
			mav.setViewName("main");
			if(id.equals("admin")) {
				mav.setViewName("redirect:/admin"); // 관리자일 경우엔 회원리스트 보기로
			}			
			return mav;
		}

		// 게시글 상세보기
		@Transactional(isolation = Isolation.READ_COMMITTED)
		public ModelAndView detail(String idx) {
			ModelAndView mav = new ModelAndView();		
			int success = dao.bHit(idx);
			logger.info("조회수 증가: " +success);
			BoardDTO dto = dao.detail(idx);
			logger.info("내용: "+dto.getContent());	
			mav.addObject("info",dto);
			mav.setViewName("detail");
			return mav;
		}
		
		public ModelAndView write(BoardDTO dto) {
			int success = dao.write(dto);
			logger.info("success : "+success);
			String page = "writeForm";
			if(success > 0) {
				page = "redirect:/main";
			}
			ModelAndView mav = new ModelAndView();
			mav.setViewName(page);
			return mav;
		}

		public ModelAndView updateForm(String idx) {
			ModelAndView mav = new ModelAndView();
			BoardDTO dto = dao.detail(idx);
			logger.info(dto.getContent());	
			mav.addObject("info",dto);
			mav.setViewName("updateForm");
			return mav;
		}

		public ModelAndView update(BoardDTO dto) {
			ModelAndView mav = new ModelAndView();
			int success = dao.update(dto);
			logger.info("success : "+success);
			String page = "updateForm";
			if(success > 0) {
				page = "redirect:/detail?idx="+dto.getIdx();
			}
			mav.setViewName(page);
			return mav;
		}

		public ModelAndView delete(String idx) {
			ModelAndView mav = new ModelAndView();
			int success = dao.delete(idx);
			logger.info("success : "+success);
			mav.setViewName("redirect:main");
			return mav;
		}
		
}

package kr.project.practice.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import kr.project.practice.dao.MemberDAO;
import kr.project.practice.dto.BoardDTO;
import kr.project.practice.dto.MemberDTO;

@Service
public class MemberService {

	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired MemberDAO dao;
	@Value("#{config['manager.id']}") String adminId;
	@Value("#{config['manager.pw']}") String adminPw;
	@Value("#{config['manager.msg']}") String adminMsg;	
	// root-context.xml에서 설정한, util 부분을 참고해서 
	//@Value 라는 annotation으로 properties 내의 값을 불러 오는 것. 해당 설정에 id="config"로 줘서 #{config}로 가져오는 것
	
	public boolean login(HashMap<String, String> params) throws SQLException {
		boolean success = false;
		if(!params.get("mode").equals("admin")) {
			MemberDTO dto = dao.login(params);		
			if(dto!=null) {
				String id = dto.getId();
				logger.info("id: "+id);
				success = true;
			}	
		}else {
			if(params.get("id").equals(adminId)&&params.get("pw").equals(adminPw)) {
			success = true;
			}
		}		
		return success;	
		
		
	}

	public boolean join(HashMap<String, String> param) {
		boolean success = false;			
		if(dao.join(param)>0) {
			success = true;
		}
		return success;
	}

	public boolean overlay(String id) {
		boolean success = false;		
		MemberDTO dto = dao.overlay(id);
		if(dto!=null) { // 해당 아이디가 존재 함
			success = true;
		}		
		return success;
	}

	public ModelAndView memberlist() {
		ArrayList<MemberDTO> list = dao.memberlist();
		logger.info("size: "+ list.size()); //logger는 기본적으로 문자열이 들어가야함
		ModelAndView mav = new ModelAndView();
		mav.addObject("list",list);
		mav.setViewName("admin");		
		return mav;
	}
	
	public ModelAndView memdelete(String id) {
		ModelAndView mav = new ModelAndView();
		int success = dao.memdelete(id);
		logger.info("success : "+success);
		mav.setViewName("redirect:admin");
		return mav;
	}

	public ModelAndView memdetail(String id) {
		ModelAndView mav = new ModelAndView();
		MemberDTO dto = dao.memdetail(id);
		logger.info("회원정보보기: "+dto.getId()+" 회원성별: "+dto.getGender());	
		mav.addObject("memdetail",dto);
		mav.setViewName("memdetail");
		return mav;
	}

	public ModelAndView memupdate(MemberDTO dto) {
		ModelAndView mav = new ModelAndView();
		int success = dao.memupdate(dto);
		logger.info("success : "+success);
		String page = "redirect:/memdetail?id=\"+dto.getId();";
		if(success > 0) {
			page = "redirect:/admin";
		}
		mav.setViewName(page);
		return mav;
	}
	
	
	
	
}

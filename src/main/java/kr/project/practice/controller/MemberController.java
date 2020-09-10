package kr.project.practice.controller;

import java.sql.SQLException;
import java.util.HashMap;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.project.practice.dto.MemberDTO;
import kr.project.practice.service.MemberService;

@Controller
public class MemberController {
	@Autowired MemberService service;
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@RequestMapping(value= "/login", method= RequestMethod.POST)
	public String login(HttpSession session, RedirectAttributes rAttr, 
			@RequestParam HashMap<String, String> params) {
		logger.info("params: "+params);
		String page = "redirect:/";
		String msg = "로그인에 실패했습니다.";
		
		try {
			if(service.login(params)) {
				page="redirect:/main";
				msg="로그인에 성공했습니다.";
				session.setAttribute("loginId", params.get("id"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		rAttr.addFlashAttribute("msg", msg);
		return page;
	}
	
	@RequestMapping(value= "/joinForm", method= RequestMethod.GET)
	public String joinForm() {
		return "joinForm";
	}
	
	@RequestMapping(value= "/join", method= RequestMethod.POST)
	public @ResponseBody HashMap<String,Object> join(RedirectAttributes rAttr, 
			@RequestParam HashMap<String, String> param) {
		logger.info("param: {}"+param);
		HashMap<String, Object> map= new HashMap<String, Object> ();
		boolean join = false;
		join = service.join(param);
		map.put("join", join);
		return map;
	}
	
	@RequestMapping(value= "/overlay", method= RequestMethod.GET)
	public @ResponseBody HashMap<String, Object> overlay(@RequestParam HashMap<String, String> param) {
		logger.info("param: "+param.get("id"));
		String id = param.get("id");
		HashMap<String, Object> map= new HashMap<String, Object> ();
		boolean overlay = false;	
		overlay = service.overlay(id);
		map.put("overlay", overlay);
		return map;
	}
		
	@RequestMapping(value= "/logout", method= RequestMethod.GET)
	public String logout(HttpSession session, Model model) {
		logger.info("로그인한 ID: "+session.getAttribute("loginId"));
		session.removeAttribute("loginId");
		model.addAttribute("msg","로그아웃되었습니다.");
		return "home";
	}
	
	@RequestMapping(value= "/admin", method= RequestMethod.GET)
	public ModelAndView admin(HttpSession session, Model model) {		
		logger.info("회원 리스트 호출");
		return service.memberlist();
	}
		
	@RequestMapping(value= "/memdelete", method= RequestMethod.GET)
	public ModelAndView memdelete(@RequestParam String id) {
		logger.info("삭제할 회원:" + id);		
		return service.memdelete(id);
	}
	
	@RequestMapping(value= "/memdetail", method= RequestMethod.GET)
	public ModelAndView memdetail(@RequestParam String id) {
		logger.info("수정할 회원:" + id);		
		return service.memdetail(id);
	}
	
	@RequestMapping(value = "/memupdate", method = RequestMethod.POST)
	public ModelAndView memupdate(@ModelAttribute MemberDTO dto) {
		logger.info("회원정보 수정하기: "+dto.getId());
		return service.memupdate(dto);
	}
	
	

	
	
	
	
	
	
	
}

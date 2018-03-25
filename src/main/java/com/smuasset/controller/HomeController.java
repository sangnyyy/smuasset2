package com.smuasset.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.smuasset.dto.MemberVO;
import com.smuasset.service.MemberService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Inject
	MemberService service;

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate);

		return "index";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public void login(HttpServletResponse res, HttpServletRequest req, HttpSession session) throws IOException {
		try {
			res.setContentType("text/html; charset=UTF-8");
			req.setCharacterEncoding("UTF-8"); // POST방식 encoding 해결
			PrintWriter out = res.getWriter();
			MemberVO vo = new MemberVO();
			vo.setEmail(req.getParameter("email"));
			vo.setPassword(req.getParameter("password"));
			int checkNum = service.loginCheck(vo);
			if (checkNum > 0) {
				List<MemberVO> list = service.selectMember(vo);
				session.setAttribute("name", list.get(0).getName());
				out.println("<script>alert('로그인을 성공하였습니다.'); location.href='/'</script>");
				out.flush();
				out.close();
			} else {
				out.println("<script>alert('로그인 정보를 확인하세요!'); location.href='/'</script>");
				out.flush();
				out.close();
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value="/logout")
	public void logOut(HttpServletResponse res, HttpSession session) throws IOException {
		res.setContentType("text/html; charset=UTF-8");
		PrintWriter out = res.getWriter();
		session.removeAttribute("name");
		out.println("<script>alert('로그아웃을 성공하였습니다!'); location.href='/'</script>");
		out.flush();
		out.close();
	}
	
	@RequestMapping(value = "/signup", method = RequestMethod.GET)
	public String signUp() {
		return "signup";
	}
	
	@RequestMapping(value = "/signup", method = RequestMethod.POST)
	public void signUpFinish(HttpServletRequest req, HttpServletResponse res) throws IOException{
		MemberVO vo = new MemberVO();
		try {
			req.setCharacterEncoding("UTF-8");	//POST방식 encoding 해결
			res.setContentType("text/html; charset=UTF-8");
			PrintWriter out = res.getWriter();
			if(req.getParameter("password").equals(req.getParameter("confirmPw"))) {
				vo.setName(req.getParameter("name"));
				vo.setEmail(req.getParameter("email"));
				vo.setPassword(req.getParameter("password"));
				service.insertMember(vo);
				out.println("<script>alert('회원가입을 성공하였습니다!'); location.href='/'</script>");
				out.flush();
				out.close();
			}else {
				out.println("<script>alert('비밀번호가 일치하지 않습니다.'); location.href='/signup'</script>");
				out.flush();
				out.close();
			}
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value="/cwrite", method = RequestMethod.GET)
	public String communityWrite() {
		return "cwrite";
	}
	@RequestMapping(value="/cwrite", method = RequestMethod.POST)
	public String communityWriteFinish() {
		return "index";
	}
	@RequestMapping(value="/pwrite", method = RequestMethod.GET)
	public String pConsultWrite() {
		return "pwrite";
	}
	@RequestMapping(value="/pwrite", method = RequestMethod.POST)
	public String pConsultWriteFinish() {
		return "index";
	}
	@RequestMapping(value = "/gconsult", method = RequestMethod.GET)
	public String showGConsult() {
		return "gconsult";
	}
	@RequestMapping(value = "/pconsult", method = RequestMethod.GET)
	public String showPConsult() {
		return "pconsult";
	}
	@RequestMapping(value = "/news", method = RequestMethod.GET)
	public String showNews() {
		return "news";
	}
	@RequestMapping(value = "/policy", method = RequestMethod.GET)
	public String showPolicy() {
		return "policy";
	}
	@RequestMapping(value = "/community", method = RequestMethod.GET)
	public String showCommunity() {
		return "community";
	}
}

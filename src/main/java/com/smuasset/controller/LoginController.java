package com.smuasset.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.smuasset.dto.MemberVO;
import com.smuasset.service.MemberService;

@Controller
public class LoginController {

	@Inject
	MemberService service;

	@ResponseBody
	@RequestMapping(value = "/checkid", method = RequestMethod.POST)
	public String checkId(HttpServletRequest req, Model model) {
		MemberVO vo = new MemberVO();
		int checkNum;
		if (req.getParameter("email") == null || req.getParameter("email").trim().isEmpty()) {
			checkNum = -1;
		} else {
			vo.setEmail(req.getParameter("email"));
			checkNum = service.checkId(vo);
		}
		return String.valueOf(checkNum);
	}

	@ResponseBody
	@RequestMapping(value = "/checknick", method = RequestMethod.POST)
	public String checkNick(HttpServletRequest req, Model model) {
		MemberVO vo = new MemberVO();
		int checkNum;
		if (req.getParameter("nickname") == null || req.getParameter("nickname").trim().isEmpty()) {
			checkNum = -1;
		} else {
			vo.setNickname(req.getParameter("nickname"));
			checkNum = service.checkNick(vo);
		}
		return String.valueOf(checkNum);
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
				session.setAttribute("nickname", list.get(0).getNickname());
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

	@RequestMapping(value = "/logout")
	public void logOut(HttpServletResponse res, HttpSession session) throws IOException {
		res.setContentType("text/html; charset=UTF-8");
		PrintWriter out = res.getWriter();
		session.removeAttribute("nickname");
		out.println("<script>alert('로그아웃을 성공하였습니다!'); location.href='/'</script>");
		out.flush();
		out.close();
	}

	@RequestMapping(value = "/signup", method = RequestMethod.GET)
	public String signUp() {
		return "signup";
	}

	@RequestMapping(value = "/signup", method = RequestMethod.POST)
	public void signUpFinish(HttpServletRequest req, HttpServletResponse res) throws IOException {
		
		MemberVO vo = new MemberVO();
		vo.setName(req.getParameter("name"));
		vo.setEmail(req.getParameter("email"));
		vo.setPassword(req.getParameter("password"));
		vo.setNickname(req.getParameter("nickname"));

		try {
			req.setCharacterEncoding("UTF-8"); // POST방식 encoding 해결
			res.setContentType("text/html; charset=UTF-8");
			PrintWriter out = res.getWriter();
			if (service.checkId(vo) > 0 || service.checkNick(vo) > 0) {
				out.println("<script>alert('계정 또는 닉네임이 존재합니다.'); location.href='/signup'</script>");
				out.flush();
				out.close();
			} else {
				if (req.getParameter("name") == null || req.getParameter("name").trim().isEmpty()) {
					out.println("<script>alert('이름을 확인하세요!'); location.href='/signup'</script>");
					out.flush();
					out.close();
				}
				if (req.getParameter("email") == null || req.getParameter("email").trim().isEmpty()) {
					out.println("<script>alert('이메일을 확인하세요!'); location.href='/signup'</script>");
					out.flush();
					out.close();
				} else {
					int emailFormCheck = 0;
					for (int i = 0; i < req.getParameter("email").length(); i++) {
						if (req.getParameter("email").charAt(i) == '@' || req.getParameter("email").charAt(i) == '.') {
							emailFormCheck++;
						}
					}
					if (emailFormCheck < 2) {
						out.println("<script>alert('올바르지 않은 이메일 형식입니다!'); location.href='/signup'</script>");
						out.flush();
						out.close();
					}
				}

				if (req.getParameter("nickname") == null || req.getParameter("nickname").trim().isEmpty()) {
					out.println("<script>alert('닉네임을 확인하세요!'); location.href='/signup'</script>");
					out.flush();
					out.close();
				}

				if ((req.getParameter("password") == null || req.getParameter("password").trim().isEmpty())
						|| (req.getParameter("confirmPw") == null || req.getParameter("confirmPw").trim().isEmpty())) {
					out.println("<script>alert('비밀번호를 확인하세요!'); location.href='/signup'</script>");
					out.flush();
					out.close();
				} else {
					String pwd = String.valueOf(req.getParameter("password"));
					if (pwd.length() < 6) {
						out.println("<script>alert('비밀번호는 6자 이상이어야 합니다.'); location.href='/signup'</script>");
						out.flush();
						out.close();
					} else {
						int sLetterCount = 0;
						for (int i = 0; i < pwd.length(); i++) {
							for (int j = 33; j <= 47; j++) {
								if (pwd.charAt(i) == j) {
									sLetterCount++;
								}
							}
							for (int j = 58; j <= 64; j++) {
								if (pwd.charAt(i) == j) {
									sLetterCount++;
								}
							}
							for (int j = 91; j <= 96; j++) {
								if (pwd.charAt(i) == j) {
									sLetterCount++;
								}
							}
							for (int j = 123; j <= 126; j++) {
								if (pwd.charAt(i) == j) {
									sLetterCount++;
								}
							}
						}
						if (sLetterCount == 0) {
							out.println("<script>alert('비밀번호에 특수문자를 한개이상 포함하세요.'); location.href='/signup'</script>");
							out.flush();
							out.close();
						} else {
							if (pwd.equals(req.getParameter("confirmPw"))) {
								service.insertMember(vo);
								out.println("<script>alert('회원가입을 성공하였습니다!'); location.href='/'</script>");
								out.flush();
								out.close();
							} else {
								out.println("<script>alert('비밀번호가 일치하지 않습니다.'); location.href='/signup'</script>");
								out.flush();
								out.close();
							}
						}
					}
				}
			}
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}

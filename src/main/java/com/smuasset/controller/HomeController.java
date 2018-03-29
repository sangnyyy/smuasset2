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
import org.springframework.web.bind.annotation.ResponseBody;

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

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate);

		return "index";
	}

	@RequestMapping(value = "/cwrite", method = RequestMethod.GET)
	public String communityWrite() {
		return "cwrite";
	}

	@RequestMapping(value = "/cwrite", method = RequestMethod.POST)
	public String communityWriteFinish() {
		return "index";
	}

	@RequestMapping(value = "/pwrite", method = RequestMethod.GET)
	public String pConsultWrite() {
		return "pwrite";
	}

	@RequestMapping(value = "/pwrite", method = RequestMethod.POST)
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

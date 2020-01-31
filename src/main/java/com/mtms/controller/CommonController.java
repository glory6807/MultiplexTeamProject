package com.mtms.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mtms.domain.Coolsms;
import com.mtms.domain.PhoneAuthVO;
import com.mtms.domain.simple.JSONObject;
import com.mtms.service.MemberService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class CommonController {
	
	@Setter(onMethod_=@Autowired)
	private MemberService memberSerivce;
	
	String api_key = "NCSOQVNBTVYZZZ7I";
	String api_secret = "4JVN8VRZEHNTP6GU79TLNQDWATDYTW7O";
	
	@GetMapping("/accessError")
	public void accessDenied(Authentication auth, Model model) {
		log.info("access Denied : " + auth);

		model.addAttribute("msg", "아이디와 비밀번호를 확인해주세요");
	}
	
	@PreAuthorize("!isAuthenticated()")
	@GetMapping("/customLogin")
	public void loginInput(String error, String logout, Model model) {
		String springVersion = org.springframework.core.SpringVersion.getVersion();

		System.out.println("스프링 프레임워크 버전 : " + springVersion);
		log.info(error);
	}

	@PreAuthorize("isAuthenticated()")
	@GetMapping("/logout")
	public void logoutGet() {
		log.info("custom logout");
	}

	@GetMapping("/customLoginError")
	public void loginError() {

	}
	
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@RequestMapping(value = "/sendSms", method = RequestMethod.POST)
	public String sendSms(HttpServletRequest request) throws Exception {

		Coolsms coolsms = new Coolsms(api_key, api_secret);

		HashMap<String, String> set = new HashMap<String, String>();
		set.put("to", (String) request.getParameter("to")); // 수신번호

		set.put("from", "01041895485"); // 발신번호
		set.put("text", (String) request.getParameter("text")); // 문자내용
		set.put("type", "sms"); // 문자 타입

		System.out.println(set);
		
		JSONObject result = coolsms.send(set); // 보내기&전송결과받기

		if ((boolean) result.get("status") == true) {
			// 메시지 보내기 성공 및 전송결과 출력
			System.out.println("성공");
		} else {
			// 메시지 보내기 실패
			System.out.println("실패");
		}
		return "redirect:/member/client";
	}
	
	@GetMapping("/phoneAuthPopup")
	public void phoneAuthPopup() {
		
	}
	
	@RequestMapping(value = "/sendSmsPhoneAuth", method = RequestMethod.POST)
	public String sendSmsPhoneAuth(HttpServletRequest request, PhoneAuthVO paVO, RedirectAttributes rttr) throws Exception {

		int resultService = memberSerivce.phoneAuthInsert(paVO);
		
		if(resultService != 1) {
			System.out.println("error");
			return null;
		}
		
		Coolsms coolsms = new Coolsms(api_key, api_secret);
		
		HashMap<String, String> set = new HashMap<String, String>();
		set.put("to", paVO.getAuthPhone()); // 수신번호

		set.put("from", "01041895485"); // 발신번호
		set.put("text", (String) request.getParameter("text")); // 문자내용
		set.put("type", "sms"); // 문자 타입

		System.out.println(set);
		
		JSONObject result = coolsms.send(set); // 보내기&전송결과받기
		
		rttr.addFlashAttribute("sendPhoneAuthMsgChk", "sendPhoneAuthMsgChk");
		
		if ((boolean) result.get("status") == true) {
			// 메시지 보내기 성공 및 전송결과 출력
			System.out.println("성공");
		} else {
			// 메시지 보내기 실패
			System.out.println("실패");
		}
		
		return "redirect:/phoneAuthPopup?phone="+paVO.getAuthPhone();
	}
	
	@GetMapping("/error404")
	public void error404() {
		
	}
	
	@GetMapping(value="/{authPhone}/{authNumber}", produces = {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<PhoneAuthVO> get(@PathVariable("authPhone") String authPhone, @PathVariable("authNumber") String authNumber){
		
		return new ResponseEntity<>(memberSerivce.phoneAuthSelect(authPhone, authNumber), HttpStatus.OK);
	}
	
	@DeleteMapping(value="/deleteAuth/{authPhone}", produces = {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<Integer> phoneAuthDelete(@PathVariable("authPhone") String authPhone){
		
		return new ResponseEntity<>(memberSerivce.phoneAuthDelete(authPhone), HttpStatus.OK);
	}
	
}











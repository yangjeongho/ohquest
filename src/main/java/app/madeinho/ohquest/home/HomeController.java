package app.madeinho.ohquest.home;

import java.io.IOException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import app.madeinho.ohquest.common.util.OhquestUtil;

@Controller
public class HomeController {
	
	private static Logger logger = LoggerFactory.getLogger(HomeController.class);
		
	/*@RequestMapping("/")
	public String index() {
		return "/index";
	}*/
	
	@RequestMapping("/main")
	public String main() throws IOException {
		
		System.out.println("양정화 : Main Call " );
		//OhquestUtil.getURLInfo();
		//return "";
		return "main";
	}
	
	@RequestMapping("/notice/listtest")
	public String notice() {
		return "co/notice/list";
	}
	
	@RequestMapping("/security/errMessage")
	public String errorMessage() {
		return "dialog.co.error.properties";
	}
	
	/* 아래는 샘플 코드임 */
	@RequestMapping("/sample1")
	public String sample() {
		return "sample.sample1";
	}
	
	@RequestMapping("/sample2")
	public String sample2() {
		return "sample/sample2";
	}
	
	@RequestMapping("/sample3")
	public String sample3() {
		return "sample.test.sample3";
	}
	
	@RequestMapping("/sample4")
	public String sample4() {
		return "sample/test/sample4";
	}
	
	@RequestMapping("/searchTest")
	public String searchTest() {
		return "sample/search_test";
	}
	
	
	@RequestMapping("/code_sample")
	public String codeSample() {
		return "sample/code-sample";
	}
	
	@RequestMapping("/sec_sample")
	public String securitySample() {
		return "sample/sec-sample";
	}
	
	@RequestMapping("/member_sample")
	public String memberSample() {
		return "sample/member-sample";
	}
}

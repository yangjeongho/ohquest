package app.madeinho.ohquest.ui.connect;

import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.PrintWriter;
import java.util.List;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

//import app.madeinho.ohquest.co.logicalDate.LogicalDateRepository;
import app.madeinho.ohquest.ui.member.MemberService;
import app.madeinho.ohquest.ui.member.Member;
//import app.madeinho.ohquest.co.sms.domain.SmsSend;
//import app.madeinho.ohquest.co.sms.service.SmsService;
import app.madeinho.ohquest.common.type.MessageParam;
import app.madeinho.ohquest.common.type.ResultCode;
import app.madeinho.ohquest.common.util.OhquestUtil;
//import app.madeinho.ohquest.cs.password.domain.PasswordPolicy;
//import app.madeinho.ohquest.cs.password.service.PasswordService;
//import app.madeinho.ohquest.or.user.UserService;
//import app.madeinho.ohquest.or.user.domain.User;


@Controller
public class ConnectController {

	private static final Logger logger = LoggerFactory.getLogger(ConnectController.class);
	//@Autowired SecurityService memberService ;
	@Autowired MemberService memberService ;
	//@Autowired UserService userService ;
	//@Autowired PasswordService passwordService;
	//@Autowired SmsService smsService;
	//@Autowired  LogicalDateRepository logicalDateRepository;
	
	
	
	/**
	 * 로그인 처리
	 * @param session
	 * @param model
	 * @param member
	 * @param returnURL (로그인 후 이동할 페이지를 설정한다.)
	 * @return
	 */
	@RequestMapping(value = "/security/login", method = RequestMethod.POST)
	public String login(HttpSession session, HttpServletRequest request, Model model, 
						@RequestParam String loginId,
						@RequestParam String password,
						@RequestParam(required=false, defaultValue="/main") String returnURL) {
		String retUrl = "" ;
		Member member = new Member();
		//member.setLoginId(loginId);
		member.setPassword(password);
			
		if (logger.isDebugEnabled()) {
			logger.debug("[login] BEGIN, " + member.toString());
		}
		try {
			//Member afterMember = memberService.login(request, session, member, null) ;
			
			/*if(afterMember != null && afterMember.getLoginId()!= null){
				logger.debug("[login] Login success!" );
				retUrl = "redirect:" + returnURL ;
			}
			else{
				logger.debug("[login] Login failed!" );
				retUrl = "redirect:/?failed=true" ;
			}*/
		}catch (Exception e) {
			retUrl = "redirect:/?failed=true" ;			
			logger.error("[login] Login failed!" );
		} finally{
			if (logger.isDebugEnabled()) {
				logger.debug("[login] END");
			}	
		}
		return retUrl;
	}
	
	/**
	 * 로그인 처리
	 * @param session
	 * @param model
	 * @param member
	 * @param returnURL (로그인 후 이동할 페이지를 설정한다.)
	 * @return
	 */
	@RequestMapping(value = "/security/login2", method = RequestMethod.POST)
	@ResponseBody public MessageParam login2(HttpSession session, HttpServletRequest request, Model model, Member member, 
						@RequestParam(required=false, defaultValue="/main") String returnURL) {
		
		if (logger.isDebugEnabled()) {
			logger.debug("[login] BEGIN, " + member.toString());
		}
		
		try {
			//return memberService.processLogin(session, request, member);
			return new MessageParam(ResultCode.EXCEPTION,"Login Failed with System Error ");
			
			
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("[login] Login failed!" ,e);
			return new MessageParam(ResultCode.EXCEPTION,"Login Failed with System Error ");
		} finally{
			if (logger.isDebugEnabled()) {
				logger.debug("[login] END");
			}	
		}
	}

	
		
	/**
	 * 로그아웃 처리
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/security/logout", method = RequestMethod.GET)
	public String logout(HttpSession session, Model model, @RequestParam String returnUrl) {
		//Member member = memberService.getCurrentMember();
		//model.addAttribute("marketCode", member.getBranch().getMarketCode());
		//memberService.logout(session) ;
		/*if(member != null){
			logger.debug("[LOGOUT] SUCCESS, " + member.toString());
		}*/
		return "redirect:/" + returnUrl ;
	}
	
	/**
	 * 세션 타임 아웃 처리 
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/security/timeout", method = RequestMethod.GET)
	public String sessiontTimeOut(HttpSession session, Model model) {
		//Member member = memberService.getCurrentMember();
		//model.addAttribute("marketCode", member.getBranch().getMarketCode());
		return "/timeout" ;
	}
	
	@RequestMapping(value = "/security/dialogIndex", method = RequestMethod.GET)
	public String sessiontLogOut(HttpSession session, Model model) {
		return "/dialogIndex" ;
	}
	
	
	@RequestMapping(value="/security/textAuth")
	public String textAuth(Model model,@RequestParam(required=false, defaultValue="") String userId) {
		model.addAttribute("userId", userId);
		return "/co/textAuth/textAuth";
	}
	
	
	@RequestMapping(value="/security/getTextAuth")
	@ResponseBody
	public String getTextAuth(HttpServletRequest req, HttpServletResponse res) {
		//BufferedImage bImage = memberService.getCapCharImage(req.getSession());
	    /*if (bImage == null) {
	        res.setContentType("text/html; charset=utf-8");
	        
	        String message = "Error! Please try later.";
	        try {
	            PrintWriter out = res.getWriter();
	            out.println(message);
	            out.flush();
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }else{
	    	
	    	ServletOutputStream sos = null;
	        try {
	            res.setContentType("image/png; charset=utf-8");
	            ByteArrayOutputStream baos = new ByteArrayOutputStream();
	             
	            //ImageIO.write(bImage, "png", baos);

	            byte buffer[] = baos.toByteArray();
	            
	            sos = res.getOutputStream();
	            sos.write(buffer);
	            sos.flush();
	            sos.close();
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }*/
		
	    return "/co/textAuth/textAuth";
	}
	
	
/*	@RequestMapping(value="/security/getTextAuthLogin")
	@ResponseBody
	public MessageParam getTextAuthLogin(HttpServletRequest req, HttpServletResponse res,@RequestParam String inCapCharText,@RequestParam String userId,@RequestParam String notiCd) {
	//List<PasswordPolicy> alist = passwordService.getPasswordPolicies();
		//PasswordPolicy policy = (PasswordPolicy)alist.get(0);
		int capcharPeriodUnit = Integer.parseInt(policy.getCapchaTryLimitPeriodUnit());//분이 나와야됨
		int capcharPeriod = Integer.parseInt(policy.getCapchaTryLimitPeriod());
		
		//int maxAge = 60*60*24*15;//15day
		int maxAge = 0;
		
		if(capcharPeriodUnit ==1){
			maxAge = 60*60*24*365*capcharPeriod;//년
		}else if(capcharPeriodUnit ==2){
			maxAge = 60*60*24*30*capcharPeriod;//월
		}else if(capcharPeriodUnit ==3){	
			maxAge = 60*60*24*7*capcharPeriod;//주
		}else if(capcharPeriodUnit ==5){	
			maxAge = 60*60*24*capcharPeriod;//일
		}else if(capcharPeriodUnit ==11){	
			maxAge = 60*60*capcharPeriod;//시간		
		}else if(capcharPeriodUnit ==12){
			maxAge = capcharPeriod;//초
		}
		
		Cookie[] cookies = req.getCookies();
		String block = null;
    	for(int i=0;i<cookies.length;i++){
    		if("cblock".equals(cookies[i].getName())){
    			block = cookies[i].getValue();
    			break;
    		}
    	}
    	logger.debug("[block]:"+block);
		if(block !=null){
			return new MessageParam(ResultCode.EXCEPTION,"Authentication Failed 5 times.  Try again after 30 minute ");
		}
    	
		
		//1.capChar 세션추출
		HttpSession sess = req.getSession();
        String capCharSess=(String)sess.getAttribute("TEXTAUTHIAMGE");
        
        
        logger.debug("[getTextAuthLogin] capCharSess :  " + capCharSess);
        logger.debug("[getTextAuthLogin] inCapCharText :  " + inCapCharText);
        
        if(capCharSess == null || "".equals(capCharSess)){
        	return new MessageParam(ResultCode.EXCEPTION,"Authentication Failed with System Error ");
        }
        
        int cnt = 0;
        if(!capCharSess.equals(inCapCharText)){
        	Cookie[] cookies1 = req.getCookies();
        	String value = null;
        	for(int i=0;i<cookies1.length;i++){
        		if("cfc".equals(cookies1[i].getName())){
        			value = cookies1[i].getValue();
        			break;
        		}
        	}
        	
        	logger.debug("[value]:"+value);
        	
        	if(value ==null){
        		Cookie cookie = new Cookie("cfc","1");
        		cookie.setMaxAge(maxAge);
        		res.addCookie(cookie);
        	}else{
        		cnt = Integer.parseInt(value);
        		cnt++;
        		Cookie cookie = new Cookie("cfc",""+cnt);
        		cookie.setMaxAge(maxAge);
        		res.addCookie(cookie);
        	}
        	
        	if(cnt == 5){
        		Cookie cookie = new Cookie("cblock","true");
        		cookie.setMaxAge(maxAge);
        		res.addCookie(cookie);
        	}
        	
        	return new MessageParam(ResultCode.EXCEPTION,"AuthenticationAuthentication Failed with value mismatch ");
        }
        
        sess.removeAttribute("TEXTAUTHIAMGE");
        
        //Member loginmember = memberService.getCurrentMember();
        
        
        
        logger.debug("[getTextAuthLogin] getUserId :  " + userId);
        User user = new User();
		user.setStatus("Active");
		user.setUserId(userId);
		
		List<User> resurltUser = userService.getUserInfoByUser(user);
		
		if(resurltUser !=null && resurltUser.size()>0){
			
			String pwd ="aba!234";
			
			List<PasswordPolicy> al = passwordService.getPasswordPolicies();
			if(al !=null && al.size()>0){
				pwd = passwordService.getPasswordByPolicy(   (PasswordPolicy)al.get(0)  ) ;
			}
			
			int statusResult = memberService.updateUserStatus(user);
			int passwordResutl = userService.updatePassword(userId,pwd);
			
			logger.debug("statusResult:"+statusResult);
			logger.debug("passwordResutl:"+passwordResutl);
			logger.debug("notiCd:"+notiCd);
			
			if(statusResult >0 && passwordResutl >0 ){
				if("sms".equals(notiCd)){
					User smsuser = (User)resurltUser.get(0);
					String mobileNo = smsuser.getMobileTelno();
					
					logger.debug("[mobileNomobileNomobileNo]:"+mobileNo);
					if(mobileNo ==null){
						return new MessageParam(ResultCode.EXCEPTION,"Your mobile phone number is invalid!");
					}
					
					String sSmsPhr  = "[Password]"+ pwd;
					SmsSend smsSend = new SmsSend();
					smsSend.setSendRsnCd("PWI");//aba_sb_cust_mgmt_prss 정의된 코드 
					smsSend.setSmsSendPhr(sSmsPhr);
					//smsSend.setEntrNo(resurltUser.getEntrNo());
					smsSend.setCtn(mobileNo);
					smsSend.setOnlnYn("Y");
					smsSend.setApplicationId("");
					smsSend.setOperatorId(userId);
					smsService.createSmsSend(smsSend);
				}else{
					//이메일
				}
				
				Member member = new Member();
				member.setUserId(userId);
				member.setIpAddress(AcubeUtil.getRemoteAddr(req));
				member.setLoginResult(ResultCode.PWDINIT.name());
				member.setPassword(pwd);
				member.setOldPassword(pwd);
				member.setDescription("CAUSER");
				memberService.insertLog(member);
				memberService.insertPwdUpdateLog(member);
				
				return new MessageParam(ResultCode.SUCCESS);
			}else{
				return new MessageParam(ResultCode.EXCEPTION,"Authentication Failed with System Error");
			}
		}else{
			return new MessageParam(ResultCode.EXCEPTION,"Authentication Failed with System Error");
		}		
		return new MessageParam(ResultCode.EXCEPTION,"Authentication Failed with System Error");
	}*/
	
	/*@RequestMapping(value="/security/changeUserForm", method = RequestMethod.GET)
	public String changeUserForm(Model model){
		
		Member member = memberService.getCurrentMember();
		User user = new User();
		user.setLoginId(member.getLoginId());
		user.setMarketCode(member.getMarketCode().equals("1") ? "2" : "1");
		User user2 = userService.getUserInfoByLoginId(user) ;
		if(user2 != null ){
			model.addAttribute("user", user2);
		}
		return "dialog.co.login.scSec001";
	}*/
	
	//@RequestMapping(value="/security/sso", method = RequestMethod.POST)
	/*public MessageParam changeUser(HttpSession session, HttpServletRequest request, Model model, Member member){
		if (logger.isDebugEnabled()) {
			logger.debug("[login] BEGIN, " + member.toString());
		}
		try {
			return memberService.processSSOLogin(session, request, member); 
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("[login] Login failed!" ,e);
			return new MessageParam(ResultCode.EXCEPTION,"Login Failed with System Error ");
		} finally{
			if (logger.isDebugEnabled()) {
				logger.debug("[login] END");
			}	
		}
	}*/
}
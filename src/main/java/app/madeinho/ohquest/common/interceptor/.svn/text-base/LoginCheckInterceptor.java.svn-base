package app.madeinho.ohquest.common.interceptor;

import java.net.URLEncoder;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.servlet.resource.DefaultServletHttpRequestHandler;

/*import com.acube.unitel.co.member.domain.Member;
import com.acube.unitel.co.security.SecurityService;*/


/**
 * 모든 컨트롤러가 호출될때 세션체크를 수행한다.
 * 
 * @author YangByeongSub
 * @version 1.0
 */
public class LoginCheckInterceptor extends HandlerInterceptorAdapter {

	private static final Logger logger = LoggerFactory.getLogger(LoginCheckInterceptor.class);
//	@Autowired SecurityService securityService;
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		boolean result   =  true;
		
		if (!(handler instanceof DefaultServletHttpRequestHandler)) {
			
			String rootPath   =  request.getContextPath();
			String skipContexts[] = {rootPath+"/security", rootPath+"/openapi"};
			String requestURL = request.getRequestURI() ;
			
			/*Enumeration<String> headers = request.getHeaderNames();    
		    while(headers.hasMoreElements())    
		    {    
		        String headerName    = (String)headers.nextElement();    
		        String value        = request.getHeader(headerName);    
		        System.out.println("headerName:"+headerName+","+value);   
		    } */   

			//로그인 관련 페이지(/security로 시작하는)는 skip한다.
			boolean skip = false ;
			for(String skipContext : skipContexts){
				if(requestURL.indexOf(skipContext) >= 0) {
					skip = true;
					break ; 
				}
			}
			if(skip) {
				return true ;
			}
						
			try{
				
				HttpSession session  =  request.getSession(false);
				String dialogName = (String)request.getParameter("dialogName");
				// 세션이 없는 경우에는 로긴 페이지로 이동한다.
				if(session == null){
					if(StringUtils.isEmpty(dialogName)){
						response.sendRedirect(rootPath + getRequestPramURI(request));
					}else{
						response.sendRedirect(rootPath + "/security/dialogIndex"+getRequestPramURI(request)+"&dialogName="+dialogName);
					}
					result = false ;
					return false ;
				}
				// 세션은 있으나 로그아웃되었거나, 세션아웃 되었을시..
				else{
					session.setAttribute("returnURL", rootPath + getRequestPramURI(request)) ;
					//Member member = (Member)session.getAttribute("ss_member");
					//세션이 있으나 member 객체가 세션에 있는 경우만 컨트롤로러 진입할 수 있다.
				/*	if(member != null && member.getUserId() != null){
						// session exist
					}else{
						// session non exist
						if(StringUtils.isEmpty(dialogName)){
							response.sendRedirect(rootPath + "/security/timeout" + getRequestPramURI(request));
						}else{
							response.sendRedirect(rootPath + "/security/dialogIndex"+getRequestPramURI(request)+"&dialogName="+dialogName);
						}
						
						result = false ;
						return false ;
					}*/
			   }
			}catch(Exception e){
				e.printStackTrace();
				logger.debug(e.getMessage());
			}			  
		}
		return result ;
	}
	
	private String getRequestPramURI(HttpServletRequest request){
		Enumeration<String> enumeration = request.getParameterNames();
		String rootPath = request.getContextPath() ;
		String requestURL = request.getRequestURI() ;
		requestURL = requestURL.replace(rootPath, "");
		
		String url = "?" ;
		if(enumeration != null){
			while(enumeration.hasMoreElements()){
				String paramName = enumeration.nextElement();
				String paramValue = (String)request.getParameter(paramName);
				url += paramName +"="+paramValue ;
				if(enumeration.hasMoreElements()){
					url += "&" ;
				}
			}
			if(url.length()>1){
				url = URLEncoder.encode(url);				
				url = "?returnURL="+ requestURL + url ;
			}else{
				url = "?returnURL="+ requestURL ;
			}
		}
		return url;
	}
	
	/**
	 * model에 세션의 member 정보를 설정한다.
	* {@inheritDoc}
	 */
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
		
		if (!(handler instanceof DefaultServletHttpRequestHandler)) {
									
			try{
				if(modelAndView != null) {
					;//modelAndView.addObject("ss_member", securityService.getCurrentMember());
				}
			}catch(Exception e){
				e.printStackTrace();
				logger.debug(e.getMessage());
			}			  
		}
	}
}

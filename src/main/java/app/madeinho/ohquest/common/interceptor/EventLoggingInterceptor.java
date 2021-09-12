package app.madeinho.ohquest.common.interceptor;

import java.lang.reflect.Method;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.servlet.resource.DefaultServletHttpRequestHandler;

/*import com.acube.unitel.co.eventlog.EventLog;
import com.acube.unitel.co.eventlog.EventLogService;
import com.acube.unitel.co.mask.Mask;
import com.acube.unitel.co.member.domain.Member;
import com.acube.unitel.co.security.SecurityService;*/


/**
 * 모든 이벤트에 대해서 DB에 로그를 쌓는다.
 * 
 * @author YangByeongSub
 * @version 1.0
 */
public class EventLoggingInterceptor extends HandlerInterceptorAdapter {

	private static final Logger logger = LoggerFactory.getLogger(EventLoggingInterceptor.class);
	
	/*@Autowired SecurityService securityService ;
	@Autowired EventLogService eventLogService ;*/
	
	/**
	* {@inheritDoc}
	*/
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		//logout만 처리
		if (!(handler instanceof DefaultServletHttpRequestHandler)) {
			
			HandlerMethod handlerMethod = (HandlerMethod)handler;
			//Class controller = handlerMethod.getBean().getClass() ;
			Method method= handlerMethod.getMethod();
			
			String rootPath   =  request.getContextPath();
			//String securityURL = rootPath+"/security" ;
			String requestURL = request.getRequestURI() ;
			String controllerName = handlerMethod.getBean().getClass().getName();
			String methodName = method.getName() ;
			String controlId = controllerName+"."+methodName ;		
			try{
				
				
				HttpSession session  =  request.getSession(false);
				HashMap<String, String> hashMap = null;
				if(session != null){
				/*	hashMap = (HashMap<String, String>)session.getAttribute("ss_masterEvent");
					if(hashMap == null){
						List<EventLog> eventLogs = eventLogService.getMasterEventLog();
						hashMap = new HashMap<String, String>();
						for(EventLog eventLog : eventLogs){
							hashMap.put(eventLog.getControlId(), eventLog.getControlName());
						}
						if(session != null)session.setAttribute("ss_masterEvent", hashMap) ;
					}*/
				}
				
				if(!controlId.equals("com.acube.unitel.co.security.SecurityController.logout")){
					return true;
				}
				
				String custNo = request.getParameter("custNo");
				String entrNo = checkEntrNo(request.getParameter("entrNo"));
				
			/*	Member member = securityService.getCurrentMember();
				//코드 관련 조회는 스킵처리한다.
				if(hashMap != null){
					String controlName = (String)hashMap.get(controlId);
					if(controlName != null){
						EventLog eventLog = new EventLog();
						eventLog.setCustNo(custNo);
						eventLog.setEntrNo(entrNo);
						eventLog.setControlId(controlId);
						eventLog.setUserId(member.getUserId());
						eventLog.setIpAddress(request.getRemoteAddr());
						eventLog.setWorkDate(new Date());
						if(logger.isDebugEnabled()) {
							logger.debug("EventLog = " + eventLog.toString());
						}
						eventLogService.addEventLog(eventLog);
					}
				}*/
			}catch(Exception e){
				e.printStackTrace();
				logger.debug(e.getMessage());
			}			  
		}
		return true ;
	}
	/**
	* {@inheritDoc}
	*/
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
		if (!(handler instanceof DefaultServletHttpRequestHandler)) {
			
			HandlerMethod handlerMethod = (HandlerMethod)handler;
			//Class controller = handlerMethod.getBean().getClass() ;
			Method method= handlerMethod.getMethod();
			
			String rootPath   =  request.getContextPath();
			//String securityURL = rootPath+"/security" ;
			String requestURL = request.getRequestURI() ;
			String controllerName = handlerMethod.getBean().getClass().getName();
			String methodName = method.getName() ;
			String controlId = controllerName+"."+methodName ;
			try{
				if(controlId.equals("com.acube.unitel.co.security.SecurityController.logout")){
					return ;
				}
				
				String custNo = request.getParameter("custNo");
				String entrNo = checkEntrNo(request.getParameter("entrNo"));
				HttpSession session  =  request.getSession(false);
				HashMap<String, String> hashMap = null;
				/*if(session != null){
					hashMap = (HashMap<String, String>)session.getAttribute("ss_masterEvent");
					
					if(hashMap == null){
						List<EventLog> eventLogs = eventLogService.getMasterEventLog();
						hashMap = new HashMap<String, String>();
						for(EventLog eventLog : eventLogs){
							hashMap.put(eventLog.getControlId(), eventLog.getControlName());
						}
						session.setAttribute("ss_masterEvent", hashMap) ;
					}
				}
				
				Member member = securityService.getCurrentMember();
				//코드 관련 조회는 스킵처리한다.
				
				if(hashMap != null){
					String controlName = (String)hashMap.get(controlId);
					if(controlName != null){
						EventLog eventLog = new EventLog();
						eventLog.setCustNo(custNo);
						eventLog.setEntrNo(entrNo);
						eventLog.setControlId(controlId);
						eventLog.setUserId(member.getUserId());
						eventLog.setIpAddress(request.getRemoteAddr());
						eventLog.setWorkDate(new Date());
						if(logger.isDebugEnabled()) {
							logger.debug("EventLog = " + eventLog.toString());
						}
						eventLogService.addEventLog(eventLog);
					}
				}*/
								
			}catch(Exception e){
				e.printStackTrace();
				logger.debug(e.getMessage());
			}			  
		}
	}
	private String checkEntrNo(String entrNo){
		String retEntrNo = "";
		if(entrNo == null || "".equals(entrNo)){
			return entrNo;
		}
		if(entrNo.length()>15){
			String entrNos[] = entrNo.split(",");
			if(entrNos.length>0){
				retEntrNo = entrNos[0];
			}
		}
		return retEntrNo;
	}
}

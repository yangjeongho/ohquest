package app.madeinho.ohquest.common.interceptor;

import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.ModelMap;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.servlet.resource.DefaultServletHttpRequestHandler;

/*import com.acube.unitel.co.mask.Mask;
import com.acube.unitel.co.mask.MaskService;
import com.acube.unitel.co.member.domain.Member;
import com.acube.unitel.co.security.SecurityService;
import com.acube.unitel.cs.cust.domain.Contact;
import com.acube.unitel.cs.cust.domain.CsAddress;
import com.acube.unitel.cs.cust.domain.Customer;
import com.acube.unitel.cs.cust.domain.EntrancePassword;
import com.acube.unitel.cs.entr.domain.EntrContractBill;
import com.acube.unitel.cs.entr.domain.EntrCustomer;
import com.acube.unitel.cs.entr.domain.subDomain.SearchCustEntrVO;*/


/**
 * 권한에 따라 Mask 처리할 도메인 체크함.
 * 
 * @version 1.0
 */
public class MaskCheckInterceptor extends HandlerInterceptorAdapter {

	private static final Logger logger = LoggerFactory.getLogger(MaskCheckInterceptor.class);
	
/*	@Autowired SecurityService securityService ;
	@Autowired MaskService maskService ;*/
	
/*		
	*//**
	* {@inheritDoc}
	*//*
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
		//로그아웃을 제외한 나머지
		if (!(handler instanceof DefaultServletHttpRequestHandler)) {
			
			HandlerMethod handlerMethod = (HandlerMethod)handler;
			Method method= handlerMethod.getMethod();
			String controllerName = handlerMethod.getBean().getClass().getName();
			String methodName = method.getName() ;
			String controlId = controllerName+"."+methodName ;
			
			
			try{
				//컨트롤 단으로 구분해서 할 경우 아래 같이 추가...
				if(controlId.equals("com.acube.unitel.co.security.SecurityController.logout") ){
					return ;
				}
				
				HttpSession session  =  request.getSession(false);
				List<Mask> masks = null;
				if(session != null){
					masks = (List<Mask>)session.getAttribute("ss_masks");
					if(masks == null){
						masks = new ArrayList<Mask>();
						Member member = securityService.getCurrentMember();
						if(member!=null){
							masks = maskService.getMaskDomainList(member.getUserId());
							session.setAttribute("ss_masks", masks) ;
						}
					}
				}
				if(modelAndView !=null && modelAndView.getModelMap()!=null && modelAndView.getModelMap().keySet() != null){

                    ModelMap model = (ModelMap)modelAndView.getModelMap().clone();
					Iterator<String> iterator = model.keySet().iterator();
					while(iterator.hasNext()) {
						Object element = iterator.next();
						 if(modelAndView.getModelMap().get(element) instanceof Customer){
							 Customer customer = (Customer)modelAndView.getModelMap().get(element) ;
							 if(customer != null && !("-1".equals(customer.getCustNo()) || StringUtils.isEmpty(customer.getCustNo()) ) && StringUtils.isNotEmpty(customer.getCustRnmNo())){
								 //고객 정보
								 mask(customer, masks, modelAndView,  "maskMap" , "N" );
								 
								 //고객 주소 정보
								 List<CsAddress> csAddresses = customer.getAddresses() ;
								 for(CsAddress csAddress : csAddresses){
									 if(csAddress != null && StringUtils.isNotEmpty(csAddress.getVilageAboveAddr())){										 
										 mask(csAddress, masks, modelAndView,  "maskMapAddress" , "Y" );
									 }
								 }
								 //고객 contact정보
								 List<Contact> contacts = customer.getContacts() ;
								 for(Contact contact : contacts){
									 if(contact != null && StringUtils.isNotEmpty(contact.getCntctInfo1())){
										 mask(contact, masks, modelAndView,  "maskMapContact" , "Y" );
									 }
								 }
								 //고객 패스워드 정보
								 EntrancePassword entrancePassword = customer.getEntrancePassword() ;
								 if(entrancePassword != null && StringUtils.isNotEmpty(entrancePassword.getPassword())){
									 mask(entrancePassword, masks, modelAndView,  "maskMapPassword" , "N" );
								 }
									 
								 
							 }
						 }
						 
						 
						 if(modelAndView.getModelMap().get(element) instanceof EntrContractBill){
							 //가입조회 청구계정 정보
							 EntrContractBill entrContractBill = (EntrContractBill)modelAndView.getModelMap().get(element) ;
							 if(entrContractBill != null && StringUtils.isNotEmpty(entrContractBill.getPymCustSsn())){
								 mask(entrContractBill, masks, modelAndView,  "maskMapBill" , "N" );
							 }
							 
						 }
						 
						 if( modelAndView.getModelMap().get(element) instanceof List<?>){
							 List<Object> searchCustEntrVOs = (List<Object>)modelAndView.getModelMap().get(element) ;
							 
							 boolean isSearchCustEntrVOType = false ;
							 for(Object object : searchCustEntrVOs){
								 if(object instanceof SearchCustEntrVO){
									 isSearchCustEntrVOType = true ;
									 break;
								 }
							 }
							 
							 if ( isSearchCustEntrVOType && searchCustEntrVOs != null ){
								
								 for ( Object object : searchCustEntrVOs ){
									 SearchCustEntrVO searchCustEntrVO = null ;
									 if(object instanceof SearchCustEntrVO){
										 searchCustEntrVO = (SearchCustEntrVO)object ;
									 }else{
										 break ;
									 }
									 //가입조회 가입리스트 조회
									 if(searchCustEntrVO != null &&!("-1".equals(searchCustEntrVO.getCustNo()) || StringUtils.isEmpty(searchCustEntrVO.getCustNo()) )){
										 mask(searchCustEntrVO, masks, modelAndView,  "maskMapSearchCust" , "N" );
									 }
									 
								 }
							 
							 }
						 }
						 
						 if(modelAndView.getModelMap().get(element) instanceof EntrCustomer){
							 //가입조회 고객정보 
							 EntrCustomer entrCustomer = (EntrCustomer)modelAndView.getModelMap().get(element) ;
							 if(entrCustomer != null &&!("-1".equals(entrCustomer.getCustNo()) || StringUtils.isEmpty(entrCustomer.getCustNo()) )){
								 mask(entrCustomer, masks, modelAndView,  "maskMapCust" , "N" );
							 }
							 
						 }
					}
				}
				
			}catch(Exception e){
				e.printStackTrace();
				logger.debug(e.getMessage());
			}			  
		}
	}*/
	
	/*private ModelMap mask(Object domain, List<Mask> masks, ModelAndView modelAndView,  String mapName, String attrYn ) throws SecurityException, NoSuchMethodException, IllegalArgumentException, IllegalAccessException, InvocationTargetException{
		 Class c = domain.getClass();
		 logger.debug(domain +"조작.. = ");
		 logger.debug("getName.. = "+c.getName());
		 
		 Field fileds[] = c.getDeclaredFields();
		
		 
		 //권한체크 해서 해당 도메인 mask처리
		 //member.getUserId();
		 //String fieldName[] = {"custRnmNo","aaa","bbb","authNo"};
		// int i =0;
		 LinkedHashMap<String, String> maskMap = new LinkedHashMap<String, String>();
		
		 for(Mask mask : masks){
			 
			 String getMthdName = "get"+ mask.getAuthName().substring(0,1).toUpperCase() + mask.getAuthName().substring(1) ;
			 String setMthdName = "set"+ mask.getAuthName().substring(0,1).toUpperCase() + mask.getAuthName().substring(1) ;
			
			 for (Field field : fileds){
				
				 //현재 도메인에 맞을때만 세팅
				 if(mask.getAuthName().equals(field.getName())){
					 Method getMethod = c.getMethod(getMthdName);
					 Method setMethod = c.getMethod(setMthdName,  field.getType());
					 logger.debug(mask.getAuthName()+"="+ getMethod.invoke(domain));
					 
					 String masked ="masked";
					 if ( "Y".equals(attrYn)){
						 masked = mask.getAuthName()+"Masked";
					 }
					 
					 String value = (String)getMethod.invoke(domain);
					 if (!StringUtils.isEmpty(value)){
						 Pattern p = Pattern.compile(".");
						 Matcher m = p.matcher(value);
						 value = m.replaceAll("*");
						 maskMap.put(mask.getAuthName(), masked);
						 Object data = value ;
						 setMethod.invoke(domain, new Object[] {data});
					// i++;
					 }
				 }
			 }
		     
		 }
		 return modelAndView.getModelMap().addAttribute(mapName, maskMap);
	}*/
}

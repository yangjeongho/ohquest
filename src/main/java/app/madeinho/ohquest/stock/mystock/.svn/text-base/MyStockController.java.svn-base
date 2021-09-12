package app.madeinho.ohquest.stock.mystock;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import app.madeinho.ohquest.common.domain.searchFilter.SearchFilter;
import app.madeinho.ohquest.common.exception.OhquestCommonException;
import app.madeinho.ohquest.common.type.MessageParam;
import app.madeinho.ohquest.common.util.OhquestUtil;
import app.madeinho.ohquest.stock.analyze.AnalyzePolicySiteService;
import app.madeinho.ohquest.stock.analyze.AnalyzeSiteService;
import app.madeinho.ohquest.stock.day.StockDay;
import app.madeinho.ohquest.stock.mystockhist.MyStockHist;
import app.madeinho.ohquest.stock.mystockhist.MyStockHistService;
import app.madeinho.ohquest.stock.policy.ScPolicy;
import app.madeinho.ohquest.stock.policy.ScPolicyService;
import app.madeinho.ohquest.ui.accountcode.AccountCode;
import app.madeinho.ohquest.ui.accountcode.AccountCodeService;
import app.madeinho.ohquest.ui.message.Message;
import app.madeinho.ohquest.ui.message.MessageService;

@Controller
public class MyStockController {
	
	private static Logger logger = LoggerFactory.getLogger(MyStockController.class);

	@Autowired
	MyStockService myStockService;
	@Autowired
	MyStockHistService myStockHistService;
	@Autowired
	AnalyzeSiteService analyzeSiteService;
	@Autowired
	AccountCodeService accountCodeService;	
	@Autowired
	MessageService messageService;	
	@Autowired
	AnalyzePolicySiteService analyzePolicySiteService;
	@Autowired	
	ScPolicyService scPolicyService;	
		
	
	@RequestMapping(value = "/stock/myStockSale", method = RequestMethod.GET)
	public String MyStockOpen(Model model, StockDay stockDay, @RequestParam(value="page",required=false, defaultValue="0" ) int curPage,
		@RequestParam(value="callBack",required=false, defaultValue="callBack" ) String callBack ) {
		return "stock.myStockSale";
	}	

	@RequestMapping(value = "/stock/mystock/sel", method = RequestMethod.GET)
	public String list(Model model, MyStock myStcok, 
			@RequestParam(value="page",required=false, defaultValue="0" ) int curPage,
			@RequestParam(value="statCd",required=false, defaultValue="0" ) String statCd,
			@RequestParam(value="scCode",required=false, defaultValue="" ) String scCode,
			@RequestParam(value="inDate",required=false, defaultValue="" ) String inDate) {
		
		//Pagination pagination = new Pagination(searchFilter.getPage(stockDay));
		//pagination.setObjectsCount(csNoticeService.getCsNoticeListCount(searchFilter));
		///model.addAttribute("pagination", pagination)
		
		
		//관심종목 등록되어 있는지 조회 후 insert처리.
		SearchFilter searchFilter = new SearchFilter();
		
		if (!OhquestUtil.isNull(scCode)){
			MyStock myStockSel = new MyStock();
			myStockSel.setScCode(scCode);
			myStockSel.setStatChgDate(inDate);
			
			List<MyStock> myStocks = myStockService.getMyStockLikeList(myStockSel);
			
			model.addAttribute("list", myStocks);
		}else{
			
			// AND   DATE_FORMAT(STAT_CHG_DATE, '%Y%m%d') =  #{statChgDate          ,jdbcType=VARCHAR}	
			
			
			String searchValue[] = {statCd, inDate};
			String searchKey[] = {"SC_STAT_CD", "DATE_FORMAT(STAT_CHG_DATE, '%Y%m%d')"}; 
			searchFilter.setSearchKey(searchKey);
			searchFilter.setSearchValue(searchValue);
			
			List<MyStock> myStocks = myStockService.getMyStockList(searchFilter);
			System.out.println("양정화 : myStocks Size > "+myStocks.size());

			model.addAttribute("list", myStocks);
		}
				
		//for(StockDay stockDayNaver : stockdayRetNaver) stockdayRet.add(stockDayNaver);  //DB ST_RATE_DAY + naver 정보
		
	//	System.out.println("양정화 : STEP end > "+stockdayRet.size());
		
		
				
		return "stock.myStockSale";
	}
	
	@RequestMapping(value = "/stock/mystock/save", method = RequestMethod.GET)
	public String notice_detail(Model model, SearchFilter searchFilter,
			@RequestParam(value="statCd",required=false, defaultValue="0" ) String statCd,
			@RequestParam(value="realYN",required=false, defaultValue="0" ) String realYN) {
		String returnUrl="dialog.stock.myStockSave";
		
		if(logger.isDebugEnabled()){
			logger.debug("[xxxxxxxxxxxxxxxxx} BEGIN"+statCd);
			logger.debug("[xxxxxxxxxxxxxxxxx} BEGIN"+realYN);
		}
		
		
		//주식상태에 따른 판매방식을 적용함.
		String sSaleType = "";//BUYTYPE;
    	//해당판매정책 조회처리
		ScPolicy scPolicySel = new ScPolicy();
		int iRate = 0;//작업유형별 요율
	    if (statCd.equals("WR") || statCd.equals("BV") ){
		   sSaleType = "BUYTYPE"; 
		   scPolicySel.setCodeId("DFT");
	     //BV	매수요청	
	    } else if (statCd.equals("BR") || statCd.equals("SV"))  {
		   sSaleType = "SALETYPE";
		   scPolicySel.setCodeId("DFTS");
	    } 
	    
	    //디폴트 정책의 요출을 조회
		List<ScPolicy> scPolicys = scPolicyService.getScPolicyAlltList(scPolicySel);
		
		if (scPolicys.size()>0){
			ScPolicy scPolicyInfo = scPolicys.get(0);
			iRate = Integer.parseInt(scPolicyInfo.getPocyUpValue());
		}
	  
		//잔고를 조회 후 값을 등록처리.
		AccountCode accountCode = new AccountCode();
		
		accountCode.setIdohMember("1");//디폴트 사용자 값 확인
		
		List<AccountCode> accountCodes = accountCodeService.getMyAccountCodeAlltList(accountCode);
		
		System.out.println("양정화 : STEP 1 > "+accountCodes.size());
		String sbAmt =  "";
		for(AccountCode accountCode1 : accountCodes){
			System.out.println("양정화 : STEP 2 > "+accountCode1);
			if (realYN.equals("S")){ //가상인경우
				if (sSaleType.equals("BUYTYPE")){ //매수시 현금
					//발런스는 현금으로 적용함.
					if (accountCode1.getAcCode().equals("VCASH")){
					   sbAmt = accountCode1.getBalance();
					}
				}
			}else{
				if (sSaleType.equals("BUYTYPE")){ //매수시 현금
					//발런스는 현금으로 적용함.
					if (accountCode1.getAcCode().equals("RCASH")){
					   sbAmt = accountCode1.getBalance();
					}
				}
			}
		}  
		
		logger.debug("[YYYYYYYYYY} sbAmt="+sbAmt);
		logger.debug("[YYYYYYYYYY} iRate="+iRate);
		
		//디폴트 유형의 정책의 요율을 조회
		model.addAttribute("jobTypeRate",iRate);
		model.addAttribute("balanceAmt",sbAmt);
		model.addAttribute("jobSelType",sSaleType);
		model.addAttribute("authType","User");
		try{
			//model.addAttribute("userId", this.securityService.getCurrentMember().getUserId());
		}catch(Exception e){
			logger.error("[list]"+e.toString(),e);
			throw new OhquestCommonException("err.500",e.toString());
		}finally{
			if(logger.isDebugEnabled()){
				logger.debug("[list] END");
			}
		}
		return 	returnUrl;
	}

	
	//주식 상태 변경 처리 등록요청
	@RequestMapping(value="/stock/mystock/saveStockChgStatCd", method = RequestMethod.POST, produces="application/json")
	@ResponseBody public MessageParam saveStockBV(@RequestBody  MyStock myStcok, HttpServletRequest request) {
	//@ResponseBody public MessageParam saveRecommand(@Valid StockDay stockDay, BindingResult bindingResult) {
	//public @ResponseBody MessageParam saveRecommand( @RequestBody StockDay stockDay,  BindingResult bindingResult) {	
//		smsPhrByEvnt.setOperator(securityService.getCurrentMember()); //operator Id가 테이블에 number로 선언되어있음 
		MessageParam messageParam = new MessageParam();

		int insertCnt = 0;
		int updateCnt = 0;
		int deleteCnt = 0;
		int insertErrCnt = 0;
		int updateErrCnt = 0;
		int deleteErrCnt = 0;
		int totalCnt = 0;
		
		logger.debug("[SAVE stockDayInfo XXXXXXXXXXXXXXXX} BEGIN"+myStcok);
		
		logger.debug("[SAVE stockDayInfo XXXXXXXXXXXXXXXX} myStcok.getMode>>>"+myStcok.getMode());
		 
		
		for(MyStock myStockInfo : myStcok.getMyStockList()){
			
			//관심종목 이력을 등록함.
			MyStockHist myStockHist =  new MyStockHist();
			myStockHist.setIdscMyStock(myStockInfo.getIdscMyStock());
			
			logger.debug("[SAVE myStockHist XXXXXXXXXXXXXXXX} BEGIN"+myStockHist);
			
			myStockHistService.insertMystockHist(myStockHist);
			
			//관심종목이 등록이 안되어 있는경우 insert 처리함.
			// BV:가 매수	
			//code 관리 - SCSTATCD : 상태코드	  WR : 관심목록  WC : 취소	  BV:매수요청	  BR: 매수	  BC: 매수 취소	  SV: 매도요청	  SR:매도
			//myStockInfo.setScStatCd("BV"); //
			logger.debug("[SAVE validate "+myStockInfo);
			
			//강재 매매여부인경우
			if (myStcok.getMode().equals("allow")){
				myStockInfo.setBuyAllowYn("Y");
				logger.debug("[SAVE validate  allowallowallowallowallow>>>>>>>"+myStockInfo.getBuyAllowYn());
			}
			
			int iret =  myStockService.updateMyStock(myStockInfo);
			insertCnt++;
			//logger.debug("[SAVE Last  "+iret);
			
			//매수완료, 매도완료인 경우 계정정보 반영처리.
			if (myStockInfo.getScStatCd().equals("BR") ||
				myStockInfo.getScStatCd().equals("SR")){
				
				//계정정보 반영.
				analyzePolicySiteService.processAccountInfo(myStockInfo);
				
			}
			
		
			totalCnt++;
		}
		messageParam.setMessage("Saved "+totalCnt+" count as \n [insert] success:"+insertCnt+", fail:"+insertErrCnt+" \n [update] success:"+updateCnt+", fail:"+updateErrCnt+" \n [delete] success:"+deleteCnt+", fail:"+deleteErrCnt);
		//messageParam.setObject(smsPhrByEvnt);
		return messageParam;
		
	}
	
	@RequestMapping(value="/stock/mystock/saveRecomm", method = RequestMethod.POST, produces="application/json")
	@ResponseBody public MessageParam saveRecommand(@RequestBody StockDay stockDay, HttpServletRequest request) {
	//@ResponseBody public MessageParam saveRecommand(@Valid StockDay stockDay, BindingResult bindingResult) {
	//public @ResponseBody MessageParam saveRecommand( @RequestBody StockDay stockDay,  BindingResult bindingResult) {	
//		smsPhrByEvnt.setOperator(securityService.getCurrentMember()); //operator Id가 테이블에 number로 선언되어있음 
		MessageParam messageParam = new MessageParam();

		int insertCnt = 0;
		int updateCnt = 0;
		int deleteCnt = 0;
		int insertErrCnt = 0;
		int updateErrCnt = 0;
		int deleteErrCnt = 0;
		int totalCnt = 0;
		
		logger.debug("[SAVE stockDayInfo XXXXXXXXXXXXXXXX} BEGIN"+stockDay);
		 
		
		for(StockDay stockDayInfo : stockDay.getStockDayList()){
			MyStock myStock = new MyStock();
			//smsPhrByEvnts.setMode(smsPhrByEvnt.getMode());
			//smsPhrByEvnts.setSvcCd(smsPhrByEvnt.getSvcCd());
			//smsPhrByEvnts.setOperatorId(securityService.getCurrentMember().getUserId());
			//smsPhrByEvnts.setApplicationId("smsCodRegistrationUI");
		//	messageParam = smsCodeService.saveSmsCodes(smsPhrByEvnts);
			
			logger.debug("[SAVE stockDayInfo XXXXXXXXXXXXXXXX} BEGIN"+stockDayInfo);
			
			//setting
			myStock.setScName(stockDayInfo.getName());
			myStock.setScCode(stockDayInfo.getScCode());
			myStock.setIdohMember("1"); //user default set
			myStock.setBuyVAmt(stockDayInfo.getSiRate());
			myStock.setScStatCd("WR"); //  WR : wish 리스트 등록
			myStock.setRemark(stockDayInfo.getMemo());
			
			//new MyStockValidator().validate(myStock, bindingResult); //validation을 수행한다.
			//관심종목 등록되어 있는지 조회 후 insert처리.
			SearchFilter searchFilter = new SearchFilter();
			
			String searchValue[] = {myStock.getScStatCd(), myStock.getScCode()};
			String searchKey[] = {"SC_STAT_CD", "SC_CODE"}; 
			searchFilter.setSearchKey(searchKey);
			searchFilter.setSearchValue(searchValue);

			for ( int i = 0; i < searchFilter.getSearchKey().length; i++) {
				logger.debug("[viewCposDlr] getSearchKey :: " + searchFilter.getSearchKey()[i] + " :: value :: " +  searchFilter.getSearchValue()[i]);
			}
			
			int iCnt = myStockService.getMyStockCount(searchFilter);
			
			logger.debug("[SAVE getMyStockCount "+iCnt);
			
			//관심종목이 등록이 안되어 있는경우 insert 처리함.
			if (iCnt == 0){
				logger.debug("[SAVE validate "+myStock);   	
				int iret =  myStockService.insertMyStock(myStock);
				
				logger.debug("[SAVE Last  "+iret);
			}
			
			
			
			//if(bindingResult.hasErrors()){ //validation 에러가 있으면,
				//return "modifydepartment";  //이 페이지로 이동.
		//		logger.debug("[SAVE validate Error"+bindingResult);
			//}
			
			/*if((ResultCode.SUCCESS).equals(messageParam.getResultCode())){
				if((messageParam.getMessage()).indexOf("insertSmsCode") >= 0){
					insertCnt++;
				}else if((messageParam.getMessage()).indexOf("updateSmsCode") >= 0){
					updateCnt++;
				}else if((messageParam.getMessage()).indexOf("deleteSmsCode") >= 0){
					deleteCnt++;
				}
			}else{
				if((messageParam.getMessage()).indexOf("insertSmsCode") >= 0){
					insertErrCnt++;
				}else if((messageParam.getMessage()).indexOf("updateSmsCode") >= 0){
					updateErrCnt++;
				}else if((messageParam.getMessage()).indexOf("deleteSmsCode") >= 0){
					deleteErrCnt++;
				}
			}*/
			totalCnt++;
		}
		messageParam.setMessage("Saved "+totalCnt+" count as \n [insert] success:"+insertCnt+", fail:"+insertErrCnt+" \n [update] success:"+updateCnt+", fail:"+updateErrCnt+" \n [delete] success:"+deleteCnt+", fail:"+deleteErrCnt);
		//messageParam.setObject(smsPhrByEvnt);
		return messageParam;
		
	}

	
	//판매처리 공통처리 프로세스 [데몬호출]
	@RequestMapping(value = "/stock/mystock/processCall", method = RequestMethod.GET)
	public String processStockCall(Model model, StockDay stockDay, @RequestParam(value="page",required=false, defaultValue="0" ) int curPage) {

		return "stock.processStockCall";

	}

	
	//판매처리 공통처리 프로세스 [데몬처리역활]
	@RequestMapping(value = "/stock/mystock/processStock", method = RequestMethod.GET)
	public String processStock(Model model, StockDay stockDay, @RequestParam(value="page",required=false, defaultValue="0" ) int curPage) {

		analyzeSiteService.processStockAnalyze(); //매수,매도 자동 처리및 공지 생성
		return "stock.processStockOk";

	}

	//메시지정보를 화면에 표시함.
	@RequestMapping(value = "/stock/stockMessage", method = RequestMethod.GET)
	public String myStockMessage(Model model, StockDay stockDay, @RequestParam(value="page",required=false, defaultValue="0" ) int curPage) {

		//views/stock/myStockMessage.jsp
		return "stock.myStockMessage";

	}

	//메시지정보를 화면에 표시함.
	@RequestMapping(value = "/stock/message/sel", method = RequestMethod.GET)
	public String myStockSelMessage(Model model, Message message, @RequestParam(value="page",required=false, defaultValue="0" ) int curPage) {

		//관심종목 등록되어 있는지 조회 후 insert처리.
		SearchFilter searchFilter = new SearchFilter();
		
		String searchValue[] = {"1"}; //디폴트 1 로그인 관련정보 수정 시 변경함.
		String searchKey[] = {"idOH_MEMBER"}; 
		searchFilter.setSearchKey(searchKey);
		searchFilter.setSearchValue(searchValue);

		List<Message> messages = messageService.getMessageList(searchFilter);
		System.out.println("양정화 : myStocks Size > "+messages.size());
		
		model.addAttribute("list", messages);
				
		return "stock.myStockMessage";

	}
	
	//정책정보의 상항요율을 조회
	@RequestMapping(value = "/stock/policyRate/sel", method = RequestMethod.GET)
	public Model  myStockpolicyRate(Model model, Message message,
			@RequestParam(value="sMode",required=false, defaultValue="0" ) String statCd,
			@RequestParam(value="realYN",required=false, defaultValue="0" ) String realYN) {
		
		String returnUrl="dialog.stock.myStockSave";
		
		if(logger.isDebugEnabled()){
			logger.debug("[xxxxxxxxxxxxxxxxx} BEGIN"+statCd);
			logger.debug("[xxxxxxxxxxxxxxxxx} BEGIN"+realYN);
		}
		
		
		//주식상태에 따른 판매방식을 적용함.
		String sSaleType = "";//BUYTYPE;
    	//해당판매정책 조회처리
		ScPolicy scPolicySel = new ScPolicy();
		int iRate = 0;//작업유형별 요율
	    if (statCd.equals("WR") || statCd.equals("BV") ){
		   sSaleType = "BUYTYPE"; 
		   scPolicySel.setCodeId("DFT");
	     //BV	매수요청	
	    } else if (statCd.equals("BR") || statCd.equals("SV"))  {
		   sSaleType = "SALETYPE";
		   scPolicySel.setCodeId("DFTS");
	    } 
	    
	    //디폴트 정책의 요출을 조회
		List<ScPolicy> scPolicys = scPolicyService.getScPolicyAlltList(scPolicySel);
		
		if (scPolicys.size()>0){
			ScPolicy scPolicyInfo = scPolicys.get(0);
			iRate = Integer.parseInt(scPolicyInfo.getPocyUpValue());
		}
	  
		//잔고를 조회 후 값을 등록처리.
		AccountCode accountCode = new AccountCode();
		
		accountCode.setIdohMember("1");//디폴트 사용자 값 확인
		
		List<AccountCode> accountCodes = accountCodeService.getMyAccountCodeAlltList(accountCode);
		
		System.out.println("양정화 : STEP 1 > "+accountCodes.size());
		String sbAmt =  "";
		AccountCode retAccountCode = new AccountCode();
		for(AccountCode accountCode1 : accountCodes){
			System.out.println("양정화 : STEP 2 > "+accountCode1);
			if (realYN.equals("S")){ //가상인경우
				//발런스는 현금으로 적용함.
				if (accountCode1.getAcCode().equals("VCASH")){
				   sbAmt = accountCode1.getBalance();
				   retAccountCode = accountCode1;
				}
			}else{
				//발런스는 현금으로 적용함.
				if (accountCode1.getAcCode().equals("RCASH")){
				   sbAmt = accountCode1.getBalance();
				   retAccountCode = accountCode1;
				}
			
			}
			
		}  
		
		logger.debug("[YYYYYYYYYY} sbAmt="+sbAmt);
		logger.debug("[YYYYYYYYYY} iRate="+iRate);
		
		//디폴트 유형의 정책의 요율을 조회
		model.addAttribute("jobTypeRate",iRate);
		model.addAttribute("balanceAmt",sbAmt);
		model.addAttribute("jobSelType",sSaleType);
		model.addAttribute("mRealYN", "XXXXXXXXXXX");
		model.addAttribute("RESULT", "FAIL");
		
		model.addAttribute("accountInfo",retAccountCode);
		try{
			//model.addAttribute("userId", this.securityService.getCurrentMember().getUserId());
		}catch(Exception e){
			logger.error("[list]"+e.toString(),e);
			throw new OhquestCommonException("err.500",e.toString());
		}finally{
			if(logger.isDebugEnabled()){
				logger.debug("[list] END");
			}
		}
		return 	model;
	}
	
	

}

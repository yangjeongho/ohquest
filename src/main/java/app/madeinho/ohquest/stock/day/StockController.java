package app.madeinho.ohquest.stock.day;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import app.madeinho.ohquest.co.code.CodeService;
import app.madeinho.ohquest.co.code.domain.LookupCode;
import app.madeinho.ohquest.common.domain.searchFilter.SearchFilter;
import app.madeinho.ohquest.common.util.OhquestUtil;
import app.madeinho.ohquest.stock.analyze.AnalyzeSaleTypeDFT;
import app.madeinho.ohquest.stock.analyze.AnalyzeSiteService;
import app.madeinho.ohquest.stock.mystock.MyStock;
import app.madeinho.ohquest.stock.mystock.MyStockService;
import app.madeinho.ohquest.stock.mystockhist.MyStockHistService;

@Controller
public class StockController {
	
	private static Logger logger = LoggerFactory.getLogger(StockController.class);

	@Autowired	StockService stockService;
	@Autowired	AnalyzeSiteService analyzeSiteService;
	@Autowired	CodeService codeService;
	@Autowired
	MyStockService myStockService;
	@Autowired
	MyStockHistService myStockHistService;
	
	/*@RequestMapping("/")
	public String index() {
		return "/index";
	}*/
	
	//시간별 주식 시세정보 생성 [데몬호출 - 임시]
	@RequestMapping(value = "/stock/day", method = RequestMethod.GET)
	public String processDayStockCall(Model model, StockDay stockDay, @RequestParam(value="page",required=false, defaultValue="0" ) int curPage) {

		return "stock.processDayStockCall";

	}
	
	
	
	//시간별 주식 시세정보 생성 [데몬호출]	
	//@RequestMapping("/stock/day")
	@RequestMapping(value="/stock/daySave", method = RequestMethod.GET)
	public String stockDaySave(Model model, @RequestParam(value="page",required=false, defaultValue="0" ) int curPage) throws IOException {
		
		//사이트에서 값을 읽어 테이블에 저장처리
		stockService.saveStock();
		

		//getURLInfo("");
	
		//List<EventLnkg> eventLnkgs =
		
		//System.out.println("양정화 stockDaySave: STEP end");
		//return "co/notice/notice";
		return "dialog.ui.newMember";
		//return "main";
	}
	


/*	@RequestMapping(value="/stock/stockList", method = RequestMethod.GET)
	public String stockDayList() throws IOException {
		
		//stockService.saveStock();
		

		//getURLInfo("");
	
		//List<EventLnkg> eventLnkgs =
		
		//System.out.println("양정화 : STEP end");
		//return "co/notice/notice";
		//return "dialog.ui.list";
		return "stock.stockList";
		//return "main";
	}*/
	
	//주식 시세 조회 화면 오픈	
	@RequestMapping(value = "/stock/stockList", method = RequestMethod.GET)
	public String stockOpen(Model model, StockDay stockDay, @RequestParam(value="page",required=false, defaultValue="0" ) int curPage,
		@RequestParam(value="callBack",required=false, defaultValue="callBack" ) String callBack ) {
	
			
		return "stock.stockList";
	}
	

	//주식 시세 조회 SQL + web site(naver, 갭상승, 상한,하한 정보 표시
	//@RequestMapping(value = "/stock/stockList/sel", method = RequestMethod.GET)
	@RequestMapping(value = "/stock/stockList/sel", method=RequestMethod.GET)
	public String list(Model model, StockDay stockDay, 
			@RequestParam(value="page",required=false, defaultValue="0" ) int curPage,
			@RequestParam(value = "stCode") String stCode) throws UnsupportedEncodingException {
	
		stCode = URLDecoder.decode(stCode, "UTF-8");
		
		//Pagination pagination = new Pagination(searchFilter.getPage(stockDay));
		//pagination.setObjectsCount(csNoticeService.getCsNoticeListCount(searchFilter));
		///model.addAttribute("pagination", pagination);
		System.out.println("양정화 : /stock/stockList/sel > "+stCode);
		
		if (!OhquestUtil.isNull(stCode)){
			if (stCode.equals(" ")||stCode.equals("*"))
				stCode="%";
			stockDay.setScCode(stCode);
			stockDay.setName(stCode);
			List<StockDay> stockdayRet = stockService.getMaxDayRate(stockDay);
			model.addAttribute("list", stockdayRet);
		} else {
		
			List<StockDay> stockdayRet = stockService.getMaxDayRate(stockDay);
			System.out.println("양정화 : STEP 1 > "+stockdayRet.size());
			
			List<StockDay> stockdayRetNaver = analyzeSiteService.getQuestList(""); //네이버의 정보를 리턴
			
			System.out.println("양정화 : STEP 2 > "+stockdayRetNaver.size());
			
			for(StockDay stockDayNaver : stockdayRetNaver) stockdayRet.add(stockDayNaver);  //DB ST_RATE_DAY + naver 정보
			model.addAttribute("list", stockdayRet);
		}
	
		
		try {
		//	model.addAttribute("jsonlist", new ObjectMapper().defaultPrettyPrintingWriter().writeValueAsString(stockService.getMaxDayRate(stockDay)));
			
			/*if(securityService.getCurrentMember().getUserLevel().equals("C")){
				model.addAttribute("myCounselJobList", new ObjectMapper().defaultPrettyPrintingWriter().writeValueAsString(csNoticeService.getMyCounselJobList()));
			}else if( securityService.getCurrentMember().getUserLevel().equals("W") || securityService.getCurrentMember().getUserLevel().equals("M")){
				model.addAttribute("myWorkJobList", new ObjectMapper().defaultPrettyPrintingWriter().writeValueAsString(csNoticeService.getMyWorkJobList()));
			}*/
			//model.addAttribute("myTodoList", new ObjectMapper().defaultPrettyPrintingWriter().writeValueAsString(csNoticeService.getMyTodoList()));
		} catch (Exception e) {
			e.printStackTrace();
		}
		//model.addAttribute("viewNoData", false);
		//model.addAttribute("callBack", callBack);
	
		//System.out.println("양정화 :day_rate select");
			
		return "stock.stockList";
	}
	
	
	//추천종목 추가.
	@RequestMapping(value = "/stock/stockList/add", method = RequestMethod.GET)
	public String addMyStockView(Model model, StockDay stockDay, @RequestParam(value="page",required=false, defaultValue="0" ) int curPage,
			@RequestParam(value="callBack",required=false, defaultValue="callBack" ) String callBack ) {
		
		System.out.println("양정화 : /stock/addMyStock CALL ");
		
		/*model.addAttribute("codeTypeList",
				codeService.getCodeTypeList(language));*/
		
		return "stock.view";
		//return "dialog.stock.view";
	}	
	


	//자동 추천종목 시뮬레이션 추가 - 데몬처리 하루에 한번 장시작전에 추가. 이전 상한가 종목 
	@RequestMapping(value="/stock/autoSelUpPrice", method = RequestMethod.GET)
	public String autoSalUpPrice(Model model, @RequestParam(value="page",required=false, defaultValue="0" ) int curPage) throws IOException {
		
		//step 0:상한가 리스트 조회[네이버 기초코드에서 URL조회]
		LookupCode lookupCode = new LookupCode();
		lookupCode.setLanguage("ALL");
		lookupCode.setCodeGroup("ADDSITE");
		lookupCode.setCodeId("NAVERUP"); //네이버 상한
		
		
		List<LookupCode> lookupCodes   = codeService.getCodeList(lookupCode);		
		

	
		for (LookupCode lookupCode2 : lookupCodes) {
			
			//step 1:상한가 리스트 조회[네이버에서 조회함.]
			System.out.println("/stock/autoSelUpPrice lookupCode2 "+lookupCode2);
			AnalyzeSaleTypeDFT analyzeService = new AnalyzeSaleTypeDFT();
			List<MyStock> myStocks =  analyzeService.getAnalyzeSaleNaverUpList(lookupCode2.getEtcInfo1());
			
			//step 2:20일 이평선의 평균선 확인 6프로 미만인 경우
			
		
			//step 3:관심목록 등록 및 갭상승등록.
			
			for(MyStock myStockInfo : myStocks){
				
				//MyStock myStock = new MyStock();
				//smsPhrByEvnts.setMode(smsPhrByEvnt.getMode());
				//smsPhrByEvnts.setSvcCd(smsPhrByEvnt.getSvcCd());
				//smsPhrByEvnts.setOperatorId(securityService.getCurrentMember().getUserId());
				//smsPhrByEvnts.setApplicationId("smsCodRegistrationUI");
		  	    //messageParam = smsCodeService.saveSmsCodes(smsPhrByEvnts);
				
				logger.debug("[SAVE stockDayInfo XXXXXXXXXXXXXXXX} BEGIN"+myStockInfo);
				
				//setting
				//new MyStockValidator().validate(myStock, bindingResult); //validation을 수행한다.
				//관심종목 등록되어 있는지 조회 후 insert처리.
				SearchFilter searchFilter = new SearchFilter();
				
				String searchValue[] = {myStockInfo.getScStatCd(), myStockInfo.getScCode()};
				String searchKey[] = {"SC_STAT_CD", "SC_CODE"}; 
				searchFilter.setSearchKey(searchKey);
				searchFilter.setSearchValue(searchValue);

				int iCnt = myStockService.getMyStockCount(searchFilter);
				
				logger.debug("[SAVE getMyStockCount "+iCnt);
				
				//관심종목이 등록이 안되어 있는경우 insert 처리함.
				if (iCnt == 0){
					logger.debug("[SAVE validate "+myStockInfo);   	
					int iretSeq =  myStockService.insertMyStock(myStockInfo);
					
					
					//최종 등록한 seq값을 확인
					//int iretSeq =  myStockService.getLastInsertId("");
					logger.debug("[SAVE Last >>>> "+myStockInfo);
			
					//매수요청 변경
					//관심종목이 등록이 안되어 있는경우 insert 처리함.
					// BV:가 매수	
					//code 관리 - SCSTATCD : 상태코드	  WR : 관심목록  WC : 취소	  BV:매수요청	  BR: 매수	  BC: 매수 취소	  SV: 매도요청	  SR:매도
					//myStockInfo.setScStatCd("BV"); //
					//myStock.setBuyVAmt(Double.parseDouble(StringUtil.replaceAll(rowTds.get(4).text(),",",""))); //예상금액
					//myStock.setBuyVCount("1"); //1건만 신청
					//myStockInfo.setIdscMyStock(iretSeq+""); //매수요청
					myStockInfo.setScStatCd("BV"); //매수요청
					myStockInfo.setBuyType("DFT"); //디폴트 매매 방식 
					
					logger.debug("[SAVE validate "+myStockInfo);
					myStockService.updateMyStock(myStockInfo);
					
				}
				
				//totalCnt++;
			}
			
		}

		//완료 페이지
		return "stock.processStockOk";

	}
	

}

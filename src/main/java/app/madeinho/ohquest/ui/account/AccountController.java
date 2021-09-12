package app.madeinho.ohquest.ui.account;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import app.madeinho.ohquest.common.domain.searchFilter.SearchFilter;
import app.madeinho.ohquest.common.util.OhquestUtil;
import app.madeinho.ohquest.stock.analyze.AnalyzeSiteService;
import app.madeinho.ohquest.ui.accountcode.AccountCode;
import app.madeinho.ohquest.ui.accountcode.AccountCodeService;

@Controller
public class AccountController {
	
	private static Logger logger = LoggerFactory.getLogger(AccountController.class);

	@Autowired
	AccountService accountService;
	@Autowired
	AnalyzeSiteService analyzeSiteService;
	@Autowired	
	AccountCodeService accountCodeService;
	
	/*@RequestMapping("/")
	public String index() {
		return "/index";
	}*/
	
	//계정정보 메인화면 호출
	@RequestMapping(value = "/account/main", method = RequestMethod.GET)
	public String openAccountMain(Model model, Account account, @RequestParam(value="page",required=false, defaultValue="0" ) int curPage) {

    	
    /*	try{
    		    workReportCmd.setReqFromDate(workReportCmd.getReqFromDate().replaceAll("-",""));
    		    workReportCmd.setReqToDate(workReportCmd.getReqToDate().replaceAll("-",""));
    			workReportCmd.setOperator(this.securityService.getCurrentMember());
    			Pagination pagination = new Pagination(workReportCmd.getPage(),10);	
    			pagination.setObjectsCount(this.orderService.getOrgWorkReportListCnt(workReportCmd));
    			
    		   
    		account.setIdohMember("1");//테스트
    			List<Account> accountList = accountService.getAccountAlltList(account);
    			
    			
    			System.out.println("getAccountList] BEGIN > "+accountList.size());
    			
    			Account accountInfo = new Account();
    			
    			if (accountList.size()> 0){
    				accountInfo = accountList.get(0);
    				System.out.println("양정화 : accountInfo 1 > "+accountInfo);
    			}
    			
    			
    			for(AccountCode accountCode1 : accountList){
    				
    			}
    			
    			//model.addAttribute("orgPagination", pagination);
    			model.addAttribute("accountInfo", accountInfo);		
    		
    	}catch (Exception e){
    		
	    		logger.error("[organizationWorkReport] " + e.toString(), e);
	    		model.addAttribute("RESULT", "FAIL");
	    		model.addAttribute("MESSAGE", "err.500");
    	}finally{
	    		if (logger.isDebugEnabled()) {
	    			logger.debug("[organizationWorkReport] END");
	    		}
    	}	*/
		
		//return "account.mainList";
		return "account.mainList";

	}
	
	/**
	 * 계좌정보 요약정보
	 * Organization
	 * */
	 @RequestMapping(value="/account/summaryInfo", method = RequestMethod.GET)
	 @ResponseBody
	 public Model getAccountList(Model model,Account account) {
		 
		 logger.debug("[getAccountList] BEGIN");
		 	if (logger.isDebugEnabled()) {
	    		
	    	}
	    	
	    	try{
	    		    /*workReportCmd.setReqFromDate(workReportCmd.getReqFromDate().replaceAll("-",""));
	    		    workReportCmd.setReqToDate(workReportCmd.getReqToDate().replaceAll("-",""));
	    			workReportCmd.setOperator(this.securityService.getCurrentMember());
	    			Pagination pagination = new Pagination(workReportCmd.getPage(),10);	
	    			pagination.setObjectsCount(this.orderService.getOrgWorkReportListCnt(workReportCmd));
	    			*/
	    		   
	    		    account.setIdohMember("1");//테스트
	    			List<Account> accountList = accountService.getAccountAlltList(account);
	    			
	    			
	    			System.out.println("getAccountList] BEGIN > "+accountList.size());
	    			
	    			Account accountInfo = new Account();
	    			
	    			if (accountList.size()> 0){
	    				accountInfo = accountList.get(0);
	    				System.out.println("양정화 : accountInfo 1 > "+accountInfo);
	    			}
	    			
	    			AccountCode accountCode = new AccountCode();
	    			
	    			accountCode.setIdohMember("1");//주식정보 사용자 ID
	    			
	    			
	    			String sTag = "";
	    			
	    			//sTag += "<div id='container'>";
	    			sTag += "   <div class='priceheader' id='divMyAccountName'>";
	    			sTag += "   <h1> 계좌명 : "+accountInfo.getAcDesc()+"</h1>";
	    			sTag += "   </div>";
	    			
	    			sTag += "    <div class='pricetabmid'>";
	    			sTag += "      <h1> 기본정보 </h1>";
	    			sTag += "      <div class='pricemid'>"; 
	    			sTag += "        <h2> 0 </h2> ";
	    			sTag += "      </div>";
	    			sTag += "      <div class='infos'>";
	    			sTag += "        <h3> 기본정보생성 </h3>";
	    			sTag += "        <h3> 등록일 : "+accountInfo.getContCreateDate()+" </h3>";
	    			sTag += "      </div>";
	    			sTag += "      <div class='pricefootermid'>";
	    			sTag += "     	 <div class='buttonmid'>";
	    			sTag += "     	   <a href=''> Get started </a>";
	    			sTag += "      	  </div>";
	    			sTag += "      	</div>";
	    			sTag += "    </div>";
	    			
	    			List<AccountCode> accountCodes = accountCodeService.getMyAccountCodeAlltList(accountCode);
	    			
                    int i = 0;
	    			
	    			for (AccountCode accountCode1 : accountCodes){
	    				
	    				sTag += "    <div class='pricetab'>";
		    			sTag += "      <h1> "+accountCode1.getAcName()+" </h1>";
		    			sTag += "      <div class='pricemid'>"; 
		    			sTag += "        <h2> "+accountCode1.getBalance()+"</h2> ";
		    			sTag += "      </div>";
		    			sTag += "      <div class='infos'>";
		    			sTag += "        <h3>  "+OhquestUtil.maxString(15, accountCode1.getChgMessage())+" </h3>";
		    			sTag += "        <h3> 등록일 : "+accountCode1.getContCreateDate()+" </h3>";
		    			sTag += "      </div>";
		    			sTag += "      <div class='pricefooter'>";
		    			sTag += "   	  <div class='buttonmid'>";
		    			//sTag += "   	    <button onclick=“accountDetailListLoad()”> Go History </button>";
		    			sTag += "   	    <button onclick='accountCallFun"+accountCode1.getAcCode()+"()'> Go History </button>";
		    			//var sTag1 = '<li> this is not the name "....." </li>\n';
		    			
		    			//'A string that\'s single quoted'

		    			//"a string that's double quoted"
		    			
		    			sTag += "    	  </div>";
		    			sTag += "      </div>";
		    			sTag += "    </div>"; 

	    			}
	    			
	    			//sTag += "</div>";
	    			
	    			System.out.println("sTag] BEGIN3333 > "+sTag);
	    			
	    			//ex >HTML
	    			/*
	    			 <div id="container">
	    			    <div class="priceheader" id="divMyAccountName">
	    			      <h1> 나의 주식 정보</h1>
	    			    </div>
	    			   <div class="pricetabmid">
	    			      <h1> 기본정보 </h1>
	    			      <div class="pricemid"> 
	    			        <h2> 30$ </h2> 
	    			      </div>
	    			      <div class="infos">
	    			        <h3> Premium Profile Listing </h3>
	    			        <h3> Unlimited File Access </h3>
	    			        
	    			      </div>
	    			      <div class="pricefootermid">
	    			        <div class="buttonmid">
	    			          <a href="#"> Get started </a>
	    			        </div>
	    			      </div>
	    			    </div>
	    			    <div class="pricetab">
	    			      <h1> 가장계좌-주식 </h1>
	    			      <div class="price"> 
	    			        <h2> 5% </h2> 
	    			      </div>
	    			      <div class="infos">
	    			        <h3> Premium Profile Listing </h3>
	    			        <h3> Unlimited File Access </h3>
	    			     
	    			      </div>
	    			      <div class="pricefooter">
	    			        <div class="button">
	    			          <a href="#"> Get started </a>
	    			        </div>
	    			      </div>
	    			    </div>
	    			    <div class="pricetab">
	    			      <h1> 가장계좌-현금 </h1>
	    			      <div class="price"> 
	    			        <h2> 10% </h2> 
	    			      </div>
	    			      <div class="infos">
	    			        <h3> Premium Profile Listing </h3>
	    			        <h3> Unlimited File Access </h3>
	    			       
	    			      </div>
	    			      <div class="pricefooter">
	    			        <div class="button">
	    			          <a href="#"> Get started </a>
	    			        </div>
	    			      </div>
	    			    </div>
	    			    <div class="pricetab">
	    			      <h1> 주식 </h1>
	    			      <div class="price"> 
	    			        <h2> 50% </h2> 
	    			      </div>
	    			      <div class="infos">
	    			        <h3> Premium Profile Listing </h3>
	    			        <h3> Unlimited File Access </h3>
	    			      
	    			      </div>
	    			      <div class="pricefooter">
	    			        <div class="button">
	    			          <a href="#"> Get started </a>
	    			        </div>
	    			      </div>
	    			    </div>
	    			    
	    			    <div class="pricetab">
	    			      <h1> 현금 </h1>
	    			      <div class="price"> 
	    			        <h2> 30% </h2> 
	    			      </div>
	    			      <div class="infos">
	    			        <h3> Premium Profile Listing </h3>
	    			        <h3> Unlimited File Access </h3>
	    			        
	    			      </div>
	    			      <div class="pricefooter">
	    			        <div class="button">
	    			          <a href="#"> Get started </a>
	    			        </div>
	    			      </div>
	    			    </div>

	    			  </div>
	    			  */
	    			
	    			//model.addAttribute("orgPagination", pagination);
	    			model.addAttribute("accountInfo", accountInfo);	
	    			model.addAttribute("htmlTag",     sTag);	
	    			
	    		
	    	}catch (Exception e){
	    		
		    		logger.error("[organizationWorkReport] " + e.toString(), e);
		    		model.addAttribute("RESULT", "FAIL");
		    		model.addAttribute("MESSAGE", "err.500");
	    	}finally{
		    		if (logger.isDebugEnabled()) {
		    			logger.debug("[organizationWorkReport] END");
		    		}
	    	}	
	    	
	    	return model;
	    	
	    }	
	
	
	/*@RequestMapping(value = "dynamichtml/{p1}/{p2}", method = RequestMethod.GET, produces = MediaType.TEXT_HTML_VALUE)
	@ResponseBody
	public String dynamicHtml(@PathVariable String p1, @PathVariable String p2) {
	    return "<h1>" + p1 + " " + p2 + "</h1>";
	}*/
	 
		/**
		 *접속요율등록
		 * @return
		 */
		@RequestMapping(value="/account/summaryInfo2", method = RequestMethod.GET)
		@ResponseBody public  Map<String,Object>  rateNew( Account account) {
			
			Map<String,Object> data = new HashMap<String, Object>();
			logger.debug("account");
			
			//try {
				account.setIdohMember("1");//테스트
    			List<Account> accountList = accountService.getAccountAlltList(account);
    			
    			
    			System.out.println("getAccountList] BEGIN > "+accountList.size());
    			
    			Account accountInfo = new Account();
    			
    			if (accountList.size()> 0){
    				accountInfo = accountList.get(0);
    				System.out.println("양정화 : accountInfo 1 > "+accountInfo);
    			}
    			
    			data.put("account", accountInfo);
    			
				return data;
			/*} catch (L) {
				logger.error("[processAddress] " + me.toString(), me);
				return new MessageParam(ResultCode.FAIL, me.toString());
			}*/
		}
		
		@RequestMapping(value = "/account/history/sel", method = RequestMethod.GET)
		public String list(Model model, AccountDetailInfo inAccountDetailInfo, 
				@RequestParam(value="page",required=false, defaultValue="0" ) int curPage,
				@RequestParam(value="acCode",required=false, defaultValue="0" ) String acCode) {
		
			//Pagination pagination = new Pagination(searchFilter.getPage(stockDay));
			//pagination.setObjectsCount(csNoticeService.getCsNoticeListCount(searchFilter));
			///model.addAttribute("pagination", pagination)
			
			
			//관심종목 등록되어 있는지 조회 후 insert처리.
			//  AND D.idOH_MEMBER = 1
		    //	AND C.AC_CODE = 'VCASH'
			SearchFilter searchFilter = new SearchFilter();
			
			String searchValue[] = {"1",acCode};
			String searchKey[] = {"D.idOH_MEMBER","C.AC_CODE"}; 
			searchFilter.setSearchKey(searchKey);
			searchFilter.setSearchValue(searchValue);
			
			System.out.println("양정화 : STEP 2 > "+searchFilter);

			List<AccountDetailInfo> accountDetailInfo = accountService.getAccountDetailInfoHist(searchFilter);
			System.out.println("양정화 : myStocks Size > "+accountDetailInfo.size());
			
			//for(StockDay stockDayNaver : stockdayRetNaver) stockdayRet.add(stockDayNaver);  //DB ST_RATE_DAY + naver 정보
			
		//	System.out.println("양정화 : STEP end > "+stockdayRet.size());
			
			model.addAttribute("list", accountDetailInfo);
					
			return "stock.myStockSale";
		}
		
}

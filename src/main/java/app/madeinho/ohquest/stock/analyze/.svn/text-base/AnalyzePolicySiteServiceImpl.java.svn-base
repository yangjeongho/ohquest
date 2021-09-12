package app.madeinho.ohquest.stock.analyze;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import app.madeinho.ohquest.common.domain.searchFilter.SearchFilter;
import app.madeinho.ohquest.common.util.OhquestUtil;
import app.madeinho.ohquest.common.util.WebPageReadUtil;
import app.madeinho.ohquest.stock.mystock.MyStock;
import app.madeinho.ohquest.stock.mystock.MyStockService;
import app.madeinho.ohquest.stock.mystockhist.MyStockHist;
import app.madeinho.ohquest.stock.mystockhist.MyStockHistService;
import app.madeinho.ohquest.ui.accountcode.AccountCode;
import app.madeinho.ohquest.ui.accountcode.AccountCodeService;
import app.madeinho.ohquest.ui.accountcodeHist.AccountCodeHist;
import app.madeinho.ohquest.ui.accountcodeHist.AccountCodeHistService;
import app.madeinho.ohquest.ui.accountdetail.AccountDetail;
import app.madeinho.ohquest.ui.accountdetail.AccountDetailService;
import app.madeinho.ohquest.ui.message.Message;
import app.madeinho.ohquest.ui.message.MessageService;


@Service
@Transactional
public class AnalyzePolicySiteServiceImpl extends  WebPageReadUtil implements AnalyzePolicySiteService {
	
	private static Logger logger = LoggerFactory.getLogger(AnalyzePolicySiteServiceImpl.class);
	
	@Autowired	MessageService messageService;
	@Autowired	MyStockService myStockService;
	@Autowired	MyStockHistService myStockHistService;
	@Autowired	AccountCodeService accountCodeService;
	@Autowired	AccountCodeHistService accountCodeHistService;
	@Autowired	AccountDetailService accountDetailService;	
	
	@Override
	public void processPolicyAnalyze(MyStock myStockInfo) {
    	//-----------------------------------------------//
		//STEP1. 판매유형에 따라 SC_POLICY 테이블의 설정정보에 의해서  매수, 매도 처리로직
		//       + http://vip.mk.co.kr/newSt/price/price.php?stCode=주식코드&MSid=&msPortfolioID=
		//-----------------------------------------------//
		//분석 정보을 정해진 포맷의 String 값을 받음.
		Message message = new Message();
    	//myStockInfo 상태정보 읽음
		if (myStockInfo.getScStatCd().equals("BV") ||
			myStockInfo.getScStatCd().equals("SV")){ //매수, 매도 동시처리함.
			//매수 디폴트 값인 경우
			
			String sByyType = myStockInfo.getBuyType();
			
			if (sByyType.equals("DFT")){
				AnalyzeSaleTypeDFT analyzeService = new AnalyzeSaleTypeDFT();
				message = analyzeService.getAnalyzeSaleInfo(myStockInfo);
			}else if (sByyType.equals("x")){
				
			}
			
		}

        //-----------------------------------------------//
		//STEP2. 각각 상태을 1분단위로 분석처리 기록처리함. UI_MESSAGE 필드에 값을 표시함. idSC_MY_STOCK
		//-----------------------------------------------//
	    if (message != null){
	    	System.out.println("MYYANG0 : message > " +message);
	    	if (message.getIdohMember()!=null && !message.getIdohMember().equals("")){
	    		//이전값과 동일하면 변경하지 않음.
	    		//관심종목 등록되어 있는지 조회 후 insert처리.
	    		SearchFilter searchFilter = new SearchFilter();
	    		String sStrckCd =  message.getIdscMyStock()+"";
	    		String searchValue[] = {"1", sStrckCd }; //디폴트 1 로그인 관련정보 수정 시 변경함.
	    		String searchKey[] = {"idOH_MEMBER","idSC_MY_STOCK"}; 
	    		searchFilter.setSearchKey(searchKey);
	    		searchFilter.setSearchValue(searchValue);

	    		List<Message> messages = messageService.getMessageListMax(searchFilter);
	    		System.out.println("양정화 : myStocks Size > "+messages.size());
	    		
	    		if (messages.size() > 0) {
	    			
	    			Message  messageInfo =messages.get(0);
	    			
	    			if  (!messageInfo.getMessage().equals(message.getMessage()) ){
	    				messageService.insertMessage(message);
	    			}
	    			
	    			
	    			
	    		}else{
	    			messageService.insertMessage(message);
	    		}
	    		
		    	
	    	}
	    }
	    
		//-----------------------------------------------//
		//STEP3. 상태가 시뮬레이션인 경우 자동판매처리가 되며 UI_ACCount_Detail 테이블에 값 적용 및 SC_MY_STCOK정보 update 
		//-----------------------------------------------//
		if (myStockInfo.getJobType().equals("S")){ //
		   //자동 처리등록시 시뮬레이션 결정::
			
			//actType          ; //[로직처리용]처리유형 = A:즉시실행 	, D: 미실행 :: 매수요청, 취소상태변경
			if (!OhquestUtil.isNull(message.getActType())){
				if (message.getActType().equals("A")){
                    //----------------------------------//
				    //1.SC_MY_STCOK 자동매도 상태변경 , 이력생성::
                    //----------------------------------//
					//상태변경으로 인한 이력을 등록함.
					MyStockHist myStockHist =  new MyStockHist();
					myStockHist.setIdscMyStock(myStockInfo.getIdscMyStock());
					
					logger.debug("[SAVE myStockHist XXXXXXXXXXXXXXXX} BEGIN"+myStockHist);
					myStockHistService.insertMystockHist(myStockHist);
					
					logger.debug("[SAVE validate "+myStockInfo);
					int iret =  myStockService.updateMyStock(myStockInfo);
					
                    //----------------------------------//				   
				    //2.UI_ACCOUNT, 계정정보의 매수정보 등록 및 상세이력 등록
                    //----------------------------------//
					processAccountInfo(myStockInfo);
					
					//2.1 매수완료인경우 BR 매도요청SV 상태로 변경
					if( myStockInfo.getScStatCd().equals("BR")){//매도요청인경우
						myStockInfo.setScStatCd("SV");
						myStockHist.setIdscMyStock(myStockInfo.getIdscMyStock());
						
						logger.debug("[SAVE myStockHist XXXXXXXXXXXXXXXX} BEGIN"+myStockHist);
						myStockHistService.insertMystockHist(myStockHist);
						
						logger.debug("[SAVE validate "+myStockInfo);
						myStockService.updateMyStock(myStockInfo);
					}

				}
			}
			
			
			
		}

	}


	//UI_ACCOUNT, 계정정보의 매수정보 등록 및 상세이력 등록
	@Override
	public void processAccountInfo(MyStock myStockInfo) {

		//2.1 현재 사용자가 관리하고 하고 있는계좌정보를 조회 처리
		//잔고를 조회 후 값을 등록처리.
		AccountCode accountCode = new AccountCode();
		
		accountCode.setIdohMember(myStockInfo.getIdohMember());//주식정보 사용자 ID
		
		List<AccountCode> accountCodes = accountCodeService.getMyAccountCodeAlltList(accountCode);
		
		System.out.println("양정화 : STEP 1 > "+accountCodes.size());
		String sbAmt =  "";
		
		for(AccountCode accountCode1 : accountCodes){

			AccountCodeHist accountCodeHist = new AccountCodeHist();
			AccountDetail accountDetail = new AccountDetail();
			
			//매도완료인경우 
			//시뮬레이션정보인 경우
			////code 관리 - SCSTATCD : 상태코드	  WR : wish 리스트 등록	  WC : 취소	  BV:가 매수	  BR:실 매수	  BC: 매수 취소	  SV:가 매도	  SR:실 매도
			//매수상태인 경우
			/*
			 * 주식상태 : SV(가 매도)
			 * - 주식계좌가  VCASH	가상현금 발런스 마이너스
			 * - 주식계좌가  VCASH	가상주식 발런스 플러스
			 * 
			 * ACCODE	VCASH	KR		가상계좌(현금)
			   ACCODE	VSTOC	KR		가상계좌(주식)
			   ACCODE	RCASH	KR		실현금
			   ACCODE	RSTOC	KR		실주식*/
			
			if (myStockInfo.getJobType().equals("S")){ //시뮬인경우
			   
				if (accountCode1.getAcCode().equals("VCASH") ||
				    accountCode1.getAcCode().equals("VSTOC")){
					
					setAccountDetailInfo(myStockInfo, accountCode1, accountDetail); //주식정보상태변경
					 
			 	    //발런스정보 변경처리  
					accountCodeService.updateAccountCode(accountCode1);
					
					//3.주식이력 입출력 금액 이력을 등록
					setAccountDetailDftInfo(accountCode1, accountDetail, myStockInfo);
					accountDetailService.insertAccountDetail(accountDetail);
				}
			}else{//실계정인경우
				if (accountCode1.getAcCode().equals("RCASH") ||
					accountCode1.getAcCode().equals("RSTOC")){
						
					setAccountDetailInfo(myStockInfo, accountCode1, accountDetail); //주식정보상태변경
					 
			 	    //발런스정보 변경처리  
					accountCodeService.updateAccountCode(accountCode1);
					
					//3.주식이력 입출력 금액 이력을 등록
					setAccountDetailDftInfo(accountCode1, accountDetail, myStockInfo);
					accountDetailService.insertAccountDetail(accountDetail);
				}
			}
			
		}  
		
			
		
	}


	//계정등록처리 처리
	private void setAccountDetailInfo(MyStock myStockInfo,
			AccountCode accountCode1, AccountDetail accountDetail) {
		String sbAmt;
		System.out.println("양정화 : STEP 2 > "+accountCode1);
		sbAmt = accountCode1.getBalance();
		
		//:::::매수시 주식계좌에는 가상현금은 지출, 가상주식은 수입:::::
		/*1. UI_ACCOUNT_CODE_HIST -주식계정 발런스 이전정보 이력생성 insert
		  2. UI_ACCOUNT_CODE      -현재 정보 발런스 정보 update
		  3. UI_ACCOUNT_DETAIL    -주식이력 입출력 금액 이력을 등록
		 * */
		
		//1. 이력생성
		accountCodeHistService.insertAccountCodeHist(accountCode1);
		
		//2.현재 정보 발런스 정보 update
		//TO-DO
		  /*private String balance         ;
		  private String chgCd           ; //SC등록, 상태변경
		  private String chgDate         ;
		  private String chgMessage      ;*/
		  
		  
		int iOldBalance = Integer.parseInt(onlyNumber(accountCode1.getBalance())); //기존 발란스
		int iSaleAmt    = 0;
		int iSaleCount  = 0;
		 
		 
		int iNewBalance = 0;
		 /*BR:실 매수 , SV:가 매도-시뮬레이션 상태인경우 상태인 경우 계산처리 */
		if (myStockInfo.getScStatCd().substring(0,1).equals("B") ){// 매수
			 iSaleAmt    = (int) myStockInfo.getBuyRAmt();
			 iSaleCount  = Integer.parseInt(myStockInfo.getBuyRCount());
			 iSaleAmt    = (iSaleAmt*iSaleCount);
			 if (accountCode1.getAcCode().equals("VCASH")){
				  
				 iNewBalance = iOldBalance - iSaleAmt;
				 accountDetail.setOutgoAmt(iSaleAmt+""); 
				 accountCode1.setChgMessage("[매수]현금-발런스정보 시뮬레이션경우 현금 차감."); 
			 }else if (accountCode1.getAcCode().equals("VSTOC")){
				 iNewBalance = iOldBalance + iSaleAmt;
				 accountDetail.setIncomeAmt(iSaleAmt+""); 
				 accountCode1.setChgMessage("[매수]주식-발런스정보 시뮬레이션경우 주식 증가."); 
			 }else  if (accountCode1.getAcCode().equals("RCASH")){
				 iNewBalance = iOldBalance - iSaleAmt;
				 accountDetail.setOutgoAmt(iSaleAmt+""); 
				 accountCode1.setChgMessage("[매수]현금-발런스정보 실시간 현금 차감."); 
			 }else if (accountCode1.getAcCode().equals("RSTOC")){
				 iNewBalance = iOldBalance + iSaleAmt;
				 accountDetail.setIncomeAmt(iSaleAmt+""); 
				 accountCode1.setChgMessage("[매수]주식-발런스정보 실시간  주식 증가."); 
			 }
		   
		} else if (myStockInfo.getScStatCd().substring(0,1).equals("S")){//매도
			 if (myStockInfo.getScStatCd().equals("SV")){
				 iSaleAmt    = (int) myStockInfo.getSaleVAmt();
				 iSaleCount  = Integer.parseInt(myStockInfo.getSaleVCount());
			 }else if(myStockInfo.getScStatCd().equals("SR")){
				 iSaleAmt    = (int) myStockInfo.getSaleRAmt();
				 iSaleCount  = Integer.parseInt(myStockInfo.getSaleRCount());
			 }
			 
			 iSaleAmt    = (iSaleAmt*iSaleCount);
			 
			 if (accountCode1.getAcCode().equals("VCASH")){
				 iNewBalance = iOldBalance + iSaleAmt;
				 accountDetail.setIncomeAmt(iSaleAmt+""); 
				 accountCode1.setChgMessage("[매도]현금-발런스정보 시뮬레이션경우 현금 증가."); 
			 }else if (accountCode1.getAcCode().equals("VSTOC")){
				 iNewBalance = iOldBalance - iSaleAmt;
				 accountDetail.setOutgoAmt(iSaleAmt+""); 
				 accountCode1.setChgMessage("[매도]주식-발런스정보 시뮬레이션경우 주식 차감."); 
			 }else if (accountCode1.getAcCode().equals("RCASH")){
				 iNewBalance = iOldBalance + iSaleAmt;
				 accountDetail.setIncomeAmt(iSaleAmt+""); 
				 accountCode1.setChgMessage("[매도]현금-발런스정보 실시간 현금 증가."); 
			 }else if (accountCode1.getAcCode().equals("RSTOC")){
				 iNewBalance = iOldBalance - iSaleAmt;
				 accountDetail.setOutgoAmt(iSaleAmt+""); 
				 accountCode1.setChgMessage("[매도]주식-발런스정보 실시간 주식 차감."); 
			 }		
		}
		accountCode1.setBalance(iNewBalance+"");
		accountDetail.setBalance(iNewBalance+""); 
		 
		accountCode1.setChgCd("SC");
	}

    //개인 계정정보 디폴트 정보 생성
	private void setAccountDetailDftInfo(AccountCode accountCode1,
			AccountDetail accountDetail,
			MyStock myStockInfo) {
		/*
		  private String iduiAccountDetail;
		  private String iduiAccountCode  ;
		  private String regType1         ;
		  private String regType2         ;
		  private String regDate          ;
		  private String incomeAmt        ;//수입금액
		  private String outgoAmt         ;//지출금액
		  private String idscMyStock      ;
		  private String remark           ;*/
		
		accountDetail.setIduiAccountCode(accountCode1.getIduiAccountCode());
		accountDetail.setRegType1("REG");
		accountDetail.setRegType2("REG");
		accountDetail.setIdscMyStock(myStockInfo.getIdscMyStock());
		
		
	}

}

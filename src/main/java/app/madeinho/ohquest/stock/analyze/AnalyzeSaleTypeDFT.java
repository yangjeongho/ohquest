package app.madeinho.ohquest.stock.analyze;

import java.util.List;

import app.madeinho.ohquest.stock.day.StockDay;
import app.madeinho.ohquest.stock.mystock.MyStock;
import app.madeinho.ohquest.stock.policy.ScPolicy;
import app.madeinho.ohquest.ui.message.Message;


public class AnalyzeSaleTypeDFT extends AnalyzeSaleTypeCom{
	
	
	/**
	 * WebPageReadUTIL
	 * |-AnalyzeSaleTypeCom
	 *   |-AnalyzeSaleTypeDFT
	 * @판매정보 관리 - 디폴트 분석처리 공통함수
	 *  
	 *  정책에 따라 관련 서비스 정보가 존재하는 경우 확인 체크
	 *   :: 조건 디폴트인경우 무조건 정책의 적용된 상태 값을 읽어서 상태를 처리함.             
	 *                
	 */
	public Message getAnalyzeSaleInfo(MyStock myStockInfo) {	

		//상속 메소드의 함수에서 해당 사이트의 주식 시세정보를 StockDay Domain에 값을 Set
		this.setmSReadURL(myStockInfo.getRealStockURL()); //읽을 URL코드
		this.getURLInfo(); //공통 Document의 값을 Set 현재 주식정보를 조회해옴.
		this.getUrlDocNaverRealSi();  //HTML의 정보를 읽어 현재 시가정보를 읽음.(2015.1.9일부터 읽지못함)
		//this.getUrlDocDaumRealSi();  //HTML의 정보를 읽어 현재 시가정보를 읽음.(다음정보조회)
		
	
		//리턴처리함 메시지
		Message message = new Message();
		
		setDefaultMsg(message,myStockInfo);
		
		//정책의 메세지를 구성하여 관리함.
		//해당 주식의 정책의 상한가가 존재하는지 확인
		ScPolicy scPolicy = new ScPolicy();
		if (myStockInfo.getScPolicyList().size()>0){
		   scPolicy = myStockInfo.getScPolicyList().get(0);
		}
		
		//분석시작 :: 현재가 , 요청가를 비교처리함.
		System.out.println("MYYANG0 : scPolicy > " +scPolicy);

		
		String sUnitType = scPolicy.getPocyUnit();
		int dReqStUpAmt = 0;    //정책의정한 상한요청금액
		int dReqStDownAmt = 0;  //정책의정한 하한요청금액
		int dReqStUpCritical = 0;    //정책의정한 상한임계치요청금액
		int dReqStDownCritical = 0;  //정책의정한 하한임계치요청금액

		int dRecommandAmt = 0; //최초요청금액
		int icount = 0;
		String stitle = "";
		
		//실시간여부
		if (myStockInfo.getJobType().equals("S")){
			stitle += "[시뮬]";	
		}else{
			stitle += "[실시간]";
		}
		
		
		if (myStockInfo.getScStatCd().equals("BV")){ //매수요청
			stitle += "[매수분석]"+"["+myStockInfo.getScCode()+"]"+myStockInfo.getScName()+"-\n";
			dRecommandAmt = (int)myStockInfo.getBuyVAmt(); //최초요청금액
			icount = Integer.parseInt(myStockInfo.getBuyVCount());

		}else{
			stitle += "[매도분석]"+"["+myStockInfo.getScCode()+"]"+myStockInfo.getScName()+"-\n";
			dRecommandAmt = (int)myStockInfo.getSaleVAmt(); //매도요청금액
			icount = Integer.parseInt(myStockInfo.getSaleVCount());
		}
		

		
		if (sUnitType.equals("P")){ //퍼센트
			
			 double  tempAmt1 = Integer.parseInt(onlyNumber(scPolicy.getPocyUpValue()));
			 double tempAmt2 = Integer.parseInt(onlyNumber(scPolicy.getPocyDownValue()));
			
			 double tempAmt3 = Integer.parseInt(onlyNumber(scPolicy.getPocyUpCritical()));
			 double tempAmt4 = Integer.parseInt(onlyNumber(scPolicy.getPocyDownCritical()));
			
			//결정상한요청금액 ::매수등록 
			 dReqStUpAmt   =  dRecommandAmt + (int)( dRecommandAmt *(tempAmt1/100));

			 //결정하한요청금액 ::매수최소
			dReqStDownAmt = dRecommandAmt - (int)( dRecommandAmt *(tempAmt2/100));
			
			//임계치 상항값 적용
			dReqStUpCritical   =(int)( dRecommandAmt *(tempAmt3/100));

			//임계치 하항값 적용
			dReqStDownCritical = (int)(dRecommandAmt *(tempAmt4/100));
			
			
		} else if (sUnitType.equals("C")){ //금액
			
		}
		
		//현재가 비교 :getStockDayList :: 현재 시세정보의 최초정보를 읽음.
		StockDay stockDayInfo = new StockDay();
		
		if (getStockDayList().size() > 0){
		   stockDayInfo = getStockDayList().get(0);
		}
		

		System.out.println("MYYANG0 : stockDayInfo > " +stockDayInfo);
		System.out.println("MYYANG0 : getScStatCd > " +myStockInfo.getScStatCd());
		
		//매수메시지처리
		if (myStockInfo.getScStatCd().equals("BV")){
			stitle = makeMessageBV(myStockInfo, message, scPolicy, dReqStUpAmt,
					dReqStDownAmt, dReqStUpCritical, dReqStDownCritical,
					dRecommandAmt, stockDayInfo, stitle, icount);
		}else{//매도메시지 처리
			stitle = makeMessageSV(myStockInfo, message, scPolicy, dReqStUpAmt,
					dReqStDownAmt, dReqStUpCritical, dReqStDownCritical,
					dRecommandAmt, stockDayInfo, stitle, icount);
		}
		
		//메시지적용
		message.setMessage(stitle);
		
		System.out.println("MYYANG0 : message > " +message);
		
		//dReqStUpAmt
		
		//saleAmt
	    return message;
	}

	//매수메시지를 생성처리함.
	private String makeMessageBV(MyStock myStockInfo, Message message,
			ScPolicy scPolicy, int dReqStUpAmt, int dReqStDownAmt,
			int dReqStUpCritical, int dReqStDownCritical, int dRecommandAmt,
			StockDay stockDayInfo, String stitle, int icount) {
		
		int dRealScAmt = (int)stockDayInfo.getSaleAmt();//현재가
		System.out.println("MYYANG0 : 현재가 > " +dRealScAmt);
		
		if (dRealScAmt > 0){
			//Double dReqStAmt = getStockDayList().get(0);
			
			
			if (icount > 0){
				stitle += "\n";
				int iSamAmt = (int) (dRealScAmt * icount);
		
				stitle += "요청수랑("+icount+") 매수예상금액=" +iSamAmt ;
					
			}
			
			//금액분석 후 메시지 상태 표시.
			//SC :주식취소요청상태, SR :주식대기요청상태, SS: 주식 매매가능요청상태
			
			
			//sbMessageTemp.append(stitle);
			//요청금액이 실거래가 보다 클경우
			if ( dReqStUpAmt > dRealScAmt) {
				message.setType("SS");        //주식 매매가능요청상태
				stitle += "[실행]요청금액:"+dReqStUpAmt+"/실거래가:"+dRealScAmt;
				//actType          ; //[로직처리용]처리유형 = A:즉시실행 	, D: 미실행
				message.setActType("A"); 
				
				
			} else if ((dReqStUpAmt-dReqStUpCritical) > dRealScAmt  ){ // 요청금액 보다 시세가 높으면
				stitle += "[실행][임]요청금액:"+(dReqStUpAmt-dReqStUpCritical)+"/실거래가:"+dRealScAmt;
				message.setType("SS"); //주식 매매가능요청상태
			} else if ((dReqStDownAmt+dReqStDownCritical) < dRealScAmt  ){ //예상하항가+임계지가 실거래가보다 클경우
				stitle += "[포기][임]요청금액:"+(dReqStDownAmt+dReqStDownCritical)+"/실거래가:"+dRealScAmt;
				message.setType("SC"); //주식취소요청상태
			} else if (dReqStDownAmt < dRealScAmt  ){ //예상하항가보다 큰경우
				stitle += "[포기]요청금액:"+(dReqStDownAmt+dReqStDownCritical)+"/실거래가:"+dRealScAmt;
				message.setType("SC"); //주식취소요청상태
				//actType          ; //[로직처리용]처리유형 = A:즉시실행 	, D: 미실행
				message.setActType("A"); 
			} else {
				stitle += "[대기]요청금액:"+(dRecommandAmt)+"/실거래가:"+dRealScAmt;
				message.setType("SR"); //주식대기상태
			}
			
			//시뮬레이션인 경우 자동매도요청 판매처리 ::
			if (message.getActType().equals("A")){
				//주식상태 확인
				if (message.getType().equals("SC")){
					setAutoAction(myStockInfo, message, scPolicy, icount,
							dRealScAmt,"BC");
				} else{
					if (myStockInfo.getScStatCd().equals("BV")){ //매수요청인경우
						setAutoAction(myStockInfo, message, scPolicy, icount,
								dRealScAmt,"BR");
						
					} else if( myStockInfo.getScStatCd().equals("SV")){//매도요청인경우
						setAutoAction(myStockInfo, message, scPolicy, icount,
								dRealScAmt,"SR");
						
						
					}	
				}
				
			}
		}else{
			message.setType("SE");        ///주식분석오류
			//message.setActType("A"); 
			stitle += " [대기]매수예상금액[실거래가 조회오류]"  ;
			
		}
		return stitle;
	}
	
	//매도메시지를 생성처리함.
	private String makeMessageSV(MyStock myStockInfo, Message message,
			ScPolicy scPolicy, int dReqStUpAmt, int dReqStDownAmt,
			int dReqStUpCritical, int dReqStDownCritical, int dRecommandAmt,
			StockDay stockDayInfo, String stitle, int icount) {
		
		int dRealScAmt = (int)stockDayInfo.getSaleAmt();//현재가
		System.out.println("MYYANG0 : 매도 현재가 > " +dRealScAmt);
		
		if (dRealScAmt > 0){
			//Double dReqStAmt = getStockDayList().get(0);
			
			
			if (icount > 0){
				stitle += "\n";
				int iSamAmt = (int) (dRealScAmt * icount);
		
				stitle += "요청수랑("+icount+") 매도예상금액=" +iSamAmt ;
					
			}
			
			//금액분석 후 메시지 상태 표시.
			//SC :주식취소요청상태, SR :주식대기요청상태, SS: 주식 매매가능요청상태
			
			
			//sbMessageTemp.append(stitle);
			//요청금액이 실거래가 보다 클경우
			if ( dReqStUpAmt < dRealScAmt ) {
				message.setType("SS");        //주식 매매가능요청상태
				stitle += "[실행]요청금액:"+dReqStUpAmt+"/실거래가:"+dRealScAmt;
				//actType          ; //[로직처리용]처리유형 = A:즉시실행 	, D: 미실행
				message.setActType("A"); 
				
				
			} else if ((dReqStUpAmt-dReqStUpCritical) < dRealScAmt  ){ // 요청금액 보다 시세가 높으면
				stitle += "[실행][임]요청금액:"+(dReqStUpAmt-dReqStUpCritical)+"/실거래가:"+dRealScAmt;
				message.setType("SS"); //주식 매매가능요청상태
			} else if ((dReqStDownAmt+dReqStDownCritical) > dRealScAmt  ){ //예상하항가+임계지가 실거래가보다 클경우
				stitle += "[포기][임]요청금액:"+(dReqStDownAmt+dReqStDownCritical)+"/실거래가:"+dRealScAmt;
				message.setType("SC"); //주식취소요청상태
			} else if (dReqStDownAmt > dRealScAmt  ){ //예상하항가보다 큰경우
				stitle += "[포기]요청금액:"+(dReqStDownAmt+dReqStDownCritical)+"/실거래가:"+dRealScAmt;
				message.setType("SC"); //주식취소요청상태
				//actType          ; //[로직처리용]처리유형 = A:즉시실행 	, D: 미실행
				message.setActType("A"); 
			} else {
				stitle += "[대기]요청금액:"+(dRecommandAmt)+"/실거래가:"+dRealScAmt;
				message.setType("SR"); //주식대기상태
			}
			
			//시뮬레이션인 경우 자동매도요청 판매처리 ::
			if (message.getActType().equals("A")){
				//주식상태 취소
				if (message.getType().equals("SC")){
					setAutoAction(myStockInfo, message, scPolicy, icount,
							dRealScAmt,"SC");
				} else{
					if (myStockInfo.getScStatCd().equals("BV")){ //매수요청인경우
						setAutoAction(myStockInfo, message, scPolicy, icount,
								dRealScAmt,"BR");
						
					} else if( myStockInfo.getScStatCd().equals("SV")){//매도요청인경우
						setAutoAction(myStockInfo, message, scPolicy, icount,
								dRealScAmt,"SR");
						
						
					}	
				}
				
			}
		}else{
			message.setType("SE");        ///주식분석오류
			//message.setActType("A"); 
			stitle += " [대기]매도예상금액[실거래가 조회오류]"  ;
			
		}
		return stitle;
	}

	//자동 변경 서비스 정보 설정
	private void setAutoAction(MyStock myStockInfo, Message message,
			ScPolicy scPolicy, int icount, int dRealScAmt, String sActCode) {
		////code 관리 - SCSTATCD : 상태코드	  WR : wish 리스트 등록	  WC : 취소	  BV:가 매수	  BR:실 매수	  BC: 매수 취소	  SV:가 매도	  SR:실 매도
		if (message.getType().equals("SS")){

			
			//정책에서 자동으로 생성한 매도 판매정책을 등록
			myStockInfo.setSaleType(scPolicy.getAutoActCode()); //자동매도정책
			
			//매도요청정보생성 자동생성처리
			//해당판매정책 조회처리 ::매도요청금액 계산
			ScPolicy scPolicyAct = new ScPolicy();
			int iSaleAmt = 0;
			if (scPolicy != null){
				//scPolicyAct = myStockInfo.getScPolicyListActCode().get(0);
				//퍼센트율로 계산함.
				iSaleAmt =  dRealScAmt + ( dRealScAmt * (Integer.parseInt(scPolicy.getPocyUpValue())/100));
			}
			
			if (myStockInfo.getScStatCd().equals("BV")){ //매수요청인경우
				//매수완료 
				myStockInfo.setScStatCd(sActCode); //가 매도요청상태변경
				myStockInfo.setBuyRCount(icount+"");
				myStockInfo.setBuyRAmt(dRealScAmt);
				//가 매도정보 설정
				myStockInfo.setSaleVCount(icount+"");
				myStockInfo.setSaleVAmt(iSaleAmt);
				
			}else{
				//매수완료 
				myStockInfo.setScStatCd(sActCode); //가 매도요청상태변경
				//매도완료정보 설정
				myStockInfo.setSaleRCount(icount+"");
				myStockInfo.setSaleRAmt(iSaleAmt);			
			}

			
		} else if (message.getType().equals("SC")){
			//매도취소
			myStockInfo.setScStatCd(sActCode); //BC: 매수 취소
			
		}
	}

	private void setDefaultMsg(Message message, MyStock myStockInfo) {
		//private String type             ; 
		message.setIdscMyStock(Integer.parseInt(myStockInfo.getIdscMyStock())); //주식정보이기때문에
		message.setIdohMember(myStockInfo.getIdohMember()); //사용자정보
		message.setSendIdohMember("2"); //시스템에서 사용자에게 전달
		message.setStatusCode("R");  //최초등록상태
		message.setReadYn("N"); //읽었는지 확인여부
		message.setActType("N"); //D: 미실행
		
	}
	
	/**
	 * 
	 * 네이버의 상한가 리스트 조회함.             
	 *                
	 */
	public List<MyStock>  getAnalyzeSaleNaverUpList(String sNaverUpURL) {	

		//상속 메소드의 함수에서 해당 사이트의 주식 시세정보를 StockDay Domain에 값을 Set
		this.setmSReadURL(sNaverUpURL); //읽을 URL코드
		this.getURLInfo(); //공통 Document의 값을 Set 현재 주식정보를 조회해옴.
		List<MyStock> myStocks = this.getUrlDocNaverUpList();  //HTML의 정보를 읽어 현재 시가정보를 읽음.(2015.1.9일부터 읽지못함)
		
		
		return myStocks;
		
		
	
	}

	
}

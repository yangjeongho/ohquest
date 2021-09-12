package app.madeinho.ohquest.stock.analyze;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.HttpResponseException;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.BasicResponseHandler;
import org.apache.http.impl.client.DefaultHttpClient;
import org.castor.core.util.StringUtil;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import app.madeinho.ohquest.co.code.CodeService;
import app.madeinho.ohquest.co.code.domain.LookupCode;
import app.madeinho.ohquest.common.domain.searchFilter.SearchFilter;
import app.madeinho.ohquest.common.util.OhquestUtil;
import app.madeinho.ohquest.stock.day.StockDay;
import app.madeinho.ohquest.stock.mystock.MyStock;
import app.madeinho.ohquest.stock.mystock.MyStockService;
import app.madeinho.ohquest.stock.policy.ScPolicy;
import app.madeinho.ohquest.stock.policy.ScPolicyService;


@Service
@Transactional
public class AnalyzeSiteServiceImpl implements AnalyzeSiteService {
	
	private static final Logger logger1 = LoggerFactory.getLogger(AnalyzeSiteServiceImpl.class);
	@Autowired	CodeService codeService;
	@Autowired	MyStockService myStockService;
	@Autowired	ScPolicyService scPolicyService;	
	@Autowired	AnalyzePolicySiteService analyzePolicySiteService;
	
	String GgetCodeId = "";
	List<StockDay> stockdayImsi = new ArrayList<StockDay>(); 
	
	/**
	* {@inheritDoc}
	*/
	@Override
	public List<StockDay> getQuestList(String getURL) {
		
		//네이버등 정보를 GET
		LookupCode lookupCode = new LookupCode();
		lookupCode.setLanguage("ALL");
		lookupCode.setCodeGroup("ADDSITE");
		
		List<LookupCode> lookupCodes   = codeService.getCodeList(lookupCode);
		
		//System.out.println("code etc>>>>"+codes);
		//}
		//List<Code> codes = codeService.getCodeList("ADDSITE");
		
		List<StockDay> stockdayRet = new ArrayList<StockDay>();
		
		//System.out.println("code etc>>>>"+codes);
		     
		for (LookupCode lookupCode2 : lookupCodes) {
		//for (Code code : codes) {
			 //System.out.println("code etc>>>>"+code.getEtcInfo1() );
			 //OhquestUtil.getURLInfo(code.getEtcInfo1());
			getSiteInfo(lookupCode2);
			for(StockDay stockDay : stockdayImsi){
				stockdayRet.add(stockDay);	
			}
		}
		
		return stockdayRet;
		
	}

	@Override
	public void getSiteInfo(LookupCode lookupCode) {
		
		String getURL = lookupCode.getEtcInfo1();
		List<StockDay> retList = new ArrayList<StockDay>();
		
		HttpClient httpClient = new DefaultHttpClient();
		 GgetCodeId = lookupCode.getCodeId();
		HttpGet httpget = new HttpGet(getURL);
		
		 
		try {
			httpClient.execute(httpget, new BasicResponseHandler() {
				@Override
				public String handleResponse(HttpResponse response)
						throws HttpResponseException, IOException {
					// 웹페이지를 그냥 갖어오면 한글이 깨져요. 인코딩 처리를 해야해요.
					/*String res = new String(super.handleResponse(response)
							.getBytes("8859_1"), "euc-kr");*/
					
					stockdayImsi.clear();
					
					String res = new String(super.handleResponse(response));
					
					Document doc = Jsoup.parse(res);

					Elements rowTr = doc.select("tr"); // 전체 tr 테그로 값 획득

					// table.select("td[width=65]").iterator();
					String[] items = null;
					if (GgetCodeId.equals("NAVERUP")){
					  items = new String[] { "번호","연속","누적", "종목명","현재가", "전일비", "등락율","거래량","시가" };	
					} else {
					  items = new String[] { "번호", "종목명","현재가", "전일비", "등락율","거래량","시가" };
					}
			        
					
					
					
			      	for(Element row: rowTr){
			      		 //다음 next 값이 종목이 있는경우
			      		 Elements rowSt = row.select(".no");
			      		 

			      		 
			      		 if (!rowSt.isEmpty()){
			      			    Element etd = row.select("td").first();
								Element link = row.select("a").first();
								String linkTitle = link.attr("href"); // "http://example.com/"
								
								String[] sub = linkTitle.split("=");
								//if sub.length
								linkTitle =  sub[sub.length-1];  //
								
								//String linkText = link.text(); // "example""
								
								Iterator<Element> iterElem = row.getElementsByTag("td").iterator();
								
								if (etd.attr("class").equals("no")){
						        
									String[] tempValue = new String[items.length];
									int i = 0;
									int iskip = 0;
						            for (String item : items) {
									//for(iterElem.)
						            	
							      		if (GgetCodeId.equals("NAVERUP")){
							      			if (iskip == 1 ||
							      				iskip == 2){
							      				iskip++;
							      				continue;
							      			}
							      		}else{
							      			iskip++;
							      		}
							      		
					            		tempValue[i] = iterElem.next().text();
										//String tempHtml = iterElem.next().html();
					            		// System.out.println(GgetCodeId);
										//System.out.println("TESXTsdfksdjfkd >"+tempValue[i]);
										//System.out.println("HTML >"+tempHtml);
					            		i ++;
						            }
						            System.out.println(tempValue[0]);
						            System.out.println(tempValue[1]);
						            System.out.println(tempValue[2]);
						            System.out.println(tempValue[3]);
						            System.out.println(tempValue[4]);
						            System.out.println(tempValue[5]);
						           
						            
						            /*"번호", "종목명","현재가", "전일비", "등락율","거래량","시가" 
						            TESXT >76
						            TESXT >주성엔지니어링
						            TESXT >3,665
						            TESXT >35
						            TESXT >-0.95%
						            TESXT >75,963
						            TESXT >3,700*/
						            
									StockDay stockday = new StockDay();
									stockday.setSiteRegDt("real time");
									stockday.setType(GgetCodeId);
						            stockday.setScCode(linkTitle);
						            if (GgetCodeId.equals("NAVERUP")){
						            	
							            stockday.setName(tempValue[3]); //명
							            
							            if (tempValue[4].length() >1){
										   stockday.setSiRate(Double.parseDouble(StringUtil.replaceAll(tempValue[4].trim(),",",""))); //시가
							            }
							            
						            }else{
							            stockday.setName(tempValue[1]); //명
							            
							            if (tempValue[2].length() >1){
										   stockday.setSiRate(Double.parseDouble(StringUtil.replaceAll(tempValue[2].trim(),",",""))); //시가
							            }
						            }
									//stockday.setSaleCount(tempValue[2]); //상한금액
									
									//String sTempsAmt = tempValue[2];
						            stockdayImsi.add(stockday);
						            
									   
								}
			      		 }
			      	}
			      
					return "";
				}
			});
		} catch (ClientProtocolException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}

	//매매프로세스 처리를 위한 메인 함수
	//1.SC_MY_STOCK의 가매수( BV:가 매수, SV:가 매도) 상태의 리스트를읽음
	//2.판매유형에 따라 SC_POLICY 테이블의 설정정보에 의해서  매수, 매도 처리로직
	//3.각각 상태을 1분단위로 기록처리함. UI_MESSAGE 필드에 값을 표시함. idSC_MY_STOCK
	//4.상태가 시뮬레이션인 경우 자동판매처리가 되며 UI_ACCount_Detail 테이블에 값 적용 
	
	
	@Override
	public void processStockAnalyze() {
		// TODO Auto-generated method stub
	//-----------------------------------------------//
	//STEP1. 대상조회
	//-----------------------------------------------//
		//관심종목 등록되어 있는지 조회 후 insert처리.
		SearchFilter searchFilter = new SearchFilter();
		
		String searchValue[] = {"BV','SV"};
		String searchKey[] = {"SC_STAT_CD"}; 
		searchFilter.setSearchKey(searchKey);
		searchFilter.setSearchValue(searchValue);

		List<MyStock> myStocks = myStockService.getMyStockListIN(searchFilter);
		
		//System.out.println("양정화 : myStocks Size > "+myStocks);
	    for (MyStock myStockInfo:myStocks){
	    	
	    	//디폴트값 조회 [시세조회 공통URL코드 조회 ] - 한건씩조회
	    	//네이버등 정보를 GET
			LookupCode lookupCode = new LookupCode();
			lookupCode.setLanguage("ALL");
			//lookupCode.setCodeGroup("REALSI");//메경 리스트 15분 지연건
			//lookupCode.setCodeGroup("REALDM");//다음 실시간정보조회
			lookupCode.setCodeGroup("REALNA");//네이버 실시간정보조회 (2015.01.09 읽지못함.)
			
			
			lookupCode.setSubGrp1("[SCCODE]"); //replace 대상
			lookupCode.setSubGrp2(myStockInfo.getScCode());   //replace 값
			
			String sRealStockURL = codeService.getCodeParamReplace(lookupCode);
			System.out.println("MYYANG0662 : sRealStockURL > "+sRealStockURL);
			
			myStockInfo.setRealStockURL(sRealStockURL);
	    	
	    	//해당판매정책 조회처리
			ScPolicy scPolicySel = new ScPolicy();

			if (myStockInfo.getScStatCd().equals("BV")){ //가매수:BV
				scPolicySel.setCodeId(myStockInfo.getBuyType());
			}else{                                       //가매도:SV
				scPolicySel.setCodeId(myStockInfo.getSaleType());
			}

			List<ScPolicy> scPolicys = scPolicyService.getScPolicyAlltList(scPolicySel);
			
			myStockInfo.setScPolicyList(scPolicys); //해당 정책정보를 Set처리
			
			//자동판매정책조회 후 처리
			if (scPolicys.size()>0){
				ScPolicy scPolicyInfo = scPolicys.get(0);
				
				if (!OhquestUtil.isNull(scPolicyInfo.getAutoActCode()) ){
					scPolicySel.setCodeId(scPolicyInfo.getAutoActCode());
					List<ScPolicy> scPolicysSaleActCode = scPolicyService.getScPolicyAlltList(scPolicySel);
					myStockInfo.setScPolicyListActCode(scPolicysSaleActCode);
			    }
			}

			
			//판매유형에 따른 처리 : SC_MY_STOCK상태변경, UI_MESSAGE처리, UI_ACCOUNT처리
			analyzePolicySiteService.processPolicyAnalyze(myStockInfo);
			

	    }//for end
	}

}

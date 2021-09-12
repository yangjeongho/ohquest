package app.madeinho.ohquest.stock.analyze;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.castor.core.util.StringUtil;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import app.madeinho.ohquest.common.util.CmnDateUtils;
import app.madeinho.ohquest.common.util.OhquestUtil;
import app.madeinho.ohquest.common.util.WebPageReadUtil;
import app.madeinho.ohquest.stock.day.StockDay;
import app.madeinho.ohquest.stock.mystock.MyStock;


public class AnalyzeSaleTypeCom extends WebPageReadUtil{
	
		
	/**
	 * 현재 매경 : http://vip.mk.co.kr/newSt/price/price.php?stCode=005380
	 * 15~20분 지연된 시세정보임.
	 * CO_CODE : REALSI
	 * @웹 페이즈의 정보를 읽은 mSReadHTMLDoc 처리한  override 처리함수
	 * jsoup 사용하기
	 * Elements links = doc.select("a[href]"); // a with href
     * Elements pngs = doc.select("img[src$=.png]");
     * img with src ending .png
     * Element masthead = doc.select("div.masthead").first();
     * div with class=masthead
     * Elements resultLinks = doc.select("h3.r > a"); // direct a after h3
	 * el#id -> id 로 가지고 오기.
	 *	el.class -> class 로 가지고 오기.
	 *	el[attr] -> attribute 로 가지고 오기.
	 *	parent > child: parent 바로 밑의 자식 노드를 가지고 온다.
	 */
	public void getUrlDocMkList() {	
		Document doc = this.getmSReadHTMLDoc();
	
		Elements rowDiv = doc.select("div[id=contracted] tr");

		List<StockDay> tempStockDays = new ArrayList<StockDay>();
				
	  	for(Element row: rowDiv){
	  	    	 
	  		Elements rowTd = row.select("td"); // 전체 tr 테그로 값 획득
	  		
	  		 if (!rowTd.isEmpty()){
					
	  			  if (!rowTd.isEmpty()){
	  				StockDay stockDay = new StockDay(); 
	  				//시간	
					//System.out.println(rowTd.get(0).text());
					stockDay.setRegDate(rowTd.get(0).text());
					//체결가	
					String sSaleAmt = StringUtil.replaceAll(rowTd.get(1).text(),",","");
					//System.out.println(rowTd.get(1).text());
					stockDay.setSaleAmt(Double.parseDouble(sSaleAmt));
					//전일비
					//System.out.println(rowTd.get(2).text());
					String sTempsAmt = rowTd.get(2).text();
					//특수문자 ▲ ▼ 확인
					if (sTempsAmt.length()>1){
						String sGubun = sTempsAmt.substring(0,1); 
						if (sGubun.equals("▲")){
							sTempsAmt = onlyNumber(sTempsAmt.trim());
							stockDay.setHiRate(Double.parseDouble(sTempsAmt));
						}
						if (sGubun.equals("▼")){
							sTempsAmt = onlyNumber(sTempsAmt.trim());
							stockDay.setLowRate(Double.parseDouble(sTempsAmt));
						}
						// System.out.println(sGubun);
					}					
					
					//체결량	
					//System.out.println(rowTd.get(3).text());
					sTempsAmt = onlyNumber(rowTd.get(3).text());
					stockDay.setSaleCount(sTempsAmt);
					//거래량
                    //System.out.println(rowTd.get(4).text());
					sTempsAmt = onlyNumber(rowTd.get(4).text());
					stockDay.setSaleTotCount(sTempsAmt);
					
					tempStockDays.add(stockDay);
					
	  			  }	

	  		 }
	  	}
	  	
	  	//qns
	  	//this.stockDayList = tempStockDays;
	    super.setStockDayList(tempStockDays);
	    
      }
	
	/**
	 * 다음정보 : http://m.finance.daum.net/m/item/main.daum?code=035720
	 * http://m.finance.daum.net/m/item/main.daum?code=[SCCODE]
	 * CO_CODE : REALDM
	 * 실시간 시세정보임.
	 * 
	 * @웹 페이즈의 정보를 읽은 mSReadHTMLDoc 처리한  override 처리함수
	 * jsoup 사용하기
	 * Elements links = doc.select("a[href]"); // a with href
     * Elements pngs = doc.select("img[src$=.png]");
     * img with src ending .png
     * Element masthead = doc.select("div.masthead").first();
     * div with class=masthead
     * Elements resultLinks = doc.select("h3.r > a"); // direct a after h3
	 * el#id -> id 로 가지고 오기.
	 *	el.class -> class 로 가지고 오기.
	 *	el[attr] -> attribute 로 가지고 오기.
	 *	parent > child: parent 바로 밑의 자식 노드를 가지고 온다.
	 */
	public void getUrlDocDaumRealSi() {	
		Document doc = this.getmSReadHTMLDoc();
	
		Elements rowDivSp = doc.select("div[class=item_idx_info stUp] span");

		List<StockDay> tempStockDays = new ArrayList<StockDay>();
		
		if (!rowDivSp.isEmpty()){
			System.out.println(rowDivSp.get(0).text());
			
			StockDay stockDay = new StockDay();
			
			//시간 ::현재시간	
			Date currentTime = new Date ( );
			stockDay.setRegDate(new CmnDateUtils().getStrDateFormat(currentTime));
			
			//체결가	
			String sSaleAmt = StringUtil.replaceAll(rowDivSp.get(2).text(),",","");
			//System.out.println(rowTd.get(1).text());
			stockDay.setSaleAmt(Double.parseDouble(sSaleAmt));
			
			//전일비
			//System.out.println(rowTd.get(2).text());
			String sTempsAmt = rowDivSp.get(3).text();
			//특수문자 ▲ ▼ 확인
			if (sTempsAmt.length()>1){
				String sGubun = sTempsAmt.substring(0,1); 
				if (sGubun.equals("▲")){
					sTempsAmt = onlyNumber(sTempsAmt.trim());
					stockDay.setHiRate(Double.parseDouble(sTempsAmt));
				}
				if (sGubun.equals("▼")){
					sTempsAmt = onlyNumber(sTempsAmt.trim());
					stockDay.setLowRate(Double.parseDouble(sTempsAmt));
				}
				// System.out.println(sGubun);
			}					
			
			//체결량	
			//System.out.println(rowTd.get(3).text());
			//sTempsAmt = onlyNumber(rowDivSp.get(3).text());
			//stockDay.setSaleCount(sTempsAmt);
			//거래량
            //System.out.println(rowTd.get(4).text());
			//sTempsAmt = onlyNumber(rowDivSp.get(4).text());
			//stockDay.setSaleTotCount(sTempsAmt);
			
			tempStockDays.add(stockDay);
			
		}
				
	    //this.stockDayList = tempStockDays;
	    super.setStockDayList(tempStockDays);
	    
      }
	
	/**
	 * 네이버정보 : http://m.stock.naver.com/item/index.nhn?code=[SCCODE]
	 * http://m.finance.daum.net/m/item/main.daum?code=[SCCODE]
	 * 네이버 사이트 개편 : 2015.01.09 
	 * http://finance.naver.com/item/main.nhn?code=[SCCODE]
	 * CO_CODE : REALNA
	 * 실시간 시세정보임.
	 * 
	 * @웹 페이즈의 정보를 읽은 mSReadHTMLDoc 처리한  override 처리함수
	 * jsoup 사용하기
	 * Elements links = doc.select("a[href]"); // a with href
     * Elements pngs = doc.select("img[src$=.png]");
     * img with src ending .png
     * Element masthead = doc.select("div.masthead").first();
     * div with class=masthead
     * Elements resultLinks = doc.select("h3.r > a"); // direct a after h3
	 * el#id -> id 로 가지고 오기.
	 *	el.class -> class 로 가지고 오기.
	 *	el[attr] -> attribute 로 가지고 오기.
	 *String name = link.attr("href");
	 *	parent > child: parent 바로 밑의 자식 노드를 가지고 온다.
	 */
	public void getUrlDocNaverRealSi() {	
		Document doc = this.getmSReadHTMLDoc();
	
		//Elements rowDiv = doc.select("div[class=total_lst] li");
		Elements rowDiv = doc.select("div[id=content] dl");

		List<StockDay> tempStockDays = new ArrayList<StockDay>();
		
		//System.out.println(rowSt.get(0).text());		
		
		if (!rowDiv.isEmpty()){
			
			Elements rowdd = rowDiv.select("dd"); 
			
			System.out.println(rowdd.get(0).text());
			
			StockDay stockDay = new StockDay();
			
			//시간 ::현재시간	
			Date currentTime = new Date ( );
			stockDay.setRegDate(new CmnDateUtils().getStrDateFormat(currentTime));
			
			//체결가	
			String sSaleAmt = onlyNumber(rowdd.get(0).text());
			System.out.println("현재가이 어떻게 될까요>"+sSaleAmt);
			//System.out.println(rowTd.get(1).text());
			stockDay.setSaleAmt(Double.parseDouble(sSaleAmt));
			
			//전일비
			//System.out.println(rowTd.get(2).text());
			/*String sTempsAmt = rowDiv.get(3).text();
			//특수문자 ▲ ▼ 확인
			if (sTempsAmt.length()>1){
				String sGubun = sTempsAmt.substring(0,1); 
				if (sGubun.equals("▲")){
					sTempsAmt = onlyNumber(sTempsAmt.trim());
					stockDay.setHiRate(Double.parseDouble(sTempsAmt));
				}
				if (sGubun.equals("▼")){
					sTempsAmt = onlyNumber(sTempsAmt.trim());
					stockDay.setLowRate(Double.parseDouble(sTempsAmt));
				}
				// System.out.println(sGubun);
			}		*/			
			
			//체결량	
			//System.out.println(rowTd.get(3).text());
			//sTempsAmt = onlyNumber(rowDivSp.get(3).text());
			//stockDay.setSaleCount(sTempsAmt);
			//거래량
            //System.out.println(rowTd.get(4).text());
			//sTempsAmt = onlyNumber(rowDivSp.get(4).text());
			//stockDay.setSaleTotCount(sTempsAmt);
			
			tempStockDays.add(stockDay);
			
		}
				
	    //this.stockDayList = tempStockDays;
	    super.setStockDayList(tempStockDays);
	    
      }	
	
	//네이버의 상한가 정보를 조회함.
	public List<MyStock> getUrlDocNaverUpList() {	
		Document doc = this.getmSReadHTMLDoc();
		
		List<MyStock> myStocks =  new ArrayList<MyStock>();;
	
		//Elements rowDiv = doc.select("div[class=total_lst] li");
		Elements rowTr= doc.select("div[class=box_type_l] tr");

		//List<StockDay> tempStockDays = new ArrayList<StockDay>();
		
		//System.out.println(rowTr.text());		
		
		for(Element row: rowTr){
			
			Elements rowTds = row.select("td");
			
			//System.out.println(rowTd.text());	
			if (!OhquestUtil.isNull(rowTds.text())){
				MyStock myStock = new MyStock(); 
				
				String sTempString[] = {"",""};
				//System.out.println(rowTds.get(0).text());  //23
				//System.out.println(rowTds.get(1).text());  //1
				//System.out.println(rowTds.get(2).text());  //2
				//System.out.println(rowTds.get(3).text());  // 대호피앤씨우
				//System.out.println(rowTds.get(3));
				Elements rowA = rowTds.get(3).select("a[href]");
				
				//String sTempCode = rowTds.get(3).toString();
				String name = rowA.attr("href");
				String[] sub = name.split("=");
				
				//System.out.println("HREF>>>>>"+sub[1]);
				//System.out.println(rowTds.get(4).text());  //661
				//System.out.println(rowTds.get(5).text());  //86
				//System.out.println(rowTds.get(6).text());  //+14.96%
				
				myStock.setScName(rowTds.get(3).text());
				myStock.setScCode(sub[1]);
				myStock.setiContCnt(Integer.parseInt(rowTds.get(1).text()));
				myStock.setiSumCnt(Integer.parseInt(rowTds.get(2).text()));
				
				myStock.setIdohMember("1"); //user default set
				myStock.setBuyVAmt(Double.parseDouble(StringUtil.replaceAll(rowTds.get(4).text(),",",""))); //예상금액
				myStock.setBuyVCount("1"); //1건만 신청
				myStock.setScStatCd("WR"); //관심종목 등록
				myStock.setJobType("S");//시뮬레이션
				myStock.setRemark("상한가 매매 테스트 - 데몬처리용");
				
				
				myStocks.add(myStock);
				
			
			}
					
			//System.out.println(rowTd.get(1).text());
		}
		
		System.out.println(myStocks);	
	
		return myStocks;
      }	

	
}

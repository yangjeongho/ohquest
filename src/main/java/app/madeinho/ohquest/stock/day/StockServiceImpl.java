package app.madeinho.ohquest.stock.day;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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

//import com.acube.unitel.common.domain.pagination.Pagination;
//import com.acube.unitel.common.exception.AcubeException;
//import com.acube.unitel.common.util.CsvReader;


@Service
@Transactional
public class StockServiceImpl implements StockService {
	
	private static final Logger logger1 = LoggerFactory.getLogger(StockServiceImpl.class);
	
	
	@Autowired StockRepository stockRepository;
	@Autowired	CodeService codeService;
	



	@Override
	public int saveStock() {
		LookupCode lookupCode = new LookupCode();
		lookupCode.setLanguage("ALL");
		lookupCode.setCodeGroup("SCSITE");
		
		//2015.03.17매경에서 다음으로 변경함.
		//http://finance.daum.net/quote/all.daum : 코스피
		//http://finance.daum.net/quote/all.daum?type=U&stype=Q : 코스닥
				
		//Cache cache = cacheManager.getCache("codeCache");
		//Element element = cache.get(cacheName);
		/*Map<String, List<LookupCode>> map = (Map<String, List<LookupCode>>) element.getValue() ;
		List<LookupCode> lookupCodes = codeService.getCodeList(lookupCode);
		map.put(lookupCode.getCodeGroup(), lookupCodes);*/
		
		//this.codeCache.put(new Element("codeList", map));		
		//lookupCode.setLanguage(lang);
		List<LookupCode> lookupCodes   = codeService.getCodeList(lookupCode);
		
		//System.out.println("code etc>>>>"+codes);
		
		for (LookupCode lookupCode2 : lookupCodes) {
			 //System.out.println("code etc>>>>"+code.getEtcInfo1() );
			 //OhquestUtil.getURLInfo(code.getEtcInfo1());
			 //saveURLInfoMk(lookupCode2.getEtcInfo1());//2015.03.17 매경에서 자꾸 누락되는 주식종목이 발생해서 다음으로 변경
			 saveURLInfoDaum(lookupCode2.getEtcInfo1());

		}
		
		//TestSaveURLInfo("http://vip.mk.co.kr/newSt/rate/item_all.php");
		
		return 0;
	}

	@Override
	public int saveURLInfoDaum(String getURL) {
		List<StockDay> retList = new ArrayList<StockDay>();
		
		List<String> retList2 = new ArrayList<String>();
		

		try {
			Document doc = Jsoup.connect(getURL).get();
			
			Elements rowTr = doc.select("tr"); // 전체 tr 테그로 값 획득
			Date now = new Date();
			DateFormat formatter ;
	        formatter = new SimpleDateFormat("yyyyMMddHHmmss");
	        String rDay = formatter.format(now);
	        
			  
			for(Element e: rowTr){
				//el.class
				Elements rowTd = e.select("td"); 
				
				//Elements rowA = e.get(0).select("a[href]");
				if (!rowTd.isEmpty()){
				   int iCount =	rowTd.size();
				  //System.out.println(rowTd.get(0).attr("class"));
				  if (rowTd.get(0).attr("class").equals("txt")){
					  /*
					  <td class="txt"><a href="/item/main.daum?code=060720" target="_top">KH바텍</a></td>
						<td class="num">31,100</td>
						<td class="num dtRbdGray"><span class="	cDn">-0.80%</span></td>*/
					  
					    //System.out.println(rowTd.get(0).text());  //대호피앤씨우
						//System.out.println(rowTd.get(1).text());  //시가
						//System.out.println(rowTd.get(2).text());  //증감
						
						Elements rowA = rowTd.get(0).select("a[href]");
						String name = rowA.attr("href");
						String[] sub = name.split("=");
						String sScName = rowTd.get(0).text();
						String sAmt    = rowTd.get(1).text();
					    String sTempsAmt = rowTd.get(2).text();//-0.80%
						
						insertStockday(rDay, sub, sScName, sAmt, sTempsAmt);
						
						if (iCount>4){
							
							Elements rowB = rowTd.get(3).select("a[href]");
							name = rowB.attr("href");
							sub = name.split("=");
							sScName = rowTd.get(3).text();
							sAmt    = rowTd.get(4).text();
						    sTempsAmt = rowTd.get(5).text();//-0.80%
							
							insertStockday(rDay, sub, sScName, sAmt, sTempsAmt);		
							
						}
				  }
				}
			}
		
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  
	 
		return 0;
	}

	private void insertStockday(String rDay, String[] sub, String sScName,
			String sAmt, String sTempsAmt) {
		StockDay stockday = new StockDay();
		
		  
		stockday.setSiteRegDt(rDay);
		stockday.setType("DaumSITE");
		stockday.setScCode(sub[1]);            //종목코드
		stockday.setName(sScName); //명
		stockday.setSiRate(Math.round(Double.parseDouble(StringUtil.replaceAll(sAmt,",","")))); //시가

               
		
		//특수문자 ▲ ▼ 확인
		if (sTempsAmt.length()>1){
			String sGubun = sTempsAmt.substring(0,1); 
			if (sGubun.equals("+")||sGubun.equals("↑")){
				sTempsAmt = StringUtil.replaceAll(sTempsAmt.trim(),"+","");
				sTempsAmt = StringUtil.replaceAll(sTempsAmt.trim(),"%","");
				sTempsAmt = StringUtil.replaceAll(sTempsAmt.trim(),",","");
				Double dSumUpPrice = (Double.parseDouble(sTempsAmt)/100) * stockday.getSiRate();
				stockday.setHiRate(Math.round(dSumUpPrice));
			}
			if (sGubun.equals("-")||sGubun.equals("↓")){

				sTempsAmt = StringUtil.replaceAll(sTempsAmt.trim(),"-","");
				sTempsAmt = StringUtil.replaceAll(sTempsAmt.trim(),"%","");
				sTempsAmt = StringUtil.replaceAll(sTempsAmt.trim(),",","");
				Double dSumLowPrice =( Double.parseDouble(sTempsAmt)/100) * stockday.getSiRate();
			    stockday.setLowRate(Math.round(dSumLowPrice));
				
			}
		
		}

		//저장처리
		//System.out.println(stockday); 
		if (stockRepository.getCountRegDataScCode(stockday)==0){
			stockRepository.addStockDay(stockday);	
		}
	}


	@Override
	public int saveURLInfoMk(String getURL) {
		List<StockDay> retList = new ArrayList<StockDay>();
		
		retList.clear();
		
		// DB조회
		//System.out.println("양정화 : STEP 1");
		//List<StockDay> retList = new List();
		// List<StockDay> mList = new List<StockDay>();
		 
	
		/*boolean skip = false ;
		for (Code code : Codes) {
				skip = true ;
				tmp.add(code);
		}
		return tmp;*/
			
		
		HttpClient httpClient = new DefaultHttpClient();
		HttpGet httpget = new HttpGet(getURL);
		
		
		//System.out.println("양정화 : STEP 2");
		try {
			//System.out.println("양정화 : STEP 3");
			httpClient.execute(httpget, new BasicResponseHandler() {
				@Override
				public String handleResponse(HttpResponse response)
						throws HttpResponseException, IOException {
					// 웹페이지를 그냥 갖어오면 한글이 깨져요. 인코딩 처리를 해야해요.
					String res = new String(super.handleResponse(response)
							.getBytes("8859_1"), "euc-kr");
					Document doc = Jsoup.parse(res);

					 //System.out.println("양정화 : STEP 4");

					
					/*Document doc = Jsoup.connect("http://example.com")
  .data("query", "Java")
  .userAgent("Mozilla")
  .cookie("auth", "token")
  .timeout(3000)
  .post();
  
  		//2015.03.17매경에서 다음으로 변경함.
		//http://finance.daum.net/quote/all.daum : 코스피
		//http://finance.daum.net/quote/all.daum?type=U&stype=Q : 코스닥
		 * 
					 * */
					Elements rowTr = doc.select("tr"); // 전체 tr 테그로 값 획득

					Elements selTime = doc
							.select("span[id=mystockThisTimevalue]");
					//Elements row2 = doc.select("td[width=60]");
					//Elements row3 = doc.select("td[width=40]");
					// td width='92'

					String sRetTime = StringUtil.replaceAll(selTime.text(), ":", "");
					sRetTime = StringUtil.replaceAll(sRetTime, ".", "");
					sRetTime = StringUtil.replaceAll(sRetTime, " ", "").substring(0, 8);
					Date date = new Date();
					SimpleDateFormat format = new SimpleDateFormat("yyyy");
					sRetTime = format.format(date)+""+sRetTime;

					//동일시간의 값이 있는경우 해당 데이터를 등록하지 않음.
					int icnt = stockRepository.getCountRegData(sRetTime);
					if (icnt > 0) return ""; 
					
					// terator<Element> ite =
					// table.select("td[width=65]").iterator();
					String[] items = new String[] { "종목", "시가", "상한율" };
					/*
					 * 거래일자 종목코드 종목명 시가 고가 저가 종가 거래량 거래대금 상한여부 종료여부 조회시간
					 */
			          /*거래일자
			          종목코드
			          종목명
			          시가
			          고가
			          저가
			          종가
			          거래량
			          거래대금
			          상한여부
			          종료여부
			          조회시간*/
			          
			      	for(Element row: rowTr){
			      		 //다음 next 값이 종목이 있는경우
			      		 Elements rowSt = row.select(".st2");
			      		 
			      		 if (!rowSt.isEmpty()){
			      			    Element etd = row.select("td").first();
								Element link = row.select("a").first();
								String linkTitle = link.attr("title"); // "http://example.com/"
								
								String text = doc.body().text(); // "An example link"

								String linkText = link.text(); // "example""
								
								//System.out.println(row.text());
							//	System.out.println(row.html());
						//		System.out.println(linkTitle);
								//System.out.println(etd.attr("class"));
								
								Iterator<Element> iterElem = row.getElementsByTag("td").iterator();
								
								if (etd.attr("class").equals("st2")){
						        
									String[] tempValue = new String[items.length];
									int i = 0;
						            for (String item : items) {
						            	
						            	//Element link =  iterElem.next().attr(attributeKey, attributeValue);
						            	
						            	 //System.out.println(sRetTime+">>>>"+linkTitle+"i<<<<<<"+i +">>>>>>>"+iterElem.next().text() );
						                  // builder.append(item + ": " + iterElem.next().text() + "   \t");
						            	 // System.out.println(linkTitle);
						             	// System.out.println(linkTitle +">>>>>>>"+selTime);
						            	  //System.out.println(sRetTime+">>>>"+linkTitle +">>>>>>>"+iterElem.next().text() );
											tempValue[i] = iterElem.next().text();
											i = i +1;
						            }
						            
									StockDay stockday = new StockDay();
									stockday.setSiteRegDt(sRetTime);
									stockday.setType("SCSITE");
									stockday.setScCode(linkTitle);
									stockday.setName(tempValue[0]); //명
									stockday.setSiRate(Double.parseDouble(StringUtil.replaceAll(tempValue[1].trim(),",",""))); //시가
									stockday.setSaleCount(tempValue[2]); //상한금액
				
                                    String sTempsAmt = tempValue[2];
									
									//특수문자 ▲ ▼ 확인
									if (sTempsAmt.length()>1){
										String sGubun = sTempsAmt.substring(0,1); 
										if (sGubun.equals("▲")||sGubun.equals("↑")){
											sTempsAmt = StringUtil.replaceAll(sTempsAmt.trim(),"▲","");
											sTempsAmt = StringUtil.replaceAll(sTempsAmt.trim(),"↑","");
											sTempsAmt = StringUtil.replaceAll(sTempsAmt.trim(),",","");
											stockday.setHiRate(Double.parseDouble(sTempsAmt));
										}
										if (sGubun.equals("▼")||sGubun.equals("↓")){
							
											sTempsAmt = StringUtil.replaceAll(sTempsAmt.trim(),"▼","");
											sTempsAmt = StringUtil.replaceAll(sTempsAmt.trim(),"↓","");
											sTempsAmt = StringUtil.replaceAll(sTempsAmt.trim(),",","");
											stockday.setLowRate(Double.parseDouble(sTempsAmt));
										}
										// System.out.println(sGubun);
									}
									
									//stockday.setScCode(scCode);
									stockRepository.addStockDay(stockday);
									
									
						            
								}
			      		 }
			      	}
					

					/*for (Element row : rowTr) {
						// 다음 next 값이 종목이 있는경우
						Elements rowSt = row.select(".st2");
						//Elements javascind = row.select(".javascript");
						Elements links = row.select("a[href]");
						//Elements row2  = row.select("td[width=92]"
						//Elements pngs = doc.select("img[src$=.png]");
					

						if (!rowSt.isEmpty() && !links.isEmpty()) {
							
							//javascript:goPrice
							System.out.println("LINK>>>>"+links.attr("href"));
							if (links.attr("href").length() > 13){
								if (links.attr("href").substring(0, 13).equals("javascript:go")){
									
									Element link = row.select("a").first();
									String linkTitle = link.attr("title"); // "http://example.com/"
		
									String text = doc.body().text(); // "An example link"
		
									String linkText = link.text(); // "example""
		
									// System.out.println(row.text());
									// System.out.println(row.html());
									// System.out.println(linkTitle);
		
									Iterator<Element> iterElem = row.getElementsByTag(
											"td").iterator();
		
									StringBuilder builder = new StringBuilder();
									String[] tempValue = new String[items.length];
									int i = 0;
									for (String item : items) {
										
										
										// builder.append(item + ": " +
										// iterElem.next().text() + "   \t");
										// System.out.println(linkTitle);
										// System.out.println(linkTitle
										// +">>>>>>>"+selTime);
										System.out.println(selTime.text() + ">>>>"
												+ linkTitle + ">>>>>>>"
												+ iterElem.next().text());
										tempValue[i] = iterElem.next().text();
										i++;
								
									}
									
									StockDay stockday = new StockDay();
									stockday.setRegDate(sRetTime);
									stockday.setScCode(linkTitle);
									stockday.setDesc(tempValue[0]); //명
									stockday.setSiRate(Double.parseDouble(StringUtil.replaceAll(tempValue[1].trim(),",",""))); //시가
									stockday.setSaleCount(tempValue[2]); //상한금액
				
									//stockday.setScCode(scCode);
									retList.add(stockday);
								}
								
							}
						}

					}*/

					/*
					 * for(Element row: row1){
					 * 
					 * Element link = row.select("a").first(); String linkTitle
					 * = link.attr("title"); // "http://example.com/"
					 * 
					 * String text = doc.body().text(); // "An example link"
					 * 
					 * String linkText = link.text(); // "example""
					 * 
					 * System.out.println(row.text());
					 * System.out.println(row.html());
					 * System.out.println(linkTitle);
					 * 
					 * 
					 * //Iterator<Element> iterElem = row.nextElementSibling();
					 * 
					 * StringBuilder builder = new StringBuilder(); for (String
					 * item : items) { builder.append(item + ": " +
					 * iterElem.next().text() + "   \t"); } }
					 * 
					 * 
					 * for(Element row: row2){ System.out.println(row.text());
					 * System.out.println(row.html());
					 * 
					 * }
					 * 
					 * for(Element row: row3){ System.out.println(row.text());
					 * System.out.println(row.html());
					 * 
					 * }
					 */

					/*
					 * Document doc = Jsoup.connect(fileUrl).get(); Elements tds
					 * = doc.select(".st2");
					 */

					/*
					 * for (Element row : rows) { Iterator<Element> iterElem =
					 * row.getElementsByTag("td").iterator(); StringBuilder
					 * builder = new StringBuilder(); for (String item : items)
					 * { builder.append(item + ": " + iterElem.next().text() +
					 * "   \t"); } System.out.println(builder.toString()); }
					 */
					return "";
				}
			});
		} catch (ClientProtocolException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		
		//System.out.println("양정화 : STEP End");
		// ///////////////////////////////////////////////////////////////////
		/*
		 * HttpClient httpClient = new DefaultHttpClient(); HttpGet httpget =
		 * new HttpGet("http://kbodata.news.naver.com/m_rank/rank_team.asp");
		 * try { httpClient.execute(httpget, new BasicResponseHandler() {
		 * 
		 * @Override public String handleResponse(HttpResponse response) throws
		 * HttpResponseException, IOException { // 웹페이지를 그냥 갖어오면 한글이 깨져요. 인코딩
		 * 처리를 해야해요. String res = new
		 * String(super.handleResponse(response).getBytes("8859_1"), "euc-kr");
		 * Document doc = Jsoup.parse(res); Elements rows =
		 * doc.select("table.table_board2 tbody tr"); String[] items = new
		 * String[] { "순위", "팀", "경기수", "승", "패", "무", "승률", "연속", "최근 10경기" };
		 * for (Element row : rows) { Iterator<Element> iterElem =
		 * row.getElementsByTag("td").iterator(); StringBuilder builder = new
		 * StringBuilder(); for (String item : items) { builder.append(item +
		 * ": " + iterElem.next().text() + "   \t"); }
		 * System.out.println(builder.toString()); }
		 * 
		 * return res; } }); } catch (ClientProtocolException e) {
		 * e.printStackTrace(); } catch (IOException e) { e.printStackTrace(); }
		 */
		return 0;

		// /////////////////////////////////////////////////////////////////////////////

		/*
		 * HttpClient httpClient = new DefaultHttpClient(); HttpGet httpget =
		 * new HttpGet("http://kbodata.news.naver.com/m_rank/rank_team.asp");
		 */

		// 불러올 파일의 주소.
		/*
		 * String fileUrl =
		 * "http://vip.mk.co.kr/newSt/rate/item_all.php?koskok=KOSPI&orderBy=upjong"
		 * ;
		 * 
		 * // Jsoup을 이용해 HTML Doc 추출 // Document doc =
		 * Jsoup.connect(fileUrl).get();
		 * 
		 * Document doc = Jsoup.connect(fileUrl).get(); Elements tds =
		 * doc.select(".st2");
		 * 
		 * for(Element e: tds){ System.out.println(e.text());
		 * System.out.println(e.html()); }
		 * 
		 * // 외부 파일이 아닌 String으로 된 HTML 내용 자체를 pase하고 싶다면 아래와 같이. //
		 * Jsoup.parse(htmlString);
		 * 
		 * // hello 클래스 안에 있는 값을 가져옴. Elements hello = doc.select(".title");
		 * 
		 * String text = null;
		 * 
		 * for(Element e : hello){ text = e.text(); // 텍스트만 추출.
		 * System.out.println("title : " + text); }
		 * 
		 * // hello 클래스 안에 있는 값을 가져옴. Elements hello2 = doc.select("goPrice");
		 * 
		 * for(Element e : hello2){ text = e.text(); // 텍스트만 추출.
		 * System.out.println("link : " + text); }
		 */
		// ///////////////////////////////////////////////////////////////////////////////
		/*
		 * HttpClient httpClient = new DefaultHttpClient(); HttpGet httpget =
		 * new HttpGet("http://kbodata.news.naver.com/m_rank/rank_team.asp");
		 * try { httpClient.execute(httpget, new BasicResponseHandler() {
		 * 
		 * @Override public String handleResponse(HttpResponse response) throws
		 * HttpResponseException, IOException { // 웹페이지를 그냥 갖어오면 한글이 깨져요. 인코딩
		 * 처리를 해야해요. String res = new
		 * String(super.handleResponse(response).getBytes("8859_1"), "euc-kr");
		 * Document doc = Jsoup.parse(res); Elements rows =
		 * doc.select("table.table_board2 tbody tr"); String[] items = new
		 * String[] { "순위", "팀", "경기수", "승", "패", "무", "승률", "연속", "최근 10경기" };
		 * for (Element row : rows) { Iterator<Element> iterElem =
		 * row.getElementsByTag("td").iterator(); StringBuilder builder = new
		 * StringBuilder(); for (String item : items) { builder.append(item +
		 * ": " + iterElem.next().text() + "   \t"); }
		 * System.out.println(builder.toString()); }
		 * 
		 * return res; } }); } catch (ClientProtocolException e) {
		 * e.printStackTrace(); } catch (IOException e) { e.printStackTrace(); }
		 */
	}

	@Override
	public int TestSaveURLInfo(String getURL) {
		List<StockDay> retList = new ArrayList<StockDay>();
		
		retList.clear();
		
		// DB조회
		System.out.println("양정화 : STEP 1");
	
		HttpClient httpClient = new DefaultHttpClient();
		HttpGet httpget = new HttpGet(getURL);
		
		
		System.out.println("양정화 : STEP 2");
		try {
			System.out.println("양정화 : STEP 3");
			httpClient.execute(httpget, new BasicResponseHandler() {
				@Override
				public String handleResponse(HttpResponse response)
						throws HttpResponseException, IOException {
					// 웹페이지를 그냥 갖어오면 한글이 깨져요. 인코딩 처리를 해야해요.
					String res = new String(super.handleResponse(response)
							.getBytes("8859_1"), "euc-kr");
					Document doc = Jsoup.parse(res);

					System.out.println("양정화 : STEP 4");

		
					Elements rowTr = doc.select("tr"); // 전체 tr 테그로 값 획득

					Elements selTime = doc
							.select("span[id=mystockThisTimevalue]");
				

					String sRetTime = StringUtil.replaceAll(selTime.text(), ":", "");
					sRetTime = StringUtil.replaceAll(sRetTime, ".", "");
					sRetTime = StringUtil.replaceAll(sRetTime, " ", "").substring(0, 8);
					Date date = new Date();
					SimpleDateFormat format = new SimpleDateFormat("yyyy");
					sRetTime = format.format(date)+""+sRetTime;

					// terator<Element> ite =
					// table.select("td[width=65]").iterator();
					String[] items = new String[] { "종목", "시가", "상한율" };
			
			          
			      	for(Element row: rowTr){
			      		 //다음 next 값이 종목이 있는경우
			      		 Elements rowSt = row.select(".st2");
			      		 
			      		 if (!rowSt.isEmpty()){
			      			    Element etd = row.select("td").first();
								Element link = row.select("a").first();
								String linkTitle = link.attr("title"); // "http://example.com/"
								
								String text = doc.body().text(); // "An example link"

								String linkText = link.text(); // "example""
								
								Iterator<Element> iterElem = row.getElementsByTag("td").iterator();
								
								if (etd.attr("class").equals("st2")){
						        
									String[] tempValue = new String[items.length];
									int i = 0;
						            for (String item : items) {
						            	
						            	//Element link =  iterElem.next().attr(attributeKey, attributeValue);
						            	
						            	 //System.out.println(sRetTime+">>>>"+linkTitle+"i<<<<<<"+i +">>>>>>>"+iterElem.next().text() );
						                  // builder.append(item + ": " + iterElem.next().text() + "   \t");
						            	 // System.out.println(linkTitle);
						             	// System.out.println(linkTitle +">>>>>>>"+selTime);
						            	  //System.out.println(sRetTime+">>>>"+linkTitle +">>>>>>>"+iterElem.next().text() );
											tempValue[i] = iterElem.next().text();
											i = i +1;
						            }
						            
						           // System.out.println(tempValue[2]);
						            //System.out.println(tempValue[3]);
						            
									StockDay stockday = new StockDay();
									stockday.setSiteRegDt(sRetTime);
									stockday.setType("SCSITE");
									stockday.setScCode(linkTitle);
									stockday.setName(tempValue[0]); //명
									stockday.setSiRate(Double.parseDouble(StringUtil.replaceAll(tempValue[1].trim(),",",""))); //시가
									stockday.setSaleCount(tempValue[2]); //상한금액
				
									String sTempsAmt = tempValue[2];
									
									//특수문자 ▲ ▼ 확인
									if (sTempsAmt.length()>3){
										String sGubun = sTempsAmt.substring(0,1); 
										if (sGubun.equals("▲")){
											sTempsAmt = StringUtil.replaceAll(sTempsAmt.trim(),"▲","");
											sTempsAmt = StringUtil.replaceAll(sTempsAmt.trim(),",","");
											stockday.setHiRate(Double.parseDouble(sTempsAmt));
										}
										if (sGubun.equals("▼")){
											sTempsAmt = StringUtil.replaceAll(sTempsAmt.trim(),"▼","");
											sTempsAmt = StringUtil.replaceAll(sTempsAmt.trim(),",","");
											stockday.setLowRate(Double.parseDouble(sTempsAmt));
										}
										 System.out.println(stockday.getHiRate());
										 System.out.println(stockday.getLowRate());
									}
									
									//stockday.setScCode(scCode);
									//stockRepository.addStockDay(stockday);
						            
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

		System.out.println("양정화 : STEP End");
	
		return 0;
		
	}

	@Override
	public List<StockDay> getMaxDayRate(StockDay stockDay) {
		return stockRepository.getMaxDayRate(stockDay);
	}
}

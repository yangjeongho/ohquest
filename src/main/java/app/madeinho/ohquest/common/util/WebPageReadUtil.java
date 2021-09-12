package app.madeinho.ohquest.common.util;

import java.io.IOException;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;

import app.madeinho.ohquest.stock.day.StockDay;


public class WebPageReadUtil {
	private String mSReadURL;
	private String mSReadHTML;
	private Document mSReadHTMLDoc;
	private String mSRetMessage;
	private List<StockDay>  stockDayList;
	
	
	public List<StockDay> getStockDayList() {
		return stockDayList;
	}
	public void setStockDayList(List<StockDay> stockDayList) {
		this.stockDayList = stockDayList;
	}
	public String getmSRetMessage() {
		return mSRetMessage;
	}
	public void setmSRetMessage(String mSRetMessage) {
		this.mSRetMessage = mSRetMessage;
	}
	public String getmSReadURL() {
		return mSReadURL;
	}
	public void setmSReadURL(String mSReadURL) {
		this.mSReadURL = mSReadURL;
	}
	public String getmSReadHTML() {
		return mSReadHTML;
	}
	public void setmSReadHTML(String mSReadHTML) {
		this.mSReadHTML = mSReadHTML;
	}
	
	public Document getmSReadHTMLDoc() {
		return mSReadHTMLDoc;
	}
	public void setmSReadHTMLDoc(Document mSReadHTMLDoc) {
		this.mSReadHTMLDoc = mSReadHTMLDoc;
	}
	
	//해당 URL의 에서 멤버 mSReadHTMLDoc 값을 Set처리
	public void getURLInfo() {
		
		//초기화 처리
		mSReadHTML = "";
		
		String link = mSReadURL;
		Document doc;
		
		try {
			doc = Jsoup.connect(link).get();
			setmSReadHTMLDoc(doc);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		/*if (org.jsoup.helper.StringUtil.isBlank(mSReadURL)){
			return;
		}
		
		HttpClient httpClient = new DefaultHttpClient();
		HttpGet httpget = new HttpGet(mSReadURL);
		
		try {

			httpClient.execute(httpget, new BasicResponseHandler() {
				@Override
				public String handleResponse(HttpResponse response)
						throws HttpResponseException, IOException {
					// 웹페이지를 그냥 갖어오면 한글이 깨져요. 인코딩 처리를 해야해요.
					String res = new String(super.handleResponse(response)
							.getBytes("8859_1"), "euc-kr");
					Document doc = Jsoup.parse(res);
					setmSReadHTMLDoc(doc);
					return "";

				}
			});
		} catch (ClientProtocolException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}*/

	}	
	
	/**
	 * @웹 페이즈의 정보를 읽은 mSReadHTMLDoc 처리한  overrade 처리함수
	 */
	public void getUrlDoc() {	
	
	}
		

	public static String reverseString(String data) {
		char[] sub = data.toCharArray(); 
		for (int i = 0; i < sub.length; ++i) {
			if (sub[i] =='_'){
				sub[i+1] = Character.toUpperCase(sub[i+1]); 
			}
		}
		StringBuffer sb = new StringBuffer(new String(sub)); 
		return sb.toString().replaceAll("_", "");
	}
	
	public static String splitSetValue(String trgStr, String gubun) {
		String[] sub = trgStr.split(gubun); 
		return sub[sub.length];
	}
	
	public static String onlyNumber(String str) {
		
	   // String kpiGaolValueOriginal = vo.get(idx, "DYYYY_VL"             ).toString();
		//System.out.println("onlyNumber>>>>>>>>>>>>>>>>"+str );
	   
        if(str == null) return str;

        StringBuffer sb = new StringBuffer();
        int length = str.length();
        for(int i = 0 ; i < length ; i++){
            char curChar = str.charAt(i);
            if(Character.isDigit(curChar)) sb.append(curChar);
        }

        return sb.toString();
	}

	
}

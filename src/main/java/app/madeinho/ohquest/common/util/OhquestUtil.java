package app.madeinho.ohquest.common.util;

import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.HttpResponseException;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.BasicResponseHandler;
import org.apache.http.impl.client.DefaultHttpClient;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import app.madeinho.ohquest.co.code.CodeService;

public class OhquestUtil {
	
	public static String getRemoteAddr(HttpServletRequest request){
		
		/*System.out.println("X-Client-IP:"+ request.getHeader("X-Client-IP"));
		System.out.println("x-clientip-for:"+ request.getHeader("x-clientip-for"));
		System.out.println("X-Forwarded-For:"+ request.getHeader("X-Forwarded-For"));
		System.out.println("WL_Proxy-Client-IP:"+ request.getHeader("WL_Proxy-Client-IP"));
		System.out.println("Proxy-Client-IP:"+ request.getHeader("Proxy-Client-IP"));*/
		
        String remoteAddr = "";
        if( request.getHeader("X-Client-IP") != null && !request.getHeader("X-Client-IP").equals("")){
            remoteAddr = request.getHeader("X-Client-IP");
        } else if (request.getHeader("x-clientip-for") != null && !request.getHeader("x-clientip-for").equals("")) {
            remoteAddr = request.getHeader("x-clientip-for");
        } else if (request.getHeader("X-Forwarded-For") != null && !request.getHeader("X-Forwarded-For").equals("")){
            remoteAddr = request.getHeader("X-Forwarded-For");
        } else if (request.getHeader("WL_Proxy-Client-IP") != null && !request.getHeader("WL_Proxy-Client-IP").equals("")){
            remoteAddr = request.getHeader("WL_Proxy-Client-IP");
        } else if (request.getHeader("Proxy-Client-IP") != null && !request.getHeader("Proxy-Client-IP").equals("")){
            remoteAddr = request.getHeader("Proxy-Client-IP");
        } else {
            remoteAddr = request.getRemoteAddr();
        }
        return remoteAddr;
    }
	
	public static String getPasswordBySHA512(String message){
		
	    //String message = "1234567890123456";  
	    String mes1 = "";  
	    try {  
	    	MessageDigest md = MessageDigest.getInstance("SHA-512");  
	          
	        md.update(message.getBytes());  
	        byte[] mb = md.digest();  
	        for (int i = 0; i < mb.length; i++) {  
	            byte temp = mb[i];  
	            String s = Integer.toHexString(new Byte(temp));  
	            while (s.length() < 2) {  
	                s = "0" + s;  
	            }  
	            s = s.substring(s.length() - 2);  
	            mes1 += s;  
	        }  
	        //System.out.println(mes1.length());  
	        //System.out.println("CRYPTO : " + mes1);  
	          
	    } catch (NoSuchAlgorithmException e) {  
	        e.printStackTrace();  
	    } 	 
		return mes1 ;
	}
	
	public static String getCalsDate(String basisDate,int y,int z,String date_type){
       SimpleDateFormat formatter=new SimpleDateFormat("yyyy-MM-dd");
       Date basis = new Date();
	    try {
	        basis = formatter.parse(basisDate);
	    } catch (ParseException e) {
	        e.printStackTrace();
	    }
	   Calendar cal=Calendar.getInstance(Locale.KOREAN);
       cal.setTime(basis);
       
       cal.add(y,z); 
       Date currentTime=cal.getTime();
       SimpleDateFormat formatter1=new SimpleDateFormat(date_type,Locale.KOREAN);
       String timestr=formatter1.format(currentTime);

       return timestr;
    }
	
	public static String getCalsDate(Date basisDate,int y,int z,String date_type){
       Calendar cal=Calendar.getInstance(Locale.KOREAN);
       cal.setTime(basisDate);
       
       cal.add(y,z); 
       Date currentTime=cal.getTime();
       SimpleDateFormat formatter1=new SimpleDateFormat(date_type,Locale.KOREAN);
       String timestr=formatter1.format(currentTime);

       return timestr;
    }
	
	public static void main(String[] args){
		System.out.println(getCalsDate(new Date(),2,-3,"yyyyMMdd"));
	}

	public static boolean isNull(String value) {
		if (value == null) return true;
		
		try{
			if (value.length() > 0) return false;
			else return true;
			
		}catch(NullPointerException e) {
			return true;
		}
	}
	
	public static String maxString(int imax, String value) {
		int istrLeg = value.length();
		if (imax < istrLeg) {
			return value.substring(0,imax);
		}else{
			return value;
		}
		
	}
	

}

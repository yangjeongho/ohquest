/*
 * Copyright (c) Abacus. All rights reserved.
 */
package app.madeinho.ohquest.common.util;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.net.ssl.SSLEngineResult.Status;

import org.apache.commons.httpclient.Header;
import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpException;
import org.apache.commons.httpclient.MethodRetryHandler;
import org.apache.commons.httpclient.NameValuePair;
import org.apache.commons.httpclient.methods.GetMethod;
import org.apache.commons.httpclient.methods.PostMethod;
import org.apache.commons.httpclient.methods.StringRequestEntity;
import org.springframework.http.HttpStatus;

/*import com.acube.unitel.common.exception.AcubeCommonException;
import com.acube.unitel.common.type.ResultCode;*/

import atg.taglib.json.util.JSONObject;

/**
 *
 * @author "YangByeongSub"
 * @since
 *
 */
public class WebServiceUtil {
	
	public static String post(String url, NameValuePair[] nameValuePairs) throws IOException {
		
		String result = "" ;
        HttpClient client = new HttpClient();
        PostMethod postMethod = null ;
        try {
        	
        	client.getParams().setParameter("http.useragent", "Test Client");

			postMethod = new PostMethod(url);
			
			//postMethod.setRequestHeader("Content-Type", "application/json; charset=UTF-8");			
			//postMethod.setRequestHeader("Content-Type", "text/html; charset=UTF-8");
            //postMethod.addRequestHeader("Content-Type", "multipart/form-data");

			postMethod.setRequestHeader("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8");	
			/*
			postMethod.addParameter("loginId", "cidlist");
            postMethod.addParameter("password", "db05234e98b37d43bdccb023eb8b09d6e8ad43fba9bff9dc4909a6db3fbeac33cf647a2a72b1a873c63fa1a25b5012d99a2bb87237ed246614124305125eb966");
            
			NameValuePair loginId = new NameValuePair("loginId", "cidlist");
			NameValuePair password = new NameValuePair("password", "db05234e98b37d43bdccb023eb8b09d6e8ad43fba9bff9dc4909a6db3fbeac33cf647a2a72b1a873c63fa1a25b5012d99a2bb87237ed246614124305125eb966");
			NameValuePair returnURL = new NameValuePair("returnURL", "android");
            postMethod.setRequestBody(new NameValuePair[]{loginId, password, returnURL});
			*/
            if(nameValuePairs != null){
            	postMethod.setRequestBody(nameValuePairs);
            }
            
            // Execute the method
            int statusCode = client.executeMethod(postMethod);
            if(statusCode == 200){
            	System.out.println("result = "+postMethod.getResponseBodyAsString()) ;
            	result = postMethod.getResponseBodyAsString() ;
            }
            postMethod.releaseConnection();
            System.out.println("statusCode=" + statusCode);
            // Write the body, flush and close
            
        } catch (HttpException e) {
        	System.out.println("Oops, something went wrong in the HTTP proxy, " + e.toString());
        } catch (Exception e) {
        	System.out.println("Oops, error, " + e.toString());
        }finally{
        	if(postMethod!=null)postMethod.releaseConnection();        	
        }
        return result;
	}
	
//	public static String postJson(String url, String jsonData) throws IOException {
//		
//		String result = "" ;
//        HttpClient client = new HttpClient();
//        PostMethod postMethod = null ;
//        try {
//        	
//        	client.getParams().setParameter("http.useragent", "Test Client");
//
//			postMethod = new PostMethod(url);
//			postMethod.setRequestHeader("Content-Type", "application/json; charset=UTF-8");	
//			StringRequestEntity requestEntity = new StringRequestEntity(jsonData, "application/json", "UTF-8");
//			postMethod.setRequestEntity(requestEntity);
//            
//            // Execute the method
//            int statusCode = client.executeMethod(postMethod);
//            if(statusCode == 200){
//            	/*JSONObject json = new JSONObject(postMethod.getResponseBodyAsString());
//            	result = json.getString("result");
//            	System.out.println("result :" +result);
//            	//JSONArray files = json.getJSONArray("files");
//            	*/
//				System.out.println("result = "+postMethod.getResponseBodyAsString()) ;
//            	result = postMethod.getResponseBodyAsString() ;
//            }
//            postMethod.releaseConnection();
//            System.out.println("statusCode=" + statusCode);
//            // Write the body, flush and close
//            
//        } catch (HttpException e) {
//        	System.out.println("Oops, something went wrong in the HTTP proxy, " + e.toString());
//        } catch (Exception e) {
//        	System.out.println("Oops, error, " + e.toString());
//        }finally{
//        	if(postMethod!=null)postMethod.releaseConnection();        	
//        }
//        return result;
//	}
	
	public static Map<String, Object> postJson(String url, String jsonData){
		
		System.out.println("\n\n Deploy Code is :: "+jsonData);
		
		Map<String, Object> ret = new HashMap<String, Object>();
		
		// acube.devMode 
		/*if ("L".equals(acube.devMode)) {
			ret.put("status", HttpStatus.Series.SUCCESSFUL);
			return ret;
		}*/
		
		
        HttpClient client = new HttpClient();
        PostMethod postMethod = null ;
        try {
        	
        	client.getParams().setParameter("http.useragent", "Test Client");

			postMethod = new PostMethod(url);
			postMethod.setRequestHeader("Content-Type", "application/json; charset=UTF-8");	
			StringRequestEntity requestEntity = new StringRequestEntity(jsonData, "application/json", "UTF-8");
			postMethod.setRequestEntity(requestEntity);
            
			//client.setTimeout(5000);
			
            // Execute the method
            int statusCode = client.executeMethod(postMethod);
            
            String response =postMethod.getResponseBodyAsString();
			System.out.println("\n [statusCode::" + statusCode + ",\n response::" + response);
            
			if(statusCode/100 == 2) {
				ret.put("status", HttpStatus.Series.SUCCESSFUL);
			} else if(statusCode/100 == 4) {
				ret.put("status", HttpStatus.Series.CLIENT_ERROR);
			} else if(statusCode/100 == 5) {
				ret.put("status", HttpStatus.Series.SERVER_ERROR);
			}
						
			ret.put("response", response);
			
			
            System.out.println("###"+ret);			
            postMethod.releaseConnection();
            
        } catch (HttpException e) {
        	System.out.println("Oops, something went wrong in the HTTP proxy, " + e.toString());
        //	throw new AcubeCommonException("HttpException Occur");
        } catch (Exception e) {
        	System.out.println("Oops, error, " + e.toString());
        //	throw new AcubeCommonException("Exception Occur");
        }finally{
        	if(postMethod!=null)postMethod.releaseConnection();        	
        }

        return ret;
	}
	public static String get(String url) throws IOException {
		
		String result = "" ;
        HttpClient client = new HttpClient();
        GetMethod getMethod = null ;
        try {
        	
        	client.getParams().setParameter("http.useragent", "Test Client");

			getMethod = new GetMethod(url);
			int statusCode = client.executeMethod(getMethod);
			
            if(statusCode == 200){
            	System.out.println("result = "+getMethod.getResponseBodyAsString()) ;
            	result = getMethod.getResponseBodyAsString() ;
            }
            getMethod.releaseConnection();
            System.out.println("statusCode=" + statusCode);
            // Write the body, flush and close
            
        } catch (HttpException e) {
        	System.out.println("Oops, something went wrong in the HTTP proxy, " + e.toString());
        } catch (Exception e) {
        	System.out.println("Oops, error, " + e.toString());
        }finally{
        	if(getMethod!=null)getMethod.releaseConnection();        	
        }
        return result;
	}
	
	public static String sendJSONByGetMethod(String url, NameValuePair[] nameValuePairs) throws IOException {
		
		String result = "" ;
        HttpClient client = new HttpClient();
        GetMethod getMethod = null ;
        try {
        	
        	client.getParams().setParameter("http.useragent", "Test Client");

			getMethod = new GetMethod(url);
			getMethod.setRequestHeader("Content-Type", "application/json; charset=UTF-8");
			
			getMethod.setQueryString(nameValuePairs);
			/*
			NameValuePair loginId = new NameValuePair("data", "{\"test\":\"data\"}");
			getMethod.setQueryString(new NameValuePair[] { 
					loginId 
				}); */
			int statusCode = client.executeMethod(getMethod);
			
            if(statusCode == 200){
            	System.out.println("result = "+getMethod.getResponseBodyAsString()) ;
            	result = getMethod.getResponseBodyAsString() ;
            }
            getMethod.releaseConnection();
            System.out.println("statusCode=" + statusCode);
            // Write the body, flush and close
            
        } catch (HttpException e) {
        	System.out.println("Oops, something went wrong in the HTTP proxy, " + e.toString());
        } catch (Exception e) {
        	System.out.println("Oops, error, " + e.toString());
        }finally{
        	if(getMethod!=null)getMethod.releaseConnection();        	
        }
        return result;
	}
}

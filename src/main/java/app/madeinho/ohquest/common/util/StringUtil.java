package app.madeinho.ohquest.common.util;

import java.util.StringTokenizer;

public class StringUtil {
	/**
	 * @param args
	 */
	public static void main(String[] args) {

		String test=                                          
            					"|RAP_FILE_NAME               "+
								"|CONSUME_TIME                "+
								"|RBC_SENDER                  "+
								"|RBC_RECIPIENT               "+
								"|RBC_RAP_FILE_SEQ_NO         "+
								"|RBC_RFC_TSTAMP              "+
								"|RBC_RFC_UTC_OFFSET          "+
								"|RBC_RFA_TSTAMP              "+
								"|RBC_RFA_UTC_OFFSET          "+
								"|RBC_SPEC_VER_NUM            "+
								"|RBC_RELEASE_VER_NUM         "+
								"|RBC_FILE_TYPE_IND           "+
								"|RBC_ROAMING_PARTNER         "+
								"|RBC_TAP_DECIMAL_PLACES      "+
								"|RBC_TAP_CURRENCY            "+
								"|RBC_PROC_DT                 "+
								"|RBC_FILE_STATE              "+
								"|RBC_RECV_STAFF              "+
								"|RBC_REGISTER_DT             ";
			
			
			
		StringTokenizer stok = new StringTokenizer(test);

		while (stok.hasMoreTokens()) {
			String token = stok.nextToken();
			token = token.replace('|', ' ').trim().toLowerCase();
			String reverAlpha = reverseString(token);
			System.out.println(""+reverAlpha);
		}
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
	
	

	
}

package app.madeinho.ohquest.co.code;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;

import app.madeinho.ohquest.co.code.domain.LookupCode;
import app.madeinho.ohquest.common.util.JSONException;
import app.madeinho.ohquest.common.util.JSONObject;
import app.madeinho.ohquest.common.util.WebServiceUtil;

@Service
public class CodeDeployServiceImpl implements CodeDeployService {
	
	@Value("${code.deployTarget.url}") private String DEPLOY_URL;
	
	private static final Logger logger = LoggerFactory.getLogger(CodeDeployServiceImpl.class);
	
	
	public String deployCode(LookupCode origLookupCode){
		
	
		LookupCode lookupCode = new LookupCode();
		
		// 랭귀지가 en만 전송하도록 세팅
		if(origLookupCode.getCharLang()!= null && origLookupCode.getCharLang().length > 0){
			int idx = 0 ;
			for(String language : origLookupCode.getCharLang()){
				
				if("en".equals(language)) {
					lookupCode.setSourceLang("en");
					lookupCode.setDescription(origLookupCode.getCharDscpt()[idx]);
					lookupCode.setCodeGroup(origLookupCode.getCodeGroup());
					lookupCode.setMeaning(origLookupCode.getCharMeaning()[idx]);
					lookupCode.setCode(origLookupCode.getCode());
					lookupCode.setLanguage("en");
					lookupCode.setSvcDomain(origLookupCode.getSvcDomain());
					lookupCode.setSubGrp1(origLookupCode.getSubGrp1());
					lookupCode.setSubGrp2(origLookupCode.getSubGrp2());
				}
				idx++;
			}
			
		}else{
			lookupCode.setSourceLang("en");
			lookupCode.setDescription(origLookupCode.getDescription());
			lookupCode.setCodeGroup(origLookupCode.getCodeGroup());
			lookupCode.setMeaning(origLookupCode.getMeaning());
			lookupCode.setCode(origLookupCode.getCode());
			lookupCode.setSvcDomain(origLookupCode.getSvcDomain());
			lookupCode.setSubGrp1(origLookupCode.getSubGrp1());
			lookupCode.setSubGrp2(origLookupCode.getSubGrp2());
		}
		
		//Ifvalues ifvalues = new Ifvalues();
		
		List<String> resources = new ArrayList<String>();
		resources.add(lookupCode.getCodeGroup());
				
		//ifvalues.setResources(resources);
		
		try {
			JSONObject deployJsonCode = new JSONObject();
						
			deployJsonCode.put("code", new JSONObject(lookupCode.getJson().toString()));
			//deployJsonCode.put("ifvalues", new JSONObject(ifvalues));
				
				
			Map<String, Object> webSphereRet = WebServiceUtil.postJson(DEPLOY_URL, deployJsonCode.toString());
			
			if(webSphereRet.get("status") == HttpStatus.Series.SUCCESSFUL) {
				return new String((String) webSphereRet.get("response"));
			} else {
				return new String((String) webSphereRet.get("response"));
			}
			
		//} catch(AcubeCommonException e) {
			//throw new AcubeCommonException(e.getMessage());
		} catch (JSONException e) {
			//throw new AcubeCommonException("JSONException");
		}
		return DEPLOY_URL; 
		
		/*		
				
				
				httpClient.getParams().setParameter("http.useragent", "Test Client");
				
				postMethod = new PostMethod(DEPLOY_URL);
				postMethod.setRequestHeader("Content-Type", "application/json; charset=UTF-8");	
				StringRequestEntity strEntity = new StringRequestEntity(deployJsonCode.toString(), "application/json", "UTF-8");
				postMethod.setRequestEntity(strEntity);
				
				int statusCode = httpClient.executeMethod(postMethod);
				
				if(statusCode == 200){
					logger.debug("\n statusCode::" + statusCode);
					
					result = postMethod.getResponseBodyAsString();
					postMethod.releaseConnection();
					
				} else {
					result = new String(""+statusCode);
					logger.error("\n statusCode::"+statusCode);
					
				}
				
			} catch(ConnectException e){
				logger.error("\n\n\n @@@@@ ConnectException"+e.toString()+ "@" + e.hashCode());
			} catch (IOException e) {
				logger.error("\n\n\n @@@@@ IOException"+e.toString()+"#"+e.hashCode());
				
			} catch (JSONException e) {
				logger.error("\n\n\n @@@@@ JSONException"+e.toString()+"@#"+e.hashCode());
				
			}	finally{
				
		    	if(postMethod!=null)postMethod.releaseConnection();        	
		    }*/
		
		//return result;
	}

}

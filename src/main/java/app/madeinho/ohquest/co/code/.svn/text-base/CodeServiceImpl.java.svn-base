package app.madeinho.ohquest.co.code;

import java.io.File;
import java.io.FileReader;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.httpclient.NameValuePair;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import app.madeinho.ohquest.co.cache.CodeCacheManager;
//import app.madeinho.ohquest.co.cache.CodeCacheManager;
import app.madeinho.ohquest.co.code.Code;
import app.madeinho.ohquest.co.code.domain.LookupCode;
//import app.madeinho.ohquest.co.code.domain.FeatureCode;
//import app.madeinho.ohquest.co.code.domain.Code;
//import app.madeinho.ohquest.co.security.SecurityService;
import app.madeinho.ohquest.common.exception.OhquestException;
import app.madeinho.ohquest.common.util.CsvReader;
import app.madeinho.ohquest.common.util.WebServiceUtil;
//import app.madeinho.ohquest.pdh.product.domain.Product;
//import app.madeinho.ohquest.pdh.product.service.ProductPdhService;


@Service
@Transactional
public class CodeServiceImpl implements CodeService {
	
	private static final Logger logger = LoggerFactory.getLogger(CodeServiceImpl.class);
	//@Autowired ProductPdhService pdhService;
	@Autowired CodeRepository codeRepository;
	//@Autowired SecurityService securityService;
	@Autowired CodeCacheManager codeCacheManager;
	
//	@Value("${code.linkage.url}") private String codeLinkageUrl ;

	/**
	* {@inheritDoc}
	*/
	@Override
	public Map<String, List<LookupCode>> cacheCodeData() {
		// 기본 코드에 대해 캐싱 수행
		Map<String, List<LookupCode>> cacheCode = new HashMap<String, List<LookupCode>>();
		
		/*List<LookupCode> codeTypeList = codeRepository.getCodeTypeList("en");
		List<LookupCode> lookupCodes = codeRepository.getAllCodeList();
		
		for (LookupCode lookupCode : codeTypeList) {
			
			//모든 코드를 한번에 가져와서 필터링. 
			cacheCode.put(lookupCode.getCodeGroup(), getCurCodeList(lookupCodes, lookupCode.getCodeGroup())) ;

			//코드그룹을 매번 db에서 조회하여 캐시 할때
			//lookupCode.setLanguage("ALL");
			//cacheCode.put(lookupCode.getCodeGroup(), codeRepository.getCodeList(lookupCode)); 
		}*/
		return cacheCode ;
	}
	/**
	* {@inheritDoc}
	*/

	private List<Code> getCurCodeList(List<Code> Codes, String codeGroup) {
		List<Code> tmp = new ArrayList<Code>();
		boolean skip = false ;
		for (Code code : Codes) {
				skip = true ;
				tmp.add(code);
		}
		return tmp;
	}
	
	/**
	* {@inheritDoc}
	*/

	
	
	/**
	* {@inheritDoc}
	*/

	
	
	
	/**
	* {@inheritDoc}
	*/
	@Override
	public int addCode(Code Code) {
		int ret = 0 ;
		//Code.setOperator(securityService.getCurrentMember());
		if(Code.getCharLang()!= null && Code.getCharLang().length > 0){
			int idx = 0 ;
			for(String language : Code.getCharLang()){
				Code.setLanguage(language);
				Code.setDescription(Code.getCharDscpt()[idx]);			
				codeRepository.addOrUpdateCode(Code);
				idx++;
			}
			ret = idx;
		}else{
			ret = codeRepository.addOrUpdateCode(Code);
		}
		
		//reload code cache data 
		//codeCacheManager.updateCache("codeList", Code);
		//linkageService(Code, "INSERT");

		return ret ;
	}
	
	
	/**
	* {@inheritDoc}
	*/
	@Override
	public int updateCode(Code Code) {
		int ret = 0 ;
		//Code.setOperator(securityService.getCurrentMember());
		if(Code.getCharLang()!= null && Code.getCharLang().length > 0){
			int idx = 0 ;
			for(String language : Code.getCharLang()){
				Code.setLanguage(language);
				Code.setDescription(Code.getCharDscpt()[idx]);			
				codeRepository.addOrUpdateCode(Code);
				idx++;
			}
			ret = idx;
		}else{
			ret = codeRepository.addOrUpdateCode(Code);
		}
		
		//reload code cache data 
		//codeCacheManager.updateCache("codeList", Code);
		//linkageService(Code, "UPDATE");
		
		return ret ;
	}
	
	private void linkageService(Code Code, String mode) { }

	/**
	* {@inheritDoc}
	*/
	@Override
	public int deleteCode(Code Code) {
		int ret = codeRepository.deleteCode(Code);
		//reload code cache data 
		//codeCacheManager.updateCache("codeList", Code);
		return ret;
	}
	
	/**
	* {@inheritDoc}
	*/
	@Override
	public List<Code> addCode(List<Code> Codes) {
		for(Code Code : Codes){
			try {
				codeRepository.addOrUpdateCode(Code);
			} catch (Exception e) {
				Code.setSuccess(false);
				Code.setMessage(e.toString());
			}
		}
		return Codes ;
	}

	/**
	* {@inheritDoc}
	*/
	@Override
	public List<LookupCode> getCode(LookupCode lookupCode) {
		return codeRepository.getCode(lookupCode);
	}
	
	@Override
	public Code getCode(Code Code) {
		return codeRepository.getCode(Code);
	}

	/**
	* {@inheritDoc}
	*/
	/*@Override
	public List<Code> getCodeList(String codeGroup) {
		return codeRepository.getCodeList(codeGroup);
	}*/

	/**
	* {@inheritDoc}
	*/
	@Override
	public List<Code> getCodeTypeList(String language) {
		return codeRepository.getCodeTypeList(language);
	}

	/**
	* {@inheritDoc}
	*/
	@Override
	public List<Code> addCodeByCsv(File csvFile) {
		List<Code> Codes = null;
		try {
			CsvReader csvReader = new CsvReader(new FileReader(csvFile));
			csvReader.readHeaders();
			Codes = new ArrayList<Code>();
			Code Code = null;
			while (csvReader.readRecord()){
				Code = new Code();
				try {
					Code.setLanguage(csvReader.get("language"));
					Code.setDescription(csvReader.get("description"));
					Code.setEnabledFlag(csvReader.get("enabledFlag").toLowerCase().equals("true"));
					String startDateActive = csvReader.get("startDateActive");
					String endDateActive = csvReader.get("endDateActive");
					Date sdate = null ;
					Date edate = null ;
					if(!StringUtils.isEmpty(startDateActive)){
						DateFormat formatter = new SimpleDateFormat("yyyy/MM/dd"); 
				        try {
				        	sdate = (Date)formatter.parse(startDateActive);
						} catch (ParseException e) {
							e.printStackTrace();
						}
					}
					if(!StringUtils.isEmpty(endDateActive)){
						DateFormat formatter = new SimpleDateFormat("yyyy/MM/dd"); 
				        try {
				        	edate = (Date)formatter.parse(endDateActive);
						} catch (ParseException e) {
							e.printStackTrace();
						}
					}
					Code.setApplicationId(csvReader.get("applicationId"));
					//Code.setOperator(securityService.getCurrentMember());
					codeRepository.addOrUpdateCode(Code);
					Code.setSuccess(true);
					Code.setMessage("Inserted!");	
				} catch (DuplicateKeyException e) {
					try {
						codeRepository.addOrUpdateCode(Code);
						Code.setSuccess(true);
						Code.setMessage("Updated!");
					} catch (Exception e2) {
						Code.setSuccess(false);
						Code.setMessage(e2.toString());	
					}					
				}catch (Exception e) {
					Code.setSuccess(false);
					Code.setMessage(e.toString());					
				}
				Codes.add(Code);				
			}
			csvReader.close();
			String lang = Code.getLanguage();
			Code.setLanguage(null);
			//codeCacheManager.updateCache("codeList", Code);
			Code.setLanguage(lang);
			
		} catch (Exception e) {
			throw new OhquestException("err.500", "err.500");
		}
		
		return Codes;
	}

	/**
	* {@inheritDoc}
	*/
	@Override
	public List<Code> getCodeListByOpenApi(String codeGroup) {
		return codeRepository.getCodeListByOpenApi(codeGroup);
	}
	
	/**
	* {@inheritDoc}
	*/
	@Override
	public List<Code> getCodeListAllByOpenApi() {
		return codeRepository.getCodeListAllByOpenApi();
	}

	@Override
	public List<Code> getCounselCode(Code code) {
		return codeRepository.getCounselCode(code);
	}

	/**
	* {@inheritDoc}
	*/
	@Override
	public List<Code> getDeviceByType(String type, HashMap<String, String> hashmap) {
		if("DEVICE".equals(type)){
			return codeRepository.getDeviceList(hashmap);
		}else if("MANUFACTURE".equals(type)){
			return codeRepository.getManufacutreList(hashmap);
		}else if("MODEL".equals(type)){
			return codeRepository.getModelList(hashmap);
		} 
		return null ;
	}
	





	@Override
	public List<Code> getCityCode(Code code) {
		return codeRepository.getCityCode(code);
	}

	@Override
	public List<Code> getDistrictCode(Code code) {
		return codeRepository.getDistrictCode(code);
	}

	@Override
	public List<Code> getSubDistrictCode(Code code) {
		return codeRepository.getSubDistrictCode(code);
	}

	@Override
	public List<Code> getBuildingCode(Code code) {
		return codeRepository.getBuildingCode(code);
	}

	@Override
	public List<Code> getEntranceCode(Code code) {
		return codeRepository.getEntranceCode(code);
	}

	@Override
	public List<Code> getDoorCode(Code code) {
		return codeRepository.getDoorCode(code);
	}

	@Override
	public List<Code> getGroupList(Code code) {
		return codeRepository.getGroupList(code);
	}

	@Override
	public String getImsiPrefix() {
		// TODO Auto-generated method stub
		return codeRepository.getImsiPrefix();
	}
	

	/**
	* {@inheritDoc}
	*/
	@Override
	public List<LookupCode> getCodeList(LookupCode lookupCode) {
		
		System.out.print("[XXXXXXXXXXXXXXgetCodeList] >"+lookupCode);
		return codeRepository.getCodeList(lookupCode);
	}
	

	@Override
	public LookupCode getCodeNameFromCache(LookupCode lookupCode) {
		List<LookupCode> codeList = codeCacheManager.getCachedCodeList().get(lookupCode.getCodeGroup());
		
		logger.debug("[getCodeName] codeList count"+ codeList.size());
		
		if(codeList != null){
			for (LookupCode code : codeList) {
				if(lookupCode.getCode().equals(code.getCode()) && lookupCode.getLanguage().equals(code.getLanguage())){
					return code;
				}
			}
		}else{
			codeList = codeCacheManager.appendCache("codeList", lookupCode);
			for (LookupCode code : codeList) {
				if(lookupCode.getCode().equals(code.getCode()) && lookupCode.getLanguage().equals(code.getLanguage())){
					return code;
				}
			}
		}
		return null;
	}
	
	
	/**
	* {@inheritDoc}
	*/
	@Override
	public List<LookupCode> getCodeListFromCache(LookupCode lookupCode) {
		
	
		
		List<LookupCode> codeList = codeCacheManager.getCachedCodeList().get(lookupCode.getCodeGroup());
		List<LookupCode> retCodeList = new ArrayList<LookupCode>();
		if(codeList != null){
			for (LookupCode code : codeList) {
				if(lookupCode.getLanguage().equals(code.getLanguage())){
					retCodeList.add(code);
				}
			}
			return retCodeList;
		}else{
			codeList = codeCacheManager.appendCache("codeList", lookupCode);
			for (LookupCode code : codeList) {
				if(lookupCode.getLanguage().equals(code.getLanguage())){
					retCodeList.add(code);
				}
			}
			return retCodeList;
		}
		//return null;
	}
	
	@Override
	public List<Code> getServiceDomain() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Code> getWorkEventCode(Code code) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public String getCodeParamReplace(LookupCode lookupCode) {
		// TODO Auto-generated method stub
		return codeRepository.getCodeParamReplace(lookupCode);
	}

	
}


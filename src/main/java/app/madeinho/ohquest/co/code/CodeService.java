package app.madeinho.ohquest.co.code;
import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import app.madeinho.ohquest.co.code.Code;
//import app.madeinho.ohquest.co.code.FeatureCode;
//import app.madeinho.ohquest.co.code.Code;
//import app.madeinho.ohquest.pdh.product.domain.Product;
import app.madeinho.ohquest.co.code.domain.LookupCode;

public interface CodeService {
	
	public Map<String, List<LookupCode>> cacheCodeData(); //캐시된 코드 목록 
	public LookupCode getCodeNameFromCache(LookupCode lookupCode); //캐시된 코드에서 코드 가져오기
	public List<LookupCode> getCodeListFromCache(LookupCode lookupCode);//캐시된 코드에서 코드목록 가져오기
	
	
	public int addCode(Code Code);
	public List<Code> addCode(List<Code> Codes);
	public int updateCode(Code Code);
	public int deleteCode(Code Code);
	public Code getCode(Code Code);
	public List<LookupCode> getCode(LookupCode lookupCode);
	public List<Code> getCodeTypeList(String language);
	//public List<Code> getCodeList(String codeGroup);
	public List<LookupCode> getCodeList(LookupCode lookupCode);
	public List<Code> getCodeListByOpenApi(String codeGroup);
	public List<Code> getCodeListAllByOpenApi();
	public List<Code> addCodeByCsv(File csvFile);
	
	public List<Code> getCounselCode(Code code);
	public List<Code> getDeviceByType(String type, HashMap<String, String> hashmap);
	public List<Code> getServiceDomain();
	
	
	public List<Code> getWorkEventCode(Code code);
	
	public List<Code> getCityCode(Code code);
	public List<Code> getDistrictCode(Code code);
	public List<Code> getSubDistrictCode(Code code);
	public List<Code> getBuildingCode(Code code);
	public List<Code> getEntranceCode(Code code);
	public List<Code> getDoorCode(Code code);
	
	public List<Code> getGroupList(Code code);
	public String getImsiPrefix();
	public String getCodeParamReplace(LookupCode lookupCode);
	/**
	 * @return
	 */
//	public Map<String, Product> cacheAllProductData();
	/**
	 * @param prodCd
	 * @return
	 */
//	public Product getProductFromCache(String prodCd);
}
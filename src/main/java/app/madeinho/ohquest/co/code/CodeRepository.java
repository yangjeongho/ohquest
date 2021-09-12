package app.madeinho.ohquest.co.code;

import java.util.HashMap;
import java.util.List;

import app.madeinho.ohquest.co.code.Code;
import app.madeinho.ohquest.co.code.domain.LookupCode;
//import app.madeinho.ohquest.co.member.domain.Member;
import app.madeinho.ohquest.common.dao.Mapper;

@Mapper
public interface CodeRepository {
//	public int addCode(Code Code);	
//	public int updateCode(Code Code);	
	public int addOrUpdateCode(Code Code);	
	public int deleteCode(Code Code);	
	public Code getCode(Code Code);
	public List<LookupCode> getCode(LookupCode lookupCode);
	public List<Code> getCodeTypeList(String language);

	public List<Code> getAllCodeList();
	public List<Code> getCodeListByOpenApi(String codeGroup);
	public List<Code> getCodeListAllByOpenApi();
	public List<LookupCode> getCodeList(LookupCode lookupCode);
	//public List<Code> getCodeList(String codeGroup);
	
	public List<Code> getCounselCode(Code code);
	public List<Code> getDeviceList(HashMap<String, String> hashmap);
	public List<Code> getManufacutreList(HashMap<String, String> hashmap);
	public List<Code> getModelList(HashMap<String, String> hashmap);
	//public List<Code> getServiceDomain(Member member);
	
	
	//address combobox
	public List<Code> getCityCode(Code code);
	public List<Code> getDistrictCode(Code code);
	public List<Code> getSubDistrictCode(Code code);
	public List<Code> getBuildingCode(Code code);
	public List<Code> getEntranceCode(Code code);
	public List<Code> getDoorCode(Code code);
	
	public List<Code> getGroupList(Code code);
	public String getImsiPrefix();
	public String getCodeParamReplace(LookupCode lookupCode);
	
	
}
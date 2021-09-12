package app.madeinho.ohquest.stock.day;

import java.util.HashMap;
import java.util.List;

import app.madeinho.ohquest.co.code.Code;
//import app.madeinho.ohquest.co.member.domain.Member;
import app.madeinho.ohquest.common.dao.Mapper;

@Mapper
public interface StockRepository {

	public int addStockDay(StockDay stockDay);	
	public List<Code> getCodeTypeList(String language);
	public int getCountRegData(String siteRegDt);
	public List<Code> getAllCodeList();
	public List<Code> getCodeListByOpenApi(String codeGroup);
	public List<Code> getCodeListAllByOpenApi();
	public List<StockDay> getMaxDayRate(StockDay stockDay);
	public int getCountRegDataScCode(StockDay stockDay);
	
	
}
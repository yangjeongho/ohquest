package app.madeinho.ohquest.stock.mystockhist;

import java.util.List;

//import app.madeinho.ohquest.common.domain.pagination.Pagination;
import app.madeinho.ohquest.stock.mystockhist.MyStockHist;
import app.madeinho.ohquest.common.dao.Mapper;

@Mapper
public interface MyStockHistRepository {
	public int getMyStockHistListCount(String search) ;	
	public List<MyStockHist> getMyStockHistList(String searchVal) ;
	public int insertMyStockHist(MyStockHist myStockHist) ;	
	public int updateMyStockHist(MyStockHist myStockHist) ;	
	public int deleteMyStockHist(MyStockHist myStockHist) ;	
	public int getMyStockHistCount(int addNum) ;	
	public String getAddSeqNo(MyStockHist address) ;	
	public List<MyStockHist> getmystockHistAlltList(MyStockHist myStockHist) ;
}
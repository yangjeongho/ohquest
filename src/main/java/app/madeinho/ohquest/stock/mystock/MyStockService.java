package app.madeinho.ohquest.stock.mystock;
import java.io.File;
import java.util.List;

import app.madeinho.ohquest.common.domain.searchFilter.SearchFilter;
import app.madeinho.ohquest.stock.mystock.MyStock;

public interface MyStockService {
	
	public List<MyStock> getMyStockList(SearchFilter searchFilter) ;
	public List<MyStock> getMyStockLikeList(MyStock MyStock) ;
	public List<MyStock> getMyStockListIN(SearchFilter searchFilter) ;
	public int insertMyStock(MyStock MyStock) ;	
	public int updateMyStock(MyStock MyStock) ;	
	public int deleteMyStock(MyStock MyStock) ;	
	public int getMyStockCount(int addNum) ;	
	public List<MyStock> addMyStockByCsv(File csvFile);
	public List<MyStock> getMyStockAlltList(MyStock MyStock) ;
	public int getMyStockCount(SearchFilter searchFilter) ;
	public int getLastInsertId(String search) ;

}
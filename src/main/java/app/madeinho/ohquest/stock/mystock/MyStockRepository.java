package app.madeinho.ohquest.stock.mystock;

import java.util.List;

import app.madeinho.ohquest.common.dao.Mapper;
import app.madeinho.ohquest.common.domain.searchFilter.SearchFilter;
//import app.madeinho.ohquest.common.domain.pagination.Pagination;

@Mapper
public interface MyStockRepository {
	public int getMyStockListCount(String search) ;	
	public List<MyStock> getMyStockList(SearchFilter searchFilter) ;
	public List<MyStock> getMyStockLikeList(MyStock myStock) ;
	public List<MyStock> getMyStockListIN(SearchFilter searchFilter) ;
	public int insertMyStock(MyStock myStock) ;	
	public int updateMyStock(MyStock myStock) ;	
	public int deleteMyStock(MyStock myStock) ;	
	public int getMyStockCount(int addNum) ;	
	public String getAddSeqNo(MyStock address) ;	
	public List<MyStock> getMyStockAlltList(MyStock myStock) ;
	public int getMyStockCount(SearchFilter searchFilter) ;
	public int getLastInsertId(String search) ;
	
}
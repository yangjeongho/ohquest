package app.madeinho.ohquest.ui.item;

import java.util.List;

//import app.madeinho.ohquest.common.domain.pagination.Pagination;
import app.madeinho.ohquest.ui.item.Item;
import app.madeinho.ohquest.common.dao.Mapper;

@Mapper
public interface ItemRepository {
	public int getItemListCount(String search) ;	
	public List<Item> getItemList(String searchVal) ;
	public int insertItem(Item item) ;	
	public int updateItem(Item item) ;	
	public int deleteItem(Item item) ;	
	public int getItemCount(int addNum) ;	
	public String getAddSeqNo(Item item) ;	
	public List<Item> getItemAlltList(Item item) ;
}
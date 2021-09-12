package app.madeinho.ohquest.ui.item;

import java.io.File;
import java.io.FileReader;
import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import app.madeinho.ohquest.ui.item.Item;
//import com.acube.unitel.common.domain.pagination.Pagination;
//import com.acube.unitel.common.exception.AcubeException;
//import com.acube.unitel.common.util.CsvReader;
import app.madeinho.ohquest.ui.item.ItemServiceImpl;


@Service
@Transactional
public class ItemServiceImpl implements ItemService {
	
	private static final Logger logger1 = LoggerFactory.getLogger(ItemServiceImpl.class);
	
	@Autowired ItemRepository itemRepository;

	/**
	* {@inheritDoc}
	*/
	@Override
	public List<Item> getItemList(String searchVal) {
		return itemRepository.getItemList(searchVal); 
	}

	
	/**
	* {@inheritDoc}
	*/
	@Override
	public int insertItem(Item item) {
		
		return itemRepository.insertItem(item);
	}


	@Override
	public int updateItem(Item Item) {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public int deleteItem(Item Item) {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public int getItemCount(int addNum) {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public List<Item> addItemByCsv(File csvFile) {
		// TODO Auto-generated method stub
		return null;
	}

	public List<Item> getItemAlltList(Item item)  {
		// TODO Auto-generated method stub
		return itemRepository.getItemAlltList(item);
	}


}

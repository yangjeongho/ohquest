package app.madeinho.ohquest.stock.mystock;

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

import app.madeinho.ohquest.common.domain.searchFilter.SearchFilter;
import app.madeinho.ohquest.stock.mystock.MyStock;
//import com.acube.unitel.common.domain.pagination.Pagination;
//import com.acube.unitel.common.exception.AcubeException;
//import com.acube.unitel.common.util.CsvReader;


@Service
@Transactional
public class MyStockServiceImpl implements MyStockService {
	
	private static final Logger logger1 = LoggerFactory.getLogger(MyStockServiceImpl.class);
	
	@Autowired MyStockRepository MyStockRepository;

	/**
	* {@inheritDoc}
	*/
	@Override
	public List<MyStock> getMyStockList(SearchFilter searchFilter) {
		return MyStockRepository.getMyStockList(searchFilter); 
	}
	
	@Override
	public List<MyStock> getMyStockLikeList(MyStock MyStock) {
		return MyStockRepository.getMyStockLikeList(MyStock); 
	}
	
	
	@Override
	public List<MyStock> getMyStockListIN(SearchFilter searchFilter) {
		return MyStockRepository.getMyStockListIN(searchFilter); 
	}
	

	


	@Override
	public int getMyStockCount(int addNum) {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public List<MyStock> addMyStockByCsv(File csvFile) {
		// TODO Auto-generated method stub
		return null;
	}

	



	@Override
	public int insertMyStock(MyStock MyStock) {
		// TODO Auto-generated method stub
		return MyStockRepository.insertMyStock(MyStock);
		//return 0;
	}


	@Override
	public int updateMyStock(MyStock MyStock) {
		// TODO Auto-generated method stub
		return MyStockRepository.updateMyStock(MyStock);
	}


	@Override
	public int deleteMyStock(MyStock MyStock) {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public List<MyStock> getMyStockAlltList(MyStock MyStock) {
		// TODO Auto-generated method stub
		return null;
	}




	@Override
	public int getMyStockCount(SearchFilter searchFilter) {
		return MyStockRepository.getMyStockCount(searchFilter);
	}


	@Override
	public int getLastInsertId(String search) {
		// TODO Auto-generated method stub
		return MyStockRepository.getLastInsertId(search);
	}
	
	


}

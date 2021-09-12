package app.madeinho.ohquest.stock.mystockhist;

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

import app.madeinho.ohquest.stock.mystockhist.MyStockHist;
//import com.acube.unitel.common.domain.pagination.Pagination;
//import com.acube.unitel.common.exception.AcubeException;
//import com.acube.unitel.common.util.CsvReader;


@Service
@Transactional
public class MyStockHistServiceImpl implements MyStockHistService {
	
	private static final Logger logger1 = LoggerFactory.getLogger(MyStockHistServiceImpl.class);
	
	@Autowired MyStockHistRepository myStockHistRepository;

	/**
	* {@inheritDoc}
	*/
	@Override
	public List<MyStockHist> getMystockHistList(String searchVal) {
		return myStockHistRepository.getMyStockHistList(searchVal); 
	}

	


	@Override
	public int getMystockHistCount(int addNum) {
		// TODO Auto-generated method stub
		return 0;
	}






	@Override
	public int insertMystockHist(MyStockHist myStockHist) {
		// TODO Auto-generated method stub
		System.out.println("양정호 :myStockHist > "+myStockHist);
		return myStockHistRepository.insertMyStockHist(myStockHist);
		//return 0;
	}


	@Override
	public int updateMystockHist(MyStockHist myStockHist) {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public int deleteMystockHist(MyStockHist myStockHist) {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public List<MyStockHist> getMystockHistAlltList(MyStockHist myStockHist) {
		// TODO Auto-generated method stub
		return null;
	}


}

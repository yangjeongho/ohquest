package app.madeinho.ohquest.ui.connect;

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

import app.madeinho.ohquest.ui.connect.ConnectLogin;
//import com.acube.unitel.common.domain.pagination.Pagination;
//import com.acube.unitel.common.exception.AcubeException;
//import com.acube.unitel.common.util.CsvReader;
import app.madeinho.ohquest.ui.connect.ConnectLoginRepository;
import app.madeinho.ohquest.ui.connect.ConnectLoginService;


@Service
@Transactional
public class ConnectLoginServiceImpl implements ConnectLoginService {
	
	private static final Logger logger1 = LoggerFactory.getLogger(ConnectLoginServiceImpl.class);
	
	@Autowired ConnectLoginRepository connectRepository;

	/**
	* {@inheritDoc}
	*/
	@Override
	public List<ConnectLogin> getConnectList(String searchVal) {
		return connectRepository.getConnectList(searchVal); 
	}

	
	/**
	* {@inheritDoc}
	*/
	@Override
	public int insertConnect(ConnectLogin connect) {
		
		return connectRepository.insertConnect(connect);
	}


	@Override
	public int updateConnect(ConnectLogin Connect) {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public int deleteConnect(ConnectLogin Connect) {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public int getConnectCount(int addNum) {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public List<ConnectLogin> addConnectByCsv(File csvFile) {
		// TODO Auto-generated method stub
		return null;
	}

	public List<ConnectLogin> getConnectAlltList(ConnectLogin connect)  {
		// TODO Auto-generated method stub
		return connectRepository.getConnectAlltList(connect);
	}


}

package app.madeinho.ohquest.ui.config;

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

import app.madeinho.ohquest.ui.config.Config;
//import com.acube.unitel.common.domain.pagination.Pagination;
//import com.acube.unitel.common.exception.AcubeException;
//import com.acube.unitel.common.util.CsvReader;
import app.madeinho.ohquest.ui.config.ConfigServiceImpl;


@Service
@Transactional
public class ConfigServiceImpl implements ConfigService {
	
	private static final Logger logger1 = LoggerFactory.getLogger(ConfigServiceImpl.class);
	
	@Autowired ConfigRepository configRepository;

	/**
	* {@inheritDoc}
	*/
	@Override
	public List<Config> getConfigList(String searchVal) {
		return configRepository.getConfigList(searchVal); 
	}

	
	/**
	* {@inheritDoc}
	*/
	@Override
	public int insertConfig(Config config) {
		
		return configRepository.insertConfig(config);
	}


	@Override
	public int updateConfig(Config Config) {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public int deleteConfig(Config Config) {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public int getConfigCount(int addNum) {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public List<Config> addConfigByCsv(File csvFile) {
		// TODO Auto-generated method stub
		return null;
	}

	public List<Config> getConfigAlltList(Config config)  {
		// TODO Auto-generated method stub
		return configRepository.getConfigAlltList(config);
	}


}

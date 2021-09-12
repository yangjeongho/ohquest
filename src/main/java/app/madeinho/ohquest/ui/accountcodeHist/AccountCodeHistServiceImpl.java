package app.madeinho.ohquest.ui.accountcodeHist;

import java.io.File;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
//import com.acube.unitel.common.domain.pagination.Pagination;
//import com.acube.unitel.common.exception.AcubeException;
//import com.acube.unitel.common.util.CsvReader;

import app.madeinho.ohquest.ui.accountcode.AccountCode;


@Service
@Transactional
public class AccountCodeHistServiceImpl implements AccountCodeHistService {
	
	private static final Logger logger1 = LoggerFactory.getLogger(AccountCodeHistServiceImpl.class);
	
	@Autowired AccountCodeHistRepository accountCodeHistRepository;

	/**
	* {@inheritDoc}
	*/
	@Override
	public List<AccountCodeHist> getAccountCodeHistList(String searchVal) {
		return accountCodeHistRepository.getAccountCodeHistList(searchVal); 
	}

	


	@Override
	public int getAccountCodeHistCount(int addNum) {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public List<AccountCodeHist> addAccountCodeHistByCsv(File csvFile) {
		// TODO Auto-generated method stub
		return null;
	}




	@Override
	public int insertAccountCodeHist(AccountCode accountCode) {
		// TODO Auto-generated method stub
		return accountCodeHistRepository.insertAccountCodeHist(accountCode);
		//return 0;
	}


	@Override
	public int updateAccountCodeHist(AccountCodeHist accountCodeHist) {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public int deleteAccountCodeHist(AccountCodeHist accountCodeHist) {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public List<AccountCodeHist> getAccountCodeHistAlltList(AccountCodeHist accountCodeHist) {
		// TODO Auto-generated method stub
		return null;
	}
	
	public List<AccountCodeHist> getMyAccountCodeHistAlltList(AccountCodeHist accountCodeHist) {
	  return accountCodeHistRepository.getMyAccountCodeHistAlltList(accountCodeHist);
	}


}

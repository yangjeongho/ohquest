package app.madeinho.ohquest.ui.accountcode;

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

import app.madeinho.ohquest.ui.accountcode.AccountCode;
//import com.acube.unitel.common.domain.pagination.Pagination;
//import com.acube.unitel.common.exception.AcubeException;
//import com.acube.unitel.common.util.CsvReader;


@Service
@Transactional
public class AccountCodeServiceImpl implements AccountCodeService {
	
	private static final Logger logger1 = LoggerFactory.getLogger(AccountCodeServiceImpl.class);
	
	@Autowired AccountCodeRepository accountCodeRepository;

	/**
	* {@inheritDoc}
	*/
	@Override
	public List<AccountCode> getAccountCodeList(String searchVal) {
		return accountCodeRepository.getAccountCodeList(searchVal); 
	}

	


	@Override
	public int getAccountCodeCount(int addNum) {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public List<AccountCode> addAccountCodeByCsv(File csvFile) {
		// TODO Auto-generated method stub
		return null;
	}




	@Override
	public int insertAccountCode(AccountCode accountCode) {
		// TODO Auto-generated method stub
		return accountCodeRepository.insertAccountCode(accountCode);
		//return 0;
	}


	@Override
	public int updateAccountCode(AccountCode accountCode) {
		// TODO Auto-generated method stub
		return accountCodeRepository.updateAccountCode(accountCode);
	}


	@Override
	public int deleteAccountCode(AccountCode accountCode) {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public List<AccountCode> getAccountCodeAlltList(AccountCode accountCode) {
		// TODO Auto-generated method stub
		return null;
	}
	
	public List<AccountCode> getMyAccountCodeAlltList(AccountCode accountCode) {
	  return accountCodeRepository.getMyAccountCodeAlltList(accountCode);
	}


}

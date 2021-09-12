package app.madeinho.ohquest.ui.account;

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
import app.madeinho.ohquest.ui.account.Account;
//import com.acube.unitel.common.domain.pagination.Pagination;
//import com.acube.unitel.common.exception.AcubeException;
//import com.acube.unitel.common.util.CsvReader;


@Service
@Transactional
public class AccountServiceImpl implements AccountService {
	
	private static final Logger logger1 = LoggerFactory.getLogger(AccountServiceImpl.class);
	
	@Autowired AccountRepository accountRepository;

	/**
	* {@inheritDoc}
	*/
	@Override
	public List<Account> getAccountList(String searchVal) {
		return accountRepository.getAccountList(searchVal); 
	}

	


	@Override
	public int getAccountCount(int addNum) {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public List<Account> addAccountByCsv(File csvFile) {
		// TODO Auto-generated method stub
		return null;
	}




	@Override
	public int insertAccount(Account account) {
		// TODO Auto-generated method stub
		return accountRepository.insertAccount(account);
		//return 0;
	}


	@Override
	public int updateAccount(Account account) {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public int deleteAccount(Account account) {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public List<Account> getAccountAlltList(Account account) {
		// TODO Auto-generated method stub
		return accountRepository.getAccountAlltList(account); 
	}




	@Override
	public List<AccountDetailInfo> getAccountDetailInfoHist(
			SearchFilter searchFilter) {
		// TODO Auto-generated method stub
		return accountRepository.getAccountDetailInfoHist(searchFilter); 
	}


}

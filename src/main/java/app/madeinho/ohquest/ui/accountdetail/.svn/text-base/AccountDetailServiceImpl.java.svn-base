package app.madeinho.ohquest.ui.accountdetail;

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

import app.madeinho.ohquest.ui.accountdetail.AccountDetail;
//import com.acube.unitel.common.domain.pagination.Pagination;
//import com.acube.unitel.common.exception.AcubeException;
//import com.acube.unitel.common.util.CsvReader;


@Service
@Transactional
public class AccountDetailServiceImpl implements AccountDetailService {
	
	private static final Logger logger1 = LoggerFactory.getLogger(AccountDetailServiceImpl.class);
	
	@Autowired AccountDetailRepository accountDetailRepository;

	/**
	* {@inheritDoc}
	*/
	@Override
	public List<AccountDetail> getAccountDetailList(String searchVal) {
		return accountDetailRepository.getAccountDetailList(searchVal); 
	}

	


	@Override
	public int getAccountDetailCount(int addNum) {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public List<AccountDetail> addAccountDetailByCsv(File csvFile) {
		// TODO Auto-generated method stub
		return null;
	}




	@Override
	public int insertAccountDetail(AccountDetail accountDetail) {
		// TODO Auto-generated method stub
		return accountDetailRepository.insertAccountDetail(accountDetail);
		//return 0;
	}


	@Override
	public int updateAccountDetail(AccountDetail accountDetail) {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public int deleteAccountDetail(AccountDetail accountDetail) {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public List<AccountDetail> getAccountDetailAlltList(AccountDetail accountDetail) {
		// TODO Auto-generated method stub
		return null;
	}


}

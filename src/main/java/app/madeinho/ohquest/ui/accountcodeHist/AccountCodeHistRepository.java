package app.madeinho.ohquest.ui.accountcodeHist;

import java.util.List;

import app.madeinho.ohquest.common.dao.Mapper;
//import app.madeinho.ohquest.common.domain.pagination.Pagination;
import app.madeinho.ohquest.ui.accountcode.AccountCode;

@Mapper
public interface AccountCodeHistRepository {
	public int getAccountCodeHistListCount(String search) ;	
	public List<AccountCodeHist> getAccountCodeHistList(String searchVal) ;
	public int insertAccountCodeHist(AccountCode accountCode) ;	
	public int updateAccountCodeHist(AccountCodeHist accountCodeHist) ;	
	public int deleteAccountCodeHist(AccountCodeHist accountCodeHist) ;	
	public int getAccountCodeHistCount(int addNum) ;	
	public String getAddSeqNo(AccountCodeHist accountCodeHist) ;	
	public List<AccountCodeHist> getAccountCodeHistAlltList(AccountCodeHist accountCodeHist) ;
	public List<AccountCodeHist> getMyAccountCodeHistAlltList(AccountCodeHist accountCodeHist);
}
package app.madeinho.ohquest.ui.account;

import java.util.List;

//import app.madeinho.ohquest.common.domain.pagination.Pagination;
import app.madeinho.ohquest.ui.account.Account;
import app.madeinho.ohquest.common.dao.Mapper;
import app.madeinho.ohquest.common.domain.searchFilter.SearchFilter;

@Mapper
public interface AccountRepository {
	public int getAccountListCount(String search) ;	
	public List<Account> getAccountList(String searchVal) ;
	public int insertAccount(Account address) ;	
	public int updateAccount(Account address) ;	
	public int deleteAccount(Account address) ;	
	public int getAccountCount(int addNum) ;	
	public String getAddSeqNo(Account address) ;	
	public List<Account> getAccountAlltList(Account account) ;
	public List<AccountDetailInfo> getAccountDetailInfoHist(SearchFilter searchFilter);
}
package app.madeinho.ohquest.ui.account;
import java.io.File;
import java.util.List;

import app.madeinho.ohquest.common.domain.searchFilter.SearchFilter;
import app.madeinho.ohquest.ui.account.Account;

public interface AccountService {
	
	public List<Account> getAccountList(String searchVal) ;
	public int insertAccount(Account account) ;	
	public int updateAccount(Account account) ;	
	public int deleteAccount(Account account) ;	
	public int getAccountCount(int addNum) ;	
	public List<Account> addAccountByCsv(File csvFile);
	public List<Account> getAccountAlltList(Account account) ;
	public List<AccountDetailInfo> getAccountDetailInfoHist(SearchFilter searchFilter);

}
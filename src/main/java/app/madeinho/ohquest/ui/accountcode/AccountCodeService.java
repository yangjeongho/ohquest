package app.madeinho.ohquest.ui.accountcode;
import java.io.File;
import java.util.List;

import app.madeinho.ohquest.ui.accountcode.AccountCode;

public interface AccountCodeService {
	
	public List<AccountCode> getAccountCodeList(String searchVal) ;
	public int insertAccountCode(AccountCode accountCode) ;	
	public int updateAccountCode(AccountCode accountCode) ;	
	public int deleteAccountCode(AccountCode accountCode) ;	
	public int getAccountCodeCount(int addNum) ;	
	public List<AccountCode> addAccountCodeByCsv(File csvFile);
	public List<AccountCode> getAccountCodeAlltList(AccountCode accountCode) ;
	public List<AccountCode> getMyAccountCodeAlltList(AccountCode accountCode) ;

}
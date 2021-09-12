package app.madeinho.ohquest.ui.accountcode;

import java.util.List;

//import app.madeinho.ohquest.common.domain.pagination.Pagination;
import app.madeinho.ohquest.ui.accountcode.AccountCode;
import app.madeinho.ohquest.common.dao.Mapper;

@Mapper
public interface AccountCodeRepository {
	public int getAccountCodeListCount(String search) ;	
	public List<AccountCode> getAccountCodeList(String searchVal) ;
	public int insertAccountCode(AccountCode accountCode) ;	
	public int updateAccountCode(AccountCode accountCode) ;	
	public int deleteAccountCode(AccountCode accountCode) ;	
	public int getAccountCodeCount(int addNum) ;	
	public String getAddSeqNo(AccountCode accountCode) ;	
	public List<AccountCode> getAccountCodeAlltList(AccountCode accountCode) ;
	public List<AccountCode> getMyAccountCodeAlltList(AccountCode accountCode);
}
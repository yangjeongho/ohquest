package app.madeinho.ohquest.ui.accountdetail;

import java.util.List;

//import app.madeinho.ohquest.common.domain.pagination.Pagination;
import app.madeinho.ohquest.ui.accountdetail.AccountDetail;
import app.madeinho.ohquest.common.dao.Mapper;

@Mapper
public interface AccountDetailRepository {
	public int getAccountDetailListCount(String search) ;	
	public List<AccountDetail> getAccountDetailList(String searchVal) ;
	public int insertAccountDetail(AccountDetail accountDetail) ;	
	public int updateAccountDetail(AccountDetail accountDetail) ;	
	public int deleteAccountDetail(AccountDetail accountDetail) ;	
	public int getAccountDetailCount(int addNum) ;	
	public String getAddSeqNo(AccountDetail accountDetail) ;	
	public List<AccountDetail> getAccountDetailAlltList(AccountDetail accountDetail) ;
}
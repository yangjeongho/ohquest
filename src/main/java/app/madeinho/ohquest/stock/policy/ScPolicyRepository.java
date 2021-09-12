package app.madeinho.ohquest.stock.policy;

import java.util.List;

import app.madeinho.ohquest.common.dao.Mapper;
//import app.madeinho.ohquest.common.domain.pagination.Pagination;

@Mapper
public interface ScPolicyRepository {
	public int getScPolicyListCount(String search) ;	
	public List<ScPolicy> getScPolicyList(String searchVal) ;
	public int insertScPolicy(ScPolicy scPolicy) ;	
	public int updateScPolicy(ScPolicy scPolicy) ;	
	public int deleteScPolicy(ScPolicy scPolicy) ;	
	public int getScPolicyCount(int addNum) ;	
	public String getAddSeqNo(ScPolicy address) ;	
	public List<ScPolicy> getScPolicyAlltList(ScPolicy scPolicy) ;
}
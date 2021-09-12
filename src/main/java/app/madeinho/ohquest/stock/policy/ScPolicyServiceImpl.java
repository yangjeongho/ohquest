package app.madeinho.ohquest.stock.policy;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
//import com.acube.unitel.common.domain.pagination.Pagination;
//import com.acube.unitel.common.exception.AcubeException;
//import com.acube.unitel.common.util.CsvReader;


@Service
@Transactional
public class ScPolicyServiceImpl implements ScPolicyService {
	
	private static final Logger logger1 = LoggerFactory.getLogger(ScPolicyServiceImpl.class);
	
	@Autowired ScPolicyRepository scPolicyRepository;

	/**
	* {@inheritDoc}
	*/
	@Override
	public List<ScPolicy> getScPolicyList(String searchVal) {
		return scPolicyRepository.getScPolicyList(searchVal); 
	}

	


	@Override
	public int getScPolicyCount(int addNum) {
		// TODO Auto-generated method stub
		return 0;
	}






	@Override
	public int insertScPolicy(ScPolicy scPolicy) {
		// TODO Auto-generated method stub
		System.out.println("양정호 :scPolicy > "+scPolicy);
		return scPolicyRepository.insertScPolicy(scPolicy);
		//return 0;
	}


	@Override
	public int updateScPolicy(ScPolicy scPolicy) {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public int deleteScPolicy(ScPolicy scPolicy) {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public List<ScPolicy> getScPolicyAlltList(ScPolicy scPolicy) {
		// TODO Auto-generated method stub
		return scPolicyRepository.getScPolicyAlltList(scPolicy);
	}


}

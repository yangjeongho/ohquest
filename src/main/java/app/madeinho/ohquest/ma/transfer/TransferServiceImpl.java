package app.madeinho.ohquest.ma.transfer;

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

import app.madeinho.ohquest.ma.transfer.Transfer;
//import com.acube.unitel.common.domain.pagination.Pagination;
//import com.acube.unitel.common.exception.AcubeException;
//import com.acube.unitel.common.util.CsvReader;


@Service
@Transactional
public class TransferServiceImpl implements TransferService {
	
	private static final Logger logger1 = LoggerFactory.getLogger(TransferServiceImpl.class);
	
	@Autowired TransferRepository transferRepository;

	/**
	* {@inheritDoc}
	*/
	@Override
	public List<Transfer> getTransferList(String searchVal) {
		return transferRepository.getTransferList(searchVal); 
	}

	


	@Override
	public int getTransferCount(int addNum) {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public List<Transfer> addTransferByCsv(File csvFile) {
		// TODO Auto-generated method stub
		return null;
	}




	@Override
	public int insertTransfer(Transfer transfer) {
		// TODO Auto-generated method stub
		return transferRepository.insertTransfer(transfer);
		//return 0;
	}


	@Override
	public int updateTransfer(Transfer transfer) {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public int deleteTransfer(Transfer transfer) {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public List<Transfer> getTransferAlltList(Transfer transfer) {
		// TODO Auto-generated method stub
		return null;
	}


}

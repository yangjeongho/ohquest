package app.madeinho.ohquest.ma.transfer;
import java.io.File;
import java.util.List;

import app.madeinho.ohquest.ma.transfer.Transfer;

public interface TransferService {
	
	public List<Transfer> getTransferList(String searchVal) ;
	public int insertTransfer(Transfer transfer) ;	
	public int updateTransfer(Transfer transfer) ;	
	public int deleteTransfer(Transfer transfer) ;	
	public int getTransferCount(int addNum) ;	
	public List<Transfer> addTransferByCsv(File csvFile);
	public List<Transfer> getTransferAlltList(Transfer transfer) ;

}
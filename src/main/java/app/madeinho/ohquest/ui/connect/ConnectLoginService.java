package app.madeinho.ohquest.ui.connect;
import java.io.File;
import java.util.List;

import app.madeinho.ohquest.ui.connect.ConnectLogin;

public interface ConnectLoginService {
	
	public List<ConnectLogin> getConnectList(String searchVal) ;
	public int insertConnect(ConnectLogin connect) ;	
	public int updateConnect(ConnectLogin connect) ;	
	public int deleteConnect(ConnectLogin connect) ;	
	public int getConnectCount(int addNum) ;	
	public List<ConnectLogin> addConnectByCsv(File csvFile);
	public List<ConnectLogin> getConnectAlltList(ConnectLogin connect) ;
}
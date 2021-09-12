package app.madeinho.ohquest.stock.mystockhist;
import java.io.File;
import java.util.List;

import app.madeinho.ohquest.stock.mystockhist.MyStockHist;

public interface MyStockHistService {
	
	public List<MyStockHist> getMystockHistList(String searchVal) ;
	public int insertMystockHist(MyStockHist myStockHist) ;	
	public int updateMystockHist(MyStockHist myStockHist) ;	
	public int deleteMystockHist(MyStockHist myStockHist) ;	
	public int getMystockHistCount(int addNum) ;	
//	public List<MystockHist> addMystockHistByCsv(File csvFile);
	public List<MyStockHist> getMystockHistAlltList(MyStockHist myStockHist) ;

}
package app.madeinho.ohquest.stock.analyze;

import app.madeinho.ohquest.stock.mystock.MyStock;

public interface AnalyzePolicySiteService  {

	//판매 정책 프로세스
	public void processPolicyAnalyze(MyStock myStockInfo) ;
	public void processAccountInfo(MyStock myStockInfo) ;
	
}
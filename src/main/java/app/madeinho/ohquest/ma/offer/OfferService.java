package app.madeinho.ohquest.ma.offer;
import java.io.File;
import java.util.List;

import app.madeinho.ohquest.ma.offer.Offer;

public interface OfferService {
	
	public List<Offer> getOfferList(String searchVal) ;
	public int insertOffer(Offer offer) ;	
	public int updateOffer(Offer offer) ;	
	public int deleteOffer(Offer offer) ;	
	public int getOfferCount(int addNum) ;	
	public List<Offer> addOfferByCsv(File csvFile);
	public List<Offer> getOfferAlltList(Offer offer) ;

}
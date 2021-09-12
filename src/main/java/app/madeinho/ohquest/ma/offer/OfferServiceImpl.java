package app.madeinho.ohquest.ma.offer;

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

import app.madeinho.ohquest.ma.offer.Offer;
//import com.acube.unitel.common.domain.pagination.Pagination;
//import com.acube.unitel.common.exception.AcubeException;
//import com.acube.unitel.common.util.CsvReader;


@Service
@Transactional
public class OfferServiceImpl implements OfferService {
	
	private static final Logger logger1 = LoggerFactory.getLogger(OfferServiceImpl.class);
	
	@Autowired OfferRepository offerRepository;

	/**
	* {@inheritDoc}
	*/
	@Override
	public List<Offer> getOfferList(String searchVal) {
		return offerRepository.getOfferList(searchVal); 
	}

	


	@Override
	public int getOfferCount(int addNum) {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public List<Offer> addOfferByCsv(File csvFile) {
		// TODO Auto-generated method stub
		return null;
	}




	@Override
	public int insertOffer(Offer offer) {
		// TODO Auto-generated method stub
		return offerRepository.insertOffer(offer);
		//return 0;
	}


	@Override
	public int updateOffer(Offer offer) {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public int deleteOffer(Offer offer) {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public List<Offer> getOfferAlltList(Offer offer) {
		// TODO Auto-generated method stub
		return null;
	}


}

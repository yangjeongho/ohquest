package app.madeinho.ohquest.ui.address;

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

import app.madeinho.ohquest.ui.address.Address;
//import com.acube.unitel.common.domain.pagination.Pagination;
//import com.acube.unitel.common.exception.AcubeException;
//import com.acube.unitel.common.util.CsvReader;


@Service
@Transactional
public class AddressServiceImpl implements AddressService {
	
	private static final Logger logger1 = LoggerFactory.getLogger(AddressServiceImpl.class);
	
	@Autowired AddressRepository addressRepository;

	/**
	* {@inheritDoc}
	*/
	@Override
	public List<Address> getAddressList(String searchVal) {
		return addressRepository.getAddressList(searchVal); 
	}

	


	@Override
	public int getAddressCount(int addNum) {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public List<Address> addAddressByCsv(File csvFile) {
		// TODO Auto-generated method stub
		return null;
	}




	@Override
	public int insertAddress(Address address) {
		// TODO Auto-generated method stub
		return addressRepository.insertAddress(address);
		//return 0;
	}


	@Override
	public int updateAddress(Address address) {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public int deleteAddress(Address address) {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public List<Address> getAddressAlltList(Address address) {
		// TODO Auto-generated method stub
		return null;
	}


}

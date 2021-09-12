package app.madeinho.ohquest.ui.photo;

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

import app.madeinho.ohquest.ui.photo.Photo;
//import com.acube.unitel.common.domain.pagination.Pagination;
//import com.acube.unitel.common.exception.AcubeException;
//import com.acube.unitel.common.util.CsvReader;
import app.madeinho.ohquest.ui.photo.PhotoServiceImpl;


@Service
@Transactional
public class PhotoServiceImpl implements PhotoService {
	
	private static final Logger logger1 = LoggerFactory.getLogger(PhotoServiceImpl.class);
	
	@Autowired PhotoRepository photoRepository;

	/**
	* {@inheritDoc}
	*/
	@Override
	public List<Photo> getPhotoList(String searchVal) {
		return photoRepository.getPhotoList(searchVal); 
	}

	
	/**
	* {@inheritDoc}
	*/
	@Override
	public int insertPhoto(Photo photo) {
		
		return photoRepository.insertPhoto(photo);
	}


	@Override
	public int updatePhoto(Photo Photo) {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public int deletePhoto(Photo Photo) {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public int getPhotoCount(int addNum) {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public List<Photo> addPhotoByCsv(File csvFile) {
		// TODO Auto-generated method stub
		return null;
	}

	public List<Photo> getPhotoAlltList(Photo photo)  {
		// TODO Auto-generated method stub
		return photoRepository.getPhotoAlltList(photo);
	}


}

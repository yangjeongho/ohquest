package app.madeinho.ohquest.ui.photo;

import java.util.List;

//import app.madeinho.ohquest.common.domain.pagination.Pagination;
import app.madeinho.ohquest.ui.photo.Photo;
import app.madeinho.ohquest.common.dao.Mapper;

@Mapper
public interface PhotoRepository {
	public int getPhotoListCount(String search) ;	
	public List<Photo> getPhotoList(String searchVal) ;
	public int insertPhoto(Photo photo) ;	
	public int updatePhoto(Photo photo) ;	
	public int deletePhoto(Photo photo) ;	
	public int getPhotoCount(int addNum) ;	
	public String getAddSeqNo(Photo photo) ;	
	public List<Photo> getPhotoAlltList(Photo photo) ;
}
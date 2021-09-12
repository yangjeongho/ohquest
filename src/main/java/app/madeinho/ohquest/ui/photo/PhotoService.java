package app.madeinho.ohquest.ui.photo;
import java.io.File;
import java.util.List;

import app.madeinho.ohquest.ui.photo.Photo;

public interface PhotoService {
	
	public List<Photo> getPhotoList(String searchVal) ;
	public int insertPhoto(Photo photo) ;	
	public int updatePhoto(Photo photo) ;	
	public int deletePhoto(Photo photo) ;	
	public int getPhotoCount(int addNum) ;	
	public List<Photo> addPhotoByCsv(File csvFile);
	public List<Photo> getPhotoAlltList(Photo photo) ;
}
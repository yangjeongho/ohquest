package app.madeinho.ohquest.co.notice;

import java.io.File;
import java.io.FileOutputStream;
import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


//import app.madeinho.ohquest.ccs.domain.Counsel;
//import app.madeinho.ohquest.ccs.domain.OrderList;
//import app.madeinho.ohquest.co.security.SecurityService;
import app.madeinho.ohquest.common.domain.pagination.Pagination;
import app.madeinho.ohquest.common.domain.searchFilter.SearchFilter;
import app.madeinho.ohquest.common.exception.OhquestException;
//import app.madeinho.ohquest.cs.notice.domain.type.WorkType;
//import app.madeinho.ohquest.cs.notice.domain.CsNotice;
//import app.madeinho.ohquest.cs.notice.domain.CsNoticeFile;


@Service
@Transactional
public class NoticeServiceImpl implements NoticeService {
	
	@Autowired NoticeRepository csNoticeRepository;
	//@Autowired SecurityService securityService;
	
	//@Value("${data.home.path}") private String noticeUploadPath ;
	//data.home.path=/home/user/mcbs
	@Value("/home/user/mcbs/notice") private String noticeUploadPath ;
	
	private static Logger logger = LoggerFactory.getLogger(NoticeServiceImpl.class);

	/**
	* {@inheritDoc}
	*/
	@Override
	public List<Notice> getCsNoticeList(SearchFilter searchFilter, Pagination pagination) {
		return csNoticeRepository.getCsNoticeList(searchFilter, pagination);
	}
	
	@Override
	public List<Notice> getCsNoticeGrid(Notice csNotice, Pagination pagination) {
		return csNoticeRepository.getCsNoticeGrid(csNotice, pagination);
	}
	/**
	* {@inheritDoc}
	*/
	@Override
	public int getCsNoticeListCount(SearchFilter searchFilter) {
		return csNoticeRepository.getCsNoticeListCount(searchFilter);
	}
	@Override
	public int getCsNoticeListCount2(SearchFilter searchFilter) {
		return csNoticeRepository.getCsNoticeListCount2(searchFilter);
	}
	@Override
	public int updateCsNotice(Notice csNotice) {
		return csNoticeRepository.updateCsNotice(csNotice);
	}
	@Override
	public int insertNotice(Notice csNotice) {
		return csNoticeRepository.insertNotice(csNotice);
		
	}
	@Override
	public void getCsNoticeList(int seqNo) {
		// TODO Auto-generated method stub
		
	}
	@Override
	public Notice getCsNoticeListDetail(String seqNo) {
		Notice csNotice = csNoticeRepository.getCsNoticeListDetail(seqNo);
		//csNotice.setCsNoticeFiles(csNoticeRepository.getNoticeFileList(seqNo)); 
		return csNotice;//csNoticeRepository.getCsNoticeListDetail(seqNo);
		// TODO Auto-generated method stub
		
	}
	
	@Override
	public void deleteNotice(Notice csNotice) {
		String deleteItem = csNotice.getDeleteItem();
		String deleteItems[] = deleteItem.split(",");
		
		for(String item : deleteItems){
			 csNotice.setSeqNo(Integer.parseInt(item)) ;
			 csNoticeRepository.deleteNotice(csNotice);
			}
		
	}
	
	
	
	/**
	 * 공지사항 파일갯수 조회
	 */
	@Override
	public int getNoticeFileCnt(int notice_seqno){
		return csNoticeRepository.getNoticeFileCnt(notice_seqno); 
	}

	@Override
	public int addNoticeFile(Notice csNotice, List<MultipartFile> multipartFiles) {
		// TODO Auto-generated method stub
		return 0;
	}
}

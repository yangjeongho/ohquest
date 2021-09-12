package app.madeinho.ohquest.co.notice;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

//import app.madeinho.ohquest.ccs.domain.Counsel;
//import app.madeinho.ohquest.ccs.domain.OrderList;
import app.madeinho.ohquest.common.domain.pagination.Pagination;
import app.madeinho.ohquest.common.domain.searchFilter.SearchFilter;
//import app.madeinho.ohquest.cs.notice.domain.CsNotice;
//import app.madeinho.ohquest.cs.notice.domain.CsNoticeFile;

public interface NoticeService {
	
	public int getCsNoticeListCount(SearchFilter searchFilter) ;	
	public int getCsNoticeListCount2(SearchFilter searchFilter) ;
	public List<Notice> getCsNoticeList(SearchFilter searchFilter, Pagination pagination) ;
	public List<Notice> getCsNoticeGrid(Notice csNotice,Pagination pagination);
	public int updateCsNotice(Notice csNotice) ;
	public int insertNotice(Notice csNotice);
	public void getCsNoticeList(int seqNo);
	public Notice getCsNoticeListDetail(String seqNo);
	public void deleteNotice(Notice csNotice);
	
	//public List<Counsel> getMyCounselJobList();
	//public List<OrderList> getMyWorkJobList();
	//public List<OrderList> getMyTodoList();
	
	public int addNoticeFile(Notice csNotice, List<MultipartFile> multipartFiles);//공지사항 파일첨부
	//public List<CsNoticeFile> getNoticeFileList(String notice_seqno);//공지사항리스트조회
	//public void deleteFileData(CsNoticeFile csNoticeFile);//파일객체가없는경우 파일리스트 삭제변경
	
	public int getNoticeFileCnt(int notice_seqno);
	
}
package app.madeinho.ohquest.co.notice;

import java.util.List;

//import app.madeinho.ohquest.ccs.domain.Counsel;
//import app.madeinho.ohquest.ccs.domain.OrderList;
//import app.madeinho.ohquest.co.member.domain.Member;
import app.madeinho.ohquest.common.dao.Mapper;
import app.madeinho.ohquest.common.domain.pagination.Pagination;
import app.madeinho.ohquest.common.domain.searchFilter.SearchFilter;
//import app.madeinho.ohquest.cs.notice.domain.CsNotice;
//import app.madeinho.ohquest.cs.notice.domain.CsNoticeFile;

@Mapper
public interface NoticeRepository {
	public int getCsNoticeListCount(SearchFilter searchFilter) ;	
	public int getCsNoticeListCount2(SearchFilter searchFilter) ;
	public List<Notice> getCsNoticeList(SearchFilter searchFilter, Pagination pagination) ;
	public List<Notice> getCsNoticeGrid(Notice csNotice,Pagination pagination);
	public int updateCsNotice(Notice csNotice) ;
	public int insertNotice(Notice csNotice);
	public Notice getCsNoticeListDetail(String seqNo);
	
	public int getNoticeSeqno();//공지사항seq채번
	
	public void deleteNotice(Notice csNotice);
	
	//public List<Counsel> getMyCounselJobList(Member member);
	//public List<OrderList> getMyWorkJobList(Member member);
	
	//public List<OrderList> getMyTodoList(Member member);
	
	/*
	 * 파일관련 
	 */
	public String getFileSeqno(); //공지사항파일seq채번
	
	public int getNoticeFileCnt(int notice_seqno); //공지사항첨부파일조회
	
	
	
}
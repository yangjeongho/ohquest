package app.madeinho.ohquest.ui.member;

import java.util.List;

//import app.madeinho.ohquest.common.domain.pagination.Pagination;
import app.madeinho.ohquest.ui.member.Member;
import app.madeinho.ohquest.common.dao.Mapper;

@Mapper
public interface MemberRepository {
	public int getMemberListCount(String search) ;	
	public List<Member> getMemberList(String searchVal) ;
	public int insertMember(Member member) ;	
	public int updateMember(Member member) ;	
	public int deleteMember(Member member) ;	
	public int getMemberCount(int addNum) ;	
	public String getAddSeqNo(Member member) ;	
	public List<Member> getMemberAlltList(Member member) ;
}
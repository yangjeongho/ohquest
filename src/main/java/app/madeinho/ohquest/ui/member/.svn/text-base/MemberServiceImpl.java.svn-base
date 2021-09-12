package app.madeinho.ohquest.ui.member;

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

import app.madeinho.ohquest.ui.member.Member;
//import com.acube.unitel.common.domain.pagination.Pagination;
//import com.acube.unitel.common.exception.AcubeException;
//import com.acube.unitel.common.util.CsvReader;


@Service
@Transactional
public class MemberServiceImpl implements MemberService {
	
	private static final Logger logger1 = LoggerFactory.getLogger(MemberServiceImpl.class);
	
	@Autowired MemberRepository memberRepository;

	/**
	* {@inheritDoc}
	*/
	@Override
	public List<Member> getMemberList(String searchVal) {
		return memberRepository.getMemberList(searchVal); 
	}

	
	/**
	* {@inheritDoc}
	*/
	@Override
	public int insertMember(Member member) {
		
		return memberRepository.insertMember(member);
	}


	@Override
	public int updateMember(Member Member) {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public int deleteMember(Member Member) {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public int getMemberCount(int addNum) {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public List<Member> addMemberByCsv(File csvFile) {
		// TODO Auto-generated method stub
		return null;
	}

	public List<Member> getMemberAlltList(Member member)  {
		// TODO Auto-generated method stub
		return memberRepository.getMemberAlltList(member);
	}


}

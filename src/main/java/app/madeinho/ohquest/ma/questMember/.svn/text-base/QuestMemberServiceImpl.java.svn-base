package app.madeinho.ohquest.ma.questMember;

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

import app.madeinho.ohquest.ma.questMember.QuestMember;


@Service
@Transactional
public class QuestMemberServiceImpl implements QuestMemberService {
	
	private static final Logger logger1 = LoggerFactory.getLogger(QuestMemberServiceImpl.class);
	
	@Autowired QuestMemberRepository questMemberRepository;

	/**
	* {@inheritDoc}
	*/
	@Override
	public List<QuestMember> getQuestMemberList(String searchVal) {
		return questMemberRepository.getQuestMemberList(searchVal); 
	}

	


	@Override
	public int getQuestMemberCount(int addNum) {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public List<QuestMember> addQuestMemberByCsv(File csvFile) {
		// TODO Auto-generated method stub
		return null;
	}




	@Override
	public int insertQuestMember(QuestMember questMember) {
		// TODO Auto-generated method stub
		return questMemberRepository.insertQuestMember(questMember);
		//return 0;
	}


	@Override
	public int updateQuestMember(QuestMember questMember) {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public int deleteQuestMember(QuestMember questMember) {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public List<QuestMember> getQuestMemberAlltList(QuestMember questMember) {
		// TODO Auto-generated method stub
		return null;
	}


}

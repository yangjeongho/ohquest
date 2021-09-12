package app.madeinho.ohquest.ma.quest;

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

import app.madeinho.ohquest.ma.quest.Quest;


@Service
@Transactional
public class QuestServiceImpl implements QuestService {
	
	private static final Logger logger1 = LoggerFactory.getLogger(QuestServiceImpl.class);
	
	@Autowired QuestRepository questRepository;

	/**
	* {@inheritDoc}
	*/
	@Override
	public List<Quest> getQuestList(String searchVal) {
		return questRepository.getQuestList(searchVal); 
	}

	


	@Override
	public int getQuestCount(int addNum) {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public List<Quest> addQuestByCsv(File csvFile) {
		// TODO Auto-generated method stub
		return null;
	}




	@Override
	public int insertQuest(Quest quest) {
		// TODO Auto-generated method stub
		return questRepository.insertQuest(quest);
		//return 0;
	}


	@Override
	public int updateQuest(Quest quest) {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public int deleteQuest(Quest quest) {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public List<Quest> getQuestAlltList(Quest quest) {
		// TODO Auto-generated method stub
		return null;
	}


}

package app.madeinho.ohquest.ui.uiquest;

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

import app.madeinho.ohquest.ui.uiquest.UiQuest;


@Service
@Transactional
public class UiQuestServiceImpl implements UiQuestService {
	
	private static final Logger logger1 = LoggerFactory.getLogger(UiQuestServiceImpl.class);
	
	@Autowired UiQuestRepository uiQuestRepository;

	/**
	* {@inheritDoc}
	*/
	@Override
	public List<UiQuest> getUiQuestList(String searchVal) {
		return uiQuestRepository.getUiQuestList(searchVal); 
	}

	


	@Override
	public int getUiQuestCount(int addNum) {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public List<UiQuest> addUiQuestByCsv(File csvFile) {
		// TODO Auto-generated method stub
		return null;
	}




	@Override
	public int insertUiQuest(UiQuest uiQuest) {
		// TODO Auto-generated method stub
		return uiQuestRepository.insertUiQuest(uiQuest);
		//return 0;
	}


	@Override
	public int updateUiQuest(UiQuest uiQuest) {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public int deleteUiQuest(UiQuest uiQuest) {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public List<UiQuest> getUiQuestAlltList(UiQuest uiQuest) {
		// TODO Auto-generated method stub
		return null;
	}


}

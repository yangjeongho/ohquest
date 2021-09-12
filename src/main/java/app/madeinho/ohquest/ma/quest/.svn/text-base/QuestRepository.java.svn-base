package app.madeinho.ohquest.ma.quest;

import java.util.List;

//import app.madeinho.ohquest.common.domain.pagination.Pagination;
import app.madeinho.ohquest.ma.quest.Quest;
import app.madeinho.ohquest.common.dao.Mapper;

@Mapper
public interface QuestRepository {
	public int getQuestListCount(String search) ;	
	public List<Quest> getQuestList(String searchVal) ;
	public int insertQuest(Quest quest) ;	
	public int updateQuest(Quest quest) ;	
	public int deleteQuest(Quest quest) ;	
	public int getQuestCount(int addNum) ;	
	public String getAddSeqNo(Quest quest) ;	
	public List<Quest> getQuestAlltList(Quest quest) ;
}
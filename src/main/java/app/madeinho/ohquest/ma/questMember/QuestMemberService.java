package app.madeinho.ohquest.ma.questMember;
import java.io.File;
import java.util.List;

import app.madeinho.ohquest.ma.quest.Quest;

public interface QuestMemberService {
	
	public List<QuestMember> getQuestMemberList(String searchVal) ;
	public int insertQuestMember(QuestMember questMember) ;	
	public int updateQuestMember(QuestMember questMember) ;	
	public int deleteQuestMember(QuestMember questMember) ;	
	public int getQuestMemberCount(int addNum) ;	
	public List<QuestMember> addQuestMemberByCsv(File csvFile);
	public List<QuestMember> getQuestMemberAlltList(QuestMember questMember) ;

}
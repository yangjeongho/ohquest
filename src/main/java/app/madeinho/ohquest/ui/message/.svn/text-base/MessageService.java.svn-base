package app.madeinho.ohquest.ui.message;
import java.io.File;
import java.util.List;

import app.madeinho.ohquest.common.domain.searchFilter.SearchFilter;
import app.madeinho.ohquest.ui.message.Message;

public interface MessageService {
	
	public List<Message> getMessageList(SearchFilter searchFilter) ;
	public List<Message> getMessageListMax(SearchFilter searchFilter) ;
	public int insertMessage(Message item) ;	
	public int updateMessage(Message item) ;	
	public int deleteMessage(Message item) ;	
	public int getMessageCount(int addNum) ;	
	public List<Message> addMessageByCsv(File csvFile);
	public List<Message> getMessageAlltList(Message item) ;
}
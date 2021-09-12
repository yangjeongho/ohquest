package app.madeinho.ohquest.ui.message;

import java.util.List;

//import app.madeinho.ohquest.common.domain.pagination.Pagination;
import app.madeinho.ohquest.ui.message.Message;
import app.madeinho.ohquest.common.dao.Mapper;
import app.madeinho.ohquest.common.domain.searchFilter.SearchFilter;

@Mapper
public interface MessageRepository {
	public int getMessageListCount(String search) ;	
	public List<Message> getMessageList(SearchFilter searchFilter) ;
	public List<Message> getMessageListMax(SearchFilter searchFilter) ;
	public int insertMessage(Message message) ;	
	public int updateMessage(Message message) ;	
	public int deleteMessage(Message message) ;	
	public int getMessageCount(int addNum) ;	
	public String getAddSeqNo(Message message) ;	
	public List<Message> getMessageAlltList(Message message) ;
}
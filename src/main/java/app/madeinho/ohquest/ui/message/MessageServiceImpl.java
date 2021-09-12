package app.madeinho.ohquest.ui.message;

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

import app.madeinho.ohquest.common.domain.searchFilter.SearchFilter;
import app.madeinho.ohquest.ui.message.Message;
//import com.acube.unitel.common.domain.pagination.Pagination;
//import com.acube.unitel.common.exception.AcubeException;
//import com.acube.unitel.common.util.CsvReader;
import app.madeinho.ohquest.ui.message.MessageServiceImpl;


@Service
@Transactional
public class MessageServiceImpl implements MessageService {
	
	private static final Logger logger1 = LoggerFactory.getLogger(MessageServiceImpl.class);
	
	@Autowired MessageRepository messageRepository;

	/**
	* {@inheritDoc}
	*/
	@Override
	public List<Message> getMessageList(SearchFilter searchFilter) {
		return messageRepository.getMessageList(searchFilter); 
	}

	
	public List<Message> getMessageListMax(SearchFilter searchFilter) {
		return messageRepository.getMessageListMax(searchFilter); 
	}
	
	/**
	* {@inheritDoc}
	*/
	@Override
	public int insertMessage(Message message) {
		
		return messageRepository.insertMessage(message);
	}


	@Override
	public int updateMessage(Message Message) {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public int deleteMessage(Message Message) {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public int getMessageCount(int addNum) {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public List<Message> addMessageByCsv(File csvFile) {
		// TODO Auto-generated method stub
		return null;
	}

	public List<Message> getMessageAlltList(Message message)  {
		// TODO Auto-generated method stub
		return messageRepository.getMessageAlltList(message);
	}


}

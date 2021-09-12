package app.madeinho.ohquest.ui.message;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import app.madeinho.ohquest.ui.config.ConfigServiceImpl;

@RunWith(SpringJUnit4ClassRunner.class)

@ContextConfiguration("classpath:/applicationContext.xml")



//@Transactional
public class MessageTest {
	
	
	@Autowired MessageServiceImpl messageSerciseImpl ;
	
	@Test
	public void MessageTest() throws Exception {
		
		System.out.println("Start");
		
		Message message = new Message();
		
		message.setIdohMember("1");
		message.setSendIdohMember("2");
		message.setMessage("안녕하세요.난 양정호라고 합니다.");
		
		messageSerciseImpl.insertMessage(message);
		
		System.out.println("End");
	}

}

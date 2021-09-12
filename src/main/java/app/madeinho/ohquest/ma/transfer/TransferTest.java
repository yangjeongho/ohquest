package app.madeinho.ohquest.ma.transfer;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

@RunWith(SpringJUnit4ClassRunner.class)

@ContextConfiguration("classpath:/applicationContext.xml")


//@Transactional
public class TransferTest {
	
	
	@Autowired TransferServiceImpl transferSerciseImpl ;
	
	@Test
	public void TransferTest() throws Exception {
		
		System.out.println("Start");
		
		Transfer transfer = new Transfer();
		
		transfer.setIdmaQuest("1");
		//transfer.setProSubject("첫 프로젝트");
		transfer.setSendMessage("와우 우릴 잘될거야...ㅋㅋㅋ");
		
		transferSerciseImpl.insertTransfer(transfer);
		
		System.out.println("End");
	}

}

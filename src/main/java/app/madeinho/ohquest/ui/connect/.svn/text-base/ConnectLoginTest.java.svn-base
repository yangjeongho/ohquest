package app.madeinho.ohquest.ui.connect;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;
import app.madeinho.ohquest.ui.connect.ConnectLoginServiceImpl;

@RunWith(SpringJUnit4ClassRunner.class)

@ContextConfiguration("classpath:/applicationContext.xml")

//@Transactional
public class ConnectLoginTest {
	
	
	@Autowired ConnectLoginServiceImpl connectSerciseImpl ;
	
	@Test
	public void ConnectTest() throws Exception {
		
		System.out.println("Start");
		
		ConnectLogin connect = new ConnectLogin();
		
		connect.setIdohMember("2");
		
		connectSerciseImpl.insertConnect(connect);
		
		System.out.println("End");
	}

}

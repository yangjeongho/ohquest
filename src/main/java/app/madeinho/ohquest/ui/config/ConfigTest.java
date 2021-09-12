package app.madeinho.ohquest.ui.config;

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
public class ConfigTest {
	
	
	@Autowired ConfigServiceImpl configSerciseImpl ;
	
	@Test
	public void ConfigTest() throws Exception {
		
		System.out.println("Start");
		
		Config config = new Config();
		
		config.setIdohMember("2");
		
		configSerciseImpl.insertConfig(config);
		
		System.out.println("End");
	}

}

package app.madeinho.ohquest.ui.photo;

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
public class PhotoTest {
	
	
	@Autowired PhotoServiceImpl photoSerciseImpl ;
	
	@Test
	public void PhotoTest() throws Exception {
		
		System.out.println("Start");
		
		Photo photo = new Photo();
		
		photo.setIduiMember("2");
		
		photoSerciseImpl.insertPhoto(photo);
		
		System.out.println("End");
	}

}

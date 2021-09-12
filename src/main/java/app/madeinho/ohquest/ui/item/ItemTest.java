package app.madeinho.ohquest.ui.item;

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
public class ItemTest {
	
	
	@Autowired ItemServiceImpl itemSerciseImpl ;
	
	@Test
	public void ItemTest() throws Exception {
		
		System.out.println("Start");
		
		Item item = new Item();
		
		item.setIdohMember("2");
		
		itemSerciseImpl.insertItem(item);
		
		System.out.println("End");
	}

}

package app.madeinho.ohquest.ui.address;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

@RunWith(SpringJUnit4ClassRunner.class)

@ContextConfiguration("classpath:/applicationContext.xml")


//@Transactional
public class AddressTest {
	
	
	@Autowired AddressServiceImpl addressSerciseImpl ;
	
	@Test
	public void AddressTest() throws Exception {
		
		System.out.println("Start");
		
		Address address = new Address();
		
		address.setIdohMember("1");
		address.setIdohMemberTrgt("2");
		address.setTypeCd("A");
		
		addressSerciseImpl.insertAddress(address);
		
		System.out.println("End");
	}

}

package app.madeinho.ohquest.ma.offer;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

@RunWith(SpringJUnit4ClassRunner.class)

@ContextConfiguration("classpath:/applicationContext.xml")


//@Transactional
public class OfferTest {
	
	
	@Autowired OfferServiceImpl offerSerciseImpl ;
	
	@Test
	public void OfferTest() throws Exception {
		
		System.out.println("Start");
		
		Offer offer = new Offer();
		
		offer.setIdmaQuest("1");
		
		offer.setIduiItem("1");
		//offer.setProDesc("와우 우릴 잘될거야...ㅋㅋㅋ");
		
		offerSerciseImpl.insertOffer(offer);
		
		System.out.println("End");
	}

}

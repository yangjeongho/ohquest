package app.madeinho.ohquest.ui.uiquest;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import app.madeinho.ohquest.ma.quest.Quest;

@RunWith(SpringJUnit4ClassRunner.class)

@ContextConfiguration("classpath:/applicationContext.xml")


//@Transactional
public class UiQuestTest {
	
	
	@Autowired UiQuestServiceImpl uiQuestSerciseImpl ;
	
	@Test
	public void UiQuestTest() throws Exception {
		
		System.out.println("Start");
		
		UiQuest uiQuest = new UiQuest();
		
		uiQuest.setIdmaQuest("1");
		uiQuest.setIduiMember("1");
		
		/*quest.setIdmaQuest(idmaQuest)("첫 프로젝트");
		quest.setProDesc("와우 우릴 잘될거야...ㅋㅋㅋ");*/
		
		uiQuestSerciseImpl.insertUiQuest(uiQuest);
		
		System.out.println("End");
	}

}

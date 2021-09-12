package app.madeinho.ohquest.ma.questMember;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import app.madeinho.ohquest.ma.questMember.QuestMember;

@RunWith(SpringJUnit4ClassRunner.class)

@ContextConfiguration("classpath:/applicationContext.xml")


//@Transactional
public class QuestMemberTest {
	
	
	@Autowired QuestMemberServiceImpl questMemberSerciseImpl ;
	
	@Test
	public void QuestMemberTest() throws Exception {
		
		System.out.println("Start");
		
		QuestMember questMember = new QuestMember();
		
		questMember.setIdohMember("1");
		/*questMember.setIdmaQuestMember(idmaQuestMember)("첫 프로젝트");
		questMember.setProDesc("와우 우릴 잘될거야...ㅋㅋㅋ");*/
		questMember.setIdmaQuest("1");
		questMember.setQuestText("fffffffffffffffffghhghff");
		questMemberSerciseImpl.insertQuestMember(questMember);
		
		System.out.println("End");
	}

}

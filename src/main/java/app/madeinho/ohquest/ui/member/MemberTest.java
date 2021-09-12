package app.madeinho.ohquest.ui.member;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

@RunWith(SpringJUnit4ClassRunner.class)

@ContextConfiguration("classpath:/applicationContext.xml")


//@Transactional
public class MemberTest {
	
	
	@Autowired MemberServiceImpl memberSerciseImpl ;
	
	@Test
	public void MemberTest() throws Exception {
		
		System.out.println("Start");
		
		Member member = new Member();
		
		member.setName("SKKK2");
		member.setUserId("YangJeongH111");
		member.setPassword("1234");
		
		memberSerciseImpl.insertMember(member);
		
		System.out.println("End");
	}

}

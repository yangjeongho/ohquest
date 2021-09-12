package app.madeinho.ohquest.ma.project;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

@RunWith(SpringJUnit4ClassRunner.class)

@ContextConfiguration("classpath:/applicationContext.xml")


//@Transactional
public class ProjectTest {
	
	
	@Autowired ProjectServiceImpl projectSerciseImpl ;
	
	@Test
	public void ProjectTest() throws Exception {
		
		System.out.println("Start");
		
		Project project = new Project();
		
		project.setIdohMember("1");
		project.setProSubject("첫 프로젝트");
		project.setProDesc("와우 우릴 잘될거야...ㅋㅋㅋ");
		
		projectSerciseImpl.insertProject(project);
		
		System.out.println("End");
	}

}

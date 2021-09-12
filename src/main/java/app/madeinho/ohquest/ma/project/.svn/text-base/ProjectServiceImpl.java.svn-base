package app.madeinho.ohquest.ma.project;

import java.io.File;
import java.io.FileReader;
import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import app.madeinho.ohquest.ma.project.Project;
//import com.acube.unitel.common.domain.pagination.Pagination;
//import com.acube.unitel.common.exception.AcubeException;
//import com.acube.unitel.common.util.CsvReader;


@Service
@Transactional
public class ProjectServiceImpl implements ProjectService {
	
	private static final Logger logger1 = LoggerFactory.getLogger(ProjectServiceImpl.class);
	
	@Autowired ProjectRepository projectRepository;

	/**
	* {@inheritDoc}
	*/
	@Override
	public List<Project> getProjectList(String searchVal) {
		return projectRepository.getProjectList(searchVal); 
	}

	


	@Override
	public int getProjectCount(int addNum) {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public List<Project> addProjectByCsv(File csvFile) {
		// TODO Auto-generated method stub
		return null;
	}




	@Override
	public int insertProject(Project project) {
		// TODO Auto-generated method stub
		return projectRepository.insertProject(project);
		//return 0;
	}


	@Override
	public int updateProject(Project project) {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public int deleteProject(Project project) {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public List<Project> getProjectAlltList(Project project) {
		// TODO Auto-generated method stub
		return null;
	}


}

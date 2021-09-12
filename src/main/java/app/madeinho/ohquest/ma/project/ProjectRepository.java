package app.madeinho.ohquest.ma.project;

import java.util.List;

//import app.madeinho.ohquest.common.domain.pagination.Pagination;
import app.madeinho.ohquest.ma.project.Project;
import app.madeinho.ohquest.common.dao.Mapper;

@Mapper
public interface ProjectRepository {
	public int getProjectListCount(String search) ;	
	public List<Project> getProjectList(String searchVal) ;
	public int insertProject(Project project) ;	
	public int updateProject(Project project) ;	
	public int deleteProject(Project project) ;	
	public int getProjectCount(int addNum) ;	
	public String getAddSeqNo(Project project) ;	
	public List<Project> getProjectAlltList(Project project) ;
}
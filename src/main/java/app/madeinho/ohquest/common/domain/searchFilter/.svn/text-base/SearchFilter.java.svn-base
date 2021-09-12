package app.madeinho.ohquest.common.domain.searchFilter;

import java.io.Serializable;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;


/**
 * 검색 관리
 * @author YangByeongSub
 * @since 1.0
 *
 */
public class SearchFilter implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -8745218618828099658L;
	private int page ;
	private int firstRow ;
	private int secondRow ;
	private String[] searchKey; // 검색키
	private String[] searchValue; // 검색어
	private String[] searchType; // 검색조건: equal or like
	private String sortKey; // 정렬명
	private String sortBy; // 정렬순
	private List<Search> filters ;
	private int count ;
	private String mode; //필요시 사용
	private String createDate ;
	private String marketCode;
	private String withTerminated;
	
	
	public String getWithTerminated() {
		return withTerminated;
	}

	public void setWithTerminated(String withTerminated) {
		this.withTerminated = withTerminated;
	}

	public String getMarketCode() {
		return marketCode;
	}

	public void setMarketCode(String marketCode) {
		this.marketCode = marketCode;
	}

	public String getCreateDate() {
		return createDate;
	}

	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}

	private HashMap<String, Object> filterMap ;  
	
	public SearchFilter() {
		super();
		this.page = 0;
		this.firstRow = 0;
		this.secondRow = 7;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getFirstRow() {
		return firstRow;
	}

	public void setFirstRow(int firstRow) {
		this.firstRow = firstRow;
	}

	public int getSecondRow() {
		return secondRow;
	}

	public void setSecondRow(int secondRow) {
		this.secondRow = secondRow;
	}
	
	public String[] getSearchKey() {
		return searchKey;
	}

	public void setSearchKey(String[] searchKey) {
		this.searchKey = searchKey;
	}

	public String[] getSearchValue() {
		return searchValue;
	}

	public void setSearchValue(String[] searchValue) {
		this.searchValue = searchValue;
	}

	public String getSortKey() {
		return sortKey;
	}

	public void setSortKey(String sortKey) {
		this.sortKey = sortKey;
	}

	public String getSortBy() {
		return sortBy;
	}

	public void setSortBy(String sortBy) {
		this.sortBy = sortBy;
	}

	public String[] getSearchType() {
		return searchType;
	}

	public void setSearchType(String[] searchType) {
		this.searchType = searchType;
	}

	public int getCount() {
		this.getFilters();
		if(this.filters == null) return 0;
		else return this.filters.size();
	}

	public String getMode() {
		return mode;
	}

	public void setMode(String mode) {
		this.mode = mode;
	}

	public HashMap<String, Object> getFilterMap() {
		return filterMap;
	}

	public void setFilterMap(HashMap<String, Object> filterMap) {
		this.filterMap = filterMap;
	}

	public List<Search> getFilters() {
		if (this.getSearchKey() != null && this.getSearchValue() != null) {
			
			this.filters = new ArrayList<Search>() ;
			int idx = 0;
			Search search = null;
			for(String searchValue: this.getSearchValue()){
				if(!"".equals(searchValue) && searchValue != null){
					boolean multiKey = false ;
					String[] separators = {" or ", " and "};
					for(String separator : separators){
						String keys[] =  this.getSearchKey()[idx].split(separator);
						if(keys.length>1){
							multiKey = true ;
							for(String key : keys){
								search = new Search();
								search.setName(key);
								search.setValue(searchValue);
								if(this.getSearchType() != null){
									search.setType(this.getSearchType()[idx]);
								}else{
									search.setType("LIKE");
								}
								this.filters.add(search);	
							}
						}
					}
					
					if(!multiKey){
						search = new Search();
						search.setName(this.getSearchKey()[idx]);
						search.setValue(searchValue);
						if(this.getSearchType() != null){
							search.setType(this.getSearchType()[idx]);
						}else{
							search.setType("LIKE");
						}
						
						this.filters.add(search);	
					}
				}
				idx ++;
			}			
		}
		if(filters != null)
			if(filters.size() == 0){
				/*this.searchKey = new String[1];		searchKey[0]="";
				this.searchValue = new String[1];	searchValue[0]="";
				this.searchType = new String[1];	searchType[0]="";*/
				return null;
			}else{
				return this.filters ;
			}
		else{
			/*this.searchKey = new String[1];		searchKey[0]="";
			this.searchValue = new String[1];	searchValue[0]="";
			this.searchType = new String[1];	searchType[0]="";*/
			return null ;
		}
	}
	public void loadFilter(String searchKey[], String searchValue[], String searchType[]){
		this.searchKey = searchKey;
		this.searchValue = searchValue;
		this.searchType = searchType;
		this.getFilters();
	}
	public void loadFilter(){
		this.getFilters();
	}
	public String getURI() {
		StringBuffer searchStr = new StringBuffer();
		List<Search> searchList = getFilters();
		if(searchList == null) searchStr.append("&searchKey=").append("&searchValue=");
		else{
			for(Search search : searchList){
				String _srchVal = search.getValue();
				try {
					searchStr.append("&searchKey=").append(search.getName()).append("&searchValue=").append(URLEncoder.encode(_srchVal, "UTF-8"));
				} catch (UnsupportedEncodingException e) {
					e.printStackTrace();
				}
			}
		}
		return "page="+page+"&"+searchStr.toString() + "&sortKey=" + sortKey
				+ "&sortBy=" + sortBy;
	}
	
	@Override
	public String toString() {
		return "SearchFilters [searchKey=" + searchKey
				+ ", searchValue=" + searchValue + ", sortKey=" + sortKey
				+ ", sortBy=" + sortBy + "]";
	}
}

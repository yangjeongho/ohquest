package app.madeinho.ohquest.common.domain.searchFilter;

import java.io.Serializable;

public class Search implements Serializable{
	
	/**
	 * 검색을 위한 필터
	 */
	private static final long serialVersionUID = -2258246213673005191L;
	private String name ; 
	private String value ;
	private String type;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getValue() {
		return value;
	}
	public void setValue(String value) {
		this.value = value;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
}	
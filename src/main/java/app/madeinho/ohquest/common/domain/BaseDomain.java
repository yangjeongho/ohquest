/*
 * Copyright (c) Abacus. All rights reserved.
 */
package app.madeinho.ohquest.common.domain;

import java.util.Date;

import org.codehaus.jackson.annotate.JsonIgnore;
import org.codehaus.jackson.map.ObjectMapper;

//import com.acube.unitel.co.member.domain.Member;

/**
 *
 * @author bsyang
 * @since
 *
 */

//@JsonIgnoreProperties(value={"operator", "workDate", "applicationId", "serviceCode", "updateStamp", "rowNumber", "totalCount", "json"})
public class BaseDomain {
	
	//모든 테이블에 존재하는 공통 컬럼 처리용
	//private Member 	operator ;//처리자 userId
	private Date 	workDate ; //처리일자
	private String 	applicationId ; //어플리케이션Id
	private String 	contSystem;//서비스코드
	private int 	updateStamp; 
	private int 	rowNumber; 
	private int 	totalCount; 
	private String  maskType;
	
/*	@JsonIgnore
	public Member getOperator() {
		return this.operator;
	}
	public void setOperator(Member operator) {
		this.operator = operator;
	}*/
	@JsonIgnore
	public Date getWorkDate() {
		return workDate;
	}
	public String getContSystem() {
		return contSystem;
	}
	public void setContSystem(String contSystem) {
		this.contSystem = contSystem;
	}
	public void setWorkDate(Date workDate) {
		this.workDate = workDate;
	}
	@JsonIgnore
	public String getApplicationId() {
		return applicationId;
	}
	public void setApplicationId(String applicationId) {
		this.applicationId = applicationId;
	}

	@JsonIgnore
	public int getUpdateStamp() {
		return updateStamp;
	}
	public void setUpdateStamp(int updateStamp) {
		this.updateStamp = updateStamp;
	}
	@JsonIgnore
	public int getRowNumber() {
		return rowNumber;
	}
	public void setRowNumber(int rowNumber) {
		this.rowNumber = rowNumber;
	}
	@JsonIgnore
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	@JsonIgnore
	public String getMaskType() {
		return maskType;
	}
	public void setMaskType(String maskType) {
		this.maskType = maskType;
	}
	@JsonIgnore
	public String getJson(){
		ObjectMapper om = new ObjectMapper();
		String temp = null ;
		try {
			temp = om.defaultPrettyPrintingWriter().writeValueAsString(this);
		} catch (Exception e) {
			//e.printStackTrace();
		}
		return temp ;
	}	
}

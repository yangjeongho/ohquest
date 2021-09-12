package app.madeinho.ohquest.ui.config;

import java.io.Serializable;
import java.util.Date;

import org.codehaus.jackson.annotate.JsonIgnore;

import app.madeinho.ohquest.common.domain.BaseDomain;

public class Config extends BaseDomain implements Serializable{

	/**
	 * 회원 정보 Domain 생성 
	 */
	private static final long serialVersionUID = 20131099288233L;
	  private String iduiConfigInfo ;
	  private String comType        ;
	  private String value          ;
	  private String regDate        ;
	  private String configType     ;
	  private String idohMember     ;
	  private String contCreateDate ;
	  private String contUpdateDate ;
	  private String contSystem     ;
	  
	  
	  
	public String getIduiConfigInfo() {
		return iduiConfigInfo;
	}
	public void setIduiConfigInfo(String iduiConfigInfo) {
		this.iduiConfigInfo = iduiConfigInfo;
	}
	public String getComType() {
		return comType;
	}
	public void setComType(String comType) {
		this.comType = comType;
	}
	public String getValue() {
		return value;
	}
	public void setValue(String value) {
		this.value = value;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public String getConfigType() {
		return configType;
	}
	public void setConfigType(String configType) {
		this.configType = configType;
	}
	public String getIdohMember() {
		return idohMember;
	}
	public void setIdohMember(String idohMember) {
		this.idohMember = idohMember;
	}
	public String getContCreateDate() {
		return contCreateDate;
	}
	public void setContCreateDate(String contCreateDate) {
		this.contCreateDate = contCreateDate;
	}
	public String getContUpdateDate() {
		return contUpdateDate;
	}
	public void setContUpdateDate(String contUpdateDate) {
		this.contUpdateDate = contUpdateDate;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	@JsonIgnore
	public Date getWorkDate() {
		// TODO Auto-generated method stub
		return super.getWorkDate();
	}
	@Override
	public String getContSystem() {
		// TODO Auto-generated method stub
		return super.getContSystem();
	}
	@Override
	public void setContSystem(String contSystem) {
		// TODO Auto-generated method stub
		super.setContSystem(contSystem);
	}
	@Override
	public void setWorkDate(Date workDate) {
		// TODO Auto-generated method stub
		super.setWorkDate(workDate);
	}
	@Override
	@JsonIgnore
	public String getApplicationId() {
		// TODO Auto-generated method stub
		return super.getApplicationId();
	}
	@Override
	public void setApplicationId(String applicationId) {
		// TODO Auto-generated method stub
		super.setApplicationId(applicationId);
	}
	@Override
	@JsonIgnore
	public int getUpdateStamp() {
		// TODO Auto-generated method stub
		return super.getUpdateStamp();
	}
	@Override
	public void setUpdateStamp(int updateStamp) {
		// TODO Auto-generated method stub
		super.setUpdateStamp(updateStamp);
	}
	@Override
	@JsonIgnore
	public int getRowNumber() {
		// TODO Auto-generated method stub
		return super.getRowNumber();
	}
	@Override
	public void setRowNumber(int rowNumber) {
		// TODO Auto-generated method stub
		super.setRowNumber(rowNumber);
	}
	@Override
	@JsonIgnore
	public int getTotalCount() {
		// TODO Auto-generated method stub
		return super.getTotalCount();
	}
	@Override
	public void setTotalCount(int totalCount) {
		// TODO Auto-generated method stub
		super.setTotalCount(totalCount);
	}
	@Override
	@JsonIgnore
	public String getMaskType() {
		// TODO Auto-generated method stub
		return super.getMaskType();
	}
	@Override
	public void setMaskType(String maskType) {
		// TODO Auto-generated method stub
		super.setMaskType(maskType);
	}
	@Override
	@JsonIgnore
	public String getJson() {
		// TODO Auto-generated method stub
		return super.getJson();
	}
	@Override
	protected Object clone() throws CloneNotSupportedException {
		// TODO Auto-generated method stub
		return super.clone();
	}
	@Override
	public boolean equals(Object arg0) {
		// TODO Auto-generated method stub
		return super.equals(arg0);
	}
	@Override
	protected void finalize() throws Throwable {
		// TODO Auto-generated method stub
		super.finalize();
	}
	@Override
	public int hashCode() {
		// TODO Auto-generated method stub
		return super.hashCode();
	}
	@Override
	public String toString() {
		return "Config [iduiConfigInfo=" + iduiConfigInfo + ", comType="
				+ comType + ", value=" + value + ", regDate=" + regDate
				+ ", configType=" + configType + ", idohMember=" + idohMember
				+ ", contCreateDate=" + contCreateDate + ", contUpdateDate="
				+ contUpdateDate + ", contSystem=" + contSystem + "]";
	}


	
	
}

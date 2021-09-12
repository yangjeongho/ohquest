package app.madeinho.ohquest.ui.account;

import java.io.Serializable;
import java.util.Date;

import app.madeinho.ohquest.common.domain.BaseDomain;

public class Account extends BaseDomain implements Serializable{

	/**
	 * :: 계정 정보 관리 마스터 
	 */
	private static final long serialVersionUID = 10021474121233L;
	  private String iduiAccount    ;
	  private String idohMember     ;
	  private String acName         ;
	  private String acDesc         ;
	  private String acLinkInd      ;
	  private String contCreateDate ;
	  private String contUpdateDate ;
	  private String contSystem     ;
	public String getIduiAccount() {
		return iduiAccount;
	}
	public void setIduiAccount(String iduiAccount) {
		this.iduiAccount = iduiAccount;
	}
	public String getIdohMember() {
		return idohMember;
	}
	public void setIdohMember(String idohMember) {
		this.idohMember = idohMember;
	}
	public String getAcName() {
		return acName;
	}
	public void setAcName(String acName) {
		this.acName = acName;
	}
	public String getAcDesc() {
		return acDesc;
	}
	public void setAcDesc(String acDesc) {
		this.acDesc = acDesc;
	}
	public String getAcLinkInd() {
		return acLinkInd;
	}
	public void setAcLinkInd(String acLinkInd) {
		this.acLinkInd = acLinkInd;
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
	public String getContSystem() {
		return contSystem;
	}
	public void setContSystem(String contSystem) {
		this.contSystem = contSystem;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "Account [iduiAccount=" + iduiAccount + ", idohMember="
				+ idohMember + ", acName=" + acName + ", acDesc=" + acDesc
				+ ", acLinkInd=" + acLinkInd + ", contCreateDate="
				+ contCreateDate + ", contUpdateDate=" + contUpdateDate
				+ ", contSystem=" + contSystem + "]";
	}
	  
	  
	
}

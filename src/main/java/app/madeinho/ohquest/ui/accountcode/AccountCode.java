package app.madeinho.ohquest.ui.accountcode;

import java.io.Serializable;
import java.util.Date;

import app.madeinho.ohquest.common.domain.BaseDomain;

public class AccountCode extends BaseDomain implements Serializable{

	/**
	 * 계좌정보 유형 AC_CODE
	 * ACCODE	VCASH	KR		가상계좌(현금)
	   ACCODE	VSTOC	KR		가상계좌(주식)
	   ACCODE	RCASH	KR		현금
	   ACCODE	RSTOC	KR		주식
	 */
	private static final long serialVersionUID = 1006223432443323L;
	  private String iduiAccountCode ;
	  private String iduiAccount     ;
	  private String acCode          ;
	  private String acName          ;
	  private String balance         ;
	  private String chgCd           ; //SC등록, 상태변경
	  private String chgDate         ;
	  private String chgMessage      ;
	  private String contCreateDate  ;
	  private String contUpdateDate  ;
	  private String contSystem      ;
	  private String idohMember     ;
	  
	  
	  
	public String getAcName() {
		return acName;
	}
	public void setAcName(String acName) {
		this.acName = acName;
	}
	public String getChgMessage() {
		return chgMessage;
	}
	public void setChgMessage(String chgMessage) {
		this.chgMessage = chgMessage;
	}
	public String getChgCd() {
		return chgCd;
	}
	public void setChgCd(String chgCd) {
		this.chgCd = chgCd;
	}
	public String getIdohMember() {
		return idohMember;
	}
	public void setIdohMember(String idohMember) {
		this.idohMember = idohMember;
	}
	public String getIduiAccountCode() {
		return iduiAccountCode;
	}
	public void setIduiAccountCode(String iduiAccountCode) {
		this.iduiAccountCode = iduiAccountCode;
	}
	public String getIduiAccount() {
		return iduiAccount;
	}
	public void setIduiAccount(String iduiAccount) {
		this.iduiAccount = iduiAccount;
	}
	public String getAcCode() {
		return acCode;
	}
	public void setAcCode(String acCode) {
		this.acCode = acCode;
	}
	public String getBalance() {
		return balance;
	}
	public void setBalance(String balance) {
		this.balance = balance;
	}
	public String getChgDate() {
		return chgDate;
	}
	public void setChgDate(String chgDate) {
		this.chgDate = chgDate;
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
		return "AccountCode [iduiAccountCode=" + iduiAccountCode
				+ ", iduiAccount=" + iduiAccount + ", acCode=" + acCode
				+ ", balance=" + balance + ", chgDate=" + chgDate
				+ ", contCreateDate=" + contCreateDate + ", contUpdateDate="
				+ contUpdateDate + ", contSystem=" + contSystem + "]";
	}
	
	
}

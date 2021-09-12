package app.madeinho.ohquest.ui.member;

import java.io.Serializable;
import java.util.Date;

import app.madeinho.ohquest.common.domain.BaseDomain;

public class Member extends BaseDomain implements Serializable{

	/**
	 * 회원 정보 Domain 생성 
	 */
	private static final long serialVersionUID = 7295253428863336125L;
	private String idohMember;
	private String name;
	private String emailAddress;
	private String userId;
	private String oldPassword;
	private String password;
	private String firstDate;
    private String name1          ;
	private String name2          ;
	private String name3          ;
	private String emailAddr      ;
	private String mobileNo       ;
	private String etcPhone1      ;
	private String etcPhone2      ;
	private String bday           ;
	private String address1       ;
	private String address2       ;
	private String countryCd      ;
	
	private String countryCode;
	private String conntyName;
	private String lastContCountryCode;
	private String phoneNum;
	private String lastContDate;
	private String contCreateDate;
	private String contUpdateDate;
	private String contSystem;
	private String status;
	public String getIdohMember() {
		return idohMember;
	}
	public void setIdohMember(String idohMember) {
		this.idohMember = idohMember;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmailAddress() {
		return emailAddress;
	}
	public void setEmailAddress(String emailAddress) {
		this.emailAddress = emailAddress;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getOldPassword() {
		return oldPassword;
	}
	public void setOldPassword(String oldPassword) {
		this.oldPassword = oldPassword;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getFirstDate() {
		return firstDate;
	}
	public void setFirstDate(String firstDate) {
		this.firstDate = firstDate;
	}
	public String getCountryCode() {
		return countryCode;
	}
	public void setCountryCode(String countryCode) {
		this.countryCode = countryCode;
	}
	public String getConntyName() {
		return conntyName;
	}
	public void setConntyName(String conntyName) {
		this.conntyName = conntyName;
	}
	public String getLastContCountryCode() {
		return lastContCountryCode;
	}
	public void setLastContCountryCode(String lastContCountryCode) {
		this.lastContCountryCode = lastContCountryCode;
	}
	public String getPhoneNum() {
		return phoneNum;
	}
	public void setPhoneNum(String phoneNum) {
		this.phoneNum = phoneNum;
	}
	public String getLastContDate() {
		return lastContDate;
	}
	public void setLastContDate(String lastContDate) {
		this.lastContDate = lastContDate;
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
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	public String getName1() {
		return name1;
	}
	public void setName1(String name1) {
		this.name1 = name1;
	}
	public String getName2() {
		return name2;
	}
	public void setName2(String name2) {
		this.name2 = name2;
	}
	public String getName3() {
		return name3;
	}
	public void setName3(String name3) {
		this.name3 = name3;
	}
	public String getEmailAddr() {
		return emailAddr;
	}
	public void setEmailAddr(String emailAddr) {
		this.emailAddr = emailAddr;
	}
	public String getMobileNo() {
		return mobileNo;
	}
	public void setMobileNo(String mobileNo) {
		this.mobileNo = mobileNo;
	}
	public String getEtcPhone1() {
		return etcPhone1;
	}
	public void setEtcPhone1(String etcPhone1) {
		this.etcPhone1 = etcPhone1;
	}
	public String getEtcPhone2() {
		return etcPhone2;
	}
	public void setEtcPhone2(String etcPhone2) {
		this.etcPhone2 = etcPhone2;
	}
	public String getBday() {
		return bday;
	}
	public void setBday(String bday) {
		this.bday = bday;
	}
	public String getAddress1() {
		return address1;
	}
	public void setAddress1(String address1) {
		this.address1 = address1;
	}
	public String getAddress2() {
		return address2;
	}
	public void setAddress2(String address2) {
		this.address2 = address2;
	}
	public String getCountryCd() {
		return countryCd;
	}
	public void setCountryCd(String countryCd) {
		this.countryCd = countryCd;
	}
	@Override
	public String toString() {
		return "Member [idohMember=" + idohMember + ", name=" + name
				+ ", emailAddress=" + emailAddress + ", userId=" + userId
				+ ", oldPassword=" + oldPassword + ", password=" + password
				+ ", firstDate=" + firstDate + ", name1=" + name1 + ", name2="
				+ name2 + ", name3=" + name3 + ", emailAddr=" + emailAddr
				+ ", mobileNo=" + mobileNo + ", etcPhone1=" + etcPhone1
				+ ", etcPhone2=" + etcPhone2 + ", bday=" + bday + ", address1="
				+ address1 + ", address2=" + address2 + ", countryCd="
				+ countryCd + ", countryCode=" + countryCode + ", conntyName="
				+ conntyName + ", lastContCountryCode=" + lastContCountryCode
				+ ", phoneNum=" + phoneNum + ", lastContDate=" + lastContDate
				+ ", contCreateDate=" + contCreateDate + ", contUpdateDate="
				+ contUpdateDate + ", contSystem=" + contSystem + ", status="
				+ status + "]";
	}

	
	
}

package app.madeinho.ohquest.ui.connect;

import java.io.Serializable;
import java.util.Date;

import org.codehaus.jackson.annotate.JsonIgnore;

import app.madeinho.ohquest.common.domain.BaseDomain;

public class ConnectLogin extends BaseDomain implements Serializable{

	/**
	 * 회원 정보 Domain 생성 
	 */
	private static final long serialVersionUID = 20131012323233L;
	private String idconnectInfo       ;
	private String idohMember          ;
	private String connectTime         ;
	private String countryCode         ;
	private String connectType         ;
	private String lastContCountryCode ;
	private String lastContDate        ;
	private String contCreateDate      ;
	private String contUpdateDate      ;
	private String contSystem          ;
	public String getIdconnectInfo() {
		return idconnectInfo;
	}
	public void setIdconnectInfo(String idconnectInfo) {
		this.idconnectInfo = idconnectInfo;
	}
	public String getIdohMember() {
		return idohMember;
	}
	public void setIdohMember(String idohMember) {
		this.idohMember = idohMember;
	}
	public String getConnectTime() {
		return connectTime;
	}
	public void setConnectTime(String connectTime) {
		this.connectTime = connectTime;
	}
	public String getCountryCode() {
		return countryCode;
	}
	public void setCountryCode(String countryCode) {
		this.countryCode = countryCode;
	}
	public String getConnectType() {
		return connectType;
	}
	public void setConnectType(String connectType) {
		this.connectType = connectType;
	}
	public String getLastContCountryCode() {
		return lastContCountryCode;
	}
	public void setLastContCountryCode(String lastContCountryCode) {
		this.lastContCountryCode = lastContCountryCode;
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
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "Connect [idconnectInfo=" + idconnectInfo + ", idohMember="
				+ idohMember + ", connectTime=" + connectTime
				+ ", countryCode=" + countryCode + ", connectType="
				+ connectType + ", lastContCountryCode=" + lastContCountryCode
				+ ", lastContDate=" + lastContDate + ", contCreateDate="
				+ contCreateDate + ", contUpdateDate=" + contUpdateDate
				+ ", contSystem=" + contSystem + "]";
	}
	  
	  

}

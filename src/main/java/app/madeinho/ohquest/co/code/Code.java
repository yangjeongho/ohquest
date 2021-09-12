package app.madeinho.ohquest.co.code;

import java.io.Serializable;
import java.util.Arrays;
import java.util.Date;

import org.codehaus.jackson.annotate.JsonIgnore;
import org.codehaus.jackson.annotate.JsonPropertyOrder;
import org.springframework.beans.factory.annotation.Autowired;

import app.madeinho.ohquest.common.domain.BaseDomain;


//@JsonIgnoreProperties(value={"securityGroupId", "charLang", "charMeaning", "charDscpt", "success" , "message", "manageFlag", "enabledFlag", "startDateActive", "endDateActive"})
@JsonPropertyOrder(value={"codeSeq","codeId", "language", "imgDir", "description", "startDateActive", "startDateActive", "etcInfo1", "etcInfo2"})
public class Code extends BaseDomain implements Serializable{
	
	//@Autowired SecurityService securityService;
	/*  */
	private static final long serialVersionUID = -654324001549981208L;
	private String codeSeq         ;
	private String codeGroup       ;
	private String codeId          ;
	private String language        ;
	private String imgDir          ;
	private String description     ;
	private String startDateActive ;
	private String etcInfo1        ;
	private String etcInfo2        ;
	private String contCreateDate  ;
	private String contUpdateDate  ;
	private String contSystem      ;

	private boolean enabledFlag  = true ;

	
	/* 멀티언어 처리 */
	private String charLang[] ;//{"af", "ar-DZ", "ar", "az", "bg", "bs", "ca", "cs", "cy-GB", "da", "de", "el", "en-AU", "en-GB", "en-NZ", "eo", "es", "et", "eu", "fa", "fi", "fo", "fr-CH", "fr", "gl", "he", "hi", "hr", "hu", "hy", "id", "is", "it", "ja", "ka", "kk", "km", "ko", "lb", "lt", "lv", "mk", "ml", "ms", "nl-BE", "nl", "no", "pl", "pt-BR", "pt", "rm", "ro", "ru", "sk", "sl", "sq", "sr-SR", "sr", "sv", "ta", "th", "tj", "tr", "uk", "vi", "zh-CN", "zh-HK", "zh-TW"};
	private String charMeaning[]     ;
	private String charDscpt[]       ;
	
	/* csv 일괄처리시 성공여부와 실패메시지 */
	private boolean success = true;
	private String  message = "OK";
	
	/* 코드목록 조회시 관리자 여부 */
	private boolean manageFlag = false ;
	

	public String getCodeGroup() {
		return codeGroup;
	}
	public void setCodeGroup(String codeGroup) {
		this.codeGroup = codeGroup;
	}
	@JsonIgnore
	public String[] getCharLang() {
		return charLang;
	}
	public void setCharLang(String[] charLang) {
		this.charLang = charLang;
	}
	@JsonIgnore
	public String[] getCharMeaning() {
		return charMeaning;
	}
	public void setCharMeaning(String[] charMeaning) {
		this.charMeaning = charMeaning;
	}
	@JsonIgnore
	public String[] getCharDscpt() {
		return charDscpt;
	}
	public void setCharDscpt(String[] charDscpt) {
		this.charDscpt = charDscpt;
	}
	@JsonIgnore
	public boolean isSuccess() {
		return success;
	}
	public void setSuccess(boolean success) {
		this.success = success;
	}
	@JsonIgnore
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}	
	@JsonIgnore
	public boolean isManageFlag() {
		return manageFlag;
	}
	public void setManageFlag(boolean manageFlag) {
		this.manageFlag = manageFlag;
	}
	public String getCodeSeq() {
		return codeSeq;
	}
	public void setCodeSeq(String codeSeq) {
		this.codeSeq = codeSeq;
	}
	public String getCodeId() {
		return codeId;
	}
	public void setCodeId(String codeId) {
		this.codeId = codeId;
	}
	public String getLanguage() {
		return language;
	}
	public void setLanguage(String language) {
		this.language = language;
	}
	public String getImgDir() {
		return imgDir;
	}
	public void setImgDir(String imgDir) {
		this.imgDir = imgDir;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getStartDateActive() {
		return startDateActive;
	}
	public void setStartDateActive(String startDateActive) {
		this.startDateActive = startDateActive;
	}
	public String getEtcInfo1() {
		return etcInfo1;
	}
	public void setEtcInfo1(String etcInfo1) {
		this.etcInfo1 = etcInfo1;
	}
	public String getEtcInfo2() {
		return etcInfo2;
	}
	public void setEtcInfo2(String etcInfo2) {
		this.etcInfo2 = etcInfo2;
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
	public boolean isEnabledFlag() {
		return enabledFlag;
	}
	@Override
	public String toString() {
		return "Code [codeSeq=" + codeSeq + ", codeId=" + codeId
				+ ", language=" + language + ", imgDir=" + imgDir
				+ ", description=" + description + ", startDateActive="
				+ startDateActive + ", etcInfo1=" + etcInfo1 + ", etcInfo2="
				+ etcInfo2 + ", contCreateDate=" + contCreateDate
				+ ", contUpdateDate=" + contUpdateDate + ", contSystem="
				+ contSystem + ", enabledFlag=" + enabledFlag + ", charLang="
				+ Arrays.toString(charLang) + ", charMeaning="
				+ Arrays.toString(charMeaning) + ", charDscpt="
				+ Arrays.toString(charDscpt) + ", success=" + success
				+ ", message=" + message + ", manageFlag=" + manageFlag + "]";
	}
	public void setEnabledFlag(boolean enabledFlag) {
		this.enabledFlag = enabledFlag;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	
}	
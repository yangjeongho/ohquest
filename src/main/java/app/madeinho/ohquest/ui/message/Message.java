package app.madeinho.ohquest.ui.message;

import java.io.Serializable;
import java.util.Date;

import org.codehaus.jackson.annotate.JsonIgnore;

import app.madeinho.ohquest.common.domain.BaseDomain;

public class Message extends BaseDomain implements Serializable{

	/**
	 * 회원 정보 Domain 생성 
	 */
	private static final long serialVersionUID = 20131099288233L;

	private String iduiMessage      ;
	private String idohMember       ;
	private String sendIdohMember   ;
	private String statusCode       ; //R:등록 , S:유저전달, D:삭제 상테
	private String type             ; //SC :주식취소요청상태, SR :주식대기요청상태, SS: 주식 매매가능요청상태
	private String actType          ; //[로직처리용]처리유형 = A:즉시실행 	, D: 미실행
	private String message          ;
	private String readYn           ;
	private String regDate          ;
	private String contCreateDate   ;
	private String contUpdateDate   ;
	private String contSystem       ;
	private int    idscMyStock      ;

	
	
	public String getActType() {
		return actType;
	}
	public void setActType(String actType) {
		this.actType = actType;
	}
	public int getIdscMyStock() {
		return idscMyStock;
	}
	public void setIdscMyStock(int idscMyStock) {
		this.idscMyStock = idscMyStock;
	}
	public String getIduiMessage() {
		return iduiMessage;
	}
	public void setIduiMessage(String iduiMessage) {
		this.iduiMessage = iduiMessage;
	}
	public String getIdohMember() {
		return idohMember;
	}
	public void setIdohMember(String idohMember) {
		this.idohMember = idohMember;
	}
	public String getSendIdohMember() {
		return sendIdohMember;
	}
	public void setSendIdohMember(String sendIdohMember) {
		this.sendIdohMember = sendIdohMember;
	}
	public String getStatusCode() {
		return statusCode;
	}
	public void setStatusCode(String statusCode) {
		this.statusCode = statusCode;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String getReadYn() {
		return readYn;
	}
	public void setReadYn(String readYn) {
		this.readYn = readYn;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
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
		return "Message [iduiMessage=" + iduiMessage + ", idohMember="
				+ idohMember + ", sendIdohMember=" + sendIdohMember
				+ ", statusCode=" + statusCode + ", type=" + type
				+ ", message=" + message + ", readYn=" + readYn + ", regDate="
				+ regDate + ", contCreateDate=" + contCreateDate
				+ ", contUpdateDate=" + contUpdateDate + ", contSystem="
				+ contSystem + "]";
	}

}

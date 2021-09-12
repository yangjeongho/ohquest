package app.madeinho.ohquest.ma.questMember;

import java.io.Serializable;
import java.util.Date;

import app.madeinho.ohquest.common.domain.BaseDomain;

public class QuestMember extends BaseDomain implements Serializable{

	/**
	 * 임무 지원 멤버 도메인
	 */
	private static final long serialVersionUID = 1002342349323L;
	private String idmaQuest      ;
	private String idohMember     ;
	private String status         ;
	private String regDate        ;
	private String canDate        ;
	private String completeDate   ;
	private String contCreateDate ;
	private String contUpdateDate ;
	private String contSystem     ;
	private String questText;
	
	
	
	public String getQuestText() {
		return questText;
	}
	public void setQuestText(String questText) {
		this.questText = questText;
	}
	public String getIdmaQuest() {
		return idmaQuest;
	}
	public void setIdmaQuest(String idmaQuest) {
		this.idmaQuest = idmaQuest;
	}
	public String getIdohMember() {
		return idohMember;
	}
	public void setIdohMember(String idohMember) {
		this.idohMember = idohMember;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public String getCanDate() {
		return canDate;
	}
	public void setCanDate(String canDate) {
		this.canDate = canDate;
	}
	public String getCompleteDate() {
		return completeDate;
	}
	public void setCompleteDate(String completeDate) {
		this.completeDate = completeDate;
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
		return "QuestMember [idmaQuest=" + idmaQuest + ", idohMember="
				+ idohMember + ", status=" + status + ", regDate=" + regDate
				+ ", canDate=" + canDate + ", completeDate=" + completeDate
				+ ", contCreateDate=" + contCreateDate + ", contUpdateDate="
				+ contUpdateDate + ", contSystem=" + contSystem
				+ ", questText=" + questText + "]";
	}

	
	
}

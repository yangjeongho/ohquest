package app.madeinho.ohquest.ma.quest;

import java.io.Serializable;
import java.util.Date;

import app.madeinho.ohquest.common.domain.BaseDomain;

public class Quest extends BaseDomain implements Serializable{

	/**
	 * 임무 관리 도메인
	 */
	private static final long serialVersionUID = 10042312439323L;
	private String idmaQuest            ;
	private String idmaProject          ;
	private String questStatus          ;
	private String qWho                  ;
	private String qWhen                 ;
	private String qWhere                ;
	private String qWhat                 ;
	private String qWhy                  ;
	private String qHow                  ;
	private String questDesc            ;
	private String purpose              ;
	private String questPolicy          ;
	private String effectStart          ;
	private String effectProcess        ;
	private String effectEnd            ;
	private String questPersons         ;
	private String questRegDate         ;
	private String questStrtDate        ;
	private String questEndDate         ;
	private String contCreateDate       ;
	private String contUpdateDate       ;
	private String contSystem           ;
	
	
	public String getIdmaQuest() {
		return idmaQuest;
	}
	public void setIdmaQuest(String idmaQuest) {
		this.idmaQuest = idmaQuest;
	}
	public String getIdmaProject() {
		return idmaProject;
	}
	public void setIdmaProject(String idmaProject) {
		this.idmaProject = idmaProject;
	}
	public String getQuestStatus() {
		return questStatus;
	}
	public void setQuestStatus(String questStatus) {
		this.questStatus = questStatus;
	}

	public String getQuestDesc() {
		return questDesc;
	}
	public void setQuestDesc(String questDesc) {
		this.questDesc = questDesc;
	}
	public String getPurpose() {
		return purpose;
	}
	public void setPurpose(String purpose) {
		this.purpose = purpose;
	}
	public String getQuestPolicy() {
		return questPolicy;
	}
	public void setQuestPolicy(String questPolicy) {
		this.questPolicy = questPolicy;
	}
	public String getEffectStart() {
		return effectStart;
	}
	public void setEffectStart(String effectStart) {
		this.effectStart = effectStart;
	}
	public String getEffectProcess() {
		return effectProcess;
	}
	public void setEffectProcess(String effectProcess) {
		this.effectProcess = effectProcess;
	}
	public String getEffectEnd() {
		return effectEnd;
	}
	public void setEffectEnd(String effectEnd) {
		this.effectEnd = effectEnd;
	}
	public String getQuestPersons() {
		return questPersons;
	}
	public void setQuestPersons(String questPersons) {
		this.questPersons = questPersons;
	}
	public String getQuestRegDate() {
		return questRegDate;
	}
	public void setQuestRegDate(String questRegDate) {
		this.questRegDate = questRegDate;
	}
	public String getQuestStrtDate() {
		return questStrtDate;
	}
	public void setQuestStrtDate(String questStrtDate) {
		this.questStrtDate = questStrtDate;
	}
	public String getQuestEndDate() {
		return questEndDate;
	}
	public void setQuestEndDate(String questEndDate) {
		this.questEndDate = questEndDate;
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
	public String getqWho() {
		return qWho;
	}
	public void setqWho(String qWho) {
		this.qWho = qWho;
	}
	public String getqWhen() {
		return qWhen;
	}
	public void setqWhen(String qWhen) {
		this.qWhen = qWhen;
	}
	public String getqWhere() {
		return qWhere;
	}
	public void setqWhere(String qWhere) {
		this.qWhere = qWhere;
	}
	public String getqWhat() {
		return qWhat;
	}
	public void setqWhat(String qWhat) {
		this.qWhat = qWhat;
	}
	public String getqWhy() {
		return qWhy;
	}
	public void setqWhy(String qWhy) {
		this.qWhy = qWhy;
	}
	public String getqHow() {
		return qHow;
	}
	public void setqHow(String qHow) {
		this.qHow = qHow;
	}
	@Override
	public String toString() {
		return "Quest [idmaQuest=" + idmaQuest + ", idmaProject=" + idmaProject
				+ ", questStatus=" + questStatus + ", qWho=" + qWho
				+ ", qWhen=" + qWhen + ", qWhere=" + qWhere + ", qWhat="
				+ qWhat + ", qWhy=" + qWhy + ", qHow=" + qHow + ", questDesc="
				+ questDesc + ", purpose=" + purpose + ", questPolicy="
				+ questPolicy + ", effectStart=" + effectStart
				+ ", effectProcess=" + effectProcess + ", effectEnd="
				+ effectEnd + ", questPersons=" + questPersons
				+ ", questRegDate=" + questRegDate + ", questStrtDate="
				+ questStrtDate + ", questEndDate=" + questEndDate
				+ ", contCreateDate=" + contCreateDate + ", contUpdateDate="
				+ contUpdateDate + ", contSystem=" + contSystem
				+ ", getIdmaQuest()=" + getIdmaQuest() + ", getIdmaProject()="
				+ getIdmaProject() + ", getQuestStatus()=" + getQuestStatus()
				+ ", getQuestDesc()=" + getQuestDesc() + ", getPurpose()="
				+ getPurpose() + ", getQuestPolicy()=" + getQuestPolicy()
				+ ", getEffectStart()=" + getEffectStart()
				+ ", getEffectProcess()=" + getEffectProcess()
				+ ", getEffectEnd()=" + getEffectEnd() + ", getQuestPersons()="
				+ getQuestPersons() + ", getQuestRegDate()="
				+ getQuestRegDate() + ", getQuestStrtDate()="
				+ getQuestStrtDate() + ", getQuestEndDate()="
				+ getQuestEndDate() + ", getContCreateDate()="
				+ getContCreateDate() + ", getContUpdateDate()="
				+ getContUpdateDate() + ", getContSystem()=" + getContSystem()
				+ ", getqWho()=" + getqWho() + ", getqWhen()=" + getqWhen()
				+ ", getqWhere()=" + getqWhere() + ", getqWhat()=" + getqWhat()
				+ ", getqWhy()=" + getqWhy() + ", getqHow()=" + getqHow()
				+ ", getWorkDate()=" + getWorkDate() + ", getApplicationId()="
				+ getApplicationId() + ", getUpdateStamp()=" + getUpdateStamp()
				+ ", getRowNumber()=" + getRowNumber() + ", getTotalCount()="
				+ getTotalCount() + ", getMaskType()=" + getMaskType()
				+ ", getJson()=" + getJson() + ", getClass()=" + getClass()
				+ ", hashCode()=" + hashCode() + ", toString()="
				+ super.toString() + "]";
	}

	
		
}

package app.madeinho.ohquest.ui.uiquest;

import java.io.Serializable;
import java.util.Date;

import app.madeinho.ohquest.common.domain.BaseDomain;

public class UiQuest extends BaseDomain implements Serializable{

	/**
	 * 사요자 퀘스트 관리 도메인
	 */
	private static final long serialVersionUID = 15487812153L;
	private String iduiQuest     ;
	private String idmaQuest     ;
	private String iduiMember    ;
	private String questStatus   ;
	private String questPolicy   ;
	private String effectStart   ;
	private String effectProcess ;
	private String effectEnd     ;
	private String questPersons  ;
	private String questRegDate  ;
	private String questStrtDate ;
	private String questEndDate  ;
	private String contCreateDate;
	private String contUpdateDate;
	private String contSystem    ;
	public String getIduiQuest() {
		return iduiQuest;
	}
	public void setIduiQuest(String iduiQuest) {
		this.iduiQuest = iduiQuest;
	}
	public String getIdmaQuest() {
		return idmaQuest;
	}
	public void setIdmaQuest(String idmaQuest) {
		this.idmaQuest = idmaQuest;
	}
	public String getIduiMember() {
		return iduiMember;
	}
	public void setIduiMember(String iduiMember) {
		this.iduiMember = iduiMember;
	}
	public String getQuestStatus() {
		return questStatus;
	}
	public void setQuestStatus(String questStatus) {
		this.questStatus = questStatus;
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
	@Override
	public String toString() {
		return "UiQuest [iduiQuest=" + iduiQuest + ", idmaQuest=" + idmaQuest
				+ ", iduiMember=" + iduiMember + ", questStatus=" + questStatus
				+ ", questPolicy=" + questPolicy + ", effectStart="
				+ effectStart + ", effectProcess=" + effectProcess
				+ ", effectEnd=" + effectEnd + ", questPersons=" + questPersons
				+ ", questRegDate=" + questRegDate + ", questStrtDate="
				+ questStrtDate + ", questEndDate=" + questEndDate
				+ ", contCreateDate=" + contCreateDate + ", contUpdateDate="
				+ contUpdateDate + ", contSystem=" + contSystem + "]";
	}
	
	
		
}

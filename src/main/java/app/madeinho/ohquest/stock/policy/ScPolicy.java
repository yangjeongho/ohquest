package app.madeinho.ohquest.stock.policy;

import java.io.Serializable;
import java.util.Date;

import app.madeinho.ohquest.common.domain.BaseDomain;

public class ScPolicy extends BaseDomain implements Serializable{

	/**
	 * 판매유형별 정책관리 정보
	 */
	private static final long serialVersionUID = 10023123123249323L;
	
	  private String idscPolicy      ;
	  private String codeId          ;
	  private String codeStat        ;
	  private String pocyType        ;
	  private String pocyTime        ;
	  private String pocyUnit        ;
	  private String pocyUpValue     ;
	  private String pocyDownValue   ;
	  private String pocyUpCritical;
	  private String pocyDownCritical;
	  private String dealCount       ;
	  private String saleUpCount     ;
	  private String saleDownCount   ;
	  private String daySaleCount    ;
	  private String contCreateDate  ;
	  private String contUpdateDate  ;
	  private String contSystem      ;
	  private String policyDesc      ;
	  private String autoActCode;  //시뮬레이션처리시 매수후 자동으로 매도 요청시 정의한 코드로 등록하도록 수정.
	   
	 
	
	public String getAutoActCode() {
		return autoActCode;
	}
	public void setAutoActCode(String autoActCode) {
		this.autoActCode = autoActCode;
	}
	public String getPocyUpCritical() {
		return pocyUpCritical;
	}
	public void setPocyUpCritical(String pocyUpCritical) {
		this.pocyUpCritical = pocyUpCritical;
	}
	public String getPocyDownCritical() {
		return pocyDownCritical;
	}
	public void setPocyDownCritical(String pocyDownCritical) {
		this.pocyDownCritical = pocyDownCritical;
	}
	public String getPolicyDesc() {
		return policyDesc;
	}
	public void setPolicyDesc(String policyDesc) {
		this.policyDesc = policyDesc;
	}
	public String getIdscPolicy() {
		return idscPolicy;
	}
	public void setIdscPolicy(String idscPolicy) {
		this.idscPolicy = idscPolicy;
	}
	public String getCodeId() {
		return codeId;
	}
	public void setCodeId(String codeId) {
		this.codeId = codeId;
	}
	public String getCodeStat() {
		return codeStat;
	}
	public void setCodeStat(String codeStat) {
		this.codeStat = codeStat;
	}
	public String getPocyType() {
		return pocyType;
	}
	public void setPocyType(String pocyType) {
		this.pocyType = pocyType;
	}
	public String getPocyTime() {
		return pocyTime;
	}
	public void setPocyTime(String pocyTime) {
		this.pocyTime = pocyTime;
	}
	public String getPocyUnit() {
		return pocyUnit;
	}
	public void setPocyUnit(String pocyUnit) {
		this.pocyUnit = pocyUnit;
	}
	public String getPocyUpValue() {
		return pocyUpValue;
	}
	public void setPocyUpValue(String pocyUpValue) {
		this.pocyUpValue = pocyUpValue;
	}
	public String getPocyDownValue() {
		return pocyDownValue;
	}
	public void setPocyDownValue(String pocyDownValue) {
		this.pocyDownValue = pocyDownValue;
	}
	public String getDealCount() {
		return dealCount;
	}
	public void setDealCount(String dealCount) {
		this.dealCount = dealCount;
	}
	public String getSaleUpCount() {
		return saleUpCount;
	}
	public void setSaleUpCount(String saleUpCount) {
		this.saleUpCount = saleUpCount;
	}
	public String getSaleDownCount() {
		return saleDownCount;
	}
	public void setSaleDownCount(String saleDownCount) {
		this.saleDownCount = saleDownCount;
	}
	public String getDaySaleCount() {
		return daySaleCount;
	}
	public void setDaySaleCount(String daySaleCount) {
		this.daySaleCount = daySaleCount;
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
		return "ScPolicy [idscPolicy=" + idscPolicy + ", codeId=" + codeId
				+ ", codeStat=" + codeStat + ", pocyType=" + pocyType
				+ ", pocyTime=" + pocyTime + ", pocyUnit=" + pocyUnit
				+ ", pocyUpValue=" + pocyUpValue + ", pocyDownValue="
				+ pocyDownValue + ", dealCount=" + dealCount + ", saleUpCount="
				+ saleUpCount + ", saleDownCount=" + saleDownCount
				+ ", daySaleCount=" + daySaleCount + ", contCreateDate="
				+ contCreateDate + ", contUpdateDate=" + contUpdateDate
				+ ", contSystem=" + contSystem + ", policyDesc=" + policyDesc
				+ "]";
	}
	


	
	
}

package app.madeinho.ohquest.stock.mystockhist;

import java.io.Serializable;
import java.util.Date;

import app.madeinho.ohquest.common.domain.BaseDomain;

public class MyStockHist extends BaseDomain implements Serializable{

	/**
	 * 개인 주식거래이력 :: 주식 관심리스트, 매수, 매도 처리를  관리하는 마스터 도메인
	 */
	private static final long serialVersionUID = 10047439323L;
	  private String idscMyStockHist ;    
	  private String idscMyStock     ;    
	  private String idohMember      ; 
	  private String jobType         ; 
	  private String scCode          ; 
	  private String scStatCd        ; 
	  private String statChgDate     ; 
	  private String buyType         ; 
	  private String buyValue        ; 
	  private String buyVCount       ; 
	  private double buyVAmt         ; 
	  private String buyRCount       ; 
	  private double buyRAmt         ; 
	  private String buyRDate        ; 
	  private String saleType        ; 
	  private String saleValue       ; 
	  private String saleVCount      ; 
	  private double saleVAmt        ; 
	  private String saleRCount      ; 
	  private double saleRAmt        ; 
	  private String saleRDate       ; 
	  private String contCreateDate  ; 
	  private String contUpdateDate  ; 
	  private String contSystem      ; 
	  private String remark          ;
	
	  
	  
	public String getIdscMyStockHist() {
		return idscMyStockHist;
	}
	public void setIdscMyStockHist(String idscMyStockHist) {
		this.idscMyStockHist = idscMyStockHist;
	}
	public String getIdscMyStock() {
		return idscMyStock;
	}
	public void setIdscMyStock(String idscMyStock) {
		this.idscMyStock = idscMyStock;
	}
	public String getIdohMember() {
		return idohMember;
	}
	public void setIdohMember(String idohMember) {
		this.idohMember = idohMember;
	}
	public String getJobType() {
		return jobType;
	}
	public void setJobType(String jobType) {
		this.jobType = jobType;
	}
	public String getScCode() {
		return scCode;
	}
	public void setScCode(String scCode) {
		this.scCode = scCode;
	}
	public String getScStatCd() {
		return scStatCd;
	}
	public void setScStatCd(String scStatCd) {
		this.scStatCd = scStatCd;
	}
	public String getStatChgDate() {
		return statChgDate;
	}
	public void setStatChgDate(String statChgDate) {
		this.statChgDate = statChgDate;
	}
	public String getBuyType() {
		return buyType;
	}
	public void setBuyType(String buyType) {
		this.buyType = buyType;
	}
	public String getBuyValue() {
		return buyValue;
	}
	public void setBuyValue(String buyValue) {
		this.buyValue = buyValue;
	}
	public String getBuyVCount() {
		return buyVCount;
	}
	public void setBuyVCount(String buyVCount) {
		this.buyVCount = buyVCount;
	}
	public double getBuyVAmt() {
		return buyVAmt;
	}
	public void setBuyVAmt(double buyVAmt) {
		this.buyVAmt = buyVAmt;
	}
	public String getBuyRCount() {
		return buyRCount;
	}
	public void setBuyRCount(String buyRCount) {
		this.buyRCount = buyRCount;
	}
	public double getBuyRAmt() {
		return buyRAmt;
	}
	public void setBuyRAmt(double buyRAmt) {
		this.buyRAmt = buyRAmt;
	}
	public String getBuyRDate() {
		return buyRDate;
	}
	public void setBuyRDate(String buyRDate) {
		this.buyRDate = buyRDate;
	}
	public String getSaleType() {
		return saleType;
	}
	public void setSaleType(String saleType) {
		this.saleType = saleType;
	}
	public String getSaleValue() {
		return saleValue;
	}
	public void setSaleValue(String saleValue) {
		this.saleValue = saleValue;
	}
	public String getSaleVCount() {
		return saleVCount;
	}
	public void setSaleVCount(String saleVCount) {
		this.saleVCount = saleVCount;
	}
	public double getSaleVAmt() {
		return saleVAmt;
	}
	public void setSaleVAmt(double saleVAmt) {
		this.saleVAmt = saleVAmt;
	}
	public String getSaleRCount() {
		return saleRCount;
	}
	public void setSaleRCount(String saleRCount) {
		this.saleRCount = saleRCount;
	}
	public double getSaleRAmt() {
		return saleRAmt;
	}
	public void setSaleRAmt(double saleRAmt) {
		this.saleRAmt = saleRAmt;
	}
	public String getSaleRDate() {
		return saleRDate;
	}
	public void setSaleRDate(String saleRDate) {
		this.saleRDate = saleRDate;
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
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "MyStockHist [idscMyStockHist=" + idscMyStockHist
				+ ", idscMyStock=" + idscMyStock + ", idohMember=" + idohMember
				+ ", jobType=" + jobType + ", scCode=" + scCode + ", scStatCd="
				+ scStatCd + ", statChgDate=" + statChgDate + ", buyType="
				+ buyType + ", buyValue=" + buyValue + ", buyVCount="
				+ buyVCount + ", buyVAmt=" + buyVAmt + ", buyRCount="
				+ buyRCount + ", buyRAmt=" + buyRAmt + ", buyRDate=" + buyRDate
				+ ", saleType=" + saleType + ", saleValue=" + saleValue
				+ ", saleVCount=" + saleVCount + ", saleVAmt=" + saleVAmt
				+ ", saleRCount=" + saleRCount + ", saleRAmt=" + saleRAmt
				+ ", saleRDate=" + saleRDate + ", contCreateDate="
				+ contCreateDate + ", contUpdateDate=" + contUpdateDate
				+ ", contSystem=" + contSystem + ", remark=" + remark + "]";
	} 
	
	
	
}

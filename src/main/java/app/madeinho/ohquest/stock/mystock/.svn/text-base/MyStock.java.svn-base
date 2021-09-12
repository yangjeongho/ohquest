package app.madeinho.ohquest.stock.mystock;

import java.io.Serializable;
import java.util.List;

import app.madeinho.ohquest.common.domain.BaseDomain;
import app.madeinho.ohquest.stock.policy.ScPolicy;

public class MyStock extends BaseDomain implements Serializable{

	/**
	 * 개인 주식거래 :: 주식 관심리스트, 매수, 매도 처리를  관리하는 마스터 도메인
	 */
	private static final long serialVersionUID = 10047439324L;
	
	  private String idscMyStock     ;
	  private String idohMember      ;
	  private String jobType         ; //code 관리 -SCJOBTYPE  ; 시뮬레이션, 실시간 인지
	  private String scCode          ; //주식코드
	  private String scName          ; //주식명
	  private String scStatCd        ; //code 관리 - SCSTATCD : 상태코드	  WR : wish 리스트 등록	  WC : 취소	  BV:가 매수	  BR:실 매수	  BC: 매수 취소	  SV:가 매도	  SR:실 매도
	  private String statChgDate     ;
	  private String buyType         ; //code 관리 - BUYTYPE : 매수유형 - 코드에 따라서 프로세스 진행 디폴트 즉시 처리.
	  private String buyValue        ;
	  private String buyVCount       ;
	  private double buyVAmt         ;
	  private String buyRCount       ;
	  private double buyRAmt         ;
	  private String buyRDate        ;
	  private String saleType        ; //code 관리 - SALETYPE :매도우형
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
	  private String type            ;	  
	  private String buyPocyValue    ;
	  private String salePocyValue   ;
	  private String buyAllowYn      ;
	  private String saleAllowYn     ;

	  
	  
	  private String hiRate;
	  private String lowRate;
	  private List<MyStock>  myStockList;
	  private List<ScPolicy> scPolicyList;
	  private List<ScPolicy> scPolicyListActCode;	  
	  private String mode;
	  private String realStockURL;
	  private double lastAmt;
	  private int iContCnt; //연속건수
	  private int iSumCnt;  //누적건수
	  
	  
	public String getBuyAllowYn() {
		return buyAllowYn;
	}
	public void setBuyAllowYn(String buyAllowYn) {
		this.buyAllowYn = buyAllowYn;
	}
	public String getSaleAllowYn() {
		return saleAllowYn;
	}
	public void setSaleAllowYn(String saleAllowYn) {
		this.saleAllowYn = saleAllowYn;
	}
	public int getiContCnt() {
		return iContCnt;
	}
	public void setiContCnt(int iContCnt) {
		this.iContCnt = iContCnt;
	}
	public int getiSumCnt() {
		return iSumCnt;
	}
	public void setiSumCnt(int iSumCnt) {
		this.iSumCnt = iSumCnt;
	}
	public double getLastAmt() {
		return lastAmt;
	}
	public void setLastAmt(double lastAmt) {
		this.lastAmt = lastAmt;
	}
	public String getBuyPocyValue() {
		return buyPocyValue;
	}
	public void setBuyPocyValue(String buyPocyValue) {
		this.buyPocyValue = buyPocyValue;
	}
	public String getSalePocyValue() {
		return salePocyValue;
	}
	public void setSalePocyValue(String salePocyValue) {
		this.salePocyValue = salePocyValue;
	}
	public List<ScPolicy> getScPolicyListActCode() {
		return scPolicyListActCode;
	}
	public void setScPolicyListActCode(List<ScPolicy> scPolicyListActCode) {
		this.scPolicyListActCode = scPolicyListActCode;
	}  

	public String getRealStockURL() {
		return realStockURL;
	}
	public void setRealStockURL(String realStockURL) {
		this.realStockURL = realStockURL;
	}
	public List<ScPolicy> getScPolicyList() {
		return scPolicyList;
	}
	public void setScPolicyList(List<ScPolicy> scPolicyList) {
		this.scPolicyList = scPolicyList;
	}
	public String getMode() {
		return mode;
	}
	public void setMode(String mode) {
		this.mode = mode;
	}
	public String getHiRate() {
		return hiRate;
	}
	public void setHiRate(String hiRate) {
		this.hiRate = hiRate;
	}
	public String getLowRate() {
		return lowRate;
	}
	public void setLowRate(String lowRate) {
		this.lowRate = lowRate;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public List<MyStock> getMyStockList() {
		return myStockList;
	}
	public void setMyStockList(List<MyStock> myStockList) {
		this.myStockList = myStockList;
	}
	public String getScName() {
		return scName;
	}
	public void setScName(String scName) {
		this.scName = scName;
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
		return "MyStock [idscMyStock=" + idscMyStock + ", idohMember="
				+ idohMember + ", jobType=" + jobType + ", scCode=" + scCode
				+ ", scName=" + scName + ", scStatCd=" + scStatCd
				+ ", statChgDate=" + statChgDate + ", buyType=" + buyType
				+ ", buyValue=" + buyValue + ", buyVCount=" + buyVCount
				+ ", buyVAmt=" + buyVAmt + ", buyRCount=" + buyRCount
				+ ", buyRAmt=" + buyRAmt + ", buyRDate=" + buyRDate
				+ ", saleType=" + saleType + ", saleValue=" + saleValue
				+ ", saleVCount=" + saleVCount + ", saleVAmt=" + saleVAmt
				+ ", saleRCount=" + saleRCount + ", saleRAmt=" + saleRAmt
				+ ", saleRDate=" + saleRDate + ", contCreateDate="
				+ contCreateDate + ", contUpdateDate=" + contUpdateDate
				+ ", contSystem=" + contSystem + ", remark=" + remark + "]";
	}


	  
	
	
}

package app.madeinho.ohquest.ui.account;

import java.io.Serializable;
import java.util.Date;

import app.madeinho.ohquest.common.domain.BaseDomain;

public class AccountDetailInfo extends BaseDomain implements Serializable{

	/**
	 * :: 계정 정보 관리 마스터 
	 */
	
	
	private static final long serialVersionUID = 10021444521654543L;
	
	private String balance        ;
	private String incomeAmt      ;
	private String outgoAmt       ;
	private String contCreateDate ;
	private String scCode         ;
	private String scName         ;
	private String buyRCount      ;
	private String buyRAmt        ;
	private String saleRCount     ;
	private String saleRAmt       ;
	private String idscMyStock    ;
	

	public static long getSerialversionuid() {
		return serialVersionUID;
	}


	public String getBalance() {
		return balance;
	}


	public void setBalance(String balance) {
		this.balance = balance;
	}


	public String getIncomeAmt() {
		return incomeAmt;
	}


	public void setIncomeAmt(String incomeAmt) {
		this.incomeAmt = incomeAmt;
	}


	public String getOutgoAmt() {
		return outgoAmt;
	}


	public void setOutgoAmt(String outgoAmt) {
		this.outgoAmt = outgoAmt;
	}


	public String getContCreateDate() {
		return contCreateDate;
	}


	public void setContCreateDate(String contCreateDate) {
		this.contCreateDate = contCreateDate;
	}


	public String getScCode() {
		return scCode;
	}


	public void setScCode(String scCode) {
		this.scCode = scCode;
	}


	public String getScName() {
		return scName;
	}


	public void setScName(String scName) {
		this.scName = scName;
	}


	public String getBuyRCount() {
		return buyRCount;
	}


	public void setBuyRCount(String buyRCount) {
		this.buyRCount = buyRCount;
	}


	public String getBuyRAmt() {
		return buyRAmt;
	}


	public void setBuyRAmt(String buyRAmt) {
		this.buyRAmt = buyRAmt;
	}


	public String getSaleRCount() {
		return saleRCount;
	}


	public void setSaleRCount(String saleRCount) {
		this.saleRCount = saleRCount;
	}


	public String getSaleRAmt() {
		return saleRAmt;
	}


	public void setSaleRAmt(String saleRAmt) {
		this.saleRAmt = saleRAmt;
	}


	public String getIdscMyStock() {
		return idscMyStock;
	}


	public void setIdscMyStock(String idscMyStock) {
		this.idscMyStock = idscMyStock;
	}


	@Override
	public String toString() {
		return "AccountDetailInfo [balance=" + balance + ", incomeAmt="
				+ incomeAmt + ", outgoAmt=" + outgoAmt + ", contCreateDate="
				+ contCreateDate + ", scCode=" + scCode + ", scName=" + scName
				+ ", buyRCount=" + buyRCount + ", buyRAmt=" + buyRAmt
				+ ", saleRCount=" + saleRCount + ", saleRAmt=" + saleRAmt
				+ ", idscMyStock=" + idscMyStock + "]";
	}

	  
	
}

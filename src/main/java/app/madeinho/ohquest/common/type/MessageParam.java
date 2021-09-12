/*
 * Copyright (c) Abacus. All rights reserved.
 */
package app.madeinho.ohquest.common.type;

import java.io.Serializable;


/**
 *
 * @author bsyang
 * @since
 *
 */
public class MessageParam implements Serializable{
	
	/*  */
	private static final long serialVersionUID = 6625273253224810277L;
	private ResultCode resultCode ;
	private String message ;
	private String messageParam[] ;
	private Object object ;
	
	public MessageParam(ResultCode resultCode){
		this.resultCode = resultCode;
		if(resultCode.equals(ResultCode.FAIL)){
			this.message = "err.default" ;
		}
	}
	public MessageParam(ResultCode resultCode, String message){
		this.resultCode = resultCode;
		this.message = message;
	}
	public MessageParam(){
		this.resultCode = resultCode;
		this.message = message;
		this.messageParam = messageParam;
	}
	public ResultCode getResultCode() {
		return resultCode;
	}
	public void setResultCode(ResultCode resultCode) {
		this.resultCode = resultCode;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String[] getMessageParam() {
		return messageParam;
	}
	public void setMessageParam(String[] messageParam) {
		this.messageParam = messageParam;
	}
	public Object getObject() {
		return object;
	}
	public void setObject(Object object) {
		this.object = object;
	}	
}

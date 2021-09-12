package app.madeinho.ohquest.common.exception;

public class OhquestException extends RuntimeException {

	private static final long serialVersionUID = 2065167909477487581L;

	private String messageCode = "err.default";
	private String messageParam [] ;

	public OhquestException(String message) {
		super(message);
	}
	public OhquestException(String message, String messageParam[]) {
		super(message);
		this.messageParam = messageParam;
	}

	public OhquestException(String messageCode, String message) {
		super(message);
		this.messageCode = messageCode;
	}
	
	public OhquestException(String messageCode, String message, String messageParam[]) {
		super(message);
		this.messageCode = messageCode;
		this.messageParam = messageParam;
	}

	public OhquestException(String messageCode, String message, Throwable cause) {
		super(message, cause);
		this.messageCode = messageCode;
	}

	public OhquestException(String message, Throwable cause) {
		super(message, cause);
	}

	public String getMessageCode() {
		return messageCode;
	}
	public String[] getMessageParam() {
		return messageParam;
	}
}

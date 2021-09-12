package app.madeinho.ohquest.common.exception;


public class OhquestCommonException extends OhquestException {

	private static final long serialVersionUID = 2065167909477487581L;

	public OhquestCommonException(String message) {
		super(message);
	}
	public OhquestCommonException(String message, String messageParam[]) {
		super(message, messageParam);
	}

	public OhquestCommonException(String messageCode, String message) {
		super(messageCode, message);
	}
	public OhquestCommonException(String messageCode, String message, String messageParam[]) {
		super(messageCode, message, messageParam);
	}
}

var MessageBox = {} ;
var __callFunction = null ;
var __cancelFunction = null;
MessageBox.alert = function (){
	var _errorMessage="";
	var _errorMessageParam = ""; 
	var args = arguments.length ;
	if(args==1){
		_errorMessage = arguments[0];	
	}else if(args==2){
		_errorMessage = arguments[0];	
		_errorMessageParam = arguments[1];	
	}
	
	var msgCode ;
	try{
		var replaced = _errorMessage.replace(".", "_");
		msgCode = eval(replaced);
		if(msgCode != null){
			_errorMessage = msgCode ;
		}
	}catch(exception){
		//alert('msgCode:'+msgCode +":"+exception);
		msgCode= null ;
	}
	if(_errorMessageParam != null && _errorMessageParam != ''){
		for(var i=0; i < _errorMessageParam.length ; i++){
			_errorMessage = _errorMessage.replace('%'+i, _errorMessageParam[i]) ;
		}
	}
	if(_errorMessage != null && _errorMessage != ""){
		alert(_errorMessage);	
	}
};

MessageBox.dialog = function (){
	var _errorMessage="";
	var _errorMessageParam = ""; 
	__callFunction = null;
	var args = arguments.length ;
	if(args==1){
		_errorMessage = arguments[0];	
	}else if(args==2){
		_errorMessage = arguments[0];	
		_errorMessageParam = arguments[1];	
		if(typeof(_errorMessageParam) == 'function'){
			__callFunction = _errorMessageParam ;
		}
	}else if(args==3){
		_errorMessage = arguments[0];	
		_errorMessageParam = arguments[1];	
		__callFunction = arguments[2];	
	}
	
	
	var msgCode ;
	try{
		msgCode = eval(_errorMessage.replace(".", "_"));
		if(msgCode != null){
			_errorMessage = msgCode ;
		}
	}catch(exception){
		//alert(exception);
		msgCode= null ;
	}
	if(typeof(_errorMessageParam) != 'function' && _errorMessageParam != null && _errorMessageParam != ''){
		for(var i=0; i < _errorMessageParam.length ; i++){
			_errorMessage = _errorMessage.replace('%'+i, _errorMessageParam[i]) ;
		}
	}		
	
	if(_errorMessage != ""){		
		//attach message box division to body 
		attachMessageBox();
		// Dialog			
		$('#dialogMessagebox').dialog({
			autoOpen: false,
			modal : true,
			width: 300,
			closeOnEscape : false, 
			buttons: {
				"Ok": function() {
					$('#dialogMessagebox').dialog("close"); 
					removeMessageBox();
					if(__callFunction != null){
						setTimeout(__callFunction, 100);
					}
				}
		
			}
		});
		_errorMessage = _errorMessage.replace("com.acube.unitel.common.exception.AcubeException:", "");
		_errorMessage = _errorMessage.replace("com.acube.unitel.common.exception.AcubeCommonException:", "");
		$('#dialogMessagebox').find("#message")
								.empty()
								.append(_errorMessage);
		$('#dialogMessagebox').dialog("open");
		$('#dialogMessagebox').prev().find("a").hide();
	}
};

MessageBox.error = function (data, err500){
	
	var _errorMessage = cmnSessionOut ;	
	var refresh = false ;
	if(data.responseText.indexOf("/security/login2") != -1){
		_errorMessage = cmnSessionOut ;	
		refresh = true ;
	}else{
		_errorMessage = err500 ;
		
		var msgCode ;
		try{
			msgCode = eval(_errorMessage.replace(".", "_"));
			if(msgCode != null){
				_errorMessage = msgCode ;
			}
		}catch(exception){
			//alert(exception);
			msgCode= null ;
		}
	}
	//attach message box division to body 
	attachMessageBox();
	// Dialog			
	$('#dialogMessagebox').dialog({
		autoOpen: false,
		modal : true,
		width: 300,
		closeOnEscape : false, 
		buttons: {
			"Ok": function() {
				$('#dialogMessagebox').dialog("close"); 
				removeMessageBox();
				if(refresh){
					$("#reloadMainBtn").click();					
				}
				if(__callFunction != null){
					setTimeout(__callFunction, 100);
				}
			}
	
		}
	});
	_errorMessage = _errorMessage.replace("com.acube.unitel.common.exception.AcubeException:", "");
	_errorMessage = _errorMessage.replace("com.acube.unitel.common.exception.AcubeCommonException:", "");
	$('#dialogMessagebox').find("#message")
							.empty()
							.append(_errorMessage);
	$('#dialogMessagebox').dialog("open");
	$('#dialogMessagebox').prev().find("a").hide();
};

MessageBox.confirm = function (){
	__callFunction = null;
	__cancelFunction = null;
	
	var _errorMessage="";
	var args = arguments.length ;
	if(args==1){
		_errorMessage = arguments[0];	
	}else if(args==2){
		_errorMessage = arguments[0];	
		__callFunction = arguments[1];	
	}else if(args == 3){
		_errorMessage = arguments[0];	
		__callFunction = arguments[1];
		__cancelFunction = arguments[2];
	}
	
	
	var msgCode ;
	try{
		msgCode = eval(_errorMessage.replace(".", "_"));
		if(msgCode != null){
			_errorMessage = msgCode ;
		}
	}catch(exception){
		//alert(exception);
		msgCode= null ;
	}
		
	
	if(_errorMessage != ""){		
		//attach message box division to body 
		attachMessageBox();
		// Dialog			
		$('#dialogMessagebox').dialog({
			autoOpen: false,
			modal : true,
			width: 300,
			closeOnEscape : false, 
			buttons: {
				"Confirm": function() {
					$('#dialogMessagebox').dialog("close"); 
					
					removeMessageBox();
					
					if(__callFunction != null){
						setTimeout(eval(__callFunction), 100);
					}
					
				} ,
		        "Cancel": function() {
		          $( this ).dialog( "close" );
		          removeMessageBox();
		          
			      	if(__cancelFunction != null){
						setTimeout(eval(__cancelFunction), 100);
					}
		          
		        }
		
			}
		});		
		$('#dialogMessagebox').find("#message")
								.empty()
								.append(_errorMessage);
		$('#dialogMessagebox').dialog("open");
		$('#dialogMessagebox').prev().find("a").hide();
	}
};

function attachMessageBox(){
	var msgBox = "<div id='dialogMessagebox' title='Notification'><label id='message'></label></div>";
	$('body').append(msgBox);
}
function removeMessageBox(){
	$('body').find('#dialogMessagebox').remove();
}

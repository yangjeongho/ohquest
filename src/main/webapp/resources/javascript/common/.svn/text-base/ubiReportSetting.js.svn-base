//function loadUbiReportAJAX(ubiParam) {
//	
//  //alert(JSON.stringify(ubiParam));
//   if( ubiParam.ubiDivId == "" || ubiParam.jrfFileName == "") {
//	  MessageBox.dialog("------");
//	  return false;
//   }
//
//  //var AjaxViewer = document.getElementById('UbiAjaxViewer');
//  var AjaxViewer = document.getElementById(ubiParam.ubiDivId);
//    
//  AjaxViewer.innerHTML = '';
//  //AjaxViewer Div Width
//  //AjaxViewer.style.width = (self.innerWidth || (document.documentElement && document.documentElement.clientWidth) || document.body.clientWidth) + 'px';
//  //AjaxViewer.style.width = $('#${param.dialogName}').dialog( "option", "width" ) - 30+"px";
//  AjaxViewer.style.width = ubiParam.width;
//  //AjaxViewer Div Height
//  AjaxViewer.style.height = ubiParam.height; //$("#bs1TabDiv-1").height(); 
//  //AjaxViewer.style.height = (self.innerHeight || (document.documentElement && document.documentElement.clientHeight) || document.body.clientHeight) - 31 + 'px';
//
//  var ubiviewer = new UbiViewer( {
//	 key : 'FF950B05D24C2DBDA018DAFF2C8BB5B8', //use session id : session.getId()
//	 gatewayurl : ubiParam.contextPath + '/UbiGateway',
//	 timeout : '60000',
//	 resid : 'UBIAJAX',
//	 resource : ubiParam.contextPath +'/ubireport/ajax',
//	 toolbar : 'true',
//	 scale : '100',
//	 divid : ubiParam.ubiDivId,
//	// jrffile : 'unitel_invoice.jrf',
//	 jrffile : ubiParam.jrfFileName,
//	 //arg : 'glBillAcntNo#1000001456#gsBillTrgtYymm#201208#gsAplyLangCd#en'
//	 arg : ubiParam.jrfArg
//  });
//
//  ubiviewer.showReport();
//}

//@@@@@ Json type parameter
//loadUbiReportByAJAX({
//		jrfFileName : "unitel_invoice.jrf",			// Ubi Report 파일명
//		jrfArg      : "glBillAcntNo#${billAcntNo}#gsBillTrgtYymm#${billTrgtYymm}#gsAplyLangCd#"+baseLang+"#imgurl#"+imageUrl,
//		iframe      : 'ubiIfrm',					// 하단 html안에 iframe id
//	});

function loadUbiReportByAJAX(param) {
	if(param.jrfFileName == "") {
		MessageBox.dialog('jrf file name is required!!');
		return false;
	}

	//	console.log("<"+new Date() + JSON.stringify(param)+">");
	
	var formId = "ubiReportForm";
 	var form = document.createElement("form");
 	form.setAttribute("method", "post");
 	form.setAttribute("action", contextPathForUbi + "/ubireport/ajax.jsp");
 	form.setAttribute("id", formId);
 	var hiddenField = document.createElement("input");              
 	hiddenField.setAttribute("name", "jrfFileName");
 	hiddenField.setAttribute("value", param.jrfFileName);
 	var hiddenField2 = document.createElement("input");
 	hiddenField2.setAttribute("name", "jrfArg");
 	hiddenField2.setAttribute("value", param.jrfArg);
 	
 	
 	form.appendChild(hiddenField);
 	form.appendChild(hiddenField2);
 	
 	if(param.fontSize != ""){
 		
 		var hiddenField3 = document.createElement("input");
 		hiddenField3.setAttribute("name", "fontSize");
 		hiddenField3.setAttribute("value", param.fontSize);
 		form.appendChild(hiddenField3);
 	}
 	
 	if(param.fontFamily != ""){
 		
 		var hiddenField4 = document.createElement("input");
 		hiddenField4.setAttribute("name", "fontFamily");
 		hiddenField4.setAttribute("value", param.fontFamily);
 		form.appendChild(hiddenField4);
 	}
 	
 	
 	
 	document.body.appendChild(form);
   	
	form.target = param.iframe;
	form.action = contextPathForUbi + "/ubireport/ajax.jsp";
	form.submit();
	
	
	$('body').find("[id="+formId+"]").empty().remove();
}
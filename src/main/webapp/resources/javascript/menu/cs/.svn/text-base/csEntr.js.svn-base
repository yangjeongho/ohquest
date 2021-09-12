/* customer subscription */
function clickMenu_csEntr002(menuObject){
	    var blackListYn = $('#subscriptionCustomerSearchForm #blackListYn').val();
	    if ( blackListYn =='Y' ){
	    	alert('Black List!!!');
	    	return;
	    }
		Dialog.open({
			div : '#dialogContent', 
			url : baseUrl+"cs/entr/csEntr002?source=entr&dialogName=dialogContent&eventCd=NAC&custNo=" + pubCustNo, 
			title : 'Create Subscription', 
			width : 1220, 
			height : defaultScreenHeight900, 
			modal : true
		});
}
function clickMenu_csEntr002_hotel(menuObject){
  
	Dialog.open({ 
		div : '#dialogContent',
		url : baseUrl+"cs/entr/csEntr002?source=entr&dialogName=dialogContent&eventCd=NAC&houseCustNo=100000126026&billAccountNo=1000001425", 
		title : 'Create Subscription', 
		width : 1220, 
		height : defaultScreenHeight900, 
		modal : true
	});
}
function clickMenu_csEntr002_houseHold(menuObject){
	  
	Dialog.open({
		div : '#dialogContent',
		url : baseUrl+"cs/entr/csEntr002?source=entr&dialogName=dialogContent&eventCd=NAC&houseCustNo=100000128068&houseHoldSeqno=1000001076&custNo=100000128068",  
		title : 'Create Subscription', 
		width : 1220, 
		height : defaultScreenHeight900, 
		modal : true
	});
}
/* customer subscription (batch)*/
function clickMenu_csEntr002Batch(menuObject){
	
	var entrNo = "";//$("#subscriptionCustomerSearchForm #entrNo").val();

	if(typeof(entrNo) == 'undefined'){ 
		entrNo="";
	} 
	Dialog.open({ 
		div : '#dialogContent', 
		url : baseUrl+"cs/entr/csEntr002?source=entr&batchYn=Y&dialogName=dialogContent&eventCd=NAC&entrNo="+entrNo+"&custNo=" + pubCustNo, 
		title : 'Create Batch Subscription', 
		width : 1220, 
		height : defaultScreenHeight900, 
		modal : true
	});	

}

function clickMenu_csEntr002_1(counselId, orderNum ,custNo,entrNo,actMode,svcCd,userLevel,callBack){
	var blackListYn = $('#subscriptionCustomerSearchForm #blackListYn').val();
    if ( blackListYn =='Y' ){
    	alert('Black List!!!');
    	return;
    }
    
	Dialog.open({
		div : '#dialogContent', 
		url : baseUrl+"cs/entr/csEntr002?source=counsel&dialogName=dialogContent&eventCd=NAC&counselId="+counselId+"&custNo=" + pubCustNo+"&orderNum=" + orderNum+"&callBack=" + callBack, 
		title : 'Create Subscription [counselId=' + counselId +']', 
		width : 1220, 
		height : defaultScreenHeight900, 
		modal : true
	});
//createMainWorkArea('csEntr002', url : baseUrl + 'resources/images/common/left/btn_notice.gif', url : baseUrl+"cs/entr/csEntr002");
}

/* 처리중 목록   */
function clickMenu_csEntr005(menuObject){
		Dialog.open({
			div : '#dialogCcsWork005', 
			url : baseUrl+"cs/ccsWork005?dialogName=dialogCcsWork005&custNo=" + pubCustNo,
			title : 'Progress Work', 
			width : 900, 
			height : 500, 
			modal : true
		});
}

/* 전화번호 변경   */

function clickMenu_csEntr007(menuObject){
	if (gf_checkNumberChange()) {
		var entrNo = $("#subscriptionCustomerSearchForm #entrNo").val();
		if(typeof(entrNo) == 'undefined'){ 
			alert("Search Subscriber ..... ");
			$(this).hideLoading();  
			return ;
		}
		var ppayEntrDvNm = $("#subscriptionCustomerSearchForm #ppayEntrDvNm").val();
		if(ppayEntrDvNm != null){
	   		ppayEntrDvNm = '( '+ppayEntrDvNm+' )';
	   	}else{
	   		ppayEntrDvNm = "";
	   	}
		var title = 'Phone Number Change::' +  ppayEntrDvNm + '::' + entrNo;
		var prodCd = null;
		var productEntrList = gf_getAllGridData("#subscriptionCcsForm #productEntrList");
		for(var i=0; i<productEntrList.length; i++){
			if(productEntrList[i].svcKdCd == '01' || productEntrList[i].svcKdCd == '04'){
				prodCd = productEntrList[i].prodCd ;
			}
		}
		console.log(entrNo);
		Dialog.open({
			div : '#dialogContent', 
			url : baseUrl+"cs/entr/csEntr007?dialogName=dialogContent&entrNo="+entrNo +"&prodCd=" + prodCd,
			title : title, 
			width : 420, 
			height : 460, 
			modal : true
		});
	}
}

function clickMenu_csEntr007_1(counselId,orderNum,custNo,entrNo,actMode,svcCd,userLevel,callBack){
	if (gf_checkNumberChange()) {
		var entrNo = $("#subscriptionCustomerSearchForm #entrNo").val();
		if(typeof(entrNo) == 'undefined'){ 
			alert("Search Subscriber ..... ");
			$(this).hideLoading();  
			return ;
		}
		var ppayEntrDvNm = $("#subscriptionCustomerSearchForm #ppayEntrDvNm").val();
		
		if(ppayEntrDvNm != null){
	   		ppayEntrDvNm = '( '+ppayEntrDvNm+' )';
	   	}else{
	   		ppayEntrDvNm = "";
	   	}
		var title = 'Phone Number Change::' +  ppayEntrDvNm + '::' + entrNo;
		console.log(entrNo);
		Dialog.open({
			div : '#dialogContent', 
			url : baseUrl+"cs/entr/csEntr007?dialogName=dialogContent&entrNo="+entrNo+"&callBack="+callBack,
			title : title, 
			width : 420, 
			height : 460, 
			modal : true
		});
	} 
}

/* Service suspending   */
function clickMenu_csEntr008(menuObject){
	if (gf_CheckSttsByEntrSusRsp(true)) {
		var entrNo = $("#subscriptionCustomerSearchForm #entrNo").val();
		
		Dialog.open({
			div : '#dialogContent', 
			url : baseUrl+"cs/entr/csEntr008?dialogName=dialogContent&entrNo=" + entrNo+"&custNo=" + pubCustNo+"&language="+baseLang+"&mode=" , 
			title : 'Service Suspending/Re-Suspending', 
			width : 900, 
			height : 745, 
			modal : true
		});
	}
}

function clickMenu_csEntr008_1(counselId,orderNum,custNo,entrNo,actMode,svcCd,userLevel){
	
	Dialog.open({
		div : '#dialogContent', 
		url : baseUrl+"cs/entr/csEntr008?dialogName=dialogContent&entrNo=" + entrNo+"&language="+baseLang+"&mode=", 
		title : 'Service Suspending/Re-Suspending', 
		width : 900, 
		height : 745, 
		modal : true
	});
}

function clickMenu_csEntr008_Batch(){
	
	Dialog.open({
		div : '#dialogContent', 
		url : baseUrl+"cs/entr/csEntr008?dialogName=dialogContent&entrNo=&language="+baseLang+"&custNo=" + pubCustNo+"&mode=group" , 
		title : 'Batch Suspending/Re-Suspending', 
		width : 900, 
		height : 645, 
		modal : true
	});
}

/*Installation  */
function clickMenu_csEntr009(menuObject){
	    
	    
	    if ($("#subscriptionCustomerSearchForm").length == 0) { 
	    	alert("Search Subscriber ..... ");
	    	$(this).hideLoading();
	    	return ;
	    } else {
	    	var entrNo = $("#subscriptionCustomerSearchForm #entrNo").val();
	    	if (entrNo == "" || entrNo == null) {
	    		alert("Search Subscriber ..... ");
	    		$(this).hideLoading();
		    	return ;
	    	}
	    }
	  
	    var custNo = $("#subscriptionCustomerSearchForm #custNo").val();
	    var ppayEntrDvCd = $("#subscriptionCustomerSearchForm #ppayEntrDvCd").val();
	    console.log("ppayEntrDvCd :: " + ppayEntrDvCd);
	    var entrSttsCd = $("#subscriptionCustomerSearchForm #entrSttsCd").val();
	    console.log("entrSttsCd :: " + entrSttsCd);	    
	    var svcCd = $("#subscriptionCustomerSearchForm #svcCd").val();
	    var actMode = "CIL";
	    if ( svcCd == '2'){
	    	alert("Mobile!!");
	    	$(this).hideLoading();
	    	return;
	    }
	    
	    if (entrSttsCd != "A") {
	    	alert(entrSttsCd + " :: Charged only the Active account status.");
	    	$(this).hideLoading();
	    	return ;
	    }
	    var userLevel = $("#subscriptionCustomerSearchForm #userLevel").val();
	    var cHeight ="390";
	        
        if ( userLevel != 'C'){
        	cHeight = "510";
        }
		Dialog.open({
			div : '#chgInsAddrDialog',
			url : baseUrl+"cs/entr/csEntr009?dialogName=chgInsAddrDialog&custNo=" + pubCustNo+"&entrNo="+entrNo+"&svcCd="+svcCd +"&actMode="+actMode,
			title : 'Installation change', 
			width : 820, 
			height : cHeight,  
			modal : true
		});
}

function clickMenu_csEntr009_1(counselId,orderNum,custNo,entrNo,actMode,svcCd,userLevel,callBack){
    
	var cHeight ="390";
    
    if ( userLevel != 'C'){
    	cHeight = "510";
    }
	Dialog.open({
		div : '#chgInsAddrDialog',
		url : baseUrl+"cs/entr/csEntr009?dialogName=chgInsAddrDialog&custNo=" + custNo+"&entrNo="+entrNo+"&svcCd="+svcCd +"&actMode="+actMode+"&callBack="+callBack, 
		title : 'Installation change', 
		width : 820, 
		height : cHeight, 
		modal : true
	});
}


/* Change of contract ownership    */
function clickMenu_csEntr010(menuObject){
	var entrNo = $("#subscriptionCustomerSearchForm #entrNo").val();
	if(typeof(entrNo) == 'undefined'){ 
		alert("Search Subscriber ..... ");
		$(this).hideLoading();  
		return ;
	}
	Dialog.open({
		div : '#dialogContent', 
		url : baseUrl+"cs/entr/csEntr010?dialogName=dialogContent&eventCd=MCN&custNo=" + pubCustNo +"&entrNo=" + entrNo, 
		title : 'Change of Contract Ownership', 
		width : 920, 
		height : 860,
		close : false ,
		modal : true
	});
}


/* Change of Products    */
function clickMenu_csEntr011(menuObject){
	var entrNo = $("#subscriptionCustomerSearchForm #entrNo").val();
	if(typeof(entrNo) == 'undefined'){ 
		alert("Search Subscriber ..... ");
		$(this).hideLoading();  
		return ;
	}
	var entrSttsCd = $("#subscriptionCustomerSearchForm #entrSttsCd").val();
    if (entrSttsCd != "A") {
    	alert(entrSttsCd + " :: Change only the Active status.");
    	$(this).hideLoading();
    	return ;
    }
    
    var custNm = $("#custInfo_main #custNm").val(); 
	
    
	Dialog.open({ 
		div : '#dialogContent',
		url : baseUrl+"cs/entr/csEntr011?dialogName=dialogContent&eventCd=C11&source=menu&entrNo="+entrNo +"&custNo=" + pubCustNo,
		title : 'Product & Number & Device [Subscriber Key :'+entrNo+' > Customer Name ::' + custNm +']',
		width : 1220, 
		height : defaultScreenHeight800,  
		modal : true
	});
}

function clickMenu_csEntr011_1(counselId, orderNum ,custNo,entrNo,actMode,svcCd,userLevel){
			
	Dialog.open({ 
		div : '#dialogContent',
		url : baseUrl+"cs/entr/csEntr011?dialogName=dialogContent&eventCd=C11&source=menu&counselId="+counselId+"&entrNo="+entrNo +"&custNo=" + pubCustNo +"&orderNum=" + orderNum,
		title : 'Product & Number & Device ['+entrNo+']',
		width : 1220, 
		height : defaultScreenHeight800,  
		modal : true
	});
}

/* Change of Products (batch) */
function clickMenu_csEntr011Batch(menuObject){
	Dialog.open({ 
		div : '#dialogContent',
		url : baseUrl+"cs/entr/csEntr035?dialogName=dialogContent&eventCd=C11&source=menu&custNo=" + pubCustNo,
		title : 'Change of Products by batch', 
		width : 1020, 
		height : 560, 
		modal : true
	}); 
}

/* Change of bundle's Products    */
function clickMenu_csEntr017(menuObject){
	var entrNo = $("#subscriptionCustomerSearchForm #entrNo").val(); 
	if(typeof(entrNo) == 'undefined'){ 
		alert("Search Subscriber ..... ");
		$(this).hideLoading();  
		return ;
	}
	var entrSttsCd = $("#subscriptionCustomerSearchForm #entrSttsCd").val();
    if (entrSttsCd != "A") {
    	alert(entrSttsCd + " :: Change only the Active status.");
    	$(this).hideLoading();
    	return ;
    }
	Dialog.open({ 
		div : '#dialogContent',
		url : baseUrl+"cs/entr/csEntr017?dialogName=dialogContent&eventCd=BVC&source=menu&entrNo="+entrNo +"&custNo=" + pubCustNo,
		title : 'Product & Number & Device ['+entrNo+']',
		width : 1220, 
		height : 800,
		modal : true
	});
}

/* Change of payment method */
function clickMenu_csEntr018(menuObject){
	var entrNo = $("#subscriptionCustomerSearchForm #entrNo").val(); 
	if(typeof(entrNo) == 'undefined'){ 
		alert("Search Subscriber ..... ");
		$(this).hideLoading();  
		return ;
	}
	var entrSttsCd = $("#subscriptionCustomerSearchForm #entrSttsCd").val();
    if (entrSttsCd != "A") {
    	alert(entrSttsCd + " :: Change only the Active status.");
    	$(this).hideLoading();
    	return ;
    }
	Dialog.open({ 
		div : '#dialogContent',
		url : baseUrl+"cs/entr/csEntr018?dialogName=dialogContent&eventCd=PVC&source=menu&entrNo="+entrNo +"&custNo=" + pubCustNo,
		title : 'Product & Number & Device ['+entrNo+']',
		width : 1220, 
		height : 800,
		modal : true
	});
}

function clickMenu_csEntr018_1(counselId, orderNum ,custNo,entrNo,actMode,svcCd,userLevel){
	
	Dialog.open({ 
		div : '#dialogContent',
		url : baseUrl+"cs/entr/csEntr018?dialogName=dialogContent&eventCd=PVC&source=menu&counselId="+counselId+"&entrNo="+entrNo +"&custNo=" + pubCustNo +"&orderNum=" + orderNum,
		title : 'Product & Number & Device ['+entrNo+']',
		width : 1220, 
		height : 800,
		modal : true
	});
}

/* Change of vas : not used */
function clickMenu_csEntr012(menuObject){ 
		Dialog.open({
			div : '#dialogContent', 
			url : baseUrl+"cs/entr/csEntr012_1?dialogName=dialogContent&source=menu&custNo=" + pubCustNo,
			title : 'Vas', 
			width : 1020, 
			height : 460, 
			modal : true
		});
}

/* change of package vas */
function clickMenu_csEntr013(menuObject){
	var entrNo = $("#subscriptionCustomerSearchForm #entrNo").val();
	if(typeof(entrNo) == 'undefined'){ 
		alert("Search Subscriber ..... ");
		$(this).hideLoading();  
		return ;
	}
	var entrSttsCd = $("#subscriptionCustomerSearchForm #entrSttsCd").val();
    if (entrSttsCd != "A") {
    	alert(entrSttsCd + " :: Change only the Active status.");
    	$(this).hideLoading();
    	return ;
    }
	Dialog.open({
		div : '#dialogContent', 
		url : baseUrl+"cs/entr/csEntr013?mode=vasList&dialogName=dialogContent&eventCd=SVC&source=menu&source2=vas&entrNo="+entrNo +"&custNo=" + pubCustNo, 
		title : 'VAS ['+entrNo+']', 
		width : 1037, 
		height : defaultScreenHeight900, 
		modal : true
	});
}

/* Change of device    */
function clickMenu_csEntr015(menuObject){
	var entrNo = $("#subscriptionCustomerSearchForm #entrNo").val();
    var svcCd = $("#subscriptionCustomerSearchForm #svcCd").val();

    if(entrNo == ''){ 
		alert("Search Subscriber ..... ");
		$(this).hideLoading();  
		return ; 
	}
    
    if ( svcCd != '2'){
    	alert("Not Mobile!!");
    	$(this).hideLoading();
    	return;
    }
	Dialog.open({
		div : '#dialogContent',  
		url : baseUrl+"cs/entr/csEntr015?dialogName=dialogContent&callBack=callBackSetDevice&source=menu&eventCd=C07&entrNo="+entrNo+"&custNo=" + pubCustNo,
		title : 'New & Change Device', 
		width : 1024, 
		height : 920,
		modal : true
	});
} 

function clickMenu_csEntr015_1(counselId,orderNum,custNo,entrNo,actMode,svcCd,userLevel,callBack){
	
    if(entrNo == ''){ 
		alert("Search Subscriber ..... ");
		$(this).hideLoading();  
		return ; 
	}
    
    
	Dialog.open({
		div : '#dialogContent',  
		url : baseUrl+"cs/entr/csEntr015?dialogName=dialogContent&source=menu&eventCd=C07&entrNo="+entrNo+"&custNo=" + custNo+ "&callBack=" + callBack,
		title : 'New & Change Device', 
		width : 1024, 
		height : 920,
		modal : true
	});
} 

 
function clickMenu_csEntr025(menuObject){
		if ($("#subscriptionCustomerSearchForm").length == 0) { 
	    	alert("Search Subscriber ..... ");
	    	$(this).hideLoading();
	    	return ;
	    } else {
	    	var entrNo = $("#subscriptionCustomerSearchForm #entrNo").val();
	    	if (entrNo == "" || entrNo == null) {
	    		alert("Search Subscriber ..... ");
	    		$(this).hideLoading();
		    	return ;
	    	}
	    } 
	  
	    var custNo = $("#subscriptionCustomerSearchForm #custNo").val();
	    var ppayEntrDvCd = $("#subscriptionCustomerSearchForm #ppayEntrDvCd").val();
	    console.log("ppayEntrDvCd :: " + ppayEntrDvCd);
	    var entrSttsCd = $("#subscriptionCustomerSearchForm #entrSttsCd").val();
	    console.log("entrSttsCd :: " + entrSttsCd);	    
	    
	    if (entrSttsCd != "A") {
	    	alert(entrSttsCd + " :: Charged only the Active account status.");
	    	$(this).hideLoading();
	    	return ;
	    }
		Dialog.open({
			div : '#bundleDialog', 
			url : baseUrl+"cs/entr/csEntr025?dialogName=bundleDialog&custNo=" + pubCustNo+"&entrNo="+entrNo+"&eventCd=NCV" , 
			title : 'Convergence', 
			width : 1030, 
			height : 540, 
			modal : true
		});
}

function clickMenu_csEntr025_1(counselId,orderNum,custNo,entrNo,actMode,svcCd,userLevel,callBack){
	
	Dialog.open({
		div : '#bundleDialog', 
		url : baseUrl+"cs/entr/csEntr025?dialogName=bundleDialog&custNo=" + custNo+"&entrNo="+entrNo+"&eventCd="+actMode+"&counselId="+counselIde+"&callBack="+callBack , 
		title : 'Convergence', 
		width : 1030, 
		height : 520, 
		modal : true
	});
}

function clickMenu_csEntr027(menuObject){
	 
	    if ($("#subscriptionCustomerSearchForm").length == 0) { 
	    	alert("Search Subscriber ..... ");
	    	$(this).hideLoading();
	    	return ;
	    } else {
	    	var entrNo = $("#subscriptionCustomerSearchForm #entrNo").val();
	    	if (entrNo == "" || entrNo == null) {
	    		alert("Search Subscriber ..... ");
	    		$(this).hideLoading();
		    	return ;
	    	}
	    }
	  
	    var custNo = $("#subscriptionCustomerSearchForm #custNo").val();
	    var ppayEntrDvCd = $("#subscriptionCustomerSearchForm #ppayEntrDvCd").val();
	    console.log("ppayEntrDvCd :: " + ppayEntrDvCd);
	    var entrSttsCd = $("#subscriptionCustomerSearchForm #entrSttsCd").val();
	    console.log("entrSttsCd :: " + entrSttsCd);
	    
	    
	    /*if (ppayEntrDvCd == "0001") {
	    	alert("Prepaid ::  Billing account can not be changed.");
	    	$(this).hideLoading();
	    	return ;
	    }*/
	    
	    if (entrSttsCd != "A") {
	    	alert(entrSttsCd + " :: Charged only the Active account status.");
	    	$(this).hideLoading();
	    	return ;
	    }
	    
		Dialog.open({
			div : '#dialogContent', 
			url : baseUrl+"cs/entr/csEntr027?dialogName=dialogContent&entrNo=" + entrNo +"&custNo="+custNo+"&actMode=CAN&eventCd=CAN",
			title : 'Termination', 
			width : 1040, 
			height : 515, 
			modal : true
		});
	   
}

function clickMenu_csEntr027_1(counselId,orderNum,custNo,entrNo,actMode,svcCd,userLevel,callBack){
	 
	Dialog.open({
		div : '#dialogContent', 
		url : baseUrl+"cs/entr/csEntr027?dialogName=dialogContent&entrNo=" + entrNo +"&custNo="+custNo+"&actMode="+actMode+"&eventCd="+actMode+"&counselId="+counselId+"&callBack="+callBack,
		title : 'Termination', 
		width : 1040, 
		height : 515, 
		modal : true
	});
   
}



///홍차장님
function clickMenu_t3_1(menuObject){
		Dialog.open({
			div : '#dialogContent', 
			url : baseUrl+"wm/t3_1", 
			title : 't3_1', 
			width : 1030, 
			height : 600, 
			modal : true
		});
}


function clickMenu_t3_3_3(menuObject){
		Dialog.open({
			div : '#dialogContent', 
			url : baseUrl+"wm/t3_3_3", 
			title : 't3_3_3', 
			width : 1030, 
			height : 700, 
			modal : true
		});
}

function clickMenu_t3_3_5(menuObject){
		Dialog.open({
			div : '#dialogContent', 
			url : baseUrl+"wm/t3_3_5", 
			title : 't3_3_5', 
			width : 1030, 
			height : 700, 
			modal : true
		});
}


function clickMenu_csEntr014(menuObject){
	
	var prodNo = $("#subscriptionCustomerSearchForm #prodNo").val();
	alert(prodNo);
	
	Dialog.open({
		div : '#dialogContent', 
		url : baseUrl + "cs/csEntr014?dialogName=dialogContent&prodNo=" + prodNo,
		title : 'CRBT', 
		width : 800, 
		height : 470, 
		modal : true
	});
}


function clickMenu_csEntr030(menuObject){
	if ($("#subscriptionCustomerSearchForm").length == 0) { 
    	alert("Search Subscriber ..... ");
    	$(this).hideLoading();
    	return ;
    } else {
    	var entrNo = $("#subscriptionCustomerSearchForm #entrNo").val();
    	if (entrNo == "" || entrNo == null) {
    		alert("Search Subscriber ..... ");
    		$(this).hideLoading();
	    	return ;
    	}
    } 
  
    var custNo = $("#subscriptionCustomerSearchForm #custNo").val();
    var ppayEntrDvCd = $("#subscriptionCustomerSearchForm #ppayEntrDvCd").val();
    console.log("ppayEntrDvCd :: " + ppayEntrDvCd);
    var entrSttsCd = $("#subscriptionCustomerSearchForm #entrSttsCd").val();
    var userLevel = $("#subscriptionCustomerSearchForm #userLevel").val();
    console.log("entrSttsCd :: " + entrSttsCd);	    
    
    if (entrSttsCd != "A") {
    	alert(entrSttsCd + " :: Charged only the Active account status.");
    	$(this).hideLoading();
    	return ;
    }
    
    var cHeight ="390";
    
    if ( userLevel != 'C'){
    	cHeight = "670";
    }
    	
    var svcCd = $("#subscriptionCustomerSearchForm #svcCd").val();
    
    if ( svcCd =='2'){
    	alert('Mobile!!!!');
    	$(this).hideLoading();
    	return ;
    }
	Dialog.open({
		div : '#asDialog', 
		url : baseUrl+"cs/entr/csEntr030?dialogName=asDialog&custNo=" + custNo+"&entrNo="+entrNo+"&actMode=AS&svcCd="+svcCd , 
		title : 'AS', 
		width : 650, 
		height : cHeight, 
		modal : true
	});
}

function clickMenu_csEntr030_1(counselId,orderNum,custNo,entrNo,actMode,svcCd,userLevel,callBack){
	
	var cHeight ="390";
	    
    if ( userLevel != 'C'){
    	cHeight = "670"; 
    }
    
	Dialog.open({
		div : '#asDialog', 
		url : baseUrl+"cs/entr/csEntr030?dialogName=asDialog&custNo=" + custNo+"&entrNo="+entrNo+"&actMode="+actMode+"&svcCd="+svcCd+"&callBack="+callBack , 
		title : 'AS', 
		width : 650,
		height : cHeight,
		modal : true
	});
}

/* batch terminate */
function clickMenu_csEntr033Batch(menuObject){ 
	var entrNo = $("#subscriptionCustomerSearchForm #entrNo").val();
	if(typeof(entrNo) == 'undefined'){ 
		entrNo= "" ; 
	} 
	
	Dialog.open({
		div : '#allTerminate', 
		url : baseUrl+"cs/entr/csEntr033Batch?dialogName=allTerminate&eventCd=CAN&custNo=" + pubCustNo,
		title : 'All Termination', 
		width : 800,
		height : 500,  
		modal : true
	});	

}

/* suspending vas */
function clickMenu_csEntr034(menuObject){
	var entrNo = $("#subscriptionCustomerSearchForm #entrNo").val();
	if(typeof(entrNo) == 'undefined'){ 
		alert("Search Subscriber ..... ");
		$(this).hideLoading();  
		return ;
	}
	
	Dialog.open({
		div : '#allTerminate', 
		url : baseUrl+"cs/entr/csEntr034?dialogName=allTerminate&eventCd=C18&entrNo="+entrNo + "&custNo=" + pubCustNo, 
		title : 'Suspending VAS',  
		width : 430,
		height : 330,  
		modal : true
	});	
}

/* sale policy */
function clickMenu_csPlcy002(menuObject){
	
	Dialog.open({
		div : '#salePolicy', 
		url : baseUrl+"cs/plcy/csPlcy003?dialogName=salePolicy", 
		title : 'Sale Policy',  
		width : 1010,
		height : defaultScreenHeight900,  
		modal : true
	});	
}

/* 가입별 할인관리 */
function clickMenu_csEntr036(menuObject){
	var entrNo = $("#subscriptionCustomerSearchForm #entrNo").val();
	if(typeof(entrNo) == 'undefined'){ 
		alert("Search Subscriber ..... ");
		$(this).hideLoading();  
		return ;
	}
	
	Dialog.open({
		div : '#dialogContent', 
		url : baseUrl+"cs/entr/csEntr036?dialogName=dialogContent&eventCd=DSC&entrNo="+entrNo + "&custNo=" + pubCustNo ,    
		title : 'Discount',  
		width : 800,
		height : 620,  
		modal : true
	});	
}


/* UPDOWN SELLING REQUEST LIST */
function clickMenu_csEntr037(menuObject){
	Dialog.open({
		div : '#dialogContent', 
		url : baseUrl+"crm/request/list?dialogName=dialogContent", 
		title : 'UP/DOWN SALE REQUEST LIST',
		width : 800,
		height : 450,  
		modal : true
	});	
}

function clickMenu_csEntrRlUser(menuObject){
	Dialog.open({
		div : '#dialogContent', 
		url : baseUrl+"cs/entr/csEntrRlUser?dialogName=dialogContent", 
		title : 'Changing real user batch job',
		width : 800,
		height : 450,  
		modal : true
	});	
}

function clickMenu_changeRlUser(menuObject){
	
	var entrNo = $("#subscriptionCustomerSearchForm #entrNo").val();
	if(typeof(entrNo) == 'undefined'){ 
		alert("Search Subscriber ..... ");
		$(this).hideLoading();  
		return ;
	}
	
	var realCustNo = $("#subscriptionCustomerSearchForm #rlusrCustNo").val();
	//TODO : 개인사용자는 변경하지 못하게 처리해야함
	var orgRlUser = realCustNo ;//현재 실사용자 custNo 
	Dialog.open({
		div : '#dialogContent', 
		url : baseUrl+"cs/entr/csEntr040?dialogName=dialogContent&entrNo="+entrNo + "&rlUser=" + orgRlUser +"&callBack=callBackChangeCustInformByRlUser",
		title : 'Changing real user',
		width : 300,
		height : 150, 
		modal : true
	});	
}

function clickMenu_csEntr031(menuObject){
	
	var entrNo = $("#subscriptionCustomerSearchForm #entrNo").val();
	if(typeof(entrNo) == 'undefined'){ 
		alert("Search Subscriber ..... ");
		$(this).hideLoading();  
		return ;
	}
	
	var svcCd = $("#subscriptionCustomerSearchForm #svcCd").val();
    if ( svcCd != '2'){
    	alert("Only Mobile Service!!");
    	return;
    }
	Dialog.open({
		div : '#csEntr031Dialog',
		url : baseUrl + "cs/entr/csEntr031?dialogName=csEntr031Dialog&entrNo="+entrNo,
		title : '<s:message code="cs.lable.cust.000039"/>', //IMSI Change
		width : 430,
		height : 400,
		modal : true
	});
}


function clickMenu_csEntr031_1(counselId,orderNum,custNo,entrNo,actMode,svcCd,userLevel,callBack){
	
	Dialog.open({
		div : '#csEntr031Dialog',
		url : baseUrl + "cs/entr/csEntr031?dialogName=csEntr031Dialog&entrNo="+entrNo+"&callBack="+callBack,
		title : '<s:message code="cs.lable.cust.000039"/>', //IMSI Change
		width : 430,
		height : 400,
		modal : true
	});
}

function clickMenu_Reservations(menuObject){
	var custNo = $("#subscriptionCustomerSearchForm #custNo").val();
	if(typeof(custNo) == 'undefined'){ 
		alert("Search Subscriber ..... ");
		$(this).hideLoading();  
		return ;
	}
	
	Dialog.open({
		div : '#reservationsDialog',
		url : baseUrl + "cs/entr/reservations?dialogName=reservationsDialog&custNo="+custNo,
		title : 'Reservations',
		width : 600,
		height : 350,
		modal : true
	});
}

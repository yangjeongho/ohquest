

/* BillAcnt   */
function clickMenu_csBill001(menuObject){
	
	if (checkBillAcntInfo()) {
		var custNo = $("#subscriptionCustomerSearchForm #custNo").val();
	    var entrNo = $("#subscriptionCustomerSearchForm #entrNo").val();
	    var billAcntNo = $("#subscriptionCustomerSearchForm #billAcntNo").val();
	    var aceno = $("#subscriptionCustomerSearchForm #aceno").val();
	   	var url = baseUrl + "cs/bill/csBill001?dialogName=dialogContent&entrNo="+entrNo+"&custNo="+custNo+"&billAccountNo="+billAcntNo+"&aceno="+aceno;
	
	   	var ppayEntrDvNm = $("#subscriptionCustomerSearchForm #ppayEntrDvNm").val();
	   	if(ppayEntrDvNm == null && ppayEntrDvNm.length >0){
	   		ppayEntrDvNm = '( '+ppayEntrDvNm+' )';
	   	}else{
	   		ppayEntrDvNm = "";
	   	}
	   	var titleName = 'Billing Account Information'+ppayEntrDvNm;
	   	
		Dialog.open({
			div : '#dialogContent', 
			url : url, 
			title : titleName, 
			width : 800, 
			height : 590, 
			modal : true
		});
	}
}


/* BillAcnt Change   */
function clickMenu_csBill002(menuObject){
	
	/*Check Subscriber Sesrch */

	if (gf_CheckSubscriber()) {
		
		var custNo = $("#subscriptionCustomerSearchForm #custNo").val();
	    var entrNo = $("#subscriptionCustomerSearchForm #entrNo").val();
	    var billAcntNo = $("#subscriptionCustomerSearchForm #billAcntNo").val();
	    var aceno = $("#subscriptionCustomerSearchForm #aceno").val();
	   	var url = baseUrl + "cs/bill/csBill002?dialogName=dialogContent&entrNo="+entrNo+"&custNo="+custNo+"&billAcntNo="+billAcntNo+"&aceno="+aceno;
	   	
	   	var titleName = 'Billing Account Information (Subscriber ID :: ' + entrNo + ') , (BillAcntNo :: ' + billAcntNo + ')';
	   	
		Dialog.open({
			div : '#dialogContent', 
			url : url,
			title : titleName, 
			width : 1020, 
			height : 580, 
			modal : true
		});
	}
}


/* Separate Billing Account   */
function clickMenu_csBill003(menuObject){
		Dialog.open({
			div : '#dialogContent', 
			url : baseUrl+"cs/bill/csBill003?dialogName=dialogContent&custNo=" + pubCustNo, 
			title : 'Separate Billing Account', 
			width : 1000, 
			height : 460, 
			modal : true
		});
}



/* Change Billing Type  */
function clickMenu_csBill004(menuObject){
		Dialog.open({
			div : '#dialogContent', 
			url : baseUrl+"cs/bill/csBill004?dialogName=dialogContent&custNo=" + pubCustNo, 
			title : 'Change Billing Type', 
			width : 800, 
			height : 220, 
			modal : true
		});
}

/*Billing Recipient Change*/
function clickMenu_csBill005(menuObject){
		Dialog.open({
			div : '#dialogContent',
			url : baseUrl+"cs/bill/csBill005?dialogName=dialogContent&custNo=" + pubCustNo, 
			title : 'Billing Recipient Change', 
			width : 440, 
			height : 180, 
			modal : true
		});
}


/* Separate Billing Account   */
function clickMenu_csBill006(menuObject){

		Dialog.open({
			div : '#dialogContent', 
			url : baseUrl+"cs/bill/csBill006?dialogName=dialogContent&custNo=" + pubCustNo, 
			title : 'Separate Billing Account(Parent)', 
			width : 1000, 
			height : 760, 
			modal : true
		});
}


/* Input Bill Account   */
function clickMenu_csBill007(menuObject){

		Dialog.open({
			div : '#dialogContent', 
			url : baseUrl+"cs/bill/csBill007?dialogName=dialogContent&custNo=" + pubCustNo,
			title : '청구 정보 입력', 
			width : 1000, 
			height : 760, 
			modal : true
		});
}



/* Bill Method Management   */
function clickMenu_csBill008(menuObject){
	if (checkBillAcntInfo()) {
		var custNo = $("#subscriptionCustomerSearchForm #custNo").val();
	    var entrNo = $("#subscriptionCustomerSearchForm #entrNo").val();
	    var billAcntNo = $("#subscriptionCustomerSearchForm #billAcntNo").val();
	    var aceno = $("#subscriptionCustomerSearchForm #aceno").val();
	   	var url = baseUrl + "cs/bill/csBill008?dialogName=dialogContent&entrNo="+entrNo+"&custNo="+custNo+"&billAccountNo="+billAcntNo+"&aceno="+aceno;
	
	   	var titleName = 'Payment Method Management ';
	   	
		Dialog.open({
			div : '#dialogContent', 
			url : url, 
			title : titleName, 
			width : 935, 
			height : 675, 
			modal : true
		});
	}
}


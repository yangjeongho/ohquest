
/* cosRep001  */
function clickMenu_cosRep001(menuObject){
		Dialog.open({
			div : '#dialogContent', 
			url : baseUrl+"cos/rep/cosRep001?dialogName=dialogContent&custNo=" + pubCustNo, 
			title : 'Real_Time Sales List', 
			width : 1000, 
			height : 550, 
			modal : true
		});
}



/* cosRep002  */
function clickMenu_cosRep002(menuObject){
		Dialog.open({
			div : '#dialogContent', 
			url : baseUrl+"cos/rep/cosRep002?dialogName=dialogContent&custNo=" + pubCustNo,
			title : 'Additional Service Sales List', 
			width : 1000, 
			height : 550, 
			modal : true
		});
}



/* cosRep003 */
function clickMenu_cosRep003(menuObject){
		Dialog.open({
			div : '#dialogContent', 
			url : baseUrl+"cos/rep/cosRep003?dialogName=dialogContent&custNo=" + pubCustNo,
			title : 'Sales Result', 
			width : 1000, 
			height : 620, 
			modal : true
		});
}



/* cosRep004  */
function clickMenu_cosRep004(menuObject){
		Dialog.open({
			div : '#dialogContent', 
			url : baseUrl+"cos/rep/cosRep004?dialogName=dialogContent&custNo=" + pubCustNo,
			title : 'Payment by Reseller', 
			width : 1000, 
			height : 620, 
			modal : true
		});
}

/* cosRep005  */
function clickMenu_cosRep005(menuObject){
		Dialog.open({
			div : '#dialogContent', 
			url : baseUrl+"cos/rep/cosRep005?dialogName=dialogContent&custNo=" + pubCustNo,
			title : 'Code Management', 
			width : 1000, 
			height : 590, 
			modal : true
		});
}


/*cbManagement*/
function clickMenu_cbManagement(menuObject){
	Dialog.open({
		div : '#dialogContent', 
		url : baseUrl+"cos/rep/cbManagement?dialogName=dialogContent&custNo=" + pubCustNo,
		title : 'Deposit Change History', 
		width : 1000, 
		height : 550, 
		modal : true
	});
}

/* cosRepSrEdL  */
function clickMenu_cosRepSrEdL(menuObject){
		Dialog.open({
			div : '#dialogContent', 
			url : baseUrl+"cos/rep/cosRepSrEdL?dialogName=dialogContent&custNo=" + pubCustNo, 
			title : 'Event Detail List', 
			width : 1000, 
			height : 550, 
			modal : true
		});
}
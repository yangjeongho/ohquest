
function clickMenu_ccsWork001(menuObject){
		Dialog.open({
			div : '#ccsWork001Dialog', 
			url : baseUrl+"ccs/ccsWork001", 
			title : 'Task Receipt', 
			width : 1030, 
			height : 685, 
			modal : true
		});
}


function clickMenu_ccsWork002(menuObject){
		Dialog.open({
			div : '#ccsWork002Dialog', 
			url : baseUrl+"ccs/ccsWork002",
			title : 'Task', 
			width : 1220, 
			height : 900, 
			modal : true
		});

}

function clickMenu_ccsWork003(menuObject){
		Dialog.open({
			div : '#ccsWork003Dialog', 
			url : baseUrl+"ccs/ccsWork003",
			title : 'Work Schedule', 
			width : 1030, 
			height : 700, 
			modal : true
		});
}

function clickMenu_ccsWork003_1(menuObject){
	Dialog.open({
		div : '#ccsWork003Dialog', 
		url : baseUrl+"ccs/ccsWork003_1?dialogName=ccsWork003Dialog",
		title : 'My Work Schedule', 
		width : 1130, 
		height : 650,
		modal : true
	});
}

function clickMenu_ccsWork004(menuObject){
		Dialog.open({
			div : '#dialogContent',
			url : baseUrl+"ccs/ccsWork004?dialogName=dialogContent",
			title : 'Work Report', 
			width : 1200, 
			height : 620, 
			modal : true
		});
}

function clickMenu_ccsWork006(menuObject){
	Dialog.open({
		div : '#counselList',
		url : baseUrl+"cs/ccsWork006?dialogName=counselList",
		title : 'Counsel Report', 
		width : 1020,  
		height : 700, 
		modal : true
	});
}

function clickMenu_subscriptionView(menuObject){
	
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
	var svcCd = $("#subscriptionCustomerSearchForm #svcCd").val();
	var imsiNo = $("#subscriptionCustomerSearchForm #imsiNo").val();
	var ssnNo = $("#csCust000ViewFrom #custrnmNo").val();
	var entrNo = $("#subscriptionCustomerSearchForm #entrNo").val();
	//var mac = $("#subscriptionCustomerSearchForm #").val();//(HomeGateWay)
	var mac = '';
	var paramStr = "&svcCd="+svcCd+"&imsiNo="+imsiNo+"&ssnNo="+ssnNo+"&entrNo="+entrNo+"&mac="+mac;
	
	
	Dialog.open({
		div : '#subscriptionjson',
		url : baseUrl+"ccs/subsView?dialogName=subscriptionjson"+paramStr,
		title : 'subscription View', 
		width : 1170, 
		height : 720, 
		modal : true
	});
}


function clickMenu_HLRview(menuObject){
	Dialog.open({
		div : '#hlrView',
		url : baseUrl+"ccs/hlrView?dialogName=hlrView",
		title : 'HLR View', 
		width : 980,  
		height : 475, 
		modal : true
	});
}

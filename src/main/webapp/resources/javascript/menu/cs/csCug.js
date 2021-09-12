function clickMenu_cugm001(menuObject){
	var v_rtn = true;
	var v_svcCd = $("#subscriptionCustomerSearchForm #svcCd").val();
	var v_svcNm = $("#subscriptionCustomerSearchForm #svcNm").val();
	var v_msg3 = 'Mobile service only.';
//	v_rtn = gf_CheckSttsByEntr(true); 
	
//	if (v_rtn) {
		 // 서비스 : 모바일, voip인 경우만 전화번호 변경 가능 
//		 if(v_svcCd != "2"){
//  	   	  	 MessageBox.dialog(v_msg3);
//  	   	  	 $(this).hideLoading(); 
//  		 } else {
  			Dialog.open({
  				div : '#dialogCugMain', 
  				url : baseUrl+"cs/cug/csDccug001"+"?dialogName=dialogCugMain&svcGrpCd=2&saleChnlCd=4001000003", 
  				title : 'VPN Main', 
  				width : 1005, 
  				height : 670, 
  				modal : true
  			});
//  		 }
//	}
		
}


function clickMenu_cugm001_c(menuObject){
	var v_rtn = true;
	var v_svcCd = $("#subscriptionCustomerSearchForm #svcCd").val();
	var v_svcNm = $("#subscriptionCustomerSearchForm #svcNm").val();
	var entrNo = $("#subscriptionCustomerSearchForm #entrNo").val();
	var v_msg3 = 'Mobile service use only.';
	v_rtn = gf_CheckSttsByEntr(true); 
	
	if (v_rtn) {
		 // 서비스 : 모바일, voip인 경우만 전화번호 변경 가능 
		 if(v_svcCd != "2"){
  	   	  	 MessageBox.dialog(v_msg3);
  	   	  	 $(this).hideLoading(); 
  		 } else {
  			Dialog.open({
  				div : '#dialogCugMain', 
  				url : baseUrl+"cs/cug/cugm014"+"?dialogName=dialogCugMain&svcGrpCd=4&entrNo="+entrNo+"&saleChnlCd=4001000002",  
  				title : 'Couple Main', 
  				width : 850, 
  				height : 665, 
  				modal : true
  			});
  		 }
	}
	
	
}


function clickMenu_cugm001_f(menuObject){
	var v_rtn = true;
	var v_svcCd = $("#subscriptionCustomerSearchForm #svcCd").val();
	var v_svcNm = $("#subscriptionCustomerSearchForm #svcNm").val();
	var entrNo = $("#subscriptionCustomerSearchForm #entrNo").val();
	var v_msg3 = 'Mobile service use only.';
	v_rtn = gf_CheckSttsByEntr(true); 
	if (v_rtn) {
		 // 서비스 : 모바일, voip인 경우만 전화번호 변경 가능 
		 if(v_svcCd != "2"){
  	   	  	 MessageBox.dialog(v_msg3);
  	   	  	 $(this).hideLoading(); 
  		 } else {
  			Dialog.open({
  				div : '#dialogCugMain', 
  				url : baseUrl+"cs/cug/cugm014"+"?dialogName=dialogCugMain&svcGrpCd=3&entrNo="+entrNo+"&saleChnlCd=4001000001", 
  				title : 'Family Main', 
  				width : 850, 
  				height : 665, 
  				modal : true
  			}); 
  		 }
	}
	
}


function clickMenu_cugFriend(menuObject){
	var v_rtn = true;
	var v_svcCd = $("#subscriptionCustomerSearchForm #svcCd").val();
	var entrNo = $("#subscriptionCustomerSearchForm #entrNo").val();
	var v_msg3 = 'Mobile service use only.';
	v_rtn = gf_CheckSttsByEntr(true); 
	if (v_rtn) {
		 // 서비스 : 모바일, voip인 경우만 전화번호 변경 가능 
		 if(v_svcCd != "2"){
  	   	  	 MessageBox.dialog(v_msg3);
  	   	  	 $(this).hideLoading(); 
  		 } else {
  			Dialog.open({
  				div : '#dialogCugMain', 
  				url : baseUrl+"cs/cug/cugm014"+"?dialogName=dialogCugMain&svcGrpCd=5&entrNo="+entrNo+"&saleChnlCd=4001000001", 
  				title : 'Friend Main', 
  				width : 850, 
  				height : 665, 
  				modal : true
  			}); 
  		 }
	}
	
}



function clickMenu_groupCreate(menuObject){
	
	Dialog.open({
		div : '#dialogGroupCreatet', 
		url : baseUrl+"cs/cug/groupCreate?dialogName=dialogGroupCreatet", 
		title : 'CUG Create', 
		width : 800, 
		height : 550, 
		modal : true
	});
}

function clickMenu_cugm009(menuObject){
	
		Dialog.open({
			div : '#dialogContent', 
			url : baseUrl+"cs/cug/csDccug009",
			title : 'CUG Search', 
			width : 800, 
			height : 620, 
			modal : true
		});
}

function clickMenu_cugType(menuObject){
	
	Dialog.open({
		div : '#dialogContent', 
		url : baseUrl+"cs/cug/cugType?dialogName=dialogContent",
		title : 'CUG Type', 
		width : 600, 
		height : 410, 
		modal : true
	});
}

function clickMenu_bpCode001(menuObject){
	
	Dialog.open({
		div : '#dialogRelationCode', 
		url : baseUrl+"co/bpCode/bpCode001?dialogName=dialogRelationCode",
		title : 'Relation Code', 
		width : 435, 
		height : 420, 
		modal : true
	});
}

function clickMenu_VpnTemplate(menuObject){
	Dialog.open({
		div : '#dialogTemplate', 
		url : baseUrl+"cs/cug/openTemplate?dialogName=dialogTemplate",
		title : 'Template', 
		width : 960, 
		height : 550, 
		modal : true
	});
}



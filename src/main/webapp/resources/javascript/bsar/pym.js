//납부대리점 직영점 여부
function dlrCdHqYn(dlrCd){
		
	var dlrCdObj = "";
	
	$.ajax({
		type : "POST",
		async:false,
		url: baseUrl+"bsar/ar/dlrCdHqYn",
		data: {dlrCd:dlrCd},
		success : function(data) {

			dlrCdObj = data.hqYn;
		},
		error:function(data){
			
		}
	});
	
	return dlrCdObj;
}
//custNo 존재여부 체크
function getVatExmptYn(custNo){
	
	var custObj = 0;
	
	$.ajax({
		type : "POST",
		async:false,
		url: baseUrl+"bsar/ar/vatExmptYn",
		data: {custNo:custNo},
		success : function(data) {

			custObj = data.custData;
		},
		error:function(data){
			
		}
	});
	
	return custObj;
}

//mgmt  파라미터 생성
function getMgMtData(authObject){
	
	var mgmtData = "";
	
	$.ajax({
		type : "POST",
		async:false,
		url: baseUrl+"bsar/ar/getMgMtData",
		data: JSON.stringify(authObject),
		contentType : "application/json",
		success : function(data) {
	    
			mgmtData = data;
			
		},
		error:function(data){
			
		}
	});
	
	return mgmtData;
}
//entr trgt 파라미터 생성
function recpDataCrte(authObject){
	
	var payments = "";
	
	$.ajax({
		type : "POST",
		async:false,
		url: baseUrl+"bsar/ar/recpDataCrte",
		data: JSON.stringify(authObject),
		contentType : "application/json",
		success : function(data) {
	    
			//payments = data;
			if(data.result != "SUCCESS"){
				
				MessageBox.dialog(data.result,function(){
					
					$('#rtPymClose').click();
				});
				return false;
			}
			else if(data.result == "SUCCESS"){
				payments = data.payments;
			}
			else{
				
				
					MessageBox.dialog("Target Parameter is error",function(){
						
						$('#rtPymClose').click();
					});
					return false;
			}
			
		},
		error:function(data){
			
		}
	});
	
	return payments;
}
//가입자별 수납 파라미터 생성
function subsPymParamCrte(authObject){
	
	var payments = "";
	
	$.ajax({
		type : "POST",
		async:false,
		url: baseUrl+"bsar/ar/pymItemCrte",
		data: JSON.stringify(authObject),
		contentType : "application/json",
		success : function(data) {
	    
			payments = data;
			
		},
		error:function(data){
			
		}
	});
	
	return payments;
	
}

//이벤트 코드의 명칭 가져옴
function evntTypeCrte(eventCode){
		
		if(eventCode == undefined){
			
			alert("EventCode is Nothing");
			
			return false;
		}
		var evntCd    = eventCode.substring(0,4);
	    var evntType = "";

	    evntType =  CODE_SYS.name("LnkgPymMclsCd", evntCd);
		
		return evntType;
}

//이전 보증금만 있을 경우 계산
function dpstAcc(){
	
	var allData  = gf_getAllGridData("#rtPymGrid");
	var prePymData = gf_getMultiSelectedGridData("#rtBillItemGrid"); 
	var billAmt   = parseFloat(accAmt(prePymData,"pymTrgtAmt"));
	var recpAmt =  parseFloat(accAmt(allData,"pymAmt"));
	var rfndAmt  = recpAmt - billAmt;
	
	$("#accPymAmt").val(recpAmt.toFixed(2));
	$("#accAmt").val(rfndAmt.toFixed(2));
}

function pym_USD(){
	
	$("#usdMntSpan").removeClass("dp_none");
	$("#usdMnt").removeClass("dp_none");
	$("#usdMntSpan").show();
	$("#mntMntSpan").hide();
}
function pym_MNT(){
	$("#usdMntSpan").addClass("dp_none");
	$("#usdMntSpan").hide();
	$("#mntMntSpan").show();
}

//print
//프린트 페이지가 열려 있을경우 로그인이 안되는 경우가 발생....
//생각좀....
function printElem(){
	
	var args = arguments.length;
	var selector;
	var settings;
	var ctxpath = getContextPath();
	var defaults ={
			printMode: 'iframe', //팝업설정 printMode option = popup, iframe,
			//overrideElementCSS:[{href:'<s:url value="/resources/styles/print.css"/>',media:'print'}], //overrideElement option : boolean, css경로
			overrideElementCSS:[ctxpath+"/resources/styles/print.css"], //overrideElement option : boolean, css경로
			//printBodyOptions:{"styleToAdd":""},
			pageTitle:'receipt', //팝업 타이틀
			leaveOpen:false //인쇄하고도 창을 띄우기(true)/안띄우기(false). Default는 false	
	};
	
	selector = arguments[0];
	if(args == 1){
		settings = defaults;
	}
	else if (args == 2){
		options  = arguments[1];
		settings = $.extend({},defaults,options);
	}
	
     $(selector).printElement(settings);
}


function rtPymBtnShow(){
	
	$(".rtpymbtns :button").each(function(){
		$(this).css("display","block");
	});
	
}
function rtPymBtnHide(){
	
	 $(".rtpymbtns :button").each(function(){
			$(this).css("display","none");
	 });
}


//pym input 창 clear
function pymClear(cls){
		
	var clsCash = $("."+cls);
	
	//화폐단위 제외
	clsCash.not("[name*=BillCurCd], :button").val("");
		
};


//숫자 ,소숫점 체크
function pymChk(val){
	
	val = val.replace(/[^0-9.]/g,'');
	
	if(isNaN(val)){
		
		alert("Please Input Number");
		val = "";
	}
	
	return val;
}


function divShow(selector){
		
		var selCash = $(selector);
		
		selCash.show();		
}
	
function divHide(selector){
		
		var selCash = $(selector);
		
		selCash.hide();
}


function accAmt(jsonArray,datakey){
	
	var accAmt = 0;
	$.each(jsonArray,function(key,data){
		
		accAmt += parseFloat(data[datakey]);
	});
	
	return accAmt.toFixed(2);
	
}

function clsExcludeDisable(selector,cls){
	
	$(selector).not(cls).hide();
}

//결제수단창 enable
function pymEnable(cls){
		
		var clsCash = $("."+cls);
		
		clsCash.removeAttr("disabled").removeClass("form_readonly1").addClass("form_normal01");
		clsCash.filter("select").removeClass("form_select02").addClass("form_select01");
		
}
	
//결제수단창 disable
function pymDisable(cls){
		
		var clsCash = $("."+cls);
		
		clsCash.removeClass("form_normal01").addClass("form_readonly1").attr("disabled","disabled");
}
	
//결제수단창 readonly
function pymReadonly(cls){
		
		var clsCash = $("."+cls+".read");
		
		$.each(clsCash,function(){
				$(this).removeClass("form_normal01").filter(":input").addClass("form_readonly1").attr("readonly",true);
		});
}
	
//체크 박스 숨겨져 있으면 hide
function hiddenPym(){
		
	$.each($("input[type=checkbox]:hidden"),function(i,val){
			
		var cls = $(this).attr("class");
		$("."+cls).hide();
	});
}


//결제수단에 해당하는 css class 반환
function pymMthdToCls(pymMthdVal){
	
	var pymMthdDiv = convSelectValtoClass(pymMthdVal);
	var endIdx = pymMthdDiv.indexOf("Div");
	var cls = pymMthdDiv.substring(0,endIdx);
	
	return cls;
}


//결제수단 입력창에 값이 다 들어갔나 확인..
function pymMthdValChk(pymMthdVal){
	
	var cls = pymMthdToCls(pymMthdVal);
	var valchk = true;
	
	$.each($("."+cls),function(key,val){
		
		if($(this).val() == ""){
			
			valchk = false;
		}
	});
	
	
	return valchk;
}

/***
 * jsonData를 input창에 입력
 * 
 * selector의 확장집합중
 * jsonKey와 input창의 name이 같으면 입력해준다. 
 * 
 * {keyId:"1"}
 * 
 * <input type="text" name="keyId" class="key">
 * 
 * 
 */

function dataInject(jsonData,selector){
	
	$.each(jsonData,function(key,val){
			
			//jsonData 
			var dataKey = key;
			var dataVal = val;
			$.each($(selector),function(key,val){
				
					var inputNm = this.name;
					
					if(dataKey == inputNm){
						
						//grid data 입력창 입력
						$(this).val(dataVal);
					}
				
			});
			
		});
	
}

//depricated
//jsonkey로 해당 클래스 찾아서 입력창에 입력
function pymEditDataSet(jqgridName, jsonKey, rowId){
	
	
	var selectData = gf_getGridDataByRowId(jqgridName, rowId);
	var selectKey = selectData[jsonKey];
	
	//선택한 결제수단 입력창의 클래스를 가져온다.
	var cls = pymMthdToCls(selectKey);
	
	//grid data 가져와서 입력창에 세팅
	$.each(selectData,function(key,val){
		
		//jsonData 
		var dataKey = key;
		var dataVal = val;
		$.each($("."+cls),function(key,val){
			
				var inputNm = this.name;
				
				if(dataKey == inputNm){
					
					//grid data 입력창 입력
					$(this).val(dataVal);
				}
			
		});
		
	});
	
}

//수납화면 초기화
function rtPymInit(){
	
	var allData = gf_getAllGridData("#rtBillItemGrid");
	var totalAmt =  accAmt(allData,"pymTrgtAmt");
	
	//청구서 수납일 경우 처리로직 고민
	var zero = parseInt(0).toFixed(2);
	//var zero = parseInt(0);
	$("#totPymAmt").val(totalAmt);
	$("#totPrePymAmt").val(zero);
	$("#totPostPymAmt").val(totalAmt);
	$("#accBillAmt").val($("#totPrePymAmt").val());
	$("#accPymAmt").val(zero);
	$("#accAmt").val(zero);
//	$("#rtCurPnt").val(zero);
//	$("#possesPpym").val(zero);
	
	rtPymBtnHide();
}

//결제수단 초기화
function pymMthdInit(){
	
	divHide(".bnkDiv");
	divHide(".btrDiv");
	divHide(".cashDiv");
	divHide(".cardDiv");
	divHide(".vchDiv");
	divHide(".lypDiv");
	divHide(".dpsDiv");
	divHide(".ppymDiv");
}



//결제수단 선택시 value -> 결제수단의 class로 변환
function convSelectValtoClass(selectVal){

		var pymMthdsel = parseInt(selectVal);
		
		//현금이나 BankTransfert시 청구화폐단위와 수납화폐단위를 맞춘다.
		var cls = "";
		switch(pymMthdsel){
			case 00:
					 break;
			//Bank Transfer
			case 11:
					 cls = "bnkDiv";
					 break;
			//Barter
			case 12: 
					 cls="btrDiv";
					 break;
			//현금
			case 21: 
					 cls="cashDiv";
				 	 break;
			//신용카드즉납
			case 22: 
					 cls="cardDiv";
					 break;
			//voucher
			case 31: 
					 cls="vchDiv";
					 break;
			//loyalty point
			case 32: 
					cls="lypDiv";
					break;
			//보증금
			case 33:
					cls="dpsDiv";
					break;
			//선불 잔액
			case 34:
					cls="ppymDiv";
					break;
			//할인
			case 41:
					cls="dcDiv";
					break;
			case 42:
				cls="dcCouponDiv";
				break;
			
			default: alert("payment method select!");
		    
		}
		
		return cls;
}



//계산로직 잔액
function  balance_acc(v1,v2,v3,pymAmt){
	
	var val1 = null;
	var val2 = null;
	var val3 = null;
	
	val1 = parseFloat(v1.val());
	if( v2.val() != ""){
		val2 = parseFloat(v2.val());
		val3 = val1- val2;
		
		if(val3 <0){
			alert("금액이 너무 많습니다.");							
			pymAmt.val("");
			pymAmt.focus();
		}
		v3.val(val3);
	}
	
}


//청구화폐단위 //수납화폐단위   //수납금액   //환율
function acc_rate1(pymCurUnit,pymAmt,excRate){

	var accValue=parseInt(0);
	
	//USD->MNT
	if(pymCurUnit.val() == "1"){
		accValue = parseInt(pymAmt.val()) * parseInt(excRate.val());
	}
	//MNT-MNT
	else if(pymCurUnit.val() == "2" ){
				
		accValue = parseInt(pymAmt.val()) * parseInt(excRate.val());
	}
		
	return accValue;
}

//반올림
function roundXL(n, digits) {
	  if (digits >= 0) return parseFloat(n.toFixed(digits)); // 소수부 반올림

	  digits = Math.pow(10, digits); // 정수부 반올림
	  var t = Math.round(n * digits) / digits;

	  return parseFloat(t.toFixed(0));
}
/*var visible = $('#ui-datepicker-div').is(':visible');
$('#textbox').datepicker(visible ? 'hide' : 'show');*/


//datepicker 생성 type 보류
function dp_gen(){
	
	var args = arguments.length;
	
	var datepick_id = null;
	
	var defaults = {
			showAnim: "fold",
			dateFormat: 'yy-mm-dd',
			showOn: "button", //button 과 text를 클릭했을때 보여주게 한다.
			changeMonth: true, // 월을 바꿀수 있는 셀렉트 박스를 표시한다.
			changeYear: true, // 년을 바꿀 수 있는 셀렉트 박스를 표시한다.
			minDate: '-10y', // 현재날짜로부터 100년이전까지 년을 표시한다.
			maxDate: '0',
			buttonImage: "resources/images/btn/btn_calendar.gif",
			buttonImageOnly: true, 
			buttonText:'calendar',
	};
	
	var options = {};
	var settings = {};
	
	datepick_id = arguments[0];

	if(args == 1){
		
		settings = defaults;
		
	}
	else if (args == 2){
		
		options 	= arguments[1]; 
		
		if(options == "n"){
			defaults.maxDate = null;
			settings = defaults;
		}
		else if (typeof options == "object"){
			
			settings = $.extend({},defaults,options);		
		}
		
	} 
	
	var dpId = $(datepick_id);
	
	dpId.datepicker(settings).off('click').on('click',function(e){
		 e.preventDefault();
		 e.stopPropagation();
		 if ($('#ui-datepicker-div').is(':visible')) 
			 dpId.datepicker('hide');
		 else 
			 dpId.datepicker('show');
		return false;
	});
	
	return dpId;
	
}

//datepick from to
function dp_fromTo(){
	
	
	var args = arguments.length;
	
	var fromId= null;
	var toId  = null;
	
	var fromDefaults = {
				showAnim: "fold",
				dateFormat: "yy-mm-dd",
				showOn: "button", //button 과 text를 클릭했을때 보여주게 한다.
				changeMonth: true, // 월을 바꿀수 있는 셀렉트 박스를 표시한다.
		        changeYear: true, // 년을 바꿀 수 있는 셀렉트 박스를 표시한다.
				minDate: '-10y', // 현재날짜로부터 100년이전까지 년을 표시한다.
				maxDate: '0',
				buttonImage: "resources/images/btn/btn_calendar.gif",
				buttonImageOnly: true, 
				buttonText:'calendar',
				onSelect: function( selectedDate ) {
					toDp.datepicker( "option", "minDate", selectedDate );
				}
			};
    var toDefaults   = {
			 showAnim: "fold",
			 dateFormat: "yy-mm-dd",
			 showOn: "button", //button 과 text를 클릭했을때 보여주게 한다.
			 changeMonth: true, // 월을 바꿀수 있는 셀렉트 박스를 표시한다.
			 changeYear: true, // 년을 바꿀 수 있는 셀렉트 박스를 표시한다.
			 minDate: '-10y', // 현재날짜로부터 100년이전까지 년을 표시한다.
			 maxDate: '0',
			 buttonImage: "resources/images/btn/btn_calendar.gif",
			 buttonImageOnly: true, 
			 buttonText:'calendar',
			 onSelect: function( selectedDate ) {
					fromDp.datepicker( "option", "maxDate", selectedDate );
			 }
	 };
	
	var fromOptions  = {};
	var toOptions 	 = {};
	var fromSettings = {};
	var toSettings   = {};
	
	if(args == 2){
		
		fromId   = arguments[0];
		toId     = arguments[1];
		fromSettings = fromDefaults;
		toSettings   = toDefaults;
		
	}
	else if (args == 3 || args == 4){
		
		fromId      = arguments[0];
		toId        = arguments[1];
		fromOptions = arguments[2]; 
		toOptions   = arguments[3]; 
		
		if(fromOptions == "n"){
			
			fromDefaults.maxDate = null;
			toDefaults.maxDate   = null;
			
			fromSettings = fromDefaults;
			toSettings   = toDefaults;
		}
		else if (typeof fromOptions == "object"){
			
			fromSettings = $.extend({},fromDefaults,fromOptions);		
			toSettings   = $.extend({},toDefaults,toOptions);
			
		}
		
	} 
	
	
	 var fromDp= $(fromId);
	 var toDp  = $(toId);
	
	 fromDp.datepicker(fromSettings).off('click').on('click',function(e){
			 e.preventDefault();
			 e.stopPropagation();
			 if ($('#ui-datepicker-div').is(':visible')) 
				 fromDp.datepicker('hide');
			 else 
				 fromDp.datepicker('show');
			return false;
	 });
	 
	 toDp.datepicker(toSettings).off('click').on('click',function(e){
		 e.preventDefault();
		 e.stopPropagation();
		 if ($('#ui-datepicker-div').is(':visible')) 
			 toDp.datepicker('hide');
		 else 
			 toDp.datepicker('show');
		return false;
 });
	
}

function dp_destory(selector){
	
	$(selector).datepicker( "destroy" );
}

function mp_gen(){
	
	var args = arguments.length;
	
	var mp_id = null;
	
	var defaults = {
			showOn: "button",
			dateFormat:"yy-mm",
			buttonImage: "resources/images/btn/btn_calendar.gif",
			buttonImageOnly: true,
			maxDate:"0"
		};
	
	var options = {};
	var settings = {};
	
	mp_id = arguments[0];
	
	if(args == 1){
		
		settings = defaults;
	}
	else if (args == 2){
		
		options  = arguments[1]; 
		
		if(options == "n"){
			defaults.maxDate = null;
			settings = defaults;
		}
		else if (typeof options == "object"){
			
			settings = $.extend({},defaults,options);		
		}
		
	} 
	
	var mpId = $(mp_id);
	
	mpId.monthpicker(settings).off('click').on('click',function(e){
		 e.preventDefault();
		 e.stopPropagation();
		if ($('#ui-monthpicker-div').is(':visible')) 
			mpId.monthpicker('hide');
		else 
			mpId.monthpicker('show');
		return false;
	});
}

//monthpicker maxdate 추가 예정
function mp_fromTo(){
	
var args = arguments.length;
	
var fromId = null;
var toId   = null;
	
var fromDefaults ={
		showOn: "button",
		dateFormat:"yy-mm",
		buttonImage: "resources/images/btn/btn_calendar.gif",
		buttonImageOnly: true,
		maxDate:"0",
		onSelect: function( selectedDate ) {
			toMp.monthpicker( "option", "minDate", selectedDate );
		}
	};
var toDefaults   = {
		showOn: "button",
		dateFormat:"yy-mm",
		buttonImage: "resources/images/btn/btn_calendar.gif",
		buttonImageOnly: true,
		maxDate:"0",
		onSelect: function( selectedDate ) {
			fromMp.monthpicker( "option", "maxDate", selectedDate );
		}
	};
	
	var fromOptions  = {};
	var toOptions 	 = {};
	var fromSettings = {};
	var toSettings   = {};
	
	if(args == 2){
		
		fromId   = arguments[0];
		toId     = arguments[1];
		fromSettings = fromDefaults;
		toSettings   = toDefaults;
		
	}
	else if (args == 3 || args == 4){
		
		fromId      = arguments[0];
		toId        = arguments[1];
		fromOptions = arguments[2]; 
		toOptions   = arguments[3]; 
		
		if(fromOptions == "n"){
			
			fromDefaults.maxDate = null;
			toDefaults.maxDate   = null;
			
			fromSettings = fromDefaults;
			toSettings   = toDefaults;
		}
		else if (typeof fromOptions == "object"){
			
			fromSettings = $.extend({},fromDefaults,fromOptions);		
			toSettings   = $.extend({},toDefaults,toOptions);		
		}
		
	}
	
	
	var fromMp = $(fromId);
	var toMp = $(toId);
	
	
	fromMp.monthpicker(fromSettings).off('click').on('click',function(e){
		e.preventDefault();
		e.stopPropagation();
		if ($('#ui-monthpicker-div').is(':visible')) 
			fromMp.monthpicker('hide');
		else 
			fromMp.monthpicker('show');
		return false;
	});
	
	toMp.monthpicker(toSettings).off('click').on('click',function(e){
		e.preventDefault();
		e.stopPropagation();
		if ($('#ui-monthpicker-div').is(':visible')) 
			toMp.monthpicker('hide');
		else 
			toMp.monthpicker('show');
		return false;
	});
	
}

/*
 * 월계산
 * date- 현재날짜
 * minusMonth- 개월
 * md- 월이냐 일이냐
 * */
function getPeriodCal(date, minusMonth, md){

	var dateArr = date.split('-');
	var year = dateArr[0];
	var month = dateArr[1];
	var date = dateArr[2];
	
	var changeYear = year;
	var changeMonth = 0;
	var changeDate = date;
	
	if(month > minusMonth){
		changeMonth = Number(month) - minusMonth;
	} else { 
		changeMonth = 12 + (Number(month) - minusMonth);
		changeYear = Number(year) - 1;
	}
	
	if(changeMonth < 10){
		changeMonth = '0'+changeMonth;
	}
	
	var calDate = changeYear+'-'+changeMonth+'-'+changeDate;
	
	if(md == 'm'){
		
		calDate =  changeYear+'-'+changeMonth;
	}
	
	return calDate;
	
}


//form을 json 포맷으로 바꿈
$.fn.serializeObject = function()
{
    var o = {};
    var a = this.serializeArray();
    $.each(a, function() {
        if (o[this.name] !== undefined) {
            if (!o[this.name].push) {
                o[this.name] = [o[this.name]];
            }
            o[this.name].push(this.value || '');
        } else {
            o[this.name] = this.value || '';
        }
    });
    return o;
};

//grid에 data 주입					//form+@ data       //return 받는 model 이름	
function gridDataFetch(_reqUrl, _reqdata, _gridId, _reskey) { 
	
	$.ajax({
		type : "POST",  
		async : true,
		//contentType: "application/json",
		url : _reqUrl,
		data : _reqdata,
		//dataType : 'json',
		success : function(data) {
			jQuery("#"+_gridId).jqGrid('clearGridData');
			//서버에서 받은 json 데이터를 그리드에 저장 
			for(var i = 0 ; i < data[_reskey].length; i++)
			jQuery("#"+_gridId).jqGrid('addRowData', i+1, data[_reskey][i]);
			
		},error:function(data){
			
		}, complete:function(jqXHR, textStatus){
			
		}
	});

}
//grid에 data 주입				      //form+@ data       //return 받는 model 이름	
function gridGetDataFetch(_reqUrl, _reqdata, _gridId, _reskey) { 
	
	$.ajax({
		type : "GET",  
		async : true,
		//contentType: "application/json",
		url : _reqUrl,
		data : _reqdata,
		//dataType : 'json',
		success : function(data) {
			
			jQuery("#"+_gridId).jqGrid('clearGridData');

			//서버에서 받은 json 데이터를 그리드에 저장 
			for(var i = 0 ; i < data[_reskey].length; i++)
			jQuery("#"+_gridId).jqGrid('addRowData', i+1, data[_reskey][i]);
			
		},error:function(data){
			
		}, complete:function(jqXHR, textStatus){
			
		}
	});

}						       
						       
//form에 data 주입					//form+@ data       //return 받는 model 이름	
function formDataFetch(_reqUrl, _reqdata, _resKey, _formIdPrefix) {
	$.ajax({
		type : "POST",  
		async : false,
		//contentType: "application/json",
		url : _reqUrl,
		data : _reqdata,
		//dataType : 'json',
		success : function(data) {
			
			jsonToForm(data[_resKey], _formIdPrefix);
			
		},error:function(data){
			
		}
	});
} 

//json을 html form에 바인딩
function jsonToForm(jsonData, prefix) {
	$.each(jsonData || [], function(key, value) { 
		$("#" + prefix + key).val(value);
	});
}

//form에 data 주입					//form+@ data       //return 받는 model 이름	
function formDataFetchComma(_reqUrl, _reqdata, _resKey, _formIdPrefix) {
	$.ajax({
		type : "POST",  
		async : false,
		//contentType: "application/json",
		url : _reqUrl,
		data : _reqdata,
		//dataType : 'json',
		success : function(data) {
			
			jsonToFormComma(data[_resKey], _formIdPrefix);
			
		},error:function(data){
			
		}
	});
} 

//json을 html form에 바인딩
function jsonToFormComma(jsonData, prefix) {
	$.each(jsonData || [], function(key, value) { 
		$("#" + prefix + key).val(value.comma());
	});
}

//날짜 기준 초기화 
function mp_init(options){

	var defaults={
			fromMp:null, //from datepicker type:jquery selector ex:$('#fromDatepicker')
			toMp:null,	//to datepicker type: jquery selector ex:$('#toDatepicker') //현재날짜
			targetMp:null, //해당월
			formId:null, //form id type:String  ex:totHisForm
			gridId:null, //grid id type:String  ex:totHisGrid
			prefix:null,// type: string ex:chgInq
			dfmt:'yy-mm',
			url: null, //url을 넣지 않으면 단순 날짜 세팅...
			mkey:null, //controller에서 받아오는 model의 key
			data:null, //ajax data에 들어갈 것  현재 form값 뒤에 추가로 붙는것에 대한 처리...
			mdType:'m', //type: string ex:m monthpicker, d datepicker
			fdata:'n', //formdata와 같이 전송할 거냐 아니냐.
			initial:'y', //y: new Date(), y1: 한달후
			currentDate: new Date(),  //현재날짜 or 원하는 시점의 날짜
			period: 3 //개월수
			//method: post //추후구현
	};
			
	var settings = $.extend({},defaults,options);
	
	var mdType = settings.mdType.toLowerCase();
	var monthP =  null;
	var fdata = settings.fdata.toLowerCase();
	
	var gridId = new Array(1);
	var url = new Array(1);
	var mkey= new Array(1);
	
	//날짜 단위 선택
	if( mdType == 'm'){
		monthP = $.monthpicker;
	} else if (mdType == 'd' ){
		monthP = $.datepicker;
		settings.dfmt = 'yy-mm-dd';
	}
	
	if(typeof settings.gridId == "string" 
		&&typeof settings.url == "string" && typeof settings.mkey == "string"
		){
		
		gridId[0] = settings.gridId;
		url[0] = settings.url;
		mkey[0] = settings.mkey;
		
	}
	else if(settings.gridId instanceof Array == true &&
			settings.url instanceof Array == true && settings.mkey instanceof Array == true){
		
		gridId = new Array(settings.gridId.length);
		url = new Array(settings.url.length);
		mkey = new Array(settings.mkey.length);
		
		for(i in settings.gridId){
			
			gridId[i] = settings.gridId[i];
			url[i] = settings.url[i];
			mkey[i] = settings.mkey[i];
		}
		
	}
	
	
	//formid selector 형식변환
	var formIdv = null;
	if(settings.formId != null){
		formIdv = '#'+settings.formId;
	}
	
	//초기값 세팅 변수
	var initial = settings.initial.toLowerCase();
	var initialT = settings.initial.toLowerCase().substring(0,1);
	
	//날짜 초기화
	if(initialT == 'y'){
		
		//3달전 날짜 계산 
		var accMonth = getPeriodCal(monthP.formatDate(settings.dfmt, settings.currentDate),settings.period,settings.mdType);
		
		//safari 문제
		var accMonthSp = accMonth.split("-");
		
		if(settings.fromMp && settings.fromMp != null){
			
			if(accMonthSp.length == 2){
				
				settings.fromMp.val(monthP.formatDate(settings.dfmt, new Date(accMonthSp[0],accMonthSp[1])));
			}
			else if(accMonthSp.length == 3){
				
				settings.fromMp.val(monthP.formatDate(settings.dfmt, new Date(accMonthSp[0],accMonthSp[1],accMonthSp[2])));
			}
			
		}
		
		if(settings.toMp && settings.toMp != null){
			
			if(initial=="y"){// 평상시 현재 날짜
				settings.toMp.val(monthP.formatDate(settings.dfmt, settings.currentDate));
			}
			else if ( initial == "y1"){ //청수미관리 이력조회시 미래 한달 조회시
				
				settings.toMp.val(monthP.formatDate(settings.dfmt, 
						new Date(Date.parse(new Date(settings.currentDate)) + 30 * 1000 * 60 * 60 * 24)));
			}
			
		} 
		
		if(settings.targetMp && settings.targetMp != null){
			
			if(initial=="y"){// 평상시 현재 날짜
				settings.targetMp.val(monthP.formatDate(settings.dfmt, settings.currentDate));
			}
		} 
		
	}
	
	//json 날짜 초기화
	if(settings.data != null){
		
		if(settings.data.hasOwnProperty("startYyyyMm") == true && settings.fromMp != null){
			
				settings.data.startYyyyMm=settings.fromMp.val();
				//.replace("-","");
			
		}
		
		if(settings.data.hasOwnProperty("endYyyyMm") == true && settings.toMp != null){
			
			settings.data.endYyyyMm=settings.toMp.val();
			//.replace("-","");
		}
		
		if(settings.data.hasOwnProperty("targetYyyyMm") == true && settings.targetMp != null){
			
			settings.data.targetYyyyMm=settings.targetMp.val();
			//.replace("-","");
			
		}
		
	}
	
	if(settings.url != null){
		
		
		//날짜 포맷에서 bar 제거하면 여기서 할까나~
		
		
		gridArrayFetch(gridId, url, mkey, formIdv, settings.data,fdata);
	}
}

//개월수 버튼 클릭시 조회 3개월 6개월 12개월
function mp_active(options){
	
	var defaults={
			fromMp:null, //from datepicker type:jquery selector ex:$('#fromDatepicker')
			toMp:null,	//to datepicker type: jquery selector ex:$('#toDatepicker') //현재날짜
			targetMp:null, //해당월
			formId:null, //form id type:String  ex:totHisForm
			gridId:null, //grid id type:String  ex:totHisGrid
			url: null,
			dpSend:"y",
			mkey:null, //controller에서 받아오는 model의 key
			prefix:null,// type: string ex:chgInq 현재 쓰이는 곳 없음
			inqBtn:"y",//조회버튼  있냐 없냐...
			dfmt:'yy-mm',
			data:null, //ajax //array 처리생각중. 현재 form값 뒤에 추가로 붙는것에 대한 처리...
			fdata:'n', //formData와 startYYYYMM endYYYYMM 같이 사용할시 y
			mdType:'m', //type: string ex:m monthpicker, d datepicker
			initial:'y' //y: new Date(), y1: 한달후
			//method:"post" //추후구현
	};
	
	var settings = $.extend({},defaults,options);
	
	var mdType = settings.mdType.toLowerCase();
	var monthP =  null;
	//버튼 관련 초기화
	var month3id = null;
	var month6id = null;
	var month12id = null;
	var monthInqId = null;
	var fdata = settings.fdata.toLowerCase();
	
	//gridId url mkey 초기화
	var gridId = new Array(1);
	var url = new Array(1);
	var mkey= new Array(1);
	
	if( mdType == 'm'){
		monthP = $.monthpicker;
	} else if (mdType == 'd' ){
		monthP = $.datepicker;
		settings.dfmt = 'yy-mm-dd';
	}

	
	//개월 버튼 id 지정
	if(settings.fromMp != null && settings.prefix != null){
		//3개월
		month3id ='#'+settings.prefix+'3';
		//6개월
		month6id ='#'+settings.prefix+'6';
		//12개월
		month12id ='#'+settings.prefix+'12';
	}
	
	//조회버튼 확인
	var inqBtn = settings.inqBtn.toLowerCase();
	
	if(inqBtn == 'y'){
		monthInqId = '#'+settings.prefix+'Inq';
	}else{
		settings.fromMp.off('click');
		settings.toMp.off('click');
	}
	
	
	//gridId,url,mkey 확인후 주입
	if(typeof settings.gridId == "string" 
		&&typeof settings.url == "string" && typeof settings.mkey == "string"
		){
		
		gridId[0] = settings.gridId;
		url[0] = settings.url;
		mkey[0] = settings.mkey;
		
	}
	else if(settings.gridId instanceof Array == true &&
			settings.url instanceof Array == true && settings.mkey instanceof Array == true){
	
		gridId = new Array(settings.gridId.length);
		url = new Array(settings.url.length);
		mkey = new Array(settings.mkey.length);
		//키세팅
		for(i in settings.gridId){
			
			gridId[i] = settings.gridId[i];
			url[i] = settings.url[i];
			mkey[i] = settings.mkey[i];
		}
		
	}
	
	//form id 생성
	var formIdv = null;
	if(settings.formId != null){
		formIdv = '#'+settings.formId;
	}
	
	//날짜 세팅
	function dateSetting(val){
		dateFromToSetting(settings,val);
	}
	
	
	//개월은 from과 to 필요
	if(settings.fromMp != null && settings.fromMp != null){
		
		var month3 = $(month3id);
		var month6 = $(month6id);
		var month12 = $(month12id);
		//3개월
		month3.off("click").on('click',function(e){
			e.preventDefault();
			dateSetting(3);

			if(settings.dpSend="y"){

				if(settings.url != null){
					
					gridArrayFetch(gridId, url, mkey, formIdv, settings.data,fdata);
				}
			}
		 	
		});
		
		//6개월
		month6.off("click").on('click', function(e){
			e.preventDefault();
			dateSetting(6);

			if(settings.dpSend="y"){

				if(settings.url != null){
					
					gridArrayFetch(gridId, url, mkey, formIdv, settings.data,fdata);
				}
			}
			
		});
		
		
		//1년
		month12.off("click").on('click',function(e){
			e.preventDefault();
			dateSetting(12);

			if(settings.dpSend="y"){

				if(settings.url != null){
					
					gridArrayFetch(gridId, url, mkey, formIdv, settings.data,fdata);
				}
			}
			
		});		
	
	}//if fromMp null
	
		var monthInq = $(monthInqId);
			//조회버튼
			monthInq.off("click").on('click',function(e){
				
				e.preventDefault();
				
				if(settings.data != null){
					
					if(settings.data.hasOwnProperty("startYyyyMm") == true && settings.fromMp != null){
						
							settings.data.startYyyyMm=settings.fromMp.val();
						
					}
					if(settings.data.hasOwnProperty("endYyyyMm") == true && settings.toMp != null){
						
							settings.data.endYyyyMm=settings.toMp.val();
					}
					
					
					if(settings.data.hasOwnProperty("targetYyyyMm") == true && settings.targetMp != null){
						
							settings.data.targetYyyyMm=settings.targetMp.val();
						
					}
					
					
				}
				
				if(settings.url != null){
					
					//날짜 포맷에서 bar 제거하면 여기서 할까나~
					
					gridArrayFetch(gridId, url, mkey, formIdv, settings.data,fdata);
				}
				
			});
	
}	

//개월 차이 구한후 datepicker 세팅
function dateFromToSetting(options,val){
	
	var defaults={
			fromMp:null, //from datepicker type:jquery selector ex:$('#fromDatepicker')
			toMp:null,	//to datepicker type: jquery selector ex:$('#toDatepicker') //현재날짜
			dfmt:'yy-mm', //default: 연월
			data:null, //ajax //array 처리생각중. 현재 form값 뒤에 추가로 붙는것에 대한 처리...
			period:3,  // default 3개월전.
			currentDate: new Date() //default 현재날짜, 원하는 날짜로 변경 가능
	};
	
	var settings = $.extend({},defaults,options);
	var monthP = null;
	
	var dfmt = settings.dfmt.toLowerCase();

	var mdType = null;
	if(val == null || val == undefined){
		val = parseInt(settings.period);
	}
	
	if( dfmt == 'yy-mm'){
		monthP = $.monthpicker;
		mdType = "m";
	} else if (dfmt == 'yy-mm-dd' ){
		monthP = $.datepicker;
	}
	
	var accMonth = getPeriodCal(monthP.formatDate(settings.dfmt, settings.currentDate),val,mdType); 
	var accMonthSp = accMonth.split("-");
	
	if(settings.fromMp && settings.fromMp != null){
		
		if(accMonthSp.length == 2){
			
			settings.fromMp.val(monthP.formatDate(settings.dfmt, new Date(accMonthSp[0],accMonthSp[1])));
		}
		else if(accMonthSp.length == 3){
			
			settings.fromMp.val(monthP.formatDate(settings.dfmt, new Date(accMonthSp[0],accMonthSp[1],accMonthSp[2])));
		}
	}
	
	if(settings.toMp && settings.toMp != null){
		settings.toMp.val(monthP.formatDate(settings.dfmt, settings.currentDate));
	} 
	
	if(settings.data != null){
		
		if(settings.data.hasOwnProperty("startYyyyMm") == true && settings.fromMp != null){
			
			settings.data.startYyyyMm=settings.fromMp.val();
			
		}
		if(settings.data.hasOwnProperty("endYyyyMm") == true && settings.toMp != null){
			
			settings.data.endYyyyMm=settings.toMp.val();
		}
		
	}
}

//mp_active 종속
function gridArrayFetch(gridId, url, mkey, formId, data, fdata){
	
	var sendurl = null;
	var ajaxData = null;
	
	
	for( i in gridId){
		
		if(url[i] != null && formId != null && gridId[i] != null){
			
			sendurl = baseUrl + url[i];

			if(data ==null || data == ""){ //json data를 안 넣었을 경우
				ajaxData = $(formId).serialize();
			}
			else if(data != null && //json data에  from to date가 있을경우
					data.hasOwnProperty("startYyyyMm") == true &&
					data.hasOwnProperty("endYyyyMm") == true || data.hasOwnProperty("targetYyyyMm") == true ){
				
				if(fdata=='y'){
					var receiveData = $.param(data);
					var formData =$(formId).serialize();
					ajaxData = formData + '&' + receiveData;
					
				}else{
					
					ajaxData = data;
				}
			}
			else if(data != null &&  //json data는 있지만 from to date가 없는 경우  form의 값과 jsondata 가져감
					data.hasOwnProperty("startYyyyMm") == false && 
					data.hasOwnProperty("endYyyyMm") == false || data.hasOwnProperty("targetYyyyMm") == false ){
				
				var receiveData = $.param(data);
				var formData = $(formId).serialize();
				ajaxData = formData + '&' + receiveData;
				
			}
			/*console.log("array 확인1");
			console.log(gridId[i]);
			console.log(url[i]);
			console.log(mkey[i]);
			console.log(ajaxData);
			console.log(sendurl);*/
			gridDataFetch(sendurl, ajaxData, gridId[i], mkey[i]);
		}
	
	}
	
}

//datepicker, monthpicker 클릭 못하게 막는다.
function dp_clickOff(id){
	$("#"+id).off('click');
	$("#"+id+".hasDatepicker").off('click');
	$("#"+id+".hasMonthpicker").off('click');
	$("#"+id+"+"+"img.ui-monthpicker-trigger").off('click');
	$("#"+id+"+"+"img.ui-datepicker-trigger").off('click');
}

//사파리 문제로 인해서 Date 계산
function parseDate(input, format) {
	  format = format || 'yyyy-mm-dd'; // default format
	  var parts = input.match(/(\d+)/g), 
	      i = 0, fmt = {};
	  // extract date-part indexes from the format
	  format.replace(/(yyyy|dd|mm)/g, function(part) { fmt[part] = i++; });

	  return new Date(parts[fmt['yyyy']], parts[fmt['mm']]-1, parts[fmt['dd']]);
}


var dateFormat = function () {
	var	token = /d{1,4}|m{1,4}|yy(?:yy)?|([HhMsTt])\1?|[LloSZ]|"[^"]*"|'[^']*'/g,
		timezone = /\b(?:[PMCEA][SDP]T|(?:Pacific|Mountain|Central|Eastern|Atlantic) (?:Standard|Daylight|Prevailing) Time|(?:GMT|UTC)(?:[-+]\d{4})?)\b/g,
		timezoneClip = /[^-+\dA-Z]/g,
		pad = function (val, len) {
			val = String(val);
			len = len || 2;
			while (val.length < len) val = "0" + val;
			return val;
		};

	// Regexes and supporting functions are cached through closure
	return function (date, mask, utc) {
		var dF = dateFormat;

		// You can't provide utc if you skip other args (use the "UTC:" mask prefix)
		if (arguments.length == 1 && Object.prototype.toString.call(date) == "[object String]" && !/\d/.test(date)) {
			mask = date;
			date = undefined;
		}

		// Passing date through Date applies Date.parse, if necessary
		date = date ? new Date(date) : new Date;
		if (isNaN(date)) throw SyntaxError("invalid date");

		mask = String(dF.masks[mask] || mask || dF.masks["default"]);

		// Allow setting the utc argument via the mask
		if (mask.slice(0, 4) == "UTC:") {
			mask = mask.slice(4);
			utc = true;
		}

		var	_ = utc ? "getUTC" : "get",
			d = date[_ + "Date"](),
			D = date[_ + "Day"](),
			m = date[_ + "Month"](),
			y = date[_ + "FullYear"](),
			H = date[_ + "Hours"](),
			M = date[_ + "Minutes"](),
			s = date[_ + "Seconds"](),
			L = date[_ + "Milliseconds"](),
			o = utc ? 0 : date.getTimezoneOffset(),
			flags = {
				d:    d,
				dd:   pad(d),
				ddd:  dF.i18n.dayNames[D],
				dddd: dF.i18n.dayNames[D + 7],
				m:    m + 1,
				mm:   pad(m + 1),
				mmm:  dF.i18n.monthNames[m],
				mmmm: dF.i18n.monthNames[m + 12],
				yy:   String(y).slice(2),
				yyyy: y,
				h:    H % 12 || 12,
				hh:   pad(H % 12 || 12),
				H:    H,
				HH:   pad(H),
				M:    M,
				MM:   pad(M),
				s:    s,
				ss:   pad(s),
				l:    pad(L, 3),
				L:    pad(L > 99 ? Math.round(L / 10) : L),
				t:    H < 12 ? "a"  : "p",
				tt:   H < 12 ? "am" : "pm",
				T:    H < 12 ? "A"  : "P",
				TT:   H < 12 ? "AM" : "PM",
				Z:    utc ? "UTC" : (String(date).match(timezone) || [""]).pop().replace(timezoneClip, ""),
				o:    (o > 0 ? "-" : "+") + pad(Math.floor(Math.abs(o) / 60) * 100 + Math.abs(o) % 60, 4),
				S:    ["th", "st", "nd", "rd"][d % 10 > 3 ? 0 : (d % 100 - d % 10 != 10) * d % 10]
			};

		return mask.replace(token, function ($0) {
			return $0 in flags ? flags[$0] : $0.slice(1, $0.length - 1);
		});
	};
}();

// Some common format strings
dateFormat.masks = {
	"default":      "ddd mmm dd yyyy HH:MM:ss",
	shortDate:      "m/d/yy",
	mediumDate:     "mmm d, yyyy",
	longDate:       "mmmm d, yyyy",
	fullDate:       "dddd, mmmm d, yyyy",
	shortTime:      "h:MM TT",
	mediumTime:     "h:MM:ss TT",
	longTime:       "h:MM:ss TT Z",
	isoDate:        "yyyy-mm-dd",
	isoTime:        "HH:MM:ss",
	isoDateTime:    "yyyy-mm-dd'T'HH:MM:ss",
	isoUtcDateTime: "UTC:yyyy-mm-dd'T'HH:MM:ss'Z'"
};

// Internationalization strings
dateFormat.i18n = {
	dayNames: [
		"Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat",
		"Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"
	],
	monthNames: [
		"Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec",
		"January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"
	]
};

// For convenience...
Date.prototype.format = function (mask, utc) {
	return dateFormat(this, mask, utc);
};